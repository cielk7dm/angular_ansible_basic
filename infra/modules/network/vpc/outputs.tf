output "vpc_id" {
    value = aws_vpc.main.id
}

output "vpc_subnet_ids" {
  value =  aws_subnet.public.*.id
}