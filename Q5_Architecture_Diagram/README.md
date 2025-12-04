# Q5 - Highly Scalable AWS Architecture (Utkarsh_Mishra)

## Brief explanation (5–8 lines)
Traffic arrives from the Internet and optionally passes through CloudFront (for CDN and caching). An Application Load Balancer (ALB) in public subnets routes requests to a fleet of stateless web servers managed by an Auto Scaling Group (ASG) in private subnets across multiple AZs. Persistent data is stored in a multi-AZ RDS/Aurora cluster. A Redis ElastiCache cluster provides caching/session storage to reduce DB load. Static assets are stored in S3 (served via CloudFront). Security is enforced through Security Groups and NACLs; WAF can be attached to CloudFront/ALB for mitigating common web attacks. Observability is handled by CloudWatch metrics, logs, and alarms.

## Files
- `architecture.drawio` (import into diagrams.net)
- export from diagrams.net as `architecture.png` and include here

## Tips to enhance diagram
- Add WAF in front of CloudFront/ALB
- Add CloudWatch Logs Group, metrics & dashboards
- Add autoscaling policies (target tracking)
