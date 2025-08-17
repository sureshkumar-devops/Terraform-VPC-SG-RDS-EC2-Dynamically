# Public EC2s (spread across the two public subnets)
resource "aws_instance" "w3_public_ec2" {
  count                       = var.public_ec2_count
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.public_subnet_ids[count.index % length(var.public_subnet_ids)]
  vpc_security_group_ids      = [var.public_ec2_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = var.enable_public_ip
  user_data                   = file("scripts/install_nginx.sh")

  # Spot instance configuration
  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = var.spot_max_price # Optional, can be omitted to use on-demand price
      spot_instance_type = "one-time"
    }
  }

  root_block_device {
    volume_size = var.aws_root_storage_size
    volume_type = var.aws_volume_type
  }

  tags = {
    Name        = "${var.project_name}-public-server-${count.index + 1}"
    Environment = var.env
  }
}

# Private EC2s (spread across the two private subnets)

resource "aws_instance" "w3_private_ec2" {
  count                  = var.private_ec2_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.private_subnet_ids[count.index % length(var.private_subnet_ids)]
  vpc_security_group_ids = [var.private_ec2_sg_id]
  key_name               = var.key_name
  user_data              = file("scripts/install_nginx.sh")

  # Spot instance configuration
  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = var.spot_max_price # Optional
      spot_instance_type = "one-time"
    }
  }

  root_block_device {
    volume_size = var.aws_root_storage_size
    volume_type = var.aws_volume_type
  }

  tags = {
    Name        = "${var.project_name}-private-server-${count.index + 1}"
    Environment = var.env
  }
}
