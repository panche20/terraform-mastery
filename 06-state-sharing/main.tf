terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "url-shortener-terraform-state-028597908062"
    key            = "dev/app/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "url-shortener-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-north-1"
}

# Read outputs from another Terraform state
data "terraform_remote_state" "assets" {
  backend = "s3"
  config = {
    bucket = "url-shortener-terraform-state-028597908062"
    key    = "dev/terraform.tfstate"   # the other project's state
    region = "eu-north-1"
  }
}

# Use the bucket name from the other project
output "assets_bucket" {
  value = data.terraform_remote_state.assets.outputs
  description = "Outputs from assets state"
}
