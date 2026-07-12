# Lab 6 - Terraform Variables and Project Organization

## Objective

Refactor the Terraform configuration from previous labs by replacing hardcoded values with variables and organizing the project into multiple Terraform files.

The goal of this lab was to make the infrastructure reusable, easier to maintain, and closer to real-world Terraform project structure.

---

## AWS Resources

- EC2 Instance
- Security Group

---

## Terraform Concepts Learned

- Input Variables
- Variable References
- `terraform.tfvars`
- Outputs
- Multi-file Terraform Projects
- Infrastructure Reusability

---

## Project Structure

```
lab6-variables/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

### File Responsibilities

- **main.tf** – Defines the AWS infrastructure.
- **variables.tf** – Declares the variables used throughout the project.
- **terraform.tfvars** – Stores the values assigned to each variable.
- **outputs.tf** – Displays useful information after deployment.
- **README.md** – Documents the lab.

---

## Variables Created

The following values were converted from hardcoded values into Terraform variables:

- AWS Region
- EC2 Instance Type
- EC2 Key Pair Name
- EC2 Instance Name
- Weather App GitHub Repository URL

---

## Completed Tasks

- Created reusable Terraform variables.
- Moved configuration values into `terraform.tfvars`.
- Updated the AWS provider to use variables.
- Updated the EC2 instance configuration to use variables.
- Parameterized the GitHub repository URL used during deployment.
- Moved Terraform outputs into a dedicated `outputs.tf` file.
- Successfully deployed the Weather App using the refactored configuration.

---

## Terraform Workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

---

## Key Takeaways

Before this lab, changing values such as the AWS Region, EC2 instance type, or Key Pair required editing the infrastructure code.

After introducing variables, these values can be modified by updating `terraform.tfvars` without changing the Terraform resource definitions.

This makes the infrastructure:

- Easier to reuse
- Easier to maintain
- Easier to share with other team members

---

## Skills Practiced

### Terraform

- Variables
- Variable References
- Outputs
- Project Organization
- Infrastructure as Code
- Reusable Configurations

### AWS

- EC2
- Security Groups
- IAM
- Amazon Linux 2023

### Linux

- Apache (httpd)
- Git
- User Data