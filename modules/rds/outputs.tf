output "rds_endpoint" {
  description = "RDS endpoint to connect to the database"
  value       = aws_db_instance.infrasight-db.endpoint
}

output "rds_port" {
  description = "Database port"
  value       = aws_db_instance.infrasight-db.port
}

output "rds_username" {
  description = "Database master username"
  value       = aws_db_instance.infrasight-db.username
}

output "rds_arn" {
  description = "Amazon Resource Name (ARN) of the RDS instance"
  value       = aws_db_instance.infrasight-db.arn
}

output "rds_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.infrasight-db.identifier
}

output "rds_status" {
  description = "Current status of the RDS instance"
  value       = aws_db_instance.infrasight-db.status
}
