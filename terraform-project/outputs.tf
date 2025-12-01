output "dns_name" {
  value = aws_lb.test.dns_name
}

output "instance_1_public_ip" {
  value = aws_instance.instance-1.public_ip
  description = "Public IP of instance 1"
}

output "instance_2_public_ip" {
  value = aws_instance.instance-2.public_ip
  description = "Public IP of instance 2"
}