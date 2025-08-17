resource "aws_route_table" "w3_private_rt" {
  vpc_id = aws_vpc.w3_vpc.id
  dynamic "route" {
    for_each = var.enable_nat_gateway ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.w3_nat_gateway[0].id
    }
  }
  tags = {
    Name = "${var.project_name}-private-route-table"    
    Environment = var.env
  }
}