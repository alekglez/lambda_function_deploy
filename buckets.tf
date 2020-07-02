resource "aws_s3_bucket" "bucket_read_videos" {
  bucket = var.bucket_for_videos
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket_read_videos.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.aws_lambda_test.arn
    events = ["s3:ObjectCreated:*"]
    filter_suffix = ".mp4"
  }
}
