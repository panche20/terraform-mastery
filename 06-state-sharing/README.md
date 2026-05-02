# 06-STATE-SHARING

This Terraform project demonstrates reading outputs from another Terraform remote state in AWS.

## Overview

The configuration:
- Uses the `terraform_remote_state` data source to read outputs from a separate remote Terraform state stored in S3
- Exposes those outputs via the local `assets_bucket` output

This project does not create infrastructure itself beyond reading remote state data.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with valid credentials
- Access to the remote S3 backend containing the other Terraform state

## Usage

1. Change into the repo folder:
   ```bash
   cd /home/ubuntu/projects/06-state-sharing
   ```

2. Initialize Terraform. If you need to specify backend values, do so during init:
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

## Outputs

- `assets_bucket`: The outputs map from the remote Terraform state configured in `data "terraform_remote_state" "assets"`.

## Notes

- The remote state source is currently configured to read from `url-shortener-terraform-state-028597908062` in `eu-north-1`.
- Make sure the remote state file exists and the AWS IAM identity has permission to read it.
- This project is useful for sharing data between Terraform configurations without duplicating resources.
