output "public_ec2_sg_id" {
  value = aws_security_group.w3_public_ec2_sg.id
}
output "private_ec2_sg_id" {
  value = aws_security_group.w3_public_ec2_sg.id
}
output "rds_sg_id" {
  value = aws_security_group.w3_rds_sg.id
}
