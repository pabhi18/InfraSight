module "ubuntu_24_04_latest" {
  source = "github.com/andreswebs/terraform-aws-ami-ubuntu"
}

locals {
  ami_id = module.ubuntu_24_04_latest.ami_id
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_security_group" "instance_sg" {
  name        = "cloudwatch-instance-sg"
  description = "Allow SSH access"
  
  ingress {
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
}

resource "aws_key_pair" "infrasight-key-pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "infrasight-key-file" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.key_filename
}

resource "aws_iam_policy" "cloud-watch-permission" {
    name   = "cloud-watch-permission"
    policy = file("config/iam-policy.json")
}

resource "aws_iam_role" "ec2-role" {
    name               = "ec2-role"
    assume_role_policy = file("config/iam-role.json")
}

resource "aws_iam_role_policy_attachment" "ec2-cloudwatch-attachment" {
    role       = aws_iam_role.ec2-role.name
    policy_arn = aws_iam_policy.cloud-watch-permission.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-cloudwatch-profile"
  role = aws_iam_role.ec2-role.name
}

resource "aws_instance" "infrasight" {
  ami           = local.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.infrasight-key-pair.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  
  tags = {
    Name        = var.instance_tag
    Environment = var.environment
  }
  user_data = file("../../scripts/cloudwatch_agent.sh")
}