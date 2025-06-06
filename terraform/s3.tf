provider "aws" {
    region = "us-east-1"  # adjust as needed
  }

  # S3 bucket creation
  resource "aws_s3_bucket" "devops_bucket" {
      bucket = "devops-assoc-bucket"

      tags = {
        Name = "DevOpsAssocBucket"
   }
 }

  resource "aws_s3_bucket_versioning" "devops_bucket_versioning" {
       bucket = aws_s3_bucket.devops_bucket.id

       versioning_configuration {
         status = "Enabled"
   }
 }

