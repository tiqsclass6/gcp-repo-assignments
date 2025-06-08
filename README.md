# 🌍 GitHub Weekly Assignments (Summary)

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)
![GCP](https://img.shields.io/badge/Cloud-Google_Cloud-4285F4?logo=googlecloud&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/gcp-repo-assignments)
![Repo Size](https://img.shields.io/github/repo-size/tiqsclass6/gcp-repo-assignments)
![Open Issues](https://img.shields.io/github/issues/tiqsclass6/gcp-repo-assignments)
![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen)
![Made with Terraform](https://img.shields.io/badge/Made%20with-Terraform-5F43E9?logo=terraform)
![Status](https://img.shields.io/badge/Status-Complete-blue)

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

### 🔹 [`assignment-05312025`](https://github.com/tiqsclass6/gcp-repo-assignments/tree/assignment-05312025)

- **Focus**: Complete multi-region infrastructure deployment with load balancing and autoscaling.
- **Includes**:
  - Regional instance templates and managed instance groups (MIGs)
  - Global HTTP regional load balancer with backend services and health checks
  - Autoscaling policy configuration
  - `brazil.sh`, `italy.sh`, `iowa.sh`, and `tokyo.sh`
  - Screenshot documentation for verification

---

### 🔹 [`assignment-06072025`](https://github.com/tiqsclass6/gcp-repo-assignments/tree/assignment-06072025)

- **Focus**: Full-stack GCP deployment with Global Load Balancer and cross-region autoscaling.
- **Includes**:
  - Zonal Managed Instance Groups (MIGs) in Iowa, Brazil, Italy, and Tokyo
  - Startup scripts customized per region using metadata
  - Global backend service with Terraform-defined `capacity_scaler` for even traffic
  - HTTP health checks and auto-healing policies
  - `README.md` with screenshot integration and dynamic Terraform outputs
  - `SC1-iowa.sh`, `SC2-italy.sh`, `SC3-brazil.sh`, `SC4-tokyo.sh` scripts

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

- **Terraform** – Infrastructure as Code (IaC) for declarative resource provisioning
- **Google Cloud Platform (GCP)** – Compute Engine, VPC, Subnetworks, NAT, Load Balancer, IAM, Cloud Router
- **Global HTTP Load Balancer** – With URL maps, backend services, and forwarding rules
- **Managed Instance Groups (MIGs)** – Zonal deployment, autoscaling, and health checks
- **Linux Startup Scripts** – Custom regional Apache web servers (`SC1-iowa.sh`, `SC2-italy.sh`, `SC3-brazil.sh`, `SC4-tokyo.sh`)
- **Firewall Rules** – Port/tag-based restrictions (SSH, HTTP, RDP)
- **Cloud NAT & Routers** – Regional egress configuration
- **Google Metadata Server** – Used to inject dynamic content into web server pages
- **Shell Scripting** – Metadata retrieval and dynamic HTML rendering
- **GitHub Branching** – Weekly infrastructure expansions using assignment branches
- **Markdown Documentation** – Structured `README.md` with screenshots and project tree
- **Shields.io** – Repo badges for status, size, commits, etc.
- **GCP Console UI** – For screenshot validation of deployment results

---

## 📬 Contact

- **Author:** T.I.Q.S.
