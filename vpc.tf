resource "aws_vpc" "secure-vpc" {
  cidr_block           = "172.21.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true #This must be true for vpc endpoints services

  tags = {
    Name = "private-vpc"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.secure-vpc.id
  cidr_block = "172.21.0.0/20"
  availability_zone = "ap-northeast-1a" #Different AZs

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.secure-vpc.id
  cidr_block = "172.21.16.0/20"
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

