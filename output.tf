output "vpc_id" {
  value = module.vpc.vpc_id
}
output "env" {
  value = module.vpc.env
}
output "igw" {
  value = module.vpc.igw
}
output "available_azs" {
  value = module.vpc.available_azs
}
output "selected_azs" {
  value = module.vpc.selected_azs
}
output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}
output "public_subnet_cidr" {
  value = module.vpc.public_subnet_cidr
}
output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
output "private_subnet_cidr" {
  value = module.vpc.private_subnet_cidr
}