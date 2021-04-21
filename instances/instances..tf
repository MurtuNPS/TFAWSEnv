
locals{
  windows-disks = ["xvdb","xvdc","xvdd","xvde","xvdf"]
  linux-disks = ["/dev/sdb","/dev/sdc","/dev/sdd","/dev/sde","/dev/sdf"]
}


resource "aws_instance" "instance" {
  ami           = var.ami
  key_name = var.key_name
  iam_instance_profile = var.iam_role
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups
  subnet_id = var.subnet
  private_ip = var.ip
  associate_public_ip_address = var.public-ip
  user_data = var.user-data

  tags = var.tags

  root_block_device {
    volume_size = var.root_disk_size
  }

  dynamic "ebs_block_device" {
    for_each = {for disk in split(",",var.additional_disks) : disk=> split(":",disk) 
     if disk != "na" }

    content{
      device_name = var.ostype == "windows" ? local.windows-disks[index(split(",",var.additional_disks),ebs_block_device.key)] : local.linux-disks[index(split(",",var.additional_disks),ebs_block_device.key)]
      volume_size = ebs_block_device.value[1]
    }


  
}
}