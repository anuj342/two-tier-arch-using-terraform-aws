resource "aws_subnet" "pub_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.pub-subnet1-cidr
  availability_zone = var.subnet1-az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc-name}-pub-subnet1"
  }
  
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.pub-subnet2-cidr
  availability_zone = var.subnet2-az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc-name}-pub-subnet2"
  }
  
}