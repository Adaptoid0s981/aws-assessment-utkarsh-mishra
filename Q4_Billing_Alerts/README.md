# Q4 - Billing & Free Tier Monitoring (Utkarsh_Mishra)

## Brief approach (4–6 lines)
Create a CloudWatch EstimatedCharges alarm at INR 100 in us-east-1 (billing metrics are published there). Create an SNS topic and email subscription to receive alarm notifications. Also create an AWS Budget for monthly cost notification with an email subscriber. Enable Free Tier usage alerts via Billing Console (console step noted below).

## Why cost monitoring is important (short)
- Prevents surprise charges and educates beginners on resource cost.
- Sudden increases often caused by NAT Gateway hours, large instances (RDS/EC2), egress data transfer, or orphaned resources.

## Apply
1. Edit `notification_email` in `main.tf` (set your email).
2. `terraform init`
3. `terraform apply`

## Console step (manual)
- Go to AWS Console → Billing → Preferences → enable "Receive Free Tier Usage Alerts" (if not already enabled).

## Screenshots to include:
- CloudWatch Alarm (show the created alarm)
- AWS Budgets page showing the budget and notification
