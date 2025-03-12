#EC2 Instance
variable "environment" {}
variable "instance_name" {}
variable "instance_type" {}
variable "instance_tag" {}
variable "key_filename" {}
variable "key_name" {}

#RDS
variable "db_engine" {}               
variable "db_version" {}              
variable "db_instance_class" {}       
variable "db_username" {}             
variable "db_password" {}             
variable "db_parameter_group_name" {}  
variable "db_tag" {}                  

variable "aws_region" {}