provider "aws" {
    region = "us-east-1"
}

data "aws_subnet" "private_compute_subnet_az1"{
    filter {
        name = "tag:Name"
        values = ["Private Compute Subnet AZ1"]
    }
}

data "aws_subnet" "private_compute_subnet_az2"{
    filter {
        name = "tag:Name"
        values = ["Private Compute Subnet AZ2"]
    }
}

data "aws_subnet" "private_compute_subnet_az3"{
    filter {
        name = "tag:Name"
        values = ["Private Compute Subnet AZ3"]
    }
}

data "aws_security_group" "selected" {
    filter {
        name = "group-name"
        values = ["allow_http"]
    }
}

data "aws_lb_target_group" "alb" {
    name = "alb-tg"
}

resource "aws_launch_template" "web_server" {
    name = "apache-web-server-template"

    image_id = "ami-0c7217cdde317cfec"

    instance_type = "t2.micro"

    vpc_security_group_ids = [data.aws_security_group.selected.id]

    tags = {
        Name = "Apache Web Server Template"
    }

    user_data = filebase64("./user_data.sh")
}

module "web_server_asg" {
    source = "../../modules/services/auto-scaling-group/"

    min_size = 1
    desired_capacity = 3
    max_size = 5
    health_check_type = "ELB"
    subnets = [data.aws_subnet.private_compute_subnet_az1.id, data.aws_subnet.private_compute_subnet_az2.id, data.aws_subnet.private_compute_subnet_az3.id]
    launch_template = aws_launch_template.web_server.id
}

resource "aws_autoscaling_attachment" "alb" {
    autoscaling_group_name = module.web_server_asg.id
    lb_target_group_arn = data.aws_lb_target_group.alb.arn
}