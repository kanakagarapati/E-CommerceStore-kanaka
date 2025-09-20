resource "aws_instance" "app" {
  ami                    = data.aws_ami.al2023.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = var.ssh_key_name

  user_data = templatefile("${path.module}/user_data.sh.tftpl", {
    dockerhub_ns           = var.dockerhub_ns
    frontend_external_port = var.frontend_external_port
  })

  tags = {
    Name = "${var.project}-ec2"
  }
}
