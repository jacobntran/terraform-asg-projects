resource "aws_lb" "this"{
    internal = var.internal
    load_balancer_type = var.type
    security_groups = [aws_security_group.allow_http.id]
    subnets = var.subnets
}

resource "aws_security_group" "allow_http"{
    name = "allow_http"
    description = "Allow inbound http traffic"
    vpc_id = var.vpc_id

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
    vpc_id = var.vpc_id

    health_check {
        port     = 80
        protocol = "HTTP"
    }

    tags = {
        Name = "ALB Target Group"
    }
}

resource "aws_lb_listener" "this" {
    load_balancer_arn = aws_lb.this.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.this.arn
    }
}