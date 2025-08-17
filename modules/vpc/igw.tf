resource "aws_internet_gateway" "w3_igw" {
  vpc_id = aws_vpc.w3_vpc.id
  tags = {
    Name        = "${var.project_name}-igw"
    Environment = var.env
  }
}