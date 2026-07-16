# Lab 11 - Application Load Balancer with Multiple EC2 Instances

## Objective

Deploy an AWS Application Load Balancer (ALB) to distribute HTTP traffic across multiple EC2 web servers provisioned with reusable Terraform modules.

This lab demonstrates how load balancing improves application availability, scalability, and fault tolerance.

---

## AWS Resources Created

### Networking

- VPC
- 2 Public Subnets
- Internet Gateway
- Route Table
- Route Table Associations

### Security

- Application Load Balancer Security Group
- 3 EC2 Security Groups

### Compute

- 3 EC2 Web Servers

### Load Balancing

- Application Load Balancer
- Target Group
- Target Group Attachments
- HTTP Listener

---

## Terraform Concepts Learned

- Application Load Balancers
- Target Groups
- Target Group Attachments
- Listeners
- Health Checks
- Multi-AZ Architecture
- Security Group Referencing
- Module Reuse
- for_each

---

## Architecture

```text
                    Internet
                        │
                        ▼
         Application Load Balancer
                HTTP Port 80
                        │
                 HTTP Listener
                        │
                        ▼
                 Target Group
            ┌───────────┼───────────┐
            ▼           ▼           ▼
         web-1       web-2       web-3
            │           │           │
        Security    Security    Security
         Group       Group       Group
```

---

## Infrastructure Created

### Networking

- Custom VPC
- Two Public Subnets
- Internet Gateway
- Public Route Table

### Compute

- Three EC2 web servers deployed using Terraform modules
- Apache installed automatically using User Data

### Load Balancing

- Internet-facing Application Load Balancer
- HTTP Listener on Port 80
- Target Group
- Three Target Attachments
- Health Checks

---

## Completed Tasks

- Built an Application Load Balancer
- Created two public subnets across multiple Availability Zones
- Configured an ALB Security Group
- Updated EC2 Security Groups to allow HTTP only from the ALB
- Created a Target Group
- Registered three EC2 instances with the Target Group
- Configured HTTP health checks
- Created an HTTP Listener
- Successfully routed traffic through the ALB

---

## Traffic Flow

```text
Browser
   │
   ▼
Application Load Balancer
   │
HTTP Listener
   │
Target Group
   │
Healthy EC2 Instance
```

---

## Health Checks

The Application Load Balancer continuously checks each EC2 instance by sending HTTP requests to:

```
GET /
```

Expected response:

```
HTTP 200 OK
```

If an instance becomes unhealthy, the load balancer automatically stops routing traffic to that server until it becomes healthy again.

---

## Security Improvements

Unlike previous labs, EC2 instances no longer accept HTTP traffic directly from the Internet.

Instead:

```
Internet
    │
    ▼
ALB Security Group
    │
    ▼
EC2 Security Group
```

Only the Application Load Balancer is allowed to communicate with the web servers on port 80.

---

## Troubleshooting

During development, the ALB health checks initially failed because of two configuration issues:

- The EC2 security group temporarily allowed HTTP on the wrong port.
- The ALB security group outbound rule required correction to allow communication with the target instances.

After correcting the security group configuration, all targets successfully passed health checks and the Application Load Balancer began routing traffic correctly.

---

## Skills Practiced

### AWS

- Application Load Balancer (ALB)
- Target Groups
- Health Checks
- Listeners
- Security Groups
- Multi-AZ Networking

### Terraform

- ALB Resources
- Target Group Attachments
- Module Reuse
- Security Group References
- Dynamic Infrastructure

---

## Key Takeaway

Application Load Balancers provide a single entry point for web applications while distributing traffic across multiple healthy EC2 instances.

Combined with Terraform modules and reusable infrastructure, this architecture closely resembles how highly available web applications are deployed in production AWS environments.