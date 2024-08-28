resource "aws_iam_role" "ec2_iam_role" {
  name = "${terraform.workspace}-EC2Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action":[
      "sts:AssumeRole"
      ], 
         
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Create IAM policy for S3 Full Access
resource "aws_iam_role_policy" "ec2_s3_policy" {
  name = "${terraform.workspace}-ec2_s3_policy"
  role = "${aws_iam_role.ec2_iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "${var.s3_bucket_arn}"
    }
  ]
}
EOF
}

# Create the IAM policy for RDS access
resource "aws_iam_role_policy" "ec2_db_policy" {
  name        = "${terraform.workspace}-ec2_db_policy"
  role = "${aws_iam_role.ec2_iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1724486869142",
      "Action": [
        "rds-db:CreateDBInstance",
        "rds-db:ModifyDBInastance"
        "rds-db:connect"
      ],
      "Effect": "Allow",
      "Resource": "${var.db_arn}"
    }
  ]
}
EOF
}

# Create Elastic IP address
# resource "aws_iam_role_policy" "ec2_policy" {
#   role   = aws_iam_role.ec2_role.id
#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "s3:*"
#       ],
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }
