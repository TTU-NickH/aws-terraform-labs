# AWS Terraform Labs

This repository documents my hands-on AWS and Terraform labs as I build practical cloud infrastructure and DevOps skills. Each lab focuses on learning Infrastructure as Code (IaC) by provisioning and managing AWS resources with Terraform instead of manually configuring them through the AWS Console.

---

### Labs Completed

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
- Retrieved the latest Amazon Linux 2023 AMI using a Terraform data source
- Created a Security Group allowing SSH access
- Provisioned an EC2 instance
- Connected to the instance via SSH using an AWS Key Pair
- Installed Apache Web Server manually

---

### Lab 4 - Automating EC2 with User Data
**Objective:** Automate server configuration using EC2 User Data.

**AWS Resources**
- EC2 Instance
- Security Group

**Concepts Learned**
- EC2 User Data
- Cloud-Init
- Infrastructure automation
- Resource replacement
- Automated software installation

**Completed Tasks**
- Provisioned an EC2 instance
- Automatically updated Amazon Linux
- Installed Apache without manually connecting to the server
- Enabled and started Apache automatically
- Created a webpage during the EC2 boot process
- Troubleshot Cloud-Init logs and corrected User Data execution

---

### Lab 5 - Automated Weather App Deployment
**Objective:** Automatically deploy my Weather App from GitHub to an EC2 instance using Terraform.

**AWS Resources**
- EC2 Instance
- Security Group

**Concepts Learned**
- Automated application deployment
- Git installation through User Data
- GitHub repository cloning
- Linux file management
- Apache web hosting
- End-to-end infrastructure automation

**Completed Tasks**
- Provisioned an EC2 instance with Terraform
- Installed Apache and Git automatically using User Data
- Cloned my public Weather App repository from GitHub
- Copied application files into Apache's document root
- Configured file ownership and permissions
- Successfully served the Weather App through Apache without manual 

## Skills Practiced

### AWS
- IAM
- EC2
- Amazon S3
- Security Groups
- Amazon Linux 2023

### Terraform
- Providers
- Resources
- Data Sources
- Outputs
- User Data
- State Management
- Infrastructure as Code

### Linux
- SSH
- Apache (httpd)
- Cloud-Init
- Linux file permissions
- Linux package management (`dnf`)

### Development Tools
- AWS CLI
- Git
- GitHub
- VS Code

### Deployment
- Automated application deployment
- GitHub repository cloning
- Static website hosting
- EC2 web server provisioning