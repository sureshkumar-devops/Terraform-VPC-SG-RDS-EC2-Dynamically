resource "aws_key_pair" "w3_key_pair" {
  key_name   = var.key_pair
  public_key = var.public_key_path
  tags = {
    Name        = "${var.project_name}-terra-key-pair"
    Environment = var.env
  }
}
