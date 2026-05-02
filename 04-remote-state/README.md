# 04-REMOTE-STATE

This Terraform project bootstraps remote state infrastructure on AWS for managing Terraform state securely and collaboratively.

## Overview

The project creates:
- An S3 bucket for storing Terraform state files with versioning, encryption, and public access blocking
- A DynamoDB table for state locking to prevent concurrent modifications

It supports multiple environments through Terraform workspaces: `dev`, `prod`, and `staging`.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version ~> 1.0)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- AWS account with permissions to create S3 buckets and DynamoDB tables

## Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region for resources | `eu-north-1` |
| `project_name` | Name prefix for resources | `url-shortener` |

## Usage

1. **Clone or navigate to the project directory:**
   ```bash
   cd /home/ubuntu/projects/04-remote-state
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Review the plan:**
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

5. **Note the outputs:** After applying, copy the `backend_config` output to use in other Terraform projects.

## Using the Remote State in Other Projects

To use this remote state backend in another Terraform project, add the following to your `terraform` block (replace with actual values from outputs):

```hcl
terraform {
  backend "s3" {
    bucket         = "your-project-name-terraform-state-123456789012"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "your-project-name-terraform-locks"
    encrypt        = true
  }
}
```

## Workspaces

This project uses Terraform workspaces for different environments. The state files are stored in `terraform.tfstate.d/` with subdirectories for each workspace.

- `dev`: Development environment
- `prod`: Production environment
- `staging`: Staging environment

To switch workspaces:
```bash
terraform workspace select <workspace_name>
```

## Outputs

- `state_bucket_name`: Name of the S3 bucket for state storage
- `state_bucket_arn`: ARN of the S3 bucket
- `dynamodb_table_name`: Name of the DynamoDB table for locking
- `backend_config`: HCL snippet for configuring the S3 backend

## Security Notes

- The S3 bucket has public access blocked and server-side encryption enabled
- Versioning is enabled to allow recovery from accidental deletions or corruption
- DynamoDB table prevents concurrent state modifications

## Troubleshooting

- Ensure AWS credentials are configured and have the necessary permissions
- If you encounter locking issues, check the DynamoDB table for active locks
- For state corruption, use S3 versioning to restore previous versions</content>
<parameter name="filePath">/home/ubuntu/projects/04-remote-state/README.md