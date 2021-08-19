output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.maquina_wp.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.maquina_wp.private_ip
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.maquina_wp.public_ip
}

output "instance_public_dns" {
  description = "Public DNS address of the EC2 instance"
  value       = aws_instance.maquina_wp.public_dns
}

