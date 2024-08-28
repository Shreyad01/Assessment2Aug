# Create VPC, subnets, and security groups
resource "aws_vpc" "ProjectVPC" {
  cidr_block = var.vpc_cidr  # "10.0.0.0/16"
  tags = {
    Name = "${terraform.workspace}-shreya"
  }
}
# Create a public subnet
resource "aws_subnet" "Project_public_subnet" {
  vpc_id                  = aws_vpc.ProjectVPC.id
  cidr_block              = var.pub_subnet_cidr  # "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${terraform.workspace}-pub-subnet-shreya"
  }
}

# create a private subnet
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.ProjectVPC.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${terraform.workspace}-Private Subnet1-shreya"
  }
}

# create a private subnet
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.ProjectVPC.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "ap-south-1c"

  tags = {
    Name = "${terraform.workspace}-Private Subnet2-shreya"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "Project_igw" {
  vpc_id = aws_vpc.ProjectVPC.id
  tags = {
    Name = "${terraform.workspace}-shreya"
  }
}
# Create a route table for the public subnet
resource "aws_route_table" "Project_public_rt" {
  vpc_id = aws_vpc.ProjectVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Project_igw.id
  }

  tags = {
    Name = "${terraform.workspace}-public-RT-shreya"
  }
}

# Create a route table for the private subnet
resource "aws_route_table" "Project_private_rt" {
  vpc_id = aws_vpc.ProjectVPC.id

  tags = {
    Name = "${terraform.workspace}-private-RT-shreya"
  }
}

# create subnet group of private subnet1 and private subnet2
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${terraform.workspace}-rds_subnet_group"
  subnet_ids = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
  tags = {
    Name = "${terraform.workspace} RDS Subnet Group"
  }
}

# Associate the route table with the public subnet
resource "aws_route_table_association" "Project_public_rt_assoc" {
  subnet_id      = aws_subnet.Project_public_subnet.id
  route_table_id = aws_route_table.Project_public_rt.id
}

# Associate the route table with the private subnet1
resource "aws_route_table_association" "Project_private_rt_assoc1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.Project_private_rt.id
}

# Associate the route table with the private subnet2
resource "aws_route_table_association" "Project_private_rt_assoc2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.Project_private_rt.id
}

