output "key_name" {
  description = "Name of the created key pair"
  value       = aws_key_pair.w3_key_pair.key_name
}