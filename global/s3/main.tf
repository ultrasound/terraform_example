provider "aws" {
  region = "ap-northeast-2"
}

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "ultrasound-terraform-example"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}