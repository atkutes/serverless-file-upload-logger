# Serverless File Upload Logger

A serverless AWS project that logs uploaded S3 files into DynamoDB using AWS Lambda and Terraform.

## Architecture
S3 → Lambda → DynamoDB

## Tech stack
- AWS S3
- AWS Lambda (Python)
- AWS DynamoDB
- Terraform
- CloudWatch Logs

## Flow
1. File uploaded to S3 bucket
2. S3 event triggers Lambda
3. Lambda extracts file metadata
4. Metadata is stored in DynamoDB

## Deployment
Infrastructure is provisioned using Terraform.
