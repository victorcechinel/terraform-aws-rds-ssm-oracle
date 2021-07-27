output "rds_oracle_endpoint" {
  value       = aws_db_instance.rds_oracle.endpoint
  description = "RDS endpoint."
}

output "rds_oracle_username" {
  value       = aws_db_instance.rds_oracle.username
  description = "RDS username."
}

output "rds_oracle_password" {
  value       = aws_db_instance.rds_oracle.password
  sensitive   = true
  description = "RDS password."
}
