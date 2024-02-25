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

data "aws_instance" "selected" {
    filter {
        name = "tag:Name"
        values = ["Apache Web Server"]
    }

    filter {
        name = "instance-state-code"
        values = ["16"]
    }
}

module "application_load_balancer" {
    source = "../../modules/services/load-balancer/"
    internal = false
    type = "application"
    subnets = [data.aws_subnet.public_subnet_az1.id, data.aws_subnet.public_subnet_az2.id, data.aws_subnet.public_subnet_az3.id]
    vpc_id = data.aws_vpc.selected.id
}


resource "aws_lb_target_group_attachment" "this" {
    target_group_arn = module.application_load_balancer.target_group_arn
    target_id = data.aws_instance.selected.id
    port = 80
}