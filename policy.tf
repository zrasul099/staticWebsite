
# data "aws_iam_policy_document" "public_read_policy" {
#   jsonencode({
#     # Version = "2012-10-17",
#     Statement = [
#       {
#         Sid       = "PublicReadGetObject",
#         Effect    = "Allow",
#         Principal = "*",
#         Action    = "s3:GetObject",
#         Resource  = "arn:aws:s3:::test-rasul-recap-bucket1/*"
#       }
#     ]
#   })
# }

# resource "aws_s3_bucket_policy" "allow_access_from_another_account1" {
#   bucket = aws_s3_bucket.test-rasul-recap-bucket1.id
#   policy = data.aws_iam_policy_document.public_read_policy.json
# }

