variable "ami_map" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default = "ami-0522ab6e1ddcc7055"  #ubuntu version 24.40
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "key_pair" {
  description = "Name of your private key pair"
  type = string
}


variable "public_subnet_id" {
  description = "public subnit id for ec2"
  type = string
}

variable "security_group_id" {
  description = "security group id for ec2"
  type = string
}

variable "ec2_iam_role_arn" {
    type        = string
    description = "The ARN of the IAM role to be used by the EC2 instance"
}


# variable "project_name" {
#   description = "Adding Project Tag to Ec2 instance"
#   type = string
# }