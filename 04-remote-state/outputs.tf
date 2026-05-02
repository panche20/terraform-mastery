output "state_bucket_name" {
  value       = aws_s3_bucket.terraform_state.id
  description = "S3 bucket for Terraform state"
}

output "state_bucket_arn" {
  value = aws_s3_bucket.terraform_state.arn
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "DynamoDB table for state locking"
}

output "backend_config" {
  value = <<-EOT
    Add this to your terraform block:

    backend "s3" {
      bucket         = "${aws_s3_bucket.terraform_state.id}"
      key            = "terraform.tfstate"
      region         = "${var.aws_region}"
      dynamodb_table = "${aws_dynamodb_table.terraform_locks.name}"
      encrypt        = true
    }
  EOT
}
