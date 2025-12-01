resource "aws_route_table" "two_tier_pub_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "${var.vpc-name}-pub-rt"
  }
}

resource "aws_route_table_association" "rt_attachment1" {
    subnet_id      = aws_subnet.pub_subnet1.id
    route_table_id = aws_route_table.two_tier_pub_rt.id
}

resource "aws_route_table_association" "rt_attachment2" {
    subnet_id      = aws_subnet.pub_subnet2.id
    route_table_id = aws_route_table.two_tier_pub_rt.id
}