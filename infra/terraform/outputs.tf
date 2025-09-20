output "frontend_url" {
  description = "Public URL for the frontend"
  value       = "http://${aws_instance.app.public_ip}:${var.frontend_external_port}"
}

output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.app.public_ip
}

output "ssh_hint" {
  description = "SSH command"
  value       = var.ssh_key_name != null ?
    "ssh -i <path-to-${var.ssh_key_name}.pem> ec2-user@${aws_instance.app.public_ip}" :
    "No SSH key configured"
}
