
module network {
source = "./network"

cidr = "10.10.0.0/16"
tags = {
    Name = "testvpc"
    Project = "test"
}

//details for dhcp option set
domain-name = "na"     //use na if custom dhcp option set is not required
dns-servers = ["10.10.3.10"]

public_subnet = "true"       //true or false 
public_subnet_name = "public-subnet"
public_subnet_cidr = "10.10.2.0/24"
public_subnet_az = "eu-west-2a"

internet_access = "true"     //for private subnets, to be true public subnet needs to be true 


subnets = [
  { name = "endpoints", address = "10.10.3.0/24", az = "eu-west-2a"},
  { name = "test1", address = "10.10.4.0/24", az = "eu-west-2a"},
  { name = "test2", address = "10.10.5.0/24", az = "eu-west-2a"}
  ]

security_groups = [
    {name = "test-sg", description = "security group for test"},
  
]
sg_rules_path = "./sg.csv"

ssm_region = var.region

peer-vpc-id = "na"  //use na if peering is not required

}


locals {
    instances = csvdecode(file("instances.csv"))
}

module instances {
  for_each = {for object in local.instances: object.name => object }
  source = "./instances"
  
  name = each.key
  ami = var.image_map[each.value.image]
  key_name = each.value.key_name
  iam_role = module.iam.role
  instance_type = each.value.instance_type
  security_groups = [for sg in split(",",each.value.sgs) : module.network.security_group_id[sg]]
  subnet = each.value.subnet == "public" ? module.network.public_subnet_id : module.network.subnet_id[each.value.subnet]
  root_disk_size = each.value.root_disk_size
  additional_disks = each.value.additional_disks
  ip = each.value.ip == "na" ? null : each.value.ip
  public-ip = lower(each.value.public-ip)
  user-data = data.template_file.tpl[each.key].rendered
  ostype = each.value.ostype

  tags = {
    Name = each.key
    Project = "test"
    role = each.value.role-tag
    platform = each.value.platform-tag
}
}


module iam {
  source = "./iam"
  region = var.region
  role = "testrole"    //rolename for ec2 instances to access ssm and ec2
  group = "ssmusers"       //groupname for users to access ec2 via ssm
  users = ["ssmtestuser"]
}