output "environment_name" {
  description = "Provisioned environment"
  value       = var.environment_name
}

output "application_url" {
  description = "URL for the staging application"
  value       = "http://localhost:${var.application_port}"
}

output "application_container" {
  description = "Application container name"
  value       = docker_container.application.name
}

output "database_container" {
  description = "Database container name"
  value       = docker_container.database.name
}

output "network_name" {
  description = "Docker network created for staging"
  value       = docker_network.staging_network.name
}