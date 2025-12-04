provider "aws" {
  region = "ap-south-1"
}

# -----------------------------
# Security Group for EC2
# -----------------------------
resource "aws_security_group" "web_sg" {
  name        = "Utkarsh_Mishra_Web_SG"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Utkarsh_Mishra_Web_SG"
  }
}

# -----------------------------
# EC2 Instance
# -----------------------------
resource "aws_instance" "web_server" {
  ami                    = "ami-0a0f1259dd1c90938" # Amazon Linux 2 (ap-south-1)
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y nginx
    systemctl start nginx
    systemctl enable nginx

    echo "<h1>Resume Website - Hosted by Utkarsh Mishra</h1>" > /usr/share/nginx/html/index.html
  EOF

  tags = {
    Name = "Utkarsh_Mishra_WebServer"
  }
}

# -----------------------------
# Output
# -----------------------------
output "public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.web_server.public_ip
}

# -----------------------------
# Variables
# -----------------------------
variable "vpc_id" {}
variable "public_subnet_id" {}
