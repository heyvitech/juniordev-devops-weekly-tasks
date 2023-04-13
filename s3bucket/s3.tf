data "aws_iam_policy_document" "allow_access_from_another_account" {
  version = "2012-10-17"
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = ["s3:GetObject"]
    resources = [
      "${aws_s3_bucket.juniordevtask.arn}/*",
    ]
  }
}

resource "aws_s3_bucket" "juniordevtask" {
  bucket = "${var.bucket_name}"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.juniordevtask.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.juniordevtask.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

resource "aws_s3_bucket_website_configuration" "s3_site" {
  bucket        = aws_s3_bucket.juniordevtask.id

  index_document {
    suffix = "index.html"
  }
}
