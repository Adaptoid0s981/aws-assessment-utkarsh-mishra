output "utkarsh_mishra_alb_dns" {
  value = aws_lb.utkarsh_mishra_alb.dns_name
}

output "utkarsh_mishra_vpc_id" {
  value = aws_vpc.utkarsh_mishra_vpc.id
}

output "utkarsh_mishra_public_subnets" {
  value = aws_subnet.utkarsh_mishra_public_subnet[*].id
}

output "utkarsh_mishra_private_subnets" {
  value = aws_subnet.utkarsh_mishra_private_subnet[*].id
}
