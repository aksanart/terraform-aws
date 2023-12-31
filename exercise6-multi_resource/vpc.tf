// vpc
resource "aws_vpc" "terra-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "terraform-vpc"
  }
}

// public subnet
resource "aws_subnet" "terra-pub-1" {
  vpc_id                  = aws_vpc.terra-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.REGION["ZONEa"]
  tags = {
    Name = "terra-pub-1"
  }
}

resource "aws_subnet" "terra-pub-2" {
  vpc_id                  = aws_vpc.terra-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.REGION["ZONEb"]
  tags = {
    Name = "terra-pub-2"
  }
}

resource "aws_subnet" "terra-pub-3" {
  vpc_id                  = aws_vpc.terra-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.REGION["ZONEc"]
  tags = {
    Name = "terra-pub-3"
  }
}

// privat subnet
resource "aws_subnet" "terra-priv-1" {
  vpc_id                  = aws_vpc.terra-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.REGION["ZONEa"]
  tags = {
    Name = "terra-priv-1"
  }
}

resource "aws_subnet" "terra-priv-2" {
  vpc_id                  = aws_vpc.terra-vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.REGION["ZONEb"]
  tags = {
    Name = "terra-priv-2"
  }
}

resource "aws_subnet" "terra-priv-3" {
  vpc_id                  = aws_vpc.terra-vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.REGION["ZONEc"]
  tags = {
    Name = "terra-priv-3"
  }
}

// internet gateway
resource "aws_internet_gateway" "terra-IGW" {
  vpc_id = aws_vpc.terra-vpc.id
  tags = {
    Name = "terra-IGW"
  }
}

// route table
resource "aws_route_table" "terra-pub-RT" {
  vpc_id = aws_vpc.terra-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-IGW.id
  }
  tags = {
    Name = "terra-pub-RT"
  }
}

// route table associations
resource "aws_route_table_association" "terra-pub-1-association" {
  subnet_id      = aws_subnet.terra-pub-1.id
  route_table_id = aws_route_table.terra-pub-RT.id
}

resource "aws_route_table_association" "terra-pub-2-association" {
  subnet_id      = aws_subnet.terra-pub-2.id
  route_table_id = aws_route_table.terra-pub-RT.id
}

resource "aws_route_table_association" "terra-pub-3-association" {
  subnet_id      = aws_subnet.terra-pub-3.id
  route_table_id = aws_route_table.terra-pub-RT.id
}
