#EC2 Instance
environment    = "prod"
instance_name  = "infrasight-prod"
instance_type  = "t2.micro"
instance_tag   = "infrasight-prod"
key_filename   = "infrasight-keyfile-prod"
key_name       = "infrasight-keypair-prod"

#RDS
db_engine                = "mysql"
db_version               = "8.0"
db_instance_class        = "db.t3.micro"
db_username              = "admin"
db_password              = "admin123"
db_parameter_group_name  = "default.mysql8.0"
db_tag                   = "infrasight-db-prod"

aws_region = "us-east-1"