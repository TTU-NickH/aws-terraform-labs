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

### Lab 6 - Variables and Project Organization

**Objective:** Refactor a Terraform project to make it reusable by replacing hardcoded values with variables and organizing the configuration into multiple files.

**Concepts Learned**
- Input Variables
- `terraform.tfvars`
- Outputs
- String interpolation
- Project organization
- Reusable infrastructure

**Completed Tasks**
- Moved configuration values into variables
- Created a `terraform.tfvars` file for deployment values
- Moved outputs into a dedicated `outputs.tf`
- Parameterized the EC2 instance name and GitHub repository URL
- Improved project organization using multiple Terraform files

### Lab 7 - Custom VPC and Networking

**Objective:** Build a custom AWS network and deploy an EC2 instance without relying on AWS's default VPC.

**AWS Resources**
- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance

**Concepts Learned**
- Custom AWS networking
- CIDR blocks
- Public subnets
- Internet Gateways
- Route Tables
- Route Table Associations
- Terraform resource dependencies

**Completed Tasks**
- Created a custom VPC
- Configured a public subnet
- Attached an Internet Gateway
- Created and associated a Route Table
- Created a Security Group allowing SSH and HTTP traffic
- Deployed an EC2 instance inside the custom VPC
- Automatically configured Apache using EC2 User Data
- Verified Internet connectivity through the custom network

**Why This Matters**

Most production AWS environments do not use the default VPC. Understanding how to build a custom VPC, configure routing, and deploy resources inside your own network is a foundational cloud engineering skill and a common topic in AWS and DevOps interviews.

### Lab 8 - Remote Terraform State

**Objective:** Configure Terraform to store its state remotely using an Amazon S3 backend.

**AWS Resources**
- Amazon S3 Backend Bucket
- Amazon S3 Bucket (Managed by Terraform)

**Concepts Learned**
- Terraform State
- Remote Backends
- State Management
- S3 Backend Configuration
- Infrastructure Collaboration

**Completed Tasks**
- Created a dedicated S3 bucket for Terraform remote state
- Configured Terraform to use an S3 backend
- Migrated Terraform state from local storage to Amazon S3
- Enabled bucket encryption and versioning
- Verified the remote state file in Amazon S3
- Created a Terraform-managed S3 bucket while using remote state

**Why This Matters**

Terraform relies on its state file to understand the infrastructure it manages. Storing state remotely in Amazon S3 provides a centralized source of truth that enables collaboration, improves reliability, and supports team-based infrastructure management without relying on a single developer's machine.

### Lab 9 - Reusable Terraform Modules

**Objective:** Create a reusable Terraform module for provisioning an EC2 web server and its security group.

**AWS Resources**
- VPC networking resources
- EC2 Instance
- Security Group

**Concepts Learned**
- Root and child modules
- Module inputs and outputs
- Local module sources
- Infrastructure abstraction
- Reusable Terraform configurations

**Completed Tasks**
- Created a reusable EC2 module
- Passed VPC, subnet, instance, and key-pair values into the module
- Provisioned an EC2 instance and security group through the child module
- Configured Apache using User Data
- Returned the instance ID, public IP, website URL, and security group ID to the root project
- Successfully deployed and tested the module

**Why This Matters**

Terraform modules allow teams to write infrastructure logic once and reuse it across multiple projects and environments. They reduce duplicated code, improve consistency, and make infrastructure easier to maintain and standardize.

### Lab 10 - Deploy Multiple EC2 Instances

**Objective:** Use Terraform modules and the `for_each` meta-argument to provision multiple EC2 web servers from a single reusable module.

**AWS Resources**
- VPC
- Public Subnet
- Internet Gateway
- Route Table
- 3 EC2 Instances
- 3 Security Groups

**Concepts Learned**
- `for_each`
- Terraform Maps
- Module Reuse
- Dynamic Infrastructure
- Infrastructure Scaling
- Module Outputs

**Completed Tasks**
- Created a map of EC2 server configurations
- Used `for_each` to deploy multiple EC2 instances from a single module
- Provisioned independent security groups for each server
- Installed Apache on each instance using User Data
- Returned public IP addresses and website URLs through module outputs
- Successfully deployed and verified all web servers

**Why This Matters**

Terraform's `for_each` meta-argument allows engineers to scale infrastructure without duplicating code. Combined with reusable modules, it enables teams to provision and manage multiple resources from a single, maintainable configuration. This is a common pattern used in production cloud environments to efficiently manage large numbers of servers.

## Skills Practiced

### AWS
- IAM
- EC2
- Amazon S3
- Security Groups
- Amazon Linux 2023
- Amazon S3 Versioning
- S3 Encryption
- Remote Backend Configuration

### Terraform
- Input Variables
- terraform.tfvars
- Outputs
- String interpolation
- Multi-file project organization
- Providers
- Resources
- Data Sources
- Outputs
- User Data
- State Management
- Infrastructure as Code
- Resource Dependencies
- Infrastructure Provisioning
- Custom Network Deployment
- Remote State
- S3 Backends
- State Management
- Infrastructure Collaboration
- Modules
- Module Reuse
- for_each
- Maps 
- Dynamic Resource Creation
- Infrastructure Scaling

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

### AWS Networking
- Virtual Pirvate Cloud
- Public Subnets
- Internet Gateways
- Route Table Association
- CIDR Block Planning