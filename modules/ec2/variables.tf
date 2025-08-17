variable "ec2_instance_type" {
  description = "instance type"
  type        = string
}
variable "aws_root_storage_size" {
  description = "Root Voulme size in GB"
  default     = 8
  type        = number
}

variable "aws_volume_type" {
  description = "EBS Volume type"
  default     = "gp3"
  type        = string
}
variable "project_name" {
  description = "The Name of the Project"
  type        = string
}
variable "env" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
}
variable "key_name" {
  type        = string
  description = "The EC2 key pair name to use for instances"
}
variable "public_ec2_count" {
  type        = number
  description = "Total No of Public EC2 instance"
}
variable "private_ec2_count" {
  type        = number
  description = "Total No of Private EC2 instance"
}
variable "public_ec2_sg_id" {
  type        = string
  description = "Security Group for Public EC2 instance"
}
variable "private_ec2_sg_id" {
  type        = string
  description = "Security Group for Private EC2 instance"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public Subnets ids"
}
variable "private_subnet_ids" {
  type        = list(string)
  description = "Private Subnets ids"
}
variable "spot_max_price" {
  description = "Maximum price for spot instances (per hour). Leave null for on-demand price."
  type        = string
  default     = null
}
variable "aws_region" {
  description = "aws region"
  type        = string
}
variable "enable_public_ip" {
  description = "Assign public IP to EC2 instances in public subnets"
  type        = bool
  default     = true
}
