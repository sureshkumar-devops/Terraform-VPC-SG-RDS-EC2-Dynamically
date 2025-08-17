resource "aws_route_table" "w3_public_rt" {

  vpc_id = aws_vpc.w3_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.w3_igw.id
  }

  tags = {
    Name        = "${var.project_name}-public-route-table"
    Environment = var.env
  }
}

