output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "subnet-id" {
  value = aws_subnet.public.*.id
}

output "sg-id" {
  value = aws_security_group.sg.id
}

output "az" {
  value = var.az
}