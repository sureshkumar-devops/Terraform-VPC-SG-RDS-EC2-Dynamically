resource "aws_network_acl" "w3_public_nacl" {
  vpc_id = aws_vpc.w3_vpc.id
  tags = {
    Name        = "${var.project_name}-public-nacl"
    Environment = var.env
  }
}

resource "aws_network_acl_rule" "w3_public_nacl_rules" {
  for_each       = { for idx, rule in var.public_nacl_rules : idx => rule }
  network_acl_id = aws_network_acl.w3_public_nacl.id
  rule_number    = each.value.rule_no
  egress         = each.value.egress
  protocol       = each.value.protocol
  rule_action    = each.value.rule_action
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
}
