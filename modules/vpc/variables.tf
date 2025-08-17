variable "project_name" {
  description = "name of the project"
  type        = string
}
variable "env" {
  description = "environment for dev, prod and staging"
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "az_count" {
  description = "Number of availability zones to use"
  type        = number
}
variable "enable_nat_gateway" {
  description = "Create NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "public_nacl_rules" {
  description = "Ingress/Egress rules for public NACL with internet access"
  type = list(object({
    rule_no     = number
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
  default = [
    # Inbound rules
    { rule_no = 100, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 22, to_port = 22 },      # SSH
    { rule_no = 110, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 80, to_port = 80 },      # HTTP
    { rule_no = 120, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 443, to_port = 443 },    # HTTPS
    { rule_no = 130, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 }, # Ephemeral return ports
    { rule_no = 140, egress = false, protocol = "udp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 53, to_port = 53 },       # DNS
    { rule_no = 150, egress = false, protocol = "icmp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 },       # ICMP Ping

    # Outbound rules
    { rule_no = 200, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 22, to_port = 22 },      # SSH
    { rule_no = 210, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 80, to_port = 80 },       # HTTP
    { rule_no = 220, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 443, to_port = 443 },     # HTTPS
    { rule_no = 230, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 }, # Ephemeral ports
    { rule_no = 240, egress = true, protocol = "udp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 53, to_port = 53 },       # DNS
    { rule_no = 250, egress = true, protocol = "icmp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }        # ICMP Ping
  ] 
}
variable "private_nacl_rules" {
  description = "Ingress/Egress rules for private NACL with NAT Gateway access"
  type = list(object({
    rule_no     = number
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
   default = [
    # Inbound rules: allow return traffic from NAT/Internet
    # Inbound: allow ephemeral ports for NAT return traffic
    { rule_no = 100, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 }, # Ephemeral return ports
    { rule_no = 110, egress = false, protocol = "udp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 }, # Ephemeral UDP return ports    
     # Inbound: SSH & ICMP from public subnet (bastion)
    { rule_no = 120, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 22, to_port = 22 }, # ICMP responses
    { rule_no = 130, egress = false, protocol = "icmp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = -1, to_port = -1 }, # ssh

    # Outbound rules: allow traffic to internet via NAT
    # Outbound: allow NAT/Internet traffic
    { rule_no = 200, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 80, to_port = 80 },       # HTTP
    { rule_no = 210, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 443, to_port = 443 },     # HTTPS
    { rule_no = 220, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 }, # Ephemeral ports
    { rule_no = 230, egress = true, protocol = "udp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 53, to_port = 53 },       # DNS
    { rule_no = 240, egress = true, protocol = "icmp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = -1, to_port = -1 } # ICMP
  ] 
}
