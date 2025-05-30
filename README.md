# GitHub Assignment (05-03-2025)

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)
![GCP](https://img.shields.io/badge/Cloud-Google_Cloud-4285F4?logo=googlecloud&logoColor=white)

This repository contains Terraform configurations for setting up a cloud infrastructure environment. The configurations are modularized into separate files for authentication, backend setup, and Virtual Private Cloud (VPC) networking.

## 📁 Project Structure

- **`0-authentication.tf`**: 🔐 Defines authentication mechanisms and credentials required to interact with cloud providers.
- **`1-backend.tf`**: 💾 Specifies the backend configuration for storing Terraform state files remotely, ensuring state consistency and collaboration.
- **`2-vpc.tf`**: 🌐 Sets up the Virtual Private Cloud, including subnets, routing tables, and networking components essential for the infrastructure.
- **`.gitignore`**: 🚫 Lists files and directories to be ignored by Git, such as local Terraform state files and provider-specific credentials.

## 🚀 Getting Started

### 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- A GCP account with your necessary credentials.

### 🛠️ Initialization

1. Clone the repository:

   ```bash
   git clone https://github.com/tiqsclass6/gcp-repo-assignments
   cd gcp-repo-assignments
   code .
   ```

2. Initialize the Terraform working directory:

   ```bash
   terraform init
   ```

3. Format the Terraform:

   ```bash
   terraform fmt
   ```

4. Validate your Terraform:

   ```bash
   terraform validate
   ```

5. Preview the Terraform deployment plan:

   ```bash
   terraform plan
   ```

### ⚙️ Deployment

To apply the Terraform configurations and set up the infrastructure:

```bash
terraform apply -auto-approve
```

Review the planned actions and confirm to proceed.

### 🧹 Destruction

To destroy the infrastructure managed by these configurations:

```bash
terraform destroy -auto-approve
```

Confirm the action when prompted.

## 🏗️ Resources Applied

The Terraform configuration provisions the following Google Cloud resources:

- **google_project_service**: Enables required GCP APIs such as `compute.googleapis.com`.  
  📚 [Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service)

- **google_compute_network**:
  - **`iowa`**: 🇺🇸 Regional VPC with MTU 1460 and no auto-created subnets.
  - **`brazil`**: 🇧🇷 Regional VPC with MTU 1460 and no auto-created subnets.
  - **`tokyo`**: 🇯🇵 Regional VPC with MTU 1460 and no auto-created subnets.
  - Common settings:
    - `routing_mode = "REGIONAL"`
    - `auto_create_subnetworks = false`
    - `delete_default_routes_on_create = false`  
  📚 [Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network)

## 🧪 Troubleshooting

If issues occur during deployment, consider the following:

- **🔑 Authentication Failures**:
  - Ensure your service account JSON key file is valid and the `GOOGLE_APPLICATION_CREDENTIALS` environment variable is set.

- **🔒 Missing Permissions**:
  - Ensure the service account has appropriate IAM roles such as:
    - Compute Admin
    - Project Editor
    - Service Usage Admin

- **⚠️ API Enablement Errors**:
  - Make sure `google_project_service` resources are configured to enable required APIs like `compute.googleapis.com`.

- **🌐 VPC Configuration Errors**:
  - Verify that VPC names are unique and region-specific.
  - Ensure there are no overlapping subnets or conflicting routing rules.

- **🐞 Debugging Terraform Output**:
  - Use `terraform plan` to preview changes before applying.
  - Enable detailed logs using:

    ```bash
    TF_LOG=DEBUG terraform apply
    ```

## 📝 Notes

- Ensure that your cloud provider credentials are correctly configured and accessible to Terraform.
- Modify the `.gitignore` file as needed to prevent sensitive information from being committed to the repository.
- Customize the `.tf` files to match your specific infrastructure requirements and naming conventions.
