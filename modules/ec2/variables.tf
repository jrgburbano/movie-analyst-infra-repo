variable "ami_id" {
  description = "Bastion Host AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_subnet_id" {
  description = "Subnet ID for bastion host"
  type        = string
}

variable "bastion_sg_id" {
  description = "Bastion Host SG ID"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}