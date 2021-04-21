
resource "aws_vpc" "vpc" {
    cidr_block = var.cidr
    enable_dns_hostnames = true
    tags= var.tags
}



resource "aws_subnet" "subnet"{
    for_each = {for object in var.subnets : object.name => object}
    vpc_id = aws_vpc.vpc.id
    cidr_block = each.value.address
    availability_zone = each.value.az
    tags= {
        Name = each.key
    }
}

resource "aws_security_group" "sg" {
    for_each = {for object in var.security_groups : object.name => object }

    name = each.key
    description = each.value.description
    vpc_id = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "sgrule_default_inbound" {
     for_each = {for object in var.security_groups : object.name => object }

    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "all"
    source_security_group_id = aws_security_group.sg[each.key].id
    security_group_id = aws_security_group.sg[each.key].id
}
resource "aws_security_group_rule" "sgrule_default_outbound" {
     for_each = {for object in var.security_groups : object.name => object }

    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "all"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.sg[each.key].id
}

locals {
    sg_rules = csvdecode(file(var.sg_rules_path))
}

resource "aws_security_group_rule" "sgrule" {
    for_each = {for object in local.sg_rules : "${object.sg}-${object.from_port}-${object.to_port}"=> object}

    type = each.value.type
    from_port = each.value.from_port
    to_port = each.value.to_port
    protocol = each.value.protocol
    cidr_blocks = split(",",each.value.cidr_blocks)
    security_group_id = aws_security_group.sg[each.value.sg].id
}

