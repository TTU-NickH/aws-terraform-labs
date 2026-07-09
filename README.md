# AWS Terraform Labs

This repository documents my hands-on AWS and Terraform labs as I build practical cloud infrastructure and DevOps skills. Each lab focuses on learning Infrastructure as Code (IaC) by provisioning and managing AWS resources with Terraform instead of manually configuring them through the AWS Console.

---

## Labs Completed

### Lab 1 - Terraform Basics
**Objective:** Learn the core Terraform workflow and syntax.

**Concepts Learned**
- Terraform providers
- Resources
- Outputs
- Terraform workflow (`init`, `fmt`, `validate`, `plan`, `apply`, `destroy`)

---

### Lab 2 - AWS S3 Bucket with Terraform
**Objective:** Provision an Amazon S3 bucket using Terraform.

**Concepts Learned**
- AWS Provider
- S3 Bucket resource
- Terraform state
- AWS CLI authentication
- Infrastructure as Code fundamentals

---

### Lab 3 - EC2 Instance with Terraform
**Objective:** Provision an Amazon EC2 instance entirely with Terraform.

**AWS Resources**
- EC2 Instance
- Security Group

**Concepts Learned**
- Data Sources
- Amazon Machine Images (AMI)
- Security Groups
- EC2 provisioning
- SSH connectivity
- Terraform Outputs
- Terraform State Management

**Completed Tasks**
- Automatically retrieved the latest Amazon Linux 2023 AMI
- Created a Security Group allowing SSH access
- Provisioned an EC2 instance
- Connected to the instance via SSH using an existing AWS Key Pair
- Installed Apache Web Server for future deployment labs

---

## Website Deployment Practice

I used my existing Weather App project to practice deploying applications using multiple AWS services.

### EC2 Deployment
- Deployed the Weather App to an Amazon EC2 instance
- Configured Apache (`httpd`) to serve the application
- Connected and managed the server using SSH

### S3 Deployment
- Uploaded the Weather App to an Amazon S3 bucket
- Practiced static website hosting concepts

**Weather App Repository:**  
https://github.com/TTU-NickH/weather-app

---

## Skills Practiced

### AWS
- IAM
- EC2
- Amazon S3
- Security Groups

### Terraform
- Providers
- Resources
- Data Sources
- Outputs
- State Management
- Infrastructure as Code

### Linux
- SSH
- Apache/httpd
- Linux Command Line

### Development Tools
- AWS CLI
- Git
- GitHub
- VS Code
