output "endpoint_id" {
  value       = aws_db_instance.w3_db_instance.endpoint
  description = "The ID of the endpoint"

}