# Lab 12 – Auto Scaling Group with Application Load Balancer

## Objective

The objective of this lab was to deploy a highly available web application using Terraform by combining Launch Templates, Auto Scaling Groups, and an Application Load Balancer.

Instead of manually managing EC2 instances, the Auto Scaling Group automatically launches, replaces, and maintains healthy instances behind the load balancer.

---

## Architecture

```
                    Internet
                        │
                 Application Load Balancer
                        │
         ┌──────────────┴──────────────┐
         │                             │
    EC2 Instance                  EC2 Instance
 (Auto Scaling Group)        (Auto Scaling Group)
         │                             │
         └──────────────┬──────────────┘
                        │
                   Custom VPC
```

---

## Resources Created

- VPC
- Internet Gateway
- Route Table
- Two Public Subnets
- Security Groups
- Launch Template
- Auto Scaling Group
- Target Group
- Application Load Balancer
- HTTP Listener

---

## Skills Learned

- Launch Templates
- Auto Scaling Groups
- Target Groups
- Application Load Balancers
- Health Checks
- High Availability
- User Data
- AWS CLI
- Cloud-init troubleshooting
- Infrastructure debugging

---

## Terraform Concepts

### Launch Templates

A Launch Template serves as a reusable blueprint for EC2 instances.

It defines:

- Amazon Machine Image (AMI)
- Instance Type
- Key Pair
- Security Groups
- User Data

Whenever the Auto Scaling Group needs another instance, it launches one using this template.

---

### Auto Scaling Group

Configured with:

- Minimum Capacity
- Desired Capacity
- Maximum Capacity

The Auto Scaling Group continuously monitors instance health and automatically replaces failed instances.

---

### Target Groups

The Target Group performs health checks on each EC2 instance.

Only healthy instances receive traffic from the Application Load Balancer.

---

### Application Load Balancer

The Application Load Balancer distributes incoming HTTP requests across multiple EC2 instances located in different Availability Zones.

Benefits include:

- High Availability
- Fault Tolerance
- Automatic Traffic Distribution
- Continuous Health Monitoring

---

## Troubleshooting

This lab required extensive troubleshooting across multiple AWS services.

### Problem

The Application Load Balancer continuously returned:

```
502 Bad Gateway
```

All EC2 instances failed Target Group health checks.

---

### Investigation

The following tools were used during troubleshooting:

- `aws elbv2 describe-target-health`
- `aws autoscaling describe-auto-scaling-groups`
- SSH into EC2 instances
- `/var/log/cloud-init-output.log`
- `terraform state show`
- `terraform console`

The investigation revealed:

- Apache was never installed.
- User Data failed during instance initialization.
- Auto Scaling continuously replaced unhealthy instances.
- Cloud-init reported:

```
Failed to run module scripts-user
```

---

### Root Cause

The Terraform AMI filter was too broad:

```hcl
values = ["al2023-ami-*-x86_64"]
```

Terraform selected an Amazon ECS-optimized Amazon Linux image instead of the standard Amazon Linux 2023 image.

Because of this:

- Apache failed to install.
- User Data never completed successfully.
- Health checks continuously failed.
- The Auto Scaling Group repeatedly replaced instances.

---

### Resolution

The AMI selection was updated to use the AWS Systems Manager Parameter Store:

```hcl
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
}

image_id = data.aws_ssm_parameter.amazon_linux.value
```

This guarantees the Launch Template always uses the latest supported Amazon Linux 2023 AMI.

After updating the Launch Template:

- Terraform applied the changes.
- An Auto Scaling Instance Refresh replaced the old instances.
- Apache installed successfully.
- User Data completed.
- Target Group health checks passed.
- The Application Load Balancer successfully served the application.

---

## Commands Used

### Terraform

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

### AWS CLI

```bash
aws elbv2 describe-target-health
aws autoscaling describe-auto-scaling-groups
aws autoscaling start-instance-refresh
aws ec2 describe-launch-template-versions
terraform state show
terraform console
```

---

## Lessons Learned

- Launch Templates provide reusable EC2 configurations.
- Auto Scaling Groups automatically maintain the desired number of healthy instances.
- Target Groups determine whether instances can receive production traffic.
- Application Load Balancers only route requests to healthy targets.
- Cloud-init logs are one of the most valuable troubleshooting tools for EC2 initialization.
- AWS Systems Manager Parameter Store provides a reliable method for selecting the latest supported Amazon Linux AMI.
- Infrastructure debugging often requires investigating multiple AWS services before identifying the root cause.

---

## Skills Demonstrated

- Terraform
- AWS EC2
- Launch Templates
- Auto Scaling Groups
- Application Load Balancers
- Target Groups
- AWS CLI
- Linux
- Cloud-init
- Infrastructure Troubleshooting
- High Availability Architecture