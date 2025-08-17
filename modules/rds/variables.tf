variable "project_name" {
  description = "The Name of the Project"
  type        = string
}
variable "env" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
}
variable "db_name" {
  type        = string
  description = "The name of the database"   
}
variable "db_username" {
  type        = string
  description = "The username of the database"
}

variable "db_password" {
  type        = string
  description = "The password of the database"
}

variable "instance_class" {
  type        = string
  description = "The instance class of the database"
}
variable "vpc_security_group_ids" {
  type        = string
  description = "The ID of the security group"
}
variable "private_subnet_ids" {
  type        = list(string)
  description = "Private Subnets ids"
}