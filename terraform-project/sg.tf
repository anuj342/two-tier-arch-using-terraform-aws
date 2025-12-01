resource "aws_security_group" "sg" {
  name = var.sg-name
  description = "Security group for my application"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
     description = "Allow http from load balancer"
     from_port = 80
     to_port = 80
     protocol = "tcp"
     security_groups = [aws_security_group.lb_sg.id]
  }
  
  ingress {
     description = "Allow http from internet for testing"
     from_port = 80
     to_port = 80
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = {
      Name = var.sg-name
  }
}

# Separate rule to allow outbound to database
resource "aws_security_group_rule" "app_to_db" {
  type              = "egress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  source_security_group_id = aws_security_group.db-sg.id
}
