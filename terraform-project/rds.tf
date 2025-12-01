resource "aws_db_instance" "rds-1" {
  allocated_storage = 10
  instance_class = "db.t3.micro"
  engine = "mysql"
  engine_version = "8.0"
  db_name = "mydb"
  username = var.db-username
  password = var.db-password
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.subnet-group.name
}