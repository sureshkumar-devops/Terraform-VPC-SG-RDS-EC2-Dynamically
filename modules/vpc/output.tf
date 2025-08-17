output "vpc_id" {
  value = aws_vpc.w3_vpc.id
}
output "env" {
  value = var.env
}
output "igw" {
  value = aws_internet_gateway.w3_igw.id
}
output "available_azs" {
  value = data.aws_availability_zones.available.names
}
output "selected_azs" {
  value = local.selected_azs
}
output "public_subnet_ids" {
  value = [for subnet in aws_subnet.w3_public_subnet : subnet.id]
}
output "public_subnet_cidr" {
  value = local.public_subnet_cidrs
}
output "private_subnet_ids" {
  value = [for subnet in aws_subnet.w3_private_subnet : subnet.id]
}
output "private_subnet_cidr" {
  value = local.private_subnet_cidrs
}