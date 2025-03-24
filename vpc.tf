# Create VPC with no Internet Access #
resource "aws_vpc" "secure-vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true #This must be true for vpc endpoints services

  tags = {
    Name = "private-vpc"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.secure-vpc.id
  cidr_block = var.subnet1_cidr
  availability_zone = "ap-northeast-1a" #Different AZs

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.secure-vpc.id
  cidr_block = var.subnet2_cidr
  availability_zone = "ap-northeast-1c" #Different AZs

  tags = {
    Name = "private-subnet-2"
  }
}

data "aws_subnets" "private_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.secure-vpc.id]
  }

  depends_on = [
    aws_subnet.private-subnet-1,
    aws_subnet.private-subnet-2
  ]
}

