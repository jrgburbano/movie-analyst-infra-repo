resource "aws_security_group" "bastion_sg" {
  name        = "${var.project}-bastion-sg"
  description = "Security group for bastion host"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH from my IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.allowed_ssh_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project}-bastion-sg"
    Project     = var.project
    Environment = "default"
  }
}