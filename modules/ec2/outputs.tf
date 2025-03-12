output "ami_id" {
  description = "The ID of the Ubuntu 24.04 AMI"
  value       = local.ami_id
}

output "security_group_id" {
  description = "The ID of the security group created for the instance"
  value       = aws_security_group.instance_sg.id
}

output "key_pair_name" {
  description = "The name of the generated key pair"
  value       = aws_key_pair.infrasight-key-pair.key_name
}

output "iam_role_name" {
  description = "The name of the IAM role assigned to EC2"
  value       = aws_iam_role.ec2-role.name
}

output "iam_instance_profile_name" {
  description = "The name of the IAM instance profile"
  value       = aws_iam_instance_profile.ec2_profile.name
}

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.infrasight.id
}

output "instance_public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.infrasight.public_ip
}