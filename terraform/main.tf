# Docker Network

resource "docker_network" "staging_network" {
  name = var.network_name
}

resource "docker_image" "database_image" {
  name         = "postgres:16-alpine"
  keep_locally = false
}

resource "docker_container" "database" {
  name  = var.database_container_name
  image = docker_image.database_image.image_id

  env = [
    "POSTGRES_DB=${var.database_name}",
    "POSTGRES_USER=${var.database_user}",
    "POSTGRES_PASSWORD=${var.database_password}"
  ]

  networks_advanced {
    name = docker_network.staging_network.name
  }

  healthcheck {
    test = [
      "CMD-SHELL",
      "pg_isready -U ${var.database_user} -d ${var.database_name}"
    ]

    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }

  restart = "unless-stopped"
}

resource "docker_image" "application_image" {
  name         = "nginx:1.27-alpine"
  keep_locally = false
}

resource "docker_container" "application" {
  name  = var.application_container_name
  image = docker_image.application_image.image_id

  ports {
    internal = 80
    external = var.application_port
  }

  networks_advanced {
    name = docker_network.staging_network.name
  }

  restart = "unless-stopped"

  depends_on = [
    docker_container.database
  ]
}
