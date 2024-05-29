output "vpc_id" {
  value = aws_vpc.main.id
}

# Output the Subnet ID
output "public_subnet_id" {
  value = aws_subnet.public.id
}