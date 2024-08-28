terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  #backend "local" {}
}

provider "aws" {
  region = "ap-south-1"
  profile = terraform.workspace
}

module "ec2" {
  source         = "/home/einfochips/Desktop/learning/day31/day31/modules/ec2"
  ami_map        = var.ami
  instance_type  = var.instance_type
  instance_name  = var.instance_name
  key_pair       = var.key_pair
  public_subnet_id = module.vpc.ec2_instance_subnet_id
  security_group_id = module.security_group.ec2_sg_ssh_id
  ec2_iam_role_arn = module.IAM_Role.ec2_iam_role_arn
  # project_name = var.project_name
}

module "IAM_Role" {
  source = "/home/einfochips/Desktop/learning/day31/day31/modules/IAM_Role"
  s3_bucket_arn = module.s3.s3_bucket_arn
  db_arn = module.RDS.rds_arn
}

module "RDS" {
  source = "/home/einfochips/Desktop/learning/day31/day31/modules/RDS"
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  security_group_id = var.security_group_id
  db_subnet_group = var.db_subnet_group
  db_instance_type = var.db_instance_type
}
module "s3" {
  source       = "/home/einfochips/Desktop/learning/day31/day31/modules/s3"
  s3_bucket_name  = var.s3_bucket_name
  ec2_iam_role_arn = module.IAM_Role.ec2_iam_role_arn
}

module "vpc" {
  source = "/home/einfochips/Desktop/learning/day31/day31/modules/vpc"
  vpc_cidr = var.vpc_cidr_ip
  pub_subnet_cidr = var.pub_subnet_cidr_ip
  private_subnet1_cidr = var.private_subnet2_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
}

module "security_group" {
  source = "/home/einfochips/Desktop/learning/day31/day31/modules/security_group"
  ProjectVPC_id = module.vpc.ProjectVPC_id
}