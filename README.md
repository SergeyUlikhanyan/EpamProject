# Microservices Sample

# Introduction
This is a terraform project,vhich creates
- VPC with two public subnets and route table
- Security group with specified ports
- Route53 record 
- Network load balancer with target group and listener
- Autoscalling group and Launch template for creating EC2 instance(s) with 30gb GP2 volume

# Requirements
Operating System: Ubuntu 20.04, AWS account, Terraform

# Steps to deploy
1. Clone the repository
2. Change parameters in `vars.tf`
3. Add your aws `aws_access_key_id`  and `aws_secret_access_key` in `provider.tf`
4. Run `./deploy.sh` 

