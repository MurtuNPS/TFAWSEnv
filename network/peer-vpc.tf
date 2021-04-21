

data "aws_vpc" "peer-vpc" {
   for_each = var.peer-vpc-id == "na" ? [] : toset(["peer-vpc"]) 
  id = var.peer-vpc-id
}


# Create peer connection between Spoke and Hub network
resource "aws_vpc_peering_connection" "peer-connection" {
    for_each = var.peer-vpc-id == "na" ? [] : toset(["peer-connection"]) 

  peer_vpc_id = var.peer-vpc-id
  vpc_id      = aws_vpc.vpc.id
  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  requester {
    allow_remote_vpc_dns_resolution = true
  }
 
}

resource "aws_route" "spoke-hub" {
    for_each = var.peer-vpc-id == "na" ? [] : toset(["spoke-hub"]) 
  route_table_id              = aws_vpc.vpc.default_route_table_id
  destination_cidr_block = data.aws_vpc.peer-vpc["peer-vpc"].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer-connection["peer-connection"].id
}

resource "aws_route" "hub-spoke" {
    for_each = var.peer-vpc-id == "na" ? [] : toset(["hub-spoke"]) 
  route_table_id              = data.aws_vpc.peer-vpc["peer-vpc"].main_route_table_id
  destination_cidr_block = aws_vpc.vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer-connection["peer-connection"].id
}