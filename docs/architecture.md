# Architecture Overview

This two-tier architecture separates the web/application tier from the persistence tier. Network isolation and security groups limit access between tiers.

Core components
- VPC with public and private subnets
- Public subnets: NAT Gateway, Load Balancer, Bastion host (optional)
- Private subnets: Application servers (ASG or ECS), RDS database (or managed DB)
- Security Groups: public-to-lb, lb-to-app, app-to-db
- IAM roles for instances and automation

ASCII diagram
```
Internet
   |
[ALB] (public subnets)
   |
[ASG: Web/APP] (private subnets)
   |
[RDS] (private subnets)
```

Networking
- Use 3 AZs for high availability if available.
- Route tables: public routes to IGW; private subnets route NAT for outgoing internet.

Scaling & HA
- Autoscaling group for app tier; scaling policies based on CPU/requests.
- RDS with Multi-AZ if required.
