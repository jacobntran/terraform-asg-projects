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

# data "aws_instance" "selected" {
#     filter {
#         name = "tag:Name"
#         values = ["Apache Web Server"]
#     }

#     filter {
#         name = "instance-state-code"
#         values = ["16"]
#     }
# }

module "application_load_balancer" {
    source = "../../modules/services/load-balancer/"
    internal = false
    type = "application"
    subnets = [data.aws_subnet.public_subnet_az1.id, data.aws_subnet.public_subnet_az2.id, data.aws_subnet.public_subnet_az3.id]
    vpc_id = data.aws_vpc.selected.id
    security_groups = [aws_security_group.allow_http.id]
    name = "alb"
}

resource "aws_security_group" "allow_http"{
    name = "allow_http"
    description = "Allow inbound http traffic"
    vpc_id = data.aws_vpc.selected.id

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
}

resource "aws_lb_target_group" "this" {
    name = "alb-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = data.aws_vpc.selected.id

    health_check {
        port     = 80
        protocol = "HTTP"
    }

    tags = {
        Name = "ALB Target Group"
    }
}

resource "aws_lb_listener" "this" {
    load_balancer_arn = module.application_load_balancer.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.this.arn
    }
}