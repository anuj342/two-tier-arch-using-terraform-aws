resource "aws_db_subnet_group" "subnet-group" {
  name = var.db-subnet
  subnet_ids = [aws_subnet.pri_subnet1.id, aws_subnet.pri_subnet2.id]
  tags = {
    Name = var.db-subnet
  }
}