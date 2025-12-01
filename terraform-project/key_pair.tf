# Generate a new SSH key pair
resource "tls_private_key" "app_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair
resource "aws_key_pair" "app_key" {
  key_name   = var.key-name
  public_key = tls_private_key.app_key.public_key_openssh

  tags = {
    Name = var.key-name
  }
}

# Save private key locally (optional - for your reference)
resource "local_file" "private_key" {
  content         = tls_private_key.app_key.private_key_pem
  filename        = "${path.module}/${var.key-name}.pem"
  file_permission = "0400"
}
