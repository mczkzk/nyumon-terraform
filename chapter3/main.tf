terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "mk-lab"
    workspaces {
      name = "aws-infra"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1" # Tokyo region
}

# Get the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 Instance
resource "aws_instance" "test_server" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"

  tags = {
    Name      = "TestInstance",
    ManagedBy = "HCP Terraform"
  }
}
