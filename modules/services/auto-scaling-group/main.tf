resource "aws_autoscaling_group" "this" {
    min_size = var.min_size
    desired_capacity = var.desired_capacity
    max_size = var.max_size
    health_check_type = var.health_check_type
    vpc_zone_identifier = var.subnets
    launch_template {
        id = var.launch_template
    }
}