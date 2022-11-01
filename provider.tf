terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.25"
    }
  }

  required_version = ">= 1.2.5"
}

provider "aws"{
  region  = "ap-southeast-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "secondary_region"
}