variable "bucket_name" { }

# variable "acl_value" {
#   type = string
# }

variable "aws_region" {
  type = string
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}