# GCP Assignment (06-07-2025)

![Terraform GCP](https://img.shields.io/badge/Terraform-GCP-blueviolet?logo=terraform&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/gcp-repo-assignments?style=flat-square)
![Branch: assignment-06072025](https://img.shields.io/badge/Branch-assignment--06072025-blue)
![GCP Enabled](https://img.shields.io/badge/GCP-Enabled-4285F4?logo=googlecloud&logoColor=white)
![Made with Terraform](https://img.shields.io/badge/Made%20with-Terraform-5F43E9?logo=terraform)
![Project Status](https://img.shields.io/badge/Status-Stable-brightgreen)

This repository contains a modular Terraform configuration for deploying a global, scalable infrastructure on **Google Cloud Platform (GCP)**. Key features include VPC networking, NAT routing, firewall rules, zonal MIGs, a global load balancer, autoscaling, and custom regional startup scripts.

---

## 📁 Project Structure

```bash
├── Screenshots/
│   ├── brazil.jpg
│   ├── firewalls.jpg
│   ├── health-check.jpg
│   ├── instance-groups.jpg
│   ├── instance-templates.jpg
│   ├── iowa.jpg
│   ├── italy.jpg
│   ├── lb-backend.jpg
│   ├── lb-frontend.jpg
│   ├── nats.jpg
│   ├── outputs.jpg
│   ├── routers.jpg
│   ├── subnets.jpg
│   ├── tf-lb-backend.jpg
│   ├── tf-lb-frontend.jpg
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
├── 7-lb.tf
├── 8-template.tf
├── 9-mig.tf
├── 10-autoscale-policy.tf
├── 11-outputs.tf
├── README.md
├── SC1-iowa.sh
├── SC2-italy.sh
├── SC3-brazil.sh
├── SC4-tokyo.sh
```

---

## 🧱 Terraform Modules and Resources

- `0-authentication.tf` - Sets up application credentials.
- `1-backend.tf` - Remote backend state configuration.
- `2-vpc.tf` - Creates the VPC network.
- `3-subnets.tf` - Defines subnets across Iowa, Brazil, Italy, and Tokyo.
- `4-router.tf` - Configures Cloud Router.
- `5-nat.tf` - Sets up Cloud NAT per region.
- `6-firewalls.tf` - Firewall rules using network tags.
- `7-lb.tf` - Global Load Balancer: URL map, backend service, and forwarding rule.
- `8-template.tf` - Instance templates with regional startup scripts.
- `9-mig.tf` - Managed Instance Groups (MIGs) per zone.
- `10-autoscale-policy.tf` - Zonal autoscaling using CPU utilization.
- `11-outputs.tf` - Outputs for MIG status, zones, and IPs.
- `SC1–SC4` - Startup scripts for each regional web server (Apache + metadata-based HTML).

---

## 🚀 Deployment Steps

```bash
gcloud auth application-default login
terraform init
terraform validate
terraform plan
terraform apply
```

---

## 📡 Load Balancer Architecture

The global external HTTP(S) Load Balancer (`tsa-gateway`) routes traffic based on a default URL rule (`/*`) to the `tsa-backend-service`. Each backend points to a MIG in:

- `us-central1-a` (Iowa)
- `southamerica-east1-b` (Brazil)
- `europe-west8-b` (Italy)
- `asia-northeast1-a` (Tokyo)

![LB Diagram](Screenshots/load-balancer-flow.png)

---

## 🌍 Region Scripts (Apache Startup)

Each script configures Apache, injects regional metadata into the web page, and applies a themed background.

- `SC1-iowa.sh`  
- `SC2-italy.sh`  
- `SC3-brazil.sh`  
- `SC4-tokyo.sh`  

---

## 📸 Screenshots

Below are visual confirmations of successful deployment across key GCP services:

### 🔧 Infrastructure

- **Subnets**  
  ![Subnets](Screenshots/subnets.jpg)

- **Routers & NAT**  
  ![Routers](Screenshots/routers.jpg)  
  ![NAT](Screenshots/nats.jpg)

- **Firewalls**  
  ![Firewalls](Screenshots/firewalls.jpg)

---

### 🖥️ Compute Resources

- **Instance Templates**  
  ![Templates](Screenshots/instance-templates.jpg)

- **Instance Groups (MIGs)**  
  ![Instance Groups](Screenshots/instance-groups.jpg)

- **VM Instances**  
  ![VMs](Screenshots/vm-instances.jpg)

---

### ❤️ Health Check

- ![Health Check](Screenshots/health-check.jpg)

---

### 🌐 Load Balancer

- **Frontend Configuration**  
  ![Frontend](Screenshots/lb-frontend.jpg)

- **Terraform Frontend Resource View**  
  ![TF Frontend](Screenshots/tf-lb-frontend.jpg)

- **Backend Configuration**  
  ![Backend](Screenshots/lb-backend.jpg)

- **Terraform Backend Resource View**  
  ![TF Backend](Screenshots/tf-lb-backend.jpg)

---

### 🧪 Output & Tests

- **Outputs from Terraform**  
  ![Outputs](Screenshots/outputs.jpg)

- **Regional Startup Page - Iowa**  
  ![Iowa](Screenshots/iowa.jpg)

- **Regional Startup Page - Italy**  
  ![Italy](Screenshots/italy.jpg)  

- **Regional Startup Page - Brazil**  
  ![Brazil](Screenshots/brazil.jpg)

- **Regional Startup Page - Tokyo**  
  ![Tokyo](Screenshots/tokyo.jpg)

---

## 🔧 Troubleshooting & Optimization

- Ensure equal backend weights with `capacity_scaler = 1.0`
- Use consistent health check settings for all MIGs
- Monitor URL Map in GCP for traffic flow insights
- Cache settings may bias region selection (e.g., `SERVED_FROM_CACHE`)

---

## 🧹 Cleanup

```bash
terraform destroy -auto-approve
```

---

## 🧠 Notes

- Load balancer is **global**, leveraging GCP’s external HTTP LB.
- Startup scripts generate dynamic HTML based on region.
- Autoscaling is configured for 10% CPU target and even distribution.

---

## 📚 References

- [Terraform GCP Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Google Load Balancing](https://cloud.google.com/load-balancing/docs)
- [GCP Metadata Server](https://cloud.google.com/compute/docs/storing-retrieving-metadata)

---

## 👤 Author

T.I.Q.S. – Class 6.0
