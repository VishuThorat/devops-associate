# devops-associate
# DevOps Associate Practical Exam - Setup Overview

## Project Overview

This project demonstrates the provisioning and management of a simple cloud-native environment on AWS using Terraform, Docker Compose, and monitoring tools like Prometheus and CloudWatch.

---

## Infrastructure Provisioning

- **Terraform** provisions:
  - An S3 bucket (`devops-assoc-bucket`) with versioning enabled.
  - An EC2 instance (`t2.micro`) in the default VPC with public IP output.

## CI/CD Pipeline

- GitHub Actions workflow runs `terraform validate` to ensure Terraform configs are correct.

---

## Docker Compose Setup

- Multi-service app with:
  - `web` service using `nginx:alpine` on port 8080, with environment variables and HTTP healthchecks.
  - `redis` service on port 6379.
- ELK Stack for log aggregation:
  - Elasticsearch, Logstash, Kibana.
  - Logstash reads logs from a mounted volume (`app.log`) and sends to Elasticsearch.

---

## Monitoring and Alerting

- **CloudWatch Alarm** for EC2 CPU utilization exceeding 80% for 5 minutes.
- **Prometheus** configured to scrape the EC2 instance (node exporter on port 9100) every 15 seconds.

---

## How to Run Locally

1. Ensure you have Docker and Docker Compose installed.
2. Run `docker-compose up -d` to start all services.
3. Access:
   - Web app: `http://localhost:8080`
   - Kibana: `http://localhost:5601`
   - Prometheus UI: (configured in compose file, e.g., `http://localhost:9090`)

---

## Files Included

- `s3.tf` — Terraform config for S3 bucket
- `ec2.tf` — Terraform config for EC2 instance
- `.github/workflows/ci.yml` — GitHub Actions CI pipeline snippet
- `docker-compose.yml` — Docker Compose for app + ELK + Prometheus
- `logstash.conf` — Logstash configuration for log aggregation
- CloudWatch CLI command snippet in documentation
- `prometheus.yml` — Prometheus scrape config

---

## Notes

- Terraform state files are excluded.
- Make sure AWS credentials are configured properly before applying Terraform.
- Ports may need adjustment if conflicts occur on the local machine.

---
