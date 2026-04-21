# TerraformDemo

![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.0-623CE4?style=flat&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=flat&logo=amazon-aws)
![CI/CD](https://img.shields.io/badge/CI%2FCD-Pipeline-4CAF50?style=flat)

CICD with Terraform in AWS - A comprehensive infrastructure automation project demonstrating CI/CD pipeline integration with Terraform for AWS cloud deployments.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [CI/CD Pipeline](#cicd-pipeline)
- [Usage](#usage)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This project demonstrates how to set up a robust CI/CD pipeline for infrastructure provisioning on AWS using Terraform. It automates the deployment, testing, and validation of infrastructure changes through a continuous integration and continuous deployment workflow.

**Language Composition:**
- **HCL (Terraform)**: 43.4% - Infrastructure as Code definitions
- **Shell**: 56.6% - Automation scripts and pipeline configurations

## ✨ Features

- **Infrastructure as Code (IaC)**: Terraform configurations for AWS resources
- **CI/CD Automation**: Automated pipeline for infrastructure deployment
- **Environment Management**: Support for multiple environments (dev, staging, prod)
- **State Management**: Remote state management with AWS S3
- **Automated Testing**: Plan and validation checks before deployment
- **Shell Scripting**: Helper scripts for automation and configuration
- **Version Control Integration**: Git-based workflow for infrastructure changes

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) >= 2.0
- [Git](https://git-scm.com/)
- AWS Account with appropriate permissions
- Bash/Shell environment

## 📁 Project Structure

```
TerraformDemo/
├── README.md
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Variable definitions
├── outputs.tf              # Output definitions
├── terraform.tfvars        # Terraform variables (create from template)
├── .github/
│   └── workflows/          # GitHub Actions CI/CD workflows
├── scripts/                # Helper shell scripts
│   ├── init.sh            # Initialization script
│   ├── plan.sh            # Planning script
│   ├── apply.sh           # Apply script
│   └── validate.sh        # Validation script
└── environments/          # Environment-specific configurations
    ├── dev/
    ├── staging/
    └── prod/
```

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/RanaMondal03/TerraformDemo.git
cd TerraformDemo
```

### 2. Configure AWS Credentials

```bash
aws configure
```

Provide your AWS Access Key ID, Secret Access Key, default region, and output format.

### 3. Initialize Terraform

```bash
tf init
```

This command initializes the Terraform working directory and downloads required providers.

### 4. Validate Configuration

```bash
tf validate
```

## ⚙️ Configuration

### Variables

Edit `terraform.tfvars` to customize your deployment:

```hcl
aws_region       = "us-east-1"
environment      = "dev"
project_name     = "terraform-demo"
```

Refer to `variables.tf` for all available configuration options.

### Backend Configuration

Configure remote state by updating the backend configuration:

```hcl
tf {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

## 📤 Deployment

### Plan Deployment

Review what Terraform will change:

```bash
tf plan -out=tfplan
```

### Apply Changes

Deploy the infrastructure:

```bash
tf apply tfplan
```

### Destroy Resources

Remove all provisioned resources:

```bash
tf destroy
```

## 🔄 CI/CD Pipeline

This project includes GitHub Actions workflows for automated CI/CD. The pipeline:

1. **Triggers**: On pull requests and pushes to master branch
2. **Validates**: Checks Terraform syntax and configuration
3. **Plans**: Generates and comments terraform plan on PRs
4. **Applies**: Automatically applies changes to AWS on merge
5. **Locks**: Uses DynamoDB for state locking to prevent conflicts

### Workflow Files

Check `.github/workflows/` for:
- `terraform-plan.yml` - PR validation workflow
- `terraform-apply.yml` - Production deployment workflow

## 💻 Usage

### Using Shell Scripts

```bash
# Initialize Terraform
./scripts/init.sh

# Validate configuration
./scripts/validate.sh

# Plan deployment
./scripts/plan.sh

# Apply changes
./scripts/apply.sh
```

### Common Terraform Commands

```bash
# Format code
tf fmt -recursive

# List resources
tf state list

# Show specific resource
tf state show aws_instance.example

# Taint resource (force recreation)
tf taint aws_instance.example

# Refresh state
tf refresh
```

## 🎓 Best Practices

- **Use Remote State**: Always use S3 backend with encryption and state locking
- **Environment Separation**: Maintain separate state files for each environment
- **Code Review**: Require PR reviews before merging infrastructure changes
- **Backup State**: Regularly backup your Terraform state files
- **Version Providers**: Pin provider versions for consistency
- **Security**: Use AWS Secrets Manager or Parameter Store for sensitive data
- **Documentation**: Document all variables and outputs
- **DRY Principle**: Use modules to avoid code duplication

## 🔧 Troubleshooting

### State Lock Timeout

If Terraform hangs due to state lock:

```bash
tf force-unlock <LOCK_ID>
```

### Provider Issues

Clear the Terraform cache:

```bash
rm -rf .terraform/
tf init
```

### AWS Credentials Error

Verify AWS credentials:

```bash
aws sts get-caller-identity
```

### Plan Shows Unexpected Changes

Refresh state:

```bash
tf refresh
tf plan
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Author**: [RanaMondal03](https://github.com/RanaMondal03)

**Last Updated**: 2026-04-21

For questions or issues, please open a GitHub issue or contact the repository maintainer.