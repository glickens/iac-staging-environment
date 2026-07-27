# Staging Infrastructure Architecture

## Objective

Provision a reproducible staging environment using Infrastructure as Code with Terraform and Docker.

---

## Infrastructure Components

The staging environment consists of the following components:

- GitHub Repository
- GitHub Actions Workflow
- Terraform
- Docker Network
- Nginx Application Container
- PostgreSQL Database Container

---

## Deployment Workflow

1. Infrastructure code is stored in GitHub.
2. GitHub Actions validates the Terraform configuration.
3. Terraform provisions the infrastructure.
4. Terraform creates the Docker network.
5. Terraform deploys the PostgreSQL database container.
6. Terraform deploys the Nginx application container.
7. The application becomes available at:

```text
http://localhost:8080