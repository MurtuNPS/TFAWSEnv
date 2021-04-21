resource "aws_vpc_dhcp_options" "dhcp-SSPP" {
  for_each = var.domain-name == "na" ? [] : toset(["dhcp"])
  domain_name          = var.domain-name
  domain_name_servers  = var.dns-servers
  ntp_servers          = var.dns-servers
  netbios_name_servers = var.dns-servers
  
}