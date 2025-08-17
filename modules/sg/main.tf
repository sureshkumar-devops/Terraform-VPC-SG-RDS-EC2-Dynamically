# Public EC2 SG: allow SSH/HTTP from anywhere; all egress

resource "aws_security_group" "w3_public_ec2_sg" {
  name        = "${var.project_name}-public-ec2-sg"
  description = "Public-tier EC2 access Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.project_name}-public-ec2-sg"
    Environment = var.env
  }
}

# Private EC2 SG: allow SSH only from public EC2 SG; all egress
resource "aws_security_group" "w3_private_ec2_sg" {
  name        = "${var.project_name}-private-ec2-sg"
  description = "Private-tier EC2 access Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.w3_public_ec2_sg.id]
    description     = "SSH from Public EC2"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.project_name}-private-ec2-sg"
    Environment = var.env
  }
}
# RDS SG: allow 3306 from private EC2 SG only
resource "aws_security_group" "w3_rds_sg" {
  name        = "${var.project_name}-rds-sg"
  description = "RDS access from private tier EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.w3_private_ec2_sg.id]
    description     = "MySQL from private tier"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.project_name}-rds-sg"
    Environment = var.env
  }
}