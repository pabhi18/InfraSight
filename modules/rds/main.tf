resource "aws_db_instance" "infrasight-db" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = var.db_engine
  engine_version       = var.db_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.db_parameter_group_name
  skip_final_snapshot  = true
  publicly_accessible  = false

  tags = {
    Name        = var.db_tag
    Environment = var.environment
  }
}

