provider "aws" {
    region = "us-east-1"
}

data "aws_vpc" "selected" {
    filter {
        name = "tag:Name"
        values = ["three-tier-vpc"]
    }
}

# data "aws_subnet" "public" {
#     filter {
#         name = "tag:Name"
#         values = ["Public Subnet AZ1"]
#     }
# }

data "aws_subnet" "private" {
    filter {
        name = "tag:Name"
        values = ["Private Compute Subnet AZ1"]
    }
}

# data "aws_security_group" "selected" {
#     filter {
#         name = "tag:Name"
#         values = ["allow_http"]
#     }
# }

# module "web_server_2" {
#     source = "../../modules/services/ec2_instance/"

#     ami = "ami-0c7217cdde317cfec"
#     instance_type = "t2.micro"
#     subnet_id = data.aws_subnet.private.id
#     user_data = "./user_data.sh"
#     name = "Web Server 2"
#     security_groups = [aws_security_group.allow_http.id]
# }

module "web_server" {
    source = "../../modules/services/ec2_instance/"

    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.private.id
    user_data = "./user_data.sh"
    name = "Apache Web Server"
    security_groups = [aws_security_group.allow_http.id]
}

resource "aws_security_group" "allow_http"{
    description = "Allow inbound http traffic"
    vpc_id = data.aws_vpc.selected.id

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
}