resource "aws_security_group" "db-sg" {
  name        = var.db-sg-name
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] 
  }
  
  tags = {
    Name = var.db-sg-name
  }
}

# Separate rule to allow inbound from application
resource "aws_security_group_rule" "db_from_app" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.db-sg.id
  source_security_group_id = aws_security_group.sg.id
}
