resource "aws_cloudwatch_dashboard" "infrasight_dashboard" {
  dashboard_name = "infrasight-${var.environment}"
  dashboard_body = file(var.filepath)
}
