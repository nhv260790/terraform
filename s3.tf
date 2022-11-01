# data "aws_iam_policy_document" "example" {
#   statement {
#     sid = "1"

#     actions = [
#       "s3:ListAllMyBuckets",
#       "s3:GetBucketLocation",
#     ]

#     resources = [
#       "arn:aws:s3:::*",
#     ]
#   }

#   statement {
#     actions = [
#       "s3:ListBucket",
#     ]

#     resources = [
#       "arn:aws:s3:::${var.s3_bucket_name}",
#     ]

#     condition {
#       test     = "StringLike"
#       variable = "s3:prefix"

#       values = [
#         "",
#         "home/",
#         "home/&{aws:username}/",
#       ]
#     }
#   }

#   statement {
#     actions = [
#       "s3:*",
#     ]

#     resources = [
#       "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}",
#       "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}/*",
#     ]
#   }
# }

resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucketName
  # provider = aws.secondary_region

  tags = {
    Name        = "nhv2607-bucket"
    Environment = "Dev"
  }
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "my-bucket" {
  bucket = aws_s3_bucket.my-bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}


# resource "aws_s3_bucket_policy" "allow_access" {
#   bucket = aws_s3_bucket.my-bucket.id
#   policy = data.aws_iam_policy_document.allow_access.json
# }

data "aws_iam_policy_document" "allow_access" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.my-bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.my_origin_access_identity.iam_arn]
    }
  }
}

resource "aws_s3_bucket_acl" "my-bucket" {
  bucket = aws_s3_bucket.my-bucket.id
  acl    = "private"
}

resource "aws_s3_object" "add_index_file" {
  bucket = aws_s3_bucket.my-bucket.id
  key    = "index.html"
  source = "website/index.html"
  acl    = "public-read"
}

resource "aws_s3_object" "add_error_file" {
  bucket = aws_s3_bucket.my-bucket.id
  key    = "error.html"
  source = "website/error.html"
  acl    = "public-read"
}

resource "aws_s3_object" "add_image_file" {
  bucket = aws_s3_bucket.my-bucket.id
  key    = "spring-flower.jpg"
  source = "website/spring-flower.jpg"
  acl    = "public-read"
}