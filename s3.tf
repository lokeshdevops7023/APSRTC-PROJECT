terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "apsrtc_bucket" {
  bucket = "apsrtc-project-bucket"
  acl    = "private"

  tags = {
    Name        = "APSRTC Project Bucket"
    Environment = "dev"
  }
}
