# Serverless File Upload Logger

A serverless AWS project that logs uploaded S3 files into DynamoDB using AWS Lambda and Terraform.

## Architecture
S3 → Lambda → DynamoDB

## Tech Stack
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

## How to use
- Upload a file to the S3 input bucket
- Check DynamoDB for the logged metadata
- CloudWatch shows Lambda execution logs

## Notes
- Terraform manages infrastructure
- `.gitignore` excludes local Lambda zip and Terraform state
