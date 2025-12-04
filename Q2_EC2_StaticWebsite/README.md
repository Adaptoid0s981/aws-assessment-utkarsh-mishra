# Q2 - EC2 Static Website (Utkarsh_Mishra)

## Brief approach (4–6 lines)
Launched a free-tier t2.micro EC2 in a public subnet. Bootstrapped with user_data to install Nginx and serve a resume HTML at /usr/share/nginx/html/index.html. Security group allows HTTP (0.0.0.0/0) and SSH only from your IP to harden access. Enabled automatic OS updates and disabled SSH password authentication in user_data.

## Before apply - edit variables
- Set `vpc_id` (output from Q1)
- Set `public_subnet_id` (one of the Q1 public subnet IDs)
- Set `my_ip_cidr` to your IP (e.g., 203.0.113.45/32)
- Optional: set `key_name` to an existing EC2 key pair

## Apply
1. `terraform init`
2. `terraform apply -var="vpc_id=<vpc_id>" -var="public_subnet_id=<subnet_id>" -var="my_ip_cidr=<your_ip/32>" -var="key_name=<your_key>"`

## After apply
- Open `http://<public_ip>` (output `public_ip`) to view the resume page.
- Screenshots to include:
  - EC2 instance page (instance id, public IP)
  - Security Group rules (show inbound SSH from your IP and HTTP open)
  - Browser screenshot of the site

## Destroy
`terraform destroy -auto-approve`
