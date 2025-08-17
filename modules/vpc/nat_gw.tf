resource "aws_nat_gateway" "w3_nat_gateway" {
  count         = var.enable_nat_gateway ? 1 : 0
  allocation_id = var.enable_nat_gateway ? aws_eip.w3_eip[0].id : null  
  subnet_id = var.enable_nat_gateway ? aws_subnet.w3_public_subnet[0].id : null
  tags = {
    Name = "${var.project_name}-nat-gw"    
    Environment = var.env
  }
}

