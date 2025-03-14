output "cloudwatch_dashboard_name" {
  description = "cloudWatch Dashboard name"
  value       = aws_cloudwatch_dashboard.infrasight_dashboard.dashboard_name
}
