# Q3 - High Availability + ASG + ALB (Utkarsh_Mishra)

## Brief approach (4–6 lines)
Deployed an Internet-facing ALB in two public subnets. Created a target group and Auto Scaling Group that launches EC2 instances in private subnets (from Q1). Instances run nginx and are reachable only through the ALB. ASG runs across the two private subnets (AZs) for resilience. Health checks on the target group ensure only healthy instances receive traffic.

## Before apply - edit variables
- Set `vpc_id` (from Q1)
- Set `public_subnet_ids` (list of two public subnet IDs from Q1)
- Set `private_subnet_ids` (list of two private subnet IDs from Q1)

## Apply
`terraform init` then
`terraform apply -var='vpc_id=<vpc>' -var='public_subnet_ids=["subnet-...","subnet-..."]' -var='private_subnet_ids=["subnet-...","subnet-..."]'`

## After apply - verification/screenshots
- Open `http://<alb_dns>` (output `alb_dns`) to see the site.
- Screenshots to include:
  - ALB configuration (listeners, subnets)
  - Target Group (healthy targets)
  - Auto Scaling Group (min/max/desired)
  - EC2 instances launched by ASG (from EC2 console)

## Destroy
`terraform destroy -auto-approve`
