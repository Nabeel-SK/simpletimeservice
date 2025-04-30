variable "aws_region" {
  description = "AWS region to deploy into"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of existing EC2 key pair"
  type        = string
}

variable "docker_image" {
  description = "Docker image to deploy"
  default     = "nabeel111/simple-time-service:latest"
}

