# Lab 5 - Automated Weather App Deployment

## Objective

Provision an Amazon EC2 instance with Terraform and automatically deploy a static Weather App from GitHub using EC2 User Data.

## AWS Resources Created

- EC2 Instance
- Security Group

## Tools Used

- Terraform
- AWS EC2
- AWS CLI
- Git
- GitHub
- Apache HTTP Server
- Amazon Linux 2023
- SSH

## Terraform Concepts Practiced

- AWS Provider
- Resources
- Data Sources
- Outputs
- User Data
- Resource replacement
- Terraform state
- Infrastructure as Code

## Deployment Process

1. Terraform retrieves the latest Amazon Linux 2023 AMI.
2. Terraform creates a security group allowing SSH and HTTP traffic.
3. Terraform creates an EC2 instance.
4. EC2 User Data updates the operating system.
5. User Data installs Apache and Git.
6. The server clones the Weather App repository from GitHub.
7. The application files are copied into Apache's document root.
8. Apache starts and serves the Weather App.

## User Data Tasks

The User Data script automatically:

- Updates installed packages
- Installs Apache
- Installs Git
- Enables Apache at boot
- Starts Apache
- Clones the Weather App repository
- Copies `index.html` and `weather-icon.png` into `/var/www/html`
- Sets file ownership and permissions
- Restarts Apache

## Verification

I verified the deployment by:

- Opening the EC2 public IP in a browser
- Confirming the Weather App loaded successfully
- Connecting to the server through SSH
- Checking the contents of `/var/www/html`
- Confirming Apache was running

## Key Takeaway

This lab demonstrated how Terraform can provision infrastructure while EC2 User Data performs automated server configuration and application deployment.

Instead of manually creating a server, installing software, cloning the repository, and copying application files, the entire deployment can be completed with:

```bash
terraform apply