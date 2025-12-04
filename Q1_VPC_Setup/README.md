# Q1 - VPC & Subnets (Utkarsh_Mishra)

## Brief approach (4–6 lines)
Created one VPC (10.0.0.0/20) with two public and two private /24 subnets across ap-south-1a and ap-south-1b for resiliency. Attached Internet Gateway for public subnet internet. Deployed a NAT Gateway in a public subnet to allow private instances outbound internet while keeping them private. Configured separate route tables for public and private subnets.

## CIDR allocations and reason
- VPC: 10.0.0.0/20 (4096 IPs)
- Public Subnet A: 10.0.0.0/24 (ap-south-1a)
- Public Subnet B: 10.0.1.0/24 (ap-south-1b)
- Private Subnet A: 10.0.2.0/24 (ap-south-1a)
- Private Subnet B: 10.0.3.0/24 (ap-south-1b)

Reason: /24s are simple, abundant per-subnet space and distributing across two AZs supports HA.

## Apply
1. `terraform init`
2. `terraform plan -out plan.tf`
3. `terraform apply "plan.tf"`

## Destroy
`terraform destroy -auto-approve`

## Screenshots to include in this folder README:
- VPC details page (showing CIDR)
- Subnets list (showing the 4 subnets and AZs)
- Route Tables (public → IGW, private → NAT)
- NAT Gateway and Internet Gateway pages
