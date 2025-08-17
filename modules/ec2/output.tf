output "public_instance_ids" {
  value = aws_instance.w3_public_ec2[*].id
}
output "public_instance_public_ips" {
  value = aws_instance.w3_public_ec2[*].public_ip

}
output "private_instance_ids" {
  value = aws_instance.w3_private_ec2[*].id
}
output "private_instance_private_ips" {
  value = aws_instance.w3_private_ec2[*].private_ip
}
