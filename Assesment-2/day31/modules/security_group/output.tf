# output of ec2 security group id
output "ec2_sg_ssh_id" {
  value = aws_security_group.ec2_sg_ssh.id
}

# output of rds security group id
output "db_sg_id" {
    value = aws_security_group.db_sg.id  
}