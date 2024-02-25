resource "aws_lb" "this"{
    internal = var.internal
    load_balancer_type = var.type
    security_groups = var.security_groups
    subnets = var.subnets
}