variable "vpc_id" {
    description = "ID of the VPC for the subnet"
}

variable "cidr_block" {
    description = "CIDR block for the subnet"
}

variable "availability_zone" {
    description = "AZ to place the subnet in"
}

variable "subnet_name" {
    description = "Name of the subnet"
}

variable "enable_public_ips" {
    description = "Decides if instances in the subnet get public ips"
}