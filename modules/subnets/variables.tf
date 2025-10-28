variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

variable "public_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "az" {
  description = "Availability Zone for the subnets"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}