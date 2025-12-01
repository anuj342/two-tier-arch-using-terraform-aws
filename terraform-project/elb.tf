resource "aws_lb" "test" {
  name               = "${var.vpc-name}-elb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.pub_subnet1.id, aws_subnet.pub_subnet2.id]
  security_groups    = [aws_security_group.lb_sg.id]
  tags = {
    environment = "production"
  }
}



resource "aws_lb_listener" "front-end" {
  load_balancer_arn = aws_lb.test.arn
    port              = "80"
    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.tg.arn
    }
} 