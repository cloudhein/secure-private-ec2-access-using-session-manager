# Output VPC ID
output "vpc_id" {
  description = "The ID of VPC"
  value       = aws_vpc.secure-vpc.id
}

# Output EC2 instance ID
output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.instances[*].id
}

# Output ssm user access key
output "dev_user_access_key" {
  description = "Access key for the ssm user"
  value       = aws_iam_access_key.ssm_user_access_keys.id
  sensitive   = true
}

# Output ssm user secret access key
output "dev_user_secret_key" {
  description = "Secret access key for the Dev User"
  value       = aws_iam_access_key.ssm_user_access_keys.secret
  sensitive   = true
}
