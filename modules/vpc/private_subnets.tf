resource "aws_subnet" "w3_private_subnet" {
  vpc_id            = aws_vpc.w3_vpc.id
  count             = var.az_count
  availability_zone = local.selected_azs[count.index]
  cidr_block        = local.private_subnet_cidrs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.project_name}-private-subnet-${count.index + 1}-${local.selected_azs[count.index]}"
    Environment = var.env
  }
}