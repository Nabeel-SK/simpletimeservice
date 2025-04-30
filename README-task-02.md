📘 Task 2: Deploy SimpleTimeService to AWS ECS with Terraform (README)

🧱 Infrastructure Overview

This part of the project uses Terraform to deploy the Dockerized app to AWS using:

ECS Cluster (EC2 launch type)

Auto Scaling Group

ALB

VPC with 2 public and 2 private subnets

📁 Terraform Directory Structure

terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── ecs_cluster.tf
├── ecs_service.tf
├── ecs_task_definition.tf
├── launch_template.tf
├── autoscaling.tf
├── alb.tf
├── target_group.tf
├── listener.tf
├── user_data.sh

📦 Prerequisites

Terraform v1.3+

AWS CLI configured

Existing EC2 Key Pair in ap-south-1

Docker image pushed to DockerHub

🚀 Deployment Steps

1. Move to Terraform Directory

cd terraform/

2. Set Variables in terraform.tfvars

key_name      = "your-ec2-key"
docker_image  = "nabeel111/simple-time-service:latest"

You can also modify region and instance type in variables.tf.

3. Initialize and Deploy

terraform init
terraform apply

✅ Type yes to confirm.

🌐 Access the App via ALB

Terraform will output:

alb_dns_name = simpletime-alb-xxxxx.ap-south-1.elb.amazonaws.com

Visit:

http://simpletime-alb-xxxxx.ap-south-1.elb.amazonaws.com

🧪 Debugging Tips

Issue

Likely Fix

503 Error

ALB sees targets as unhealthy. Confirm app binds to 0.0.0.0:8080

ECS Task not starting

Check IAM role, task definition, container logs

No ALB DNS

Ensure alb.tf is applied and listener configured

🧹 Cleanup

terraform destroy

✅ This removes all AWS resources.

✅ Task Summary

Task

Status

Dockerized Flask App

✅ Done

DockerHub Push

✅ Done

ECS Cluster (EC2)

✅ Done

Load Balancer (ALB)

✅ Done

Full Infra-as-Code with Terraform

✅ Done
