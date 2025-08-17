resource "aws_db_instance" "w3_db_instance" {
  allocated_storage = 10
  identifier        = "${var.project_name}-mysql-database"

  db_name        = var.db_name
  engine         = "mysql"
  engine_version = "8.0"

  instance_class = var.instance_class
  username       = var.db_username
  password       = var.db_password

  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = false

  vpc_security_group_ids = [var.vpc_security_group_ids]
  db_subnet_group_name   = aws_db_subnet_group.w3_rds_subnet_group.name

}
