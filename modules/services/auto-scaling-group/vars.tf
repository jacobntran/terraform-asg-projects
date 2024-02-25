variable "min_size" {
    description = "Minimum amount of instances you want in your ASG"
}

variable "max_size" {
    description = "Maximum amount of instances you want in your ASG"
}

variable "desired_capacity" {
    description = "Desired amount of instances you want in your ASG"
}

variable "health_check_type" {
    description = "Health check type you want to use on your instances"
}

variable "launch_template" {
    description = "Launch template to use with your instances"
}

variable "subnets" {
    description = "Subnets that you want to launch your instances into"
}