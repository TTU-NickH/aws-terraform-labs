# Lab 8 - Remote Terraform State with Amazon S3

## Objective

Configure Terraform to store its state remotely in an Amazon S3 bucket instead of locally on the development machine.

This lab demonstrates how remote state enables collaboration, improves reliability, and provides a centralized source of truth for infrastructure.

---

## AWS Resources Created

### Backend Infrastructure

- Amazon S3 Bucket (Terraform Remote State)

### Managed Infrastructure

- Amazon S3 Bucket (Managed by Terraform)

---

## Terraform Concepts Learned

- Terraform State
- Remote Backends
- S3 Backend Configuration
- State Migration
- State Management
- Infrastructure as Code

---

## Architecture

```
                  Terraform
                       │
                       │
          Reads/Writes State
                       │
                       ▼
      ┌────────────────────────────┐
      │   S3 Backend Bucket        │
      │                            │
      │ terraform.tfstate          │
      └────────────────────────────┘
                       │
                       ▼
             Creates AWS Resources
                       │
                       ▼
      ┌────────────────────────────┐
      │ Managed S3 Bucket          │
      └────────────────────────────┘
```

---

## Completed Tasks

- Created a dedicated Amazon S3 bucket to store Terraform state remotely
- Configured Terraform to use an S3 backend
- Enabled bucket encryption
- Enabled bucket versioning
- Configured state locking using the S3 backend
- Successfully migrated Terraform state from local storage to Amazon S3
- Verified the remote state file was created in the backend bucket
- Created an additional S3 bucket managed by Terraform

---

## Key Concepts

### Terraform State

The Terraform state file (`terraform.tfstate`) stores information about the infrastructure Terraform manages.

It acts as Terraform's memory, allowing it to compare the desired infrastructure with the existing infrastructure in AWS.

---

### Remote State

Instead of storing `terraform.tfstate` on a local computer, the state file is stored centrally in Amazon S3.

Benefits include:

- Shared state across team members
- Improved reliability
- Centralized infrastructure management
- Easier collaboration
- Integration with CI/CD pipelines

---

### Backend Bucket

The backend bucket stores only Terraform's state file.

It is **not** an infrastructure resource managed by this Terraform configuration.

---

### Managed Bucket

The managed bucket is a normal AWS resource created and managed by Terraform.

Terraform records this resource in the remote state stored in the backend bucket.

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

- Amazon S3
- S3 Versioning
- S3 Encryption

### Terraform

- Remote State
- S3 Backend
- State Management
- Infrastructure as Code

---

## Key Takeaways

Prior to this lab, Terraform state was stored locally on the development machine.

After configuring a remote backend, Terraform stores its state in Amazon S3, providing a centralized and reliable source of truth for infrastructure.

This approach closely reflects how Terraform is used in professional cloud and DevOps environments where multiple engineers collaborate on the same infrastructure.