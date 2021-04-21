
variable cidr {
  type = string
  default = "172.28.0.0/16"
}

variable subnets {
  default = [
  { name = "web", address = "172.28.1.0/24", az = "eu-west-3c" },
  { name = "mgmt", address ="172.28.2.0/24", az = "eu-west-3c"},
  {name = "test", address = "172.28.3.0/24", az = "eu-west-3c"},
  {name = "app", address = "172.28.4.0/24",  az = "eu-west-3c"}
]

}

variable tags {
default = {
    Name = "sspp"
    project = "blankenv"
}
}

variable security_groups {
default = [
    {name = "ssh", description = "security group for linux"},
    {name = "ad", description = "security group for ad"}
]
}

variable sg_rules_path {
default = "D:/SSPPTerraform/NewEnv/sg.csv"
}

variable ssm_region {

}

variable internet_access {

}

variable public_subnet_cidr {

}

variable public_subnet_az {

}

variable public_subnet {

}

variable public_subnet_name {

}

variable peer-vpc-id {
  
}

variable domain-name {
  
}

variable dns-servers {
  
}