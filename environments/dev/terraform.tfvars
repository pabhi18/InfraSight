#EC2 Instance
environment    = "dev"
instance_name  = "infrasight"
instance_type  = "t2.micro"
instance_tag   = "infrasight-dev"
key_filename   = "infrasight-keyfile-dev"
key_name       = "infrasight-keypair-dev"

#RDS
db_engine                = "mysql"
db_version               = "8.0"
db_instance_class        = "db.t3.micro"
db_username              = "admin"
db_password              = "admin123"
db_parameter_group_name  = "default.mysql8.0"
db_tag                   = "infrasight-db-dev"

aws_region = "us-east-1"