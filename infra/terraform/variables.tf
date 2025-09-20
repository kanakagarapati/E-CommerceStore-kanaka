variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "AWS region"
}

variable "project" {
  type        = string
  default     = "ecom-store"
  description = "Name prefix for resources"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "ssh_key_name" {
  type        = string
  default     = null   # set to existing key pair name if you want SSH
}

variable "dockerhub_ns" {
  type        = string
  description = "Docker Hub namespace (username)"
}

variable "frontend_external_port" {
  type        = number
  default     = 80     # host port → container 3000
}
