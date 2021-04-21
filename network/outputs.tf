
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
    value = {for object in aws_subnet.subnet : object.tags.Name => object.id }
}

output "public_subnet_id" {
    value = var.public_subnet== "true" ? aws_subnet.public_subnet["public_subnet"].id: "no public subnet"
}

output "security_group_id" {
     value = {for object in aws_security_group.sg : object.name => object.id }
}