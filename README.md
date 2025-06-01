
# GCP Assignment (05-31-2025)

![Terraform GCP](https://img.shields.io/badge/Terraform-GCP-blueviolet?logo=terraform&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/gcp-repo-build-05312025?style=flat-square)
![Repo Size](https://img.shields.io/github/repo-size/tiqsclass6/gcp-repo-build-05312025)
![GCP Enabled](https://img.shields.io/badge/GCP-Enabled-4285F4?logo=googlecloud&logoColor=white)
![Made with Terraform](https://img.shields.io/badge/Made%20with-Terraform-5F43E9?logo=terraform)
![Project Status](https://img.shields.io/badge/Status-Stable-brightgreen)

This repository contains a modular, scalable Terraform configuration for deploying a fully operational infrastructure on **Google Cloud Platform (GCP)**. The deployment spans **VPC setup, NAT routing, firewall rules, managed instance groups, load balancing, autoscaling policies, and startup scripts for regional instances.**

## 📁 Project Structure

```bash
├── Screenshots/
│   ├── brazil.jpg
│   ├── firewalls.jpg
│   ├── health-checks.jpg
│   ├── instance-groups.jpg
│   ├── instance-templates.jpg
│   ├── iowa.jpg
│   ├── italy1.jpg
│   ├── italy2.jpg
│   ├── italy3.jpg
│   ├── lb-backend.jpg
│   ├── lb-frontend.jpg
│   ├── load-balancer.jpg
│   ├── nats.jpg
│   ├── outputs.jpg
│   ├── routers.jpg
│   ├── subnets.jpg
│   ├── tf-lb-backend.jpg
│   ├── tf-lb-frontend.jpg
│   ├── tf-outputs.jpg
│   ├── tokyo.jpg
│   ├── vm-instances.jpg
├── .gitignore
├── 0-authentication.tf
├── 1-backend.tf
├── 2-vpc.tf
├── 3-subnets.tf
├── 4-router.tf
├── 5-nat.tf
├── 6-firewalls.tf
├── 7a-compute.tf
├── 7b-template.tf
├── 8-health-check.tf
├── 9-mig.tf
├── 10-autoscale-policy.tf
├── 11.lb-backend.tf
├── 12.lb-frontend.tf
├── AA-outputs.tf
├── brazil.sh
├── iowa.sh
├── italy.sh
├── README.md
├── tokyo.sh
```

---

## 🧱 Terraform Modules and Resources

- `.gitignore` – 🚫 Prevents sensitive files and state data from being committed.
- `0-authentication.tf` - 🔐 Service account credentials setup using `GOOGLE_APPLICATION_CREDENTIALS`.
- `1-backend.tf` - 💾 Remote state backend configuration.
- `2-vpc.tf` - 🌐 VPC creation.
- `3-subnets.tf` - 🌍 Subnetworks for different regions (Iowa, Brazil, Tokyo, and Italy).
- `4-router.tf` - 🔁 Cloud Router setup for NAT.
- `5-nat.tf` - 🌐 Cloud NAT for each region.
- `6-firewalls.tf` - 🔥 Tag-based firewall rules:
  - RDP access (Windows)
  - SSH access (Linux)
  - HTTP/HTTPS access (web server)
- `7a-compute.tf` / `7b-template.tf` - 🖥️ VM instances and Instance Templates:
  - Linux machines `iowa`, `tokyo`, and `brazil`
  - Region-specific tagging
  - Italy Instance Template for Load Balancer
- `8-health-check.tf` - ❤️ HTTP health checks for MIG.
- `9-mig.tf` - 🧬 Managed Instance Groups:
  - Autoscaling enabled
  - Configured per region
- `10-autoscale-policy.tf` - 📈 Autoscaling policy definition.
- `11.lb-backend.tf` - 🔄 Backend services for Load Balancer.
- `12.lb-frontend.tf` - 🌐 HTTP global forwarding rule (external load balancer).
- `AA-outputs.tf` - 📤 Useful outputs like IP addresses and URLs.

---

## 🚀 Deployment Instructions

```bash
gcloud auth application-default login
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

---

## 📸 Show Your Work

> Theses screenshots will show the **GCP infrastructure** setup and **Terraform** examples for this project.

### Subnets and Firewalls

![Subnets](Screenshots/subnets.jpg)
![Firewalls](/Screenshots/firewalls.jpg)

### Cloud NAT and Routers

![Cloud NAT's](Screenshots/nats.jpg)
![Cloud Routers](/Screenshots/routers.jpg)

### Instances: VM Instances, Instance Template, and MIG

![VM Instances](/Screenshots/vm-instances.jpg)
![Instance Template](/Screenshots/instance-templates.jpg)
![Instance Group](/Screenshots/instance-groups.jpg)

### Health Checks

![Health Checks](/Screenshots/health-checks.jpg)

### Load Balancer Setup

- **Load Balancer** ![LB](/Screenshots/load-balancer.jpg)
- **Load Balancer Backend Services**
  - **Console** ![LB Backend](/Screenshots/lb-backend.jpg)
  - **Terraform** ![TF LB Backend](/Screenshots/tf-lb-backend.jpg)
- **Load Balancer Frontend Services**
  - **Console**
    - ![LB Frontend](/Screenshots/lb-frontend.jpg)
  - **Terraform** ![TF LB Frontend](/Screenshots/tf-lb-frontend.jpg)

---

## 📦 Terraform Outputs

![Outputs](/Screenshots/outputs.jpg)

---

## 🔧 Outputs Scripts

- `brazil.sh`: Configures the Brazilian Linux web server.
![brazil](/Screenshots/brazil.jpg)
- `iowa.sh`: Configures the Iowa Linux web server.
![iowa](/Screenshots/iowa.jpg)
- `tokyo.sh`: Configures the Tokyo Linux web server.
![tokyo](/Screenshots/tokyo.jpg)
- `italy.sh`: Configures the Italy MIG for the LB web server across all compute zones.
  - `europe-west8-a`: ![italy](/Screenshots/italy1.jpg)
  - `europe-west8-b`: ![italy](/Screenshots/italy2.jpg)
  - `europe-west8-c`: ![italy](/Screenshots/italy3.jpg)

---

## 🧹 Cleanup

To tear down the infrastructure:

```bash
terraform destroy -auto-approve
```

---

## 🧠 Notes

- All VM instances are deployed across three regions to test global load balancing and NAT traversal.
- Firewalls are tightly scoped using tags for security.
- Load balancer uses MIGs and health checks for fault tolerance.

---

## 🔗 References

- [Terraform GCP Provider Docs](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Google Cloud NAT](https://cloud.google.com/nat/docs/overview)
- [Google Load Balancing](https://cloud.google.com/load-balancing)

---

## Author

- **T.I.Q.S.** - *Class 6.0*
