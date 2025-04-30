resource "aws_ecs_service" "simpletime_service" {
  name            = "simpletime-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.simpletime_task.arn
  desired_count   = 1
  launch_type     = "EC2"

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  depends_on = [aws_autoscaling_group.ecs_asg]

load_balancer {
  target_group_arn = aws_lb_target_group.ecs_tg.arn
  container_name   = "simpletimeservice"
  container_port   = 8080
}

}

