output "db_instance_id" {
  value = aws_db_instance.db.id
}

output "rds_arn" {
  value = aws_db_instance.db.arn
}