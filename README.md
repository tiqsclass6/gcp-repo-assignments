# GitHub Assignment (05-24-2025)

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)
![GCP](https://img.shields.io/badge/Cloud-Google_Cloud-4285F4?logo=googlecloud&logoColor=white)
![License](https://img.shields.io/github/license/tiqsclass6/gcp-repo-assignments)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/gcp-repo-assignments)

This repository contains a modular Terraform configuration to deploy a secure, scalable, and multi-regional GCP infrastructure. The design includes **regional VPCs, subnets, routers, NAT gateways, firewalls, and virtual machine instances in Brazil, Japan, and Italy**—each with its own startup script.

---

## 📁 Project Structure

- `.gitignore` – 🚫 Prevents sensitive files and state data from being committed.
- `0-authentication.tf` – 🔐 Configures credentials to enable secure GCP access.
- `1-backend.tf` – 💾 Defines the remote backend (e.g., GCS bucket) for Terraform state.
- `2-vpc.tf` – 🌐 Provisions VPCs for Brazil 🇧🇷, Japan 🇯🇵, and Italy 🇮🇹 with regional routing.
- `3-subnets.tf` – 🧩 Creates subnets per region with unique CIDR blocks.
- `4-router.tf` – 🚦 Deploys Cloud Routers for dynamic routing in each region.
- `5-nat.tf` – 🌍 Configures Cloud NAT to allow private VMs outbound internet access.
- `6-firewalls.tf` – 🔥 Establishes firewall rules for inter-region and external access.
- `7a-compute.tf` – 🖥️ Launches VM instances in each region and applies startup scripts.
- `AA-outputs.tf` – 📤 Outputs resource info like external IPs, VM names, etc.
- `brazil-startup.sh` – 🇧🇷 Configures web server and content for the Brazil region VM.
- `italy-startup.sh` – 🇮🇹 Sets up Italy region VM with custom HTML and Apache config.
- `japan-startup.sh` – 🇯🇵 Initializes the Japan VM with localized web content.

---

## 🚀 Getting Started

### 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- Valid GCP project and service account key

### 🛠️ Clone Repository

```bash
git clone https://github.com/tiqsclass6/gcp-repo-assignments
cd gcp-repo-assignments
git checkout assignment-05242025
code .
```

### ⚙️ Initialize, Format, Validate, Plan and Apply Infrastructure

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply -auto-approve
```

### 🧹 Destroy Infrastructure

```bash
terraform destroy -auto-approve
```

---

## 🏗️ Resources Provisioned

- **google_project_service** – Enables GCP APIs like Compute, VPC, and IAM.
- **google_compute_network** – Regional VPCs with custom settings.
- **google_compute_subnetwork** – Subnets uniquely defined per region.
- **google_compute_router** – Routers for regional egress traffic.
- **google_compute_router_nat** – NATs for private VM internet access.
- **google_compute_firewall** – Firewall rules for controlled ingress/egress.
- **google_compute_instance** – VM instances per region, each with startup logic.

---

## 🧪 Troubleshooting Tips

- 🔑 **Authentication**: Ensure `GOOGLE_APPLICATION_CREDENTIALS` is set correctly.
- 🔒 **Permissions**: Service account must have Compute Admin, Editor, and Service Usage Admin roles.
- ⚠️ **API Access**: Ensure `compute.googleapis.com` and other necessary services are enabled.
- 🐞 **Debugging**: Use debug output for verbose logs:

    ```bash
    TF_LOG=DEBUG terraform apply
    ```

---

## 📌 Notes

- Use `.gitignore` to keep your Terraform state and credentials secure.
- Each region-specific VM is independently customized via its respective startup script.
- This architecture is modular and scalable—suitable for expansion to new regions or services.
