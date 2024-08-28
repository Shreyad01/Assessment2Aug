output "ec2_iam_role_arn" {
  value       = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket
}

output "s3_bucket_arn" {
 value = aws_s3_bucket.s3_bucket.arn 
}