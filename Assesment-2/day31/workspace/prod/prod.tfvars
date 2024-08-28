# ec2 Instance
ami = "ami-0522ab6e1ddcc7055"
instance_name = "prod-shreya"
instance_type = "t2.micro"
key_pair_name = "terraform-shreya-key"

# s3 bucket
bucket_name = "day31-shreya-prod"

# rds
db_instance_type = "db.t3.micro"
db_username = "admin1"
db_name = "mydb1"
db_password = "user"
security_group_id = "db-sg-prod"
db_subnet_group = "db-subnet-prod"

# vpc
vpc_cidr_ip = "10.0.3.0/16"
pub_subnet_cidr_ip = "10.0.1.4/24"
priv_subnet1_cidr_ip = "10.0.2.5/24"
priv_subnet2_cidr_ip = "10.3.0.6/24"