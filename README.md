# GitHub Assignment (05-17-2025)

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)
![GCP](https://img.shields.io/badge/Cloud-Google_Cloud-4285F4?logo=googlecloud&logoColor=white)
![License](https://img.shields.io/github/license/tiqsclass6/gcp-repo-assignments)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/gcp-repo-assignments)

This repository contains modular Terraform configurations to provision secure, regionally segmented VPC infrastructure on Google Cloud Platform (GCP). The setup includes authentication, VPC networks, subnets, routers, firewall rules, NAT gateways, and virtual machines.

---

## 📁 Project Structure

- `0-authentication.tf` – 🔐 Configures service account credentials and authentication required for Terraform to access GCP resources securely.

- `1-backend.tf` – 💾 Defines the remote backend (typically a GCS bucket) to store Terraform state files, ensuring collaboration and consistency.

- `2-vpc.tf` – 🌐 Provisions three separate Virtual Private Cloud (VPC) networks in Iowa 🇺🇸, Brazil 🇧🇷, and Tokyo 🇯🇵 with regional routing and MTU settings.

- `3-subnets.tf` – 🧩 Creates custom subnets within each regional VPC with specific IP CIDR ranges and regional placements.

- `4-router.tf` – 🚦Deploys Cloud Routers per region to manage dynamic routing and enable Cloud NAT configurations.

- `5-nat.tf` – 🌍 Provisions Cloud NAT gateways for each router, allowing outbound internet access for VMs in private subnets without assigning public IPs.

- `6-firewalls.tf` – 🔥 Sets up ingress and egress firewall rules to control traffic between regions (Iowa ↔ Brazil ↔ Tokyo) and enforce access policies (SSH, HTTP, ICMP, etc.).

- `7-compute.tf` – 🖥️ Creates VM instances in each region using custom machine types, tags, metadata, and startup scripts.

- `brazil-startup.sh` – 🟢 A custom startup script executed by the Brazil region Linux VM. It typically:
  - Installs Apache or NGINX
  - Deploys a custom HTML page or message
  - Configures the server to display regional or thematic content (e.g., Brazil flag, map, mascot)

- `.gitignore` – 🚫 Excludes sensitive or auto-generated files such as:
  - `terraform.tfstate`, `.terraform/`
  - Service account JSON keys
  - `.terraform.lock.hcl`

---

## 🚀 Getting Started

### 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- A valid GCP project and service account key file

### 🛠️ Clone Repository

```bash
git clone https://github.com/tiqsclass6/gcp-repo-assignments
cd gcp-repo-assignments
git checkout assignment-05172025
code .
```

### ⚙️ Initialize, Format, Validate, Plan, and Apply Infrastructure

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

- **google_project_service** – Enables required GCP APIs like `compute.googleapis.com`
- **google_compute_network** – VPCs per region (Iowa 🇺🇸, Brazil 🇧🇷, Tokyo 🇯🇵)
- **google_compute_subnetwork** – Custom subnet configurations per region
- **google_compute_router** – Configured routers for routing traffic
- **google_compute_router_nat** – NAT gateways for secure internet access
- **google_compute_firewall** – Regional access and path rules
- **google_compute_instance** – VM instances deployed in each region

---

## 🧪 Troubleshooting Tips

- 🔑 **Authentication**: Make sure `GOOGLE_APPLICATION_CREDENTIALS` is correctly set.
- 🔒 **Permissions**: Ensure your service account has Compute Admin, Editor, and Service Usage Admin roles.
- ⚠️ **API Errors**: Confirm that all required APIs are enabled in GCP.
- 🌐 **Network Issues**: Validate subnet ranges and region uniqueness.
- 🐞 **Debugging**: Use debug mode to troubleshoot:

    ```bash
    TF_LOG=DEBUG terraform apply
    ```

---

## 📌 Notes

- Keep your credentials secure and never commit `.tfstate` or service account JSON files.
- This setup is modular and extendable to add additional resources or environments.
- Pull requests and contributions are welcome!
