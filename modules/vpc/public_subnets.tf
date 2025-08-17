resource "aws_subnet" "w3_public_subnet" {
  count                   = var.az_count
  vpc_id                  = aws_vpc.w3_vpc.id
  availability_zone       = local.selected_azs[count.index]
  cidr_block              = local.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-public-subnet-${count.index + 1}-${local.selected_azs[count.index]}"
    Environment = var.env
  }
}
