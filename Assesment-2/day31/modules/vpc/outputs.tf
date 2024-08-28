output "ec2_instance_subnet_id" {
  description = "subnet id for ec2 instance"
  value = aws_subnet.Project_public_subnet.id
}

output "ProjectVPC_id" {
  value = aws_vpc.ProjectVPC.id
  
}