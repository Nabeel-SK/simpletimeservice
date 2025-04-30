resource "aws_lb" "app_alb" {
  name               = "simpletime-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.public[*].id
  security_groups    = [aws_security_group.ecs_instance_sg.id]

  tags = {
    Name = "simpletime-alb"
  }
}

