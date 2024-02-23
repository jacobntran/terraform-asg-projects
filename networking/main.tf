provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "three-tier-vpc"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-1"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-1"
  }
} 

resource "aws_subnet" "data_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.32.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Data-1"
  }
}

resource "aws_subnet" "reserved_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.48.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Reserved-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.64.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public-2"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.80.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-2"
  }
} 

resource "aws_subnet" "data_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.96.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Data-2"
  }
}

resource "aws_subnet" "reserved_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.112.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Reserved-2"
  }
}

resource "aws_subnet" "public_3" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Public-3"
  }
}

resource "aws_subnet" "private_3" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.144.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Private-3"
  }
} 

resource "aws_subnet" "data_3" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.160.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Data-3"
  }
}

resource "aws_subnet" "reserved_3" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.176.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Reserved-3"
  }
}