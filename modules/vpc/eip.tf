resource "aws_eip" "w3_eip" {  
 count = var.enable_nat_gateway ? 1 : 0  
  tags = {
    Name = "${var.project_name}-eip"    
    Environment = var.env
  }
}