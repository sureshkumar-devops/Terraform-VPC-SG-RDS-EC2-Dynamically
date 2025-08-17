locals {
  selected_azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)

  # Public CIDRs
  public_subnet_cidrs = [
    for i, az in local.selected_azs :
    cidrsubnet(var.vpc_cidr, 8, i + 1)
  ]
  # Private CIDRs
  private_subnet_cidrs = [
    for i, az in local.selected_azs :
    cidrsubnet(var.vpc_cidr, 8, i + 1 + var.az_count)
  ]


#   # Dynamic NACL rules in locals
#   private_nacl_rules = [
#     # Inbound ephemeral return ports
#     { rule_no = 100, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 },
#     { rule_no = 110, egress = false, protocol = "udp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 },

#     # Inbound SSH & ICMP from public subnet
#     { rule_no = 120, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = public_subnet_cidr, from_port = 22, to_port = 22 },
#     { rule_no = 130, egress = false, protocol = "icmp", rule_action = "allow", cidr_block = public_subnet_cidr, from_port = -1, to_port = -1 },

#     # Outbound to internet
#     { rule_no = 200, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 80, to_port = 80 },
#     { rule_no = 210, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 443, to_port = 443 },
#     { rule_no = 220, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 },
#     { rule_no = 230, egress = true, protocol = "udp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 53, to_port = 53 },
#     { rule_no = 240, egress = true, protocol = "icmp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = -1, to_port = -1 }
#   ]
 }