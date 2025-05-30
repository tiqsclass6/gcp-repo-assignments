
# 🌍 GitHub Weekly Assignments (Summary)

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)
![GCP](https://img.shields.io/badge/Cloud-Google_Cloud-4285F4?logo=googlecloud&logoColor=white)
![License](https://img.shields.io/github/license/tiqsclass6/gcp-repo-assignments)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/gcp-repo-assignments)

This repository contains multiple modular GCP infrastructure deployments using **Terraform**. Each **branch** represents a specific assignment with regionally separated network architectures, VM customization scripts, and cloud automation practices. **Resources are added weekly to progressively build out the entire GCP network architecture—starting with authentication and backend configuration, then expanding through VPCs, subnets, NAT, firewall rules, and compute resources. The build culminates in the deployment of managed instance groups, autoscaling policies, regional HTTP load balancer, health checks, and multi-zone traffic distribution.**

---

## 📌 Branch Breakdown

### 🔹 [`assignment-04272025`](https://github.com/tiqsclass6/gcp-repo-assignments/tree/assignment-04272025)

- **Focus**: Initial deployment of region-specific VPCs using Terraform.
- **Includes**:
  - VPC setup for Iowa, Brazil, Tokyo
  - Remote backend
  - Terraform auth
  - Uploading photos of Brazil and Tokyo to GCS

---

### 🔹 [`assignment-05032025`](https://github.com/tiqsclass6/gcp-repo-assignments/tree/assignment-05032025)

- **Focus**: VPC enhancements and early subnet definitions.
- **Includes**:
  - Extended subnet support per region
  - Modular authentication and backend structure

---

### 🔹 [`assignment-05102025`](https://github.com/tiqsclass6/gcp-repo-assignments/tree/assignment-05102025)

- **Focus**: Regional VPCs with multiple subnets and NAT configuration.
- **Includes**:
  - Cloud routers + NAT
  - Modular infrastructure expansion
  - Clean file split for networking

---

### 🔹 [`assignment-05172025`](https://github.com/tiqsclass6/gcp-repo-assignments/tree/assignment-05172025)

- **Focus**: Full VM provisioning with startup scripts and firewall segmentation.
- **Includes**:
  - Custom Linux VM per region
  - Firewall rules to restrict SSH/HTTP
  - `brazil-startup.sh` script support

---

### 🔹 [`assignment-05242025`](https://github.com/tiqsclass6/gcp-repo-assignments/tree/assignment-05242025)

- **Focus**: Multi-region VM deployment with custom startup behavior for each.
- **Includes**:
  - `brazil-startup.sh`, `italy-startup.sh`, `japan-startup.sh`
  - Full Terraform provisioning for compute, firewall, VPC, NAT, and more
  - Outputs file (`AA-outputs.tf`) for public IPs, names, etc.

---

## 🚀 Getting Started

```bash
git clone https://github.com/tiqsclass6/gcp-repo-assignments
cd gcp-repo-assignments
git checkout <branch-name>
code .
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply -auto-approve
```

Replace `<branch-name>` with any of the listed branches above.

---

## 🧰 Tools Used

- Terraform (IaC)
- GCP (VPC, Compute, NAT, Router, IAM)
- Linux startup scripts
- Shell scripting (custom region initialization)

---

## 📬 Contact

- **Author:** T.I.Q.S.
