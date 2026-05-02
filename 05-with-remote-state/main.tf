terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Remote state backend
  # Configure with: terraform init -backend-config="bucket=STATE_BUCKET_VALUE" -backend-config="dynamodb_table=LOCK_TABLE_VALUE"
  backend "s3" {
    key            = "dev/terraform.tfstate"   # path within bucket
    region         = "eu-north-1"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "app_assets" {
  bucket = "${var.project_name}-assets-${var.environment}-${random_id.suffix.hex}"

  tags = {
    Name        = "${var.project_name}-assets"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}
