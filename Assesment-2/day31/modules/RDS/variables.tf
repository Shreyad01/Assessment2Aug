variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "db_subnet_group" {
  description = "DB subnet group name"
  type        = string
}

variable "db_instance_type" {
  type = string
}