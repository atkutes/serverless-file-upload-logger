# Lambda funkcija
resource "aws_lambda_function" "logger" {
  function_name = "file-upload-logger"
  role          = aws_iam_role.lambda_role.arn
  runtime       = "python3.10"
  handler       = "handler.lambda_handler"

  filename         = "../lambda/lambda.zip"
  source_code_hash = filebase64sha256("../lambda/lambda.zip")

  timeout = 10
}

# IAM permission, kad S3 galėtų kviesti Lambda
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.logger.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.uploads.arn
}

# S3 bucket notification
resource "aws_s3_bucket_notification" "trigger" {
  bucket = aws_s3_bucket.uploads.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.logger.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [
    aws_lambda_function.logger,
    aws_lambda_permission.allow_s3
  ]
}

