data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.6.20250303.0-kernel-6.1-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

# Create EC2 instance in private subnets #
resource "aws_instance" "instances" {
  count = var.create_instances ? var.instance_count : 0

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.instances_sg.id]
  subnet_id              = element(data.aws_subnets.private_vpc_subnets.ids, count.index) # create instances in different subnets
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.id # attach ssm iam role so that it can have permission to talk to ssm manager

  tags = {
    Name        = "${local.instance_name}-${count.index + 1}"
    Environment = local.environment
  }
  
}