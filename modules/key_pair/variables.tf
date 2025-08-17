variable "key_pair" {
  type        = string
  description = "The name of the Key Pair"
}
variable "public_key_path" {
  type        = string
  description = "Path of the public key"
}
variable "project_name" {
  description = "name of the project"
  type        = string
}
variable "env" {
  description = "environment for dev, prod and staging"
  type        = string
}