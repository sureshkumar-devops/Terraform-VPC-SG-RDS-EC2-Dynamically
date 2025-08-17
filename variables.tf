variable "project_name" {
  description = "name of the project"
  type        = string
}
variable "env" {
  description = "environment for dev, prod and staging"
  type        = string
}
variable "vpc_cidr" {
  description = "cidr block "
  type        = string
}
variable "public_ec2_count" {
  type        = number
  description = "Total No of Public EC2 instance"
}
variable "private_ec2_count" {
  type        = number
  description = "Total No of Private EC2 instance"
}
variable "aws_region" {
  description = "aws region"
  type        = string
}
variable "az_count" {
  description = "Number of availability zones to use"
  type        = number
}
variable "key_name" {
  description = "key name"
  type        = string
}
variable "instance_type" {
  description = "ec2 instance type"
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
variable "spot_max_price" {
  description = "Maximum price for spot instances (per hour). Leave null for on-demand price."
  type        = string
  default     = null
}
variable "enable_nat_gateway" {
  description = "Create NAT Gateway for private subnets"
  type        = bool
  default     = false
}
variable "enable_public_ip" {
  description = "Assign public IP to EC2 instances in public subnets"
  type        = bool
  default     = true
}