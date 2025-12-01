resource "aws_lb_target_group" "tg" {
  name     = "${var.vpc-name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    environment = "production"
  }

}

resource "aws_lb_target_group_attachment" "tg_attachment_1" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id        = aws_instance.instance-1.id
    port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attachment_2" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id        = aws_instance.instance-2.id
    port             = 80
}

