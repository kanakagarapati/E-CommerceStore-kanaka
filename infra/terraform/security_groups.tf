resource "aws_security_group" "ec2" {
  name        = "${var.project}-ec2-sg"
  description = "Allow HTTP to frontend; egress open"
  vpc_id      = aws_vpc.main.id

  # Public frontend (host port)
  ingress {
    description = "HTTP to frontend"
    from_port   = var.frontend_external_port
    to_port     = var.frontend_external_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Optional SSH - lock down if you enable it
  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["YOUR.IP.ADDR.0/32"]
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = { Name = "${var.project}-ec2-sg" }
}
