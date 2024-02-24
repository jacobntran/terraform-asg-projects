variable "ami" {
    description = "AMI to use for the instance"
}

variable "instance_type" {
    description = "Instance type to use for the instance"
}

variable "subnet_id" {
    description = "Subnet to place the the instance in"
}

variable "user_data" {
    description = "User data to start the istances with"
}

variable "name" {
    description = "Name of the instance"
}

variable "security_groups" {
    description = "Security group ids for the instance"
}