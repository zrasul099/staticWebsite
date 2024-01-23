provider "aws" {
  region = "us-east-2"
}
resource "aws_s3_bucket" "static-web-rasul" {
    bucket = "static-web-rasul"
   
  
}
  resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.static-web-rasul.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  }


resource "aws_s3_bucket_public_access_block" "block-policy" {
  bucket = aws_s3_bucket.static-web-rasul.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "my-policy-web" {
  bucket = aws_s3_bucket.static-web-rasul.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::static-web-rasul/*"
            ]
        }
    ]
}
)
}

resource "aws_s3_bucket_object" "upload_index" {
  bucket = aws_s3_bucket.static-web-rasul.id
  key    = "index.html"

  source = "/Users/rasulzakirov/Downloads/index.html"
   content_type = "text/html"
  }
  resource "aws_s3_bucket_object" "upload_object" {
  bucket = aws_s3_bucket.static-web-rasul.id
  key    = "team1.png"

  source = "/Users/rasulzakirov/Downloads/team1.png"
  
  }