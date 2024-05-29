# Create a security group to allow SSH and HTTP access

# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnetid
  availability_zone = "ap-south-1a"
  #security_groups = [aws_security_group.instance_sg.name]

  tags = {
    Name = "web-instance"
  }
}