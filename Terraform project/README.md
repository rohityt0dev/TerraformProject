# 🏗️ AWS Infrastructure Automation with Terraform

Provision a **production-ready AWS environment** using Infrastructure as Code (IaC). This project automates the deployment of a secure EC2 instance with IAM role-based S3 access — all following AWS security best practices.

---

## 📌 What This Project Does

This Terraform project provisions the following AWS resources in a single `terraform apply`:

| Resource | Details |
|---|---|
| **EC2 Instance** | Ubuntu 22.04 on `t3.micro`, deployed in `ap-south-1` |
| **S3 Bucket** | Private bucket with AES-256 encryption + versioning enabled |
| **IAM Role + Policy** | Least-privilege role allowing EC2 to read from S3 only |
| **Security Group** | SSH (port 22) inbound; all outbound allowed |
| **IAM Instance Profile** | Attaches the IAM role to the EC2 instance securely |

---

## 🏛️ Architecture

```
┌─────────────────────────────────────────────┐
│                  AWS Cloud                  │
│                                             │
│   ┌──────────┐        ┌──────────────────┐  │
│   │ EC2      │──────▶ │   S3 Bucket      │  │
│   │ Instance │  IAM   │ (Encrypted +     │  │
│   │          │  Role  │  Versioned)      │  │
│   └──────────┘        └──────────────────┘  │
│        │                                    │
│   ┌────▼─────────────────┐                  │
│   │ Security Group        │                  │
│   │ (SSH: 22 inbound)     │                  │
│   └──────────────────────┘                  │
└─────────────────────────────────────────────┘
```

---

## 🔐 Security Highlights

- ✅ **S3 public access fully blocked** — all four public access block settings enabled
- ✅ **S3 versioning** enabled to protect against accidental deletions
- ✅ **IAM least privilege** — EC2 role only has `s3:GetObject` and `s3:ListBucket` permissions
- ✅ **No hardcoded credentials** — region and config injected via variables
- ⚠️ SSH is open to `0.0.0.0/0` — restrict to your IP in production

---

## 📁 Project Structure

```
TerraformProject/
├── provider.tf          # AWS provider + Terraform version constraints
├── variable.tf          # All input variables with descriptions and defaults
├── main.tf              # Core resource definitions (EC2, S3, IAM, SG)
├── output.tf            # Outputs: EC2 ID, public IP, S3 ARN, IAM role ARN
└── terraform.tfvars.example  # Sample variable values (safe to commit)
```

---

## ⚙️ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) `>= 1.0`
- AWS CLI configured with valid credentials (`aws configure`)
- An AWS account with permissions to create EC2, S3, and IAM resources

---

## 🚀 Getting Started

**1. Clone the repository**
```bash
git clone https://github.com/rohityt0dev/TerraformProject.git
cd TerraformProject
```

**2. Set up your variables**
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values (bucket name must be globally unique)
```

**3. Initialize Terraform**
```bash
terraform init
```

**4. Preview the plan**
```bash
terraform plan
```

**5. Apply the infrastructure**
```bash
terraform apply
```

**6. Destroy when done (avoid charges!)**
```bash
terraform destroy
```

---

## 📤 Outputs

After a successful apply, Terraform will display:

| Output | Description |
|---|---|
| `ec2_instance_id` | ID of the provisioned EC2 instance |
| `ec2_public_ip` | Public IP address of the EC2 instance |
| `s3_bucket_name` | Name of the created S3 bucket |
| `s3_bucket_arn` | ARN of the S3 bucket |
| `iam_role_arn` | ARN of the IAM role attached to EC2 |

---

## 🛠️ Tech Stack

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![EC2](https://img.shields.io/badge/EC2-FF9900?style=for-the-badge&logo=amazonec2&logoColor=white)
![S3](https://img.shields.io/badge/S3-569A31?style=for-the-badge&logo=amazons3&logoColor=white)

---

## 📬 Connect with Me

- 💼 [LinkedIn](https://www.linkedin.com/in/rohit-tambadkar-devops)
- 🐙 [GitHub](https://github.com/rohityt0dev)
- ✍️ [Hashnode Blog](https://rohit0dev.hashnode.dev)

---

> 💡 *This project is part of my DevOps learning journey — focused on building real-world AWS infrastructure using IaC principles.*
