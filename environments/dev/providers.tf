terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

    backend "s3" {
        bucket         = "infrasight-statefile"
        key            = "statefile-dev/terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "infrastate-statelock"
    }
}

provider "aws" {
  region = "us-east-1"
}