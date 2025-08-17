resource "aws_route_table_association" "w3_private_rta" {
  count          = var.az_count  
  subnet_id      = aws_subnet.w3_private_subnet[count.index].id
  route_table_id = aws_route_table.w3_private_rt.id  
}

