module "ec2" {
  source        = "../../modules/ec2"
  instance_name = var.instance_name
  instance_tag  = var.instance_tag
  instance_type = var.instance_type
  environment   = var.environment
  key_filename  = var.key_filename
  key_name      = var.key_name
}

module "rds" {
  source                    = "../../modules/rds"
  db_engine                 = var.db_engine
  db_version                = var.db_version
  db_instance_class         = var.db_instance_class
  db_username               = var.db_username
  db_password               = var.db_password
  db_parameter_group_name   = var.db_parameter_group_name
  db_tag                    = var.db_tag
  environment               = var.environment
}

module "cloudWatch" {
    source      = "../../modules/cloudwatch"
    filepath    = var.filepath
    environment = var.environment
}