# Lab 9 - Reusable Terraform EC2 Module

## Objective

Create and use a reusable Terraform module that provisions an EC2 instance and its security group.

This lab focused on separating infrastructure implementation from infrastructure usage so the same module can be reused across multiple projects or environments.

---

## AWS Resources Created

### Root Module

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association

### EC2 Child Module

- Security Group
- EC2 Instance
- Apache web server configured through User Data

---

## Terraform Concepts Learned

- Root modules
- Child modules
- Module inputs
- Module outputs
- Local module sources
- Reusable infrastructure
- Infrastructure abstraction
- Resource dependencies between modules

---

## Project Structure

```text
lab9-modules/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── README.md
└── modules/
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## Architecture

```text
Root Terraform Project
        │
        ├── Creates VPC networking
        │
        └── Calls EC2 Module
                    │
                    ├── Creates Security Group
                    ├── Creates EC2 Instance
                    ├── Runs User Data
                    └── Returns Outputs
```

---

## Module Inputs

The root module passes the following values into the EC2 module:

- EC2 instance name
- EC2 instance type
- Existing AWS key pair name
- VPC ID
- Subnet ID

Example:

```hcl
module "web_server" {
  source = "./modules/ec2"

  instance_name = var.instance_name
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id        = aws_vpc.lab_vpc.id
  subnet_id     = aws_subnet.public_subnet.id
}
```

---

## Module Outputs

The EC2 module returns:

- EC2 instance ID
- Public IP address
- Website URL
- Security group ID

The root module accesses these values using references such as:

```hcl
module.web_server.public_ip
```

---

## Completed Tasks

- Created a reusable EC2 child module
- Defined module input variables
- Created an EC2 instance and security group inside the module
- Passed VPC and subnet IDs from the root project into the child module
- Configured Apache through EC2 User Data
- Exposed useful module outputs
- Referenced child-module outputs from the root module
- Successfully deployed and tested the web server

---

## Why Modules Matter

Modules allow infrastructure logic to be written once and reused many times.

Without modules, similar EC2 and security group configurations would need to be copied across multiple projects. With a shared module, projects can provide different input values while using the same tested infrastructure logic.

This improves:

- Reusability
- Consistency
- Maintainability
- Standardization
- Collaboration

---

## Key Takeaway

The root module describes what infrastructure is needed, while the child module contains the details of how that infrastructure is created.

A Terraform module works similarly to a function in programming:

- Inputs act like parameters
- The module contains reusable logic
- Outputs act like return values