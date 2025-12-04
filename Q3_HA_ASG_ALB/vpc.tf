resource "aws_vpc" "utkarsh_mishra_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "utkarsh_mishra_vpc"
  }
}

resource "aws_internet_gateway" "utkarsh_mishra_igw" {
  vpc_id = aws_vpc.utkarsh_mishra_vpc.id

  tags = {
    Name = "utkarsh_mishra_igw"
  }
}

resource "aws_subnet" "utkarsh_mishra_public_subnet" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.utkarsh_mishra_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "utkarsh_mishra_public_subnet_${count.index + 1}"
  }
}

resource "aws_subnet" "utkarsh_mishra_private_subnet" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.utkarsh_mishra_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "utkarsh_mishra_private_subnet_${count.index + 1}"
  }
}

resource "aws_route_table" "utkarsh_mishra_public_rt" {
  vpc_id = aws_vpc.utkarsh_mishra_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.utkarsh_mishra_igw.id
  }

  tags = {
    Name = "utkarsh_mishra_public_rt"
  }
}

resource "aws_route_table_association" "utkarsh_mishra_public_rta" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.utkarsh_mishra_public_subnet[count.index].id
  route_table_id = aws_route_table.utkarsh_mishra_public_rt.id
}

resource "aws_eip" "utkarsh_mishra_nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "utkarsh_mishra_nat" {
  allocation_id = aws_eip.utkarsh_mishra_nat_eip.id
  subnet_id     = aws_subnet.utkarsh_mishra_public_subnet[0].id

  tags = {
    Name = "utkarsh_mishra_nat"
  }
}

resource "aws_route_table" "utkarsh_mishra_private_rt" {
  vpc_id = aws_vpc.utkarsh_mishra_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.utkarsh_mishra_nat.id
  }

  tags = {
    Name = "utkarsh_mishra_private_rt"
  }
}

resource "aws_route_table_association" "utkarsh_mishra_private_rta" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.utkarsh_mishra_private_subnet[count.index].id
  route_table_id = aws_route_table.utkarsh_mishra_private_rt.id
}

data "aws_availability_zones" "available" {
  state = "available"
}
