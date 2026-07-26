variable "environment_name" {
  description = "Name of the environment being provisioned"
  type        = string
  default     = "staging"
}

variable "network_name" {
  description = "Name of the Docker network used by the staging environment"
  type        = string
  default     = "staging-network"
}

variable "application_container_name" {
  description = "Name of the staging application container"
  type        = string
  default     = "staging-app"
}

variable "database_container_name" {
  description = "Name of the staging database container"
  type        = string
  default     = "staging-database"
}

variable "application_port" {
  description = "Host port used to access the staging application"
  type        = number
  default     = 8080
}

variable "database_name" {
  description = "Name of the PostgreSQL staging database"
  type        = string
  default     = "staging_db"
}

variable "database_user" {
  description = "PostgreSQL staging database username"
  type        = string
  default     = "staging_user"
}

variable "database_password" {
  description = "PostgreSQL staging database password"
  type        = string
  sensitive   = true
}