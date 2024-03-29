variable "internal" {
    description = "Determines if the LB is internal or not"
}

variable "type" {
    description = "Determines the type of LB"
}

variable "subnets" {
    description = "List of subnets that you want to place the LB nodes in"
}

variable "vpc_id" {
    description = "ID of the vpc"
}

variable "security_groups" {
    description = "Security groups to use with the LB"
}

variable "name" {
    description = "Name of the LB"
}