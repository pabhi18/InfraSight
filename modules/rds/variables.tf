variable "db_engine" {
    description = "DataBase Engine Type"
    type = string
}

variable "db_version" {
    description = "DataBase Engine Version"
    type = string  
}

variable "db_instance_class" {
    description = "Database instance class"
    type = string  
}

variable "db_username" {
    description = "Database Username"
    type = string  
}

variable "db_password" {
    description = "Database Password"
    type = string  
}

variable "db_parameter_group_name" {
    description = "Database Parameter Group Name"
    type = string  
}

variable "db_tag" {
    description = "Tag for DB"
    type = string  
}

variable "environment" {
    description = "environment"
    type = string  
}