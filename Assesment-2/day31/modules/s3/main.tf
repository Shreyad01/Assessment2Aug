resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${terraform.workspace}-${var.s3_bucket_name}"
  tags = {
    Name = "${terraform.workspace}-${var.s3_bucket_name}"
  }
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.ec2_iam_role_arn
        }
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.s3_bucket.arn,
          "${aws_s3_bucket.s3_bucket.arn}/*"
        ]
      }
    ]
  })
}