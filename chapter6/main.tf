terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
  cloud {
    organization = "mk-lab"
    workspaces {
      name = "terraform-nyumon-chapter6"
    }
  }
}

provider "aws" {
  region = var.region
}

module "s3-webapp" {
  source  = "app.terraform.io/mk-lab/s3-webapp/aws"
  name   = var.name
  region = var.region
  prefix = var.prefix
  version = "1.1.0"
}
