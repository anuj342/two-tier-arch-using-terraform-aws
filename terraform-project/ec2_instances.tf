resource "aws_instance" "instance-1" {
  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id     = aws_subnet.pub_subnet1.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = aws_key_pair.app_key.key_name
  
  user_data = file("userdata.sh")
  tags = {
    Name = "${var.vpc-name}-instance1"
  }
}

resource "aws_instance" "instance-2" {
  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id     = aws_subnet.pub_subnet2.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = aws_key_pair.app_key.key_name
  user_data = file("userdata.sh")
  tags = {
    Name = "${var.vpc-name}-instance2"
  }
}