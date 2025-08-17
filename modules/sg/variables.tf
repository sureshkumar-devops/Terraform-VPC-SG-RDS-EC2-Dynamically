variable "project_name" {
  description = "name of the project"
  type        = string
}
variable "env" {
  description = "environment for dev, prod and staging"
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
