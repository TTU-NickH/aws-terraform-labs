# Lab 10 - Deploy Multiple EC2 Instances with Terraform Modules

## Objective

Deploy multiple EC2 web servers using a reusable Terraform module and the `for_each` meta-argument.

This lab demonstrates how Terraform can scale infrastructure by creating multiple resources from a single module without duplicating code.

---

## AWS Resources Created

### Networking

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association

### Compute

- 3 EC2 Instances
- 3 Security Groups

---

## Terraform Concepts Learned

- Reusable Modules
- Module Reuse
- for_each
- Maps
- Iteration
- Dynamic Infrastructure
- Module Outputs
- Infrastructure Scaling

---

## Project Structure

```text
lab10-multiple-ec2/
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
                     Terraform
                          │
                          ▼
                 Root Terraform Project
                          │
                for_each over web_servers
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
    EC2 Module        EC2 Module       EC2 Module
      web-1             web-2            web-3
        │                 │                 │
        ▼                 ▼                 ▼
   EC2 Instance      EC2 Instance     EC2 Instance
   Security Group    Security Group   Security Group
```

---

## Infrastructure Created

The EC2 module was reused to deploy three independent web servers:

- web-1
- web-2
- web-3

Each server received:

- Its own EC2 instance
- Its own security group
- Apache installed through User Data
- A public IP address

---

## Completed Tasks

- Created a map of EC2 servers
- Used the `for_each` meta-argument to iterate over the server map
- Reused the EC2 module multiple times
- Passed different values into each module instance
- Provisioned three independent EC2 instances
- Returned public IP addresses and website URLs using module outputs
- Successfully deployed and tested all web servers

---

## Example Module Configuration

```hcl
module "web_servers" {
  source   = "./modules/ec2"
  for_each = var.web_servers

  instance_name = each.key
  instance_type = each.value.instance_type
  key_name      = var.key_name
  vpc_id        = aws_vpc.lab_vpc.id
  subnet_id     = aws_subnet.public_subnet.id
}
```

---

## Why `for_each`?

Instead of manually creating multiple EC2 resources, Terraform automatically creates one module instance for every entry in the `web_servers` map.

This makes infrastructure:

- Easier to scale
- Easier to maintain
- Easier to read
- Less repetitive

---

## Key Takeaway

Terraform modules become significantly more powerful when combined with `for_each`.

Rather than copying and pasting infrastructure code, a single reusable module can provision many resources by iterating over a collection of input values.

This pattern is commonly used in production environments to manage fleets of servers while keeping infrastructure code clean and maintainable.