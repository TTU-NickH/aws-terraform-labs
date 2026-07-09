# Lab 3 - Deploying an EC2 Instance with Terraform

## Objective

The goal of this lab was to provision an Amazon EC2 instance entirely with Terraform instead of manually launching it through the AWS Console.

This lab introduced Infrastructure as Code (IaC) concepts by automating the creation of AWS resources.

---

## Technologies Used

- Terraform
- AWS EC2
- AWS Security Groups
- AWS IAM
- AWS CLI
- Amazon Linux 2023
- SSH

---

## Resources Created

Terraform created the following AWS resources:

- EC2 Instance
- Security Group

Terraform also looked up the latest Amazon Linux 2023 AMI using a data source.

---

## Terraform Concepts Learned

- Providers
- Resources
- Data Sources
- Outputs
- Tags
- State File
- terraform init
- terraform fmt
- terraform validate
- terraform plan
- terraform apply
- terraform destroy

---

## Workflow

Terraform Configuration

↓

terraform init

↓

terraform validate

↓

terraform plan

↓

terraform apply

↓

SSH into EC2

---

## Lessons Learned

During this lab I learned:

- How Terraform communicates with AWS using the AWS Provider.
- The difference between Resources and Data Sources.
- How Terraform automatically discovers the latest Amazon Linux AMI.
- How to provision an EC2 instance without using the AWS Console.
- How Security Groups function as virtual firewalls.
- How Terraform stores infrastructure information in the terraform.tfstate file.
- How terraform destroy removes only infrastructure managed by Terraform.

---

## Verification

After Terraform finished provisioning the instance, I successfully:

- Retrieved the public IP address using Terraform Outputs.
- Connected to the EC2 instance using SSH.
- Verified the server was running.
- Installed Apache Web Server manually.

---

## Future Improvements

- Automate Apache installation using EC2 User Data.
- Deploy a static website automatically.
- Build a custom VPC.
- Use Terraform Modules.
