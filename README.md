Task 2: Deploy Flask App to AWS ECS using Terraform

📄 Project Overview

This project uses Terraform to deploy a Dockerized Flask app (from Task 1) to Amazon ECS (EC2 launch type) with complete AWS infrastructure setup. It includes VPC, ECS Cluster, Auto Scaling Group, EC2 instances, and an Application Load Balancer (ALB).

🧱 Infrastructure Overview

VPC with 2 public and 2 private subnets

Internet Gateway + Route Tables

ECS Cluster using EC2 Launch Type

EC2 Auto Scaling Group (1–2 instances)

Application Load Balancer (ALB)

ECS Task + Service (running your container)

📁 Terraform File Structure

terraform/
├── main.tf                 # VPC, subnets, networking
├── variables.tf            # Input variables
├── outputs.tf              # Useful output values (like ALB DNS)
├── ecs_cluster.tf          # ECS cluster setup
├── ecs_task_definition.tf  # Container config (DockerHub image)
├── ecs_service.tf          # ECS Service (linked to ALB)
├── launch_template.tf      # EC2 launch template (user_data)
├── autoscaling.tf          # Auto Scaling Group for ECS EC2s
├── alb.tf                  # Load balancer
├── target_group.tf         # Target group for ECS
├── listener.tf             # ALB listener (port 80)
├── user_data.sh            # Bootstrap ECS agent in EC2

⚙️ Prerequisites

AWS CLI configured

Terraform v1.3+

DockerHub image available (e.g., nabeel111/simple-time-service)

Valid EC2 Key Pair in ap-south-1

🚀 Deployment Instructions

1. Clone & Navigate

git clone https://github.com/<your-username>/simple-time-service.git
cd simple-time-service/terraform

2. Create terraform.tfvars

key_name      = "your-ec2-key"
docker_image  = "nabeel111/simple-time-service:latest"

3. Initialize and Deploy

terraform init
terraform apply

✅ Confirm with yes when prompted.

🌐 Access the App

After deployment, Terraform will output:

alb_dns_name = simpletime-alb-xxxxx.ap-south-1.elb.amazonaws.com

Open this in your browser:

http://simpletime-alb-xxxxx.ap-south-1.elb.amazonaws.com

You should see a JSON response:

{
  "timestamp": "2025-05-01T14:30:00+05:30",
  "ip": "123.45.67.89"
}

🧪 Troubleshooting

Issue

Fix

503 Service Unavailable

Target group unhealthy — check container port (8080), SG rules, Flask binding

ECS Task not starting

Check IAM role, memory config, or container logs

ALB DNS doesn't work

Ensure public subnets and listener on port 80 are properly set

🧹 Cleanup

To remove all AWS resources and avoid costs:

terraform destroy

✅ Type yes when prompted.

👨‍💻 Author

Created by Nabeel SK as part of DevOps hands-on Task 2.

📘 License

This project is for educational and demonstration purposes only.

