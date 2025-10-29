variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into bastion"
  type        = string
}