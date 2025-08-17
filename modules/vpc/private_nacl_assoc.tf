resource "aws_network_acl_association" "w3_nacl_private_subnet_ass" { 
  count          = length(aws_subnet.w3_private_subnet)
  subnet_id      = aws_subnet.w3_private_subnet[count.index].id
  network_acl_id = aws_network_acl.w3_private_nacl.id  
}
