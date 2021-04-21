
resource "aws_internet_gateway" "gw" {
    for_each = var.public_subnet == "true" ? toset(["gw"]) : []
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_subnet"{
    for_each = var.public_subnet == "true" ? toset(["public_subnet"]) : []
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_subnet_az
    tags= {
        Name = var.public_subnet_name
    }
}

resource "aws_route_table" "rt" {
    for_each = var.public_subnet == "true" ? toset(["rt"]) : []
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw["gw"].id
  }
}

resource "aws_route_table_association" "a" {
    for_each = var.public_subnet == "true" ? toset(["a"]) : []
  subnet_id      = aws_subnet.public_subnet["public_subnet"].id
  route_table_id = aws_route_table.rt["rt"].id
}

resource "aws_eip" "public_ip" {
  for_each = var.internet_access == "true" ? toset(["public_ip"]) : []
}

resource "aws_nat_gateway" "nat_gw" {
    for_each = var.internet_access == "true" ? toset(["nat_gw"]) : []
  allocation_id = aws_eip.public_ip["public_ip"].id
  subnet_id     = aws_subnet.public_subnet["public_subnet"].id
}



resource "aws_route" "r" {
    for_each = var.internet_access == "true" ? toset(["r"]) : []
  route_table_id              = aws_vpc.vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id      = aws_nat_gateway.nat_gw["nat_gw"].id
}