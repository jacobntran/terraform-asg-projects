provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "three-tier-vpc"
  }
}

module "public_subnet_az1" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "us-east-1a"
  subnet_name = "Public Subnet AZ1"
}

module "private_compute_subnet_az1" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-east-1a"
  subnet_name = "Private Compute Subnet AZ1"
}

module "private_data_subnet_az1" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.32.0/20"
  availability_zone = "us-east-1a"
  subnet_name = "Private Data Subnet AZ1"
}

module "reserved_subnet_az1" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.48.0/20"
  availability_zone = "us-east-1a"
  subnet_name = "Reserved Subnet AZ1"
}

module "public_subnet_az2" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.64.0/20"
  availability_zone = "us-east-1b"
  subnet_name = "Public Subnet AZ2"
}

module "private_compute_subnet_az2" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.80.0/20"
  availability_zone = "us-east-1b"
  subnet_name = "Private Compute Subnet AZ2"
}

module "private_data_subnet_az2" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.96.0/20"
  availability_zone = "us-east-1b"
  subnet_name = "Private Data Subnet AZ2"
}

module "reserved_subnet_az2" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.112.0/20"
  availability_zone = "us-east-1b"
  subnet_name = "Reserved Subnet AZ2"
}

module "public_subnet_az3" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "us-east-1c"
  subnet_name = "Public Subnet AZ3"
}

module "private_compute_subnet_az3" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.144.0/20"
  availability_zone = "us-east-1c"
  subnet_name = "Private Compute Subnet AZ3"
}

module "private_data_subnet_az3" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.160.0/20"
  availability_zone = "us-east-1c"
  subnet_name = "Private Data Subnet AZ3"
}

module "reserved_subnet_az3" {
  source = "../modules/networking/subnet"

  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.176.0/20"
  availability_zone = "us-east-1c"
  subnet_name = "Reserved Subnet AZ3"
}