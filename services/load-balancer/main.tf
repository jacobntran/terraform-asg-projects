provider "aws" {
    region = "us-east-1"
}

data "aws_subnet" "public_subnet_az1" {
    filter {
        name = "tag:Name"
        values = ["Public Subnet AZ1"]
    }
}

data "aws_subnet" "public_subnet_az2" {
    filter {
        name = "tag:Name"
        values = ["Public Subnet AZ2"]
    }
}

data "aws_subnet" "public_subnet_az3" {
    filter {
        name = "tag:Name"
        values = ["Public Subnet AZ3"]
    }
}

data "aws_vpc" "selected" {
    filter {
        name = "tag:Name"
        values = ["three-tier-vpc"]
    }
}

module "application_load_balancer" {
    source = "../../modules/services/load-balancer/"
    internal = false
    type = "application"
    subnets = [data.aws_subnet.public_subnet_az1.id, data.aws_subnet.public_subnet_az2.id, data.aws_subnet.public_subnet_az3.id]
    vpc_id = data.aws_vpc.selected.id
}