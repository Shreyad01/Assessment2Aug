variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "key_pair" {
  description = "Name of your private key pair"
  type = string
}

# EC2 IAM Role ARN
variable "ec2_iam_role_arn" {
  description = "The ARN of the IAM role attached to the EC2 instance."
  type = string
}

# variable "project_name" {
#   type = string
# }

variable "vpc_cidr_ip" {
  description = "VPC cidr and the Ip address"
  type = string
}

variable "private_subnet1_cidr" {
  description = "cidr and ip address for subnet"
  type = string
}

variable "private_subnet2_cidr" {
  description = "cidr and ip address for subnet"
  type = string
}

variable "pub_subnet_cidr_ip" {
  description = "Public Subnet Ip address and Cidr"
  type = string
}

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