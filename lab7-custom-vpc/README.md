# Lab 7 - Custom VPC and Networking

## Objective

Build a custom AWS network using Terraform instead of relying on the default VPC.

This lab focused on understanding how AWS networking components work together to allow an EC2 instance to communicate with the Internet.

---

## AWS Resources Created

- Virtual Private Cloud (VPC)
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance

---

## Terraform Concepts Learned

- AWS VPC
- Subnets
- CIDR Blocks
- Internet Gateway
- Route Tables
- Route Table Associations
- Security Groups
- Resource Dependencies
- Data Sources

---

## Network Architecture

```
                 Internet
                     │
                     ▼
          Internet Gateway
                     │
                     ▼
      ┌─────────────────────────┐
      │       Custom VPC        │
      │      10.0.0.0/16        │
      │                         │
      │  Public Route Table     │
      │          │              │
      │          ▼              │
      │  Public Subnet          │
      │    10.0.1.0/24          │
      │          │              │
      │          ▼              │
      │   Security Group        │
      │          │              │
      │          ▼              │
      │      EC2 Instance       │
      └─────────────────────────┘
```

---

## Completed Tasks

- Created a custom VPC
- Configured a public subnet
- Attached an Internet Gateway to the VPC
- Created a Route Table with Internet access
- Associated the Route Table with the Public Subnet
- Created a Security Group allowing SSH and HTTP traffic
- Provisioned an EC2 instance inside the custom VPC
- Automatically installed Apache using EC2 User Data
- Successfully accessed the web server through its public IP

---

## Key Networking Concepts

### VPC

A Virtual Private Cloud is an isolated network where AWS resources are deployed.

---

### Subnet

A subnet divides a VPC into smaller IP ranges.

This lab used a Public Subnet so resources could communicate with the Internet.

---

### Internet Gateway

Provides communication between the VPC and the public Internet.

Without an Internet Gateway, the EC2 instance would not be reachable.

---

### Route Table

Controls where network traffic is sent.

The route:

```
0.0.0.0/0
```

directs all Internet-bound traffic through the Internet Gateway.

---

### Route Table Association

Connects a subnet to a specific Route Table.

Without this association, the subnet would not know which routes to use.

---

### Security Group

Acts as a virtual firewall controlling inbound and outbound traffic.

Configured Rules:

- SSH (22)
- HTTP (80)

---

## Terraform Workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## Skills Practiced

### AWS

- VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Security Groups
- EC2

### Terraform

- Resource Dependencies
- Data Sources
- Infrastructure as Code
- Custom Networking

### Linux

- Apache (httpd)
- EC2 User Data
- SSH