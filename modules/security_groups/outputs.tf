output "bastion_sg_id" {
  description = "Bastion Host SG ID"
  value       = aws_security_group.bastion_sg.id
}