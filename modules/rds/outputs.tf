output "db_cluster_endpoint" {
  description = "Endpoint writer del clúster de Aurora"
  value       = aws_rds_cluster.this.endpoint
}

output "db_cluster_reader_endpoint" {
  description = "Endpoint reader del clúster de Aurora"
  value       = aws_rds_cluster.this.reader_endpoint
}

output "db_cluster_id" {
  description = "ID del clúster de Aurora"
  value       = aws_rds_cluster.this.id
}
