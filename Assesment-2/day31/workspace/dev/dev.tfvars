# ec2 Instance
ami = "ami-0522ab6e1ddcc7055"
instance_name = "dev-shreya"
instance_type = "t2.micro"
key_pair = "terraform-shreya-key"

# s3 bucket
s3_bucket_name = "day31-shreya-dev"

# rds
db_instance_type = "db.t3.micro"
db_username = "admin"
db_name = "mydb"
db_password = "user"
security_group_id = "db-sg-dev"
db_subnet_group = "db-subnet-dev"

# vpc
vpc_cidr_ip = "10.0.0.0/16"
pub_subnet_cidr_ip = "10.0.1.0/24"
private_subnet1_cidr = "10.0.2.0/24"
private_subnet2_cidr = "10.0.7.1/24"