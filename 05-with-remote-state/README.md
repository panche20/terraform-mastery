# 05-WITH-REMOTE-STATE

This Terraform project creates an AWS S3 bucket for application assets and is configured to use an S3 remote state backend.

## Overview

The configuration provisions:
- An AWS S3 bucket named using `project_name`, `environment`, and a random suffix
- A `random_id` resource for bucket name uniqueness

The Terraform backend is configured for S3 remote state storage, but backend values such as the bucket name and DynamoDB lock table must be provided during `terraform init`.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with credentials
- AWS account permissions to create S3 buckets

## Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region for resources | `eu-north-1` |
| `project_name` | Prefix used for the bucket name | `url-shortener` |
| `environment` | Environment name used in bucket naming | `dev` |

## Usage

1. Change into the repo folder:
   ```bash
   cd /home/ubuntu/projects/05-with-remote-state
   ```

2. Initialize Terraform with backend configuration:
   ```bash
   terraform init \
     -backend-config="bucket=<STATE_BUCKET>" \
     -backend-config="key=dev/terraform.tfstate" \
     -backend-config="region=eu-north-1" \
     -backend-config="encrypt=true" \
     -backend-config="dynamodb_table=<LOCK_TABLE>"
   ```

3. Review the plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

## Notes

- The backend configuration is not hardcoded for bucket and lock table values, so you must supply them when initializing the workspace.
- If you want to reuse an existing remote state backend, ensure the bucket and DynamoDB table are already created and accessible.

## Optional

The file `state-bucket-policy.json` is included as an example S3 bucket policy, but it is not currently referenced by the Terraform configuration.
