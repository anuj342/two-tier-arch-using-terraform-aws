resource "aws_subnet" "pri_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.pri-subnet1-cidr
  availability_zone = var.subnet1-az

  tags = {
    Name = "${var.vpc-name}-pri-subnet1"
  }
  
}

resource "aws_subnet" "pri_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.pri-subnet2-cidr
  availability_zone = var.subnet2-az

  tags = {
    Name = "${var.vpc-name}-pri-subnet2"
  }
  
}