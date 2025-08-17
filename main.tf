module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  env          = var.env
  vpc_cidr     = var.vpc_cidr
  az_count     = var.az_count
  private_nacl_rules = [
    { rule_no = 100, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 },
    { rule_no = 110, egress = false, protocol = "udp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 },
    { rule_no = 120, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = module.vpc.public_subnet_cidr[0], from_port = 22, to_port = 22 }, # <-- real value
    { rule_no = 130, egress = false, protocol = "icmp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = -1, to_port = -1 },

    { rule_no = 200, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 80, to_port = 80 },
    { rule_no = 210, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 443, to_port = 443 },
    { rule_no = 220, egress = true, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 1024, to_port = 65535 },
    { rule_no = 230, egress = true, protocol = "udp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 53, to_port = 53 },
    { rule_no = 240, egress = true, protocol = "icmp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = -1, to_port = -1 }
  ]
}
module "sg" {
  source       = "./modules/sg"
  project_name = var.project_name
  env          = var.env
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = var.vpc_cidr
}
module "key_pair" {
  source          = "./modules/key_pair"
  key_pair        = var.key_name
  public_key_path = file("/home/vali/terraform-in-practices/terra-key-ec2.pub")
  env             = var.env
  project_name    = var.project_name
}
module "ec2" {
  source             = "./modules/ec2"
  project_name       = var.project_name
  ec2_instance_type  = var.instance_type
  key_name           = var.key_name
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  public_ec2_count   = var.public_ec2_count
  private_ec2_count  = var.private_ec2_count
  public_ec2_sg_id   = module.sg.public_ec2_sg_id
  private_ec2_sg_id  = module.sg.private_ec2_sg_id
  env                = var.env
  aws_region         = var.aws_region
}
# module "rds" {
#   source                 = "./modules/rds"
#   db_name                = var.db_name
#   db_username            = var.db_username
#   db_password            = var.db_password
#   instance_class         = var.instance_class
#   vpc_security_group_ids = module.sg.rds_sg_id
#   project_name           = var.project_name
#   env                    = var.env
#   private_subnet_ids     = module.vpc.private_subnet_ids
# }
