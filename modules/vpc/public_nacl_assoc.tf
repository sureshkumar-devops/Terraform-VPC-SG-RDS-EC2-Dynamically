resource "aws_network_acl_association" "w3_nacl_pub_subnet_ass" {  
  count          = length(aws_subnet.w3_public_subnet)
  subnet_id      = aws_subnet.w3_public_subnet[count.index].id
  network_acl_id = aws_network_acl.w3_public_nacl.id
  
}
