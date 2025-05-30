# GitHub Assignment (05-10-2025)

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)
![GCP](https://img.shields.io/badge/Cloud-Google_Cloud-4285F4?logo=googlecloud&logoColor=white)
![Repo Size](https://img.shields.io/github/repo-size/tiqsclass6/git-repo-build-05102025)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/git-repo-build-05102025)
![License](https://img.shields.io/github/license/tiqsclass6/git-repo-build-05102025)
![Stars](https://img.shields.io/github/stars/tiqsclass6/git-repo-build-05102025?style=social)

This repository contains modular Terraform configurations for deploying a secure, regionally segmented VPC infrastructure on Google Cloud Platform (GCP).

---

## 📁 Project Structure

- `0-authentication.tf` – 🔐 Auth setup for secure access to GCP.
- `1-backend.tf` – 💾 Remote backend configuration for state file storage.
- `2-vpc.tf` – 🌐 Defines VPCs across multiple GCP regions (e.g., Iowa, Brazil, Tokyo).
- `3-subnets.tf` – 🧩 Configures subnets within each regional VPC.
- `4-router.tf` – 🚦 Sets up cloud routers for routing traffic within and between regions.
- `5-nat.tf` – 🌍 Provisions Cloud NAT gateways for outbound internet access.
- `.gitignore` – 🚫 Prevents committing sensitive or local state files.

## 🚀 Getting Started

### 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- Google Cloud SDK
- GCP service account with appropriate IAM roles

---

### 🛠️ Clone Repository

```bash
git clone https://github.com/tiqsclass6/git-repo-build-05102025
cd git-repo-build-05102025
code .
```

## ⚙️ Initialize, Format, Validate, Plan, and Apply Infrastructure

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply -auto-approve
```

## 🧹 Tear Down Infrastructure

```bash
terraform destroy -auto-approve
```

---

## 🏗️ Resources Deployed

- **google_project_service:** Enables necessary GCP APIs like `compute.googleapis.com.`
- `google_compute_network:`
  - **iowa** 🇺🇸
  - **brazil** 🇧🇷
  - **tokyo** 🇯🇵
  - Common config:
    - `routing_mode = "REGIONAL"`
    - `auto_create_subnetworks = false`
    - `MTU = 1460`

---

## 🧪 Troubleshooting

- 🔑 **Auth Issues:** Ensure the `GOOGLE_APPLICATION_CREDENTIALS` env variable is set.
- 🔒 **IAM Roles:** Verify your service account has Compute Admin, Editor, and Service Usage Admin.
- ⚠️ **API Errors:** Make sure necessary services are enabled in `google_project_service`.
- 🌐 **VPC Errors:** Check for region uniqueness and subnet overlap.

---

## 🐞 Debug Logs

```bash
TF_LOG=DEBUG terraform apply
```

---

## 📝 Notes

- Never commit credentials—use `.gitignore` to exclude sensitive files.
- Customize region naming to match your infrastructure standards.
- Contributions and forks welcome!
