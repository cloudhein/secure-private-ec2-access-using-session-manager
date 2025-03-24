######## Create a Security Group for EC2 instances ##############
resource "aws_security_group" "instances_sg" {
  name        = "no_inbound_rule_instance_sg"
  description = "No Inbound Rules and  HTTPS traffic allowed in outbound rules"
  vpc_id      = aws_vpc.secure-vpc.id

  tags = {
    Name = "no_inbound_rule_instance_sg"
  }
}

# allows only return https traffic to any ip address for outbound rules and no inbound rules #
resource "aws_vpc_security_group_egress_rule" "allow_https_traffic_ipv4" {
  security_group_id = aws_security_group.instances_sg.id
  cidr_ipv4         = local.anywhere
  from_port         = local.https_port
  ip_protocol       = local.tcp_protocol
  to_port           = local.https_port
}

############## Create a Security Group for VPC endpoints #######################
resource "aws_security_group" "vpc_ep_sg" {
  name        = "vpc_ep_sg"
  description = "Allow HTTPS traffice Inbound and No outbound rules"
  vpc_id      = aws_vpc.secure-vpc.id

  tags = {
    Name = "vpc_ep_sg"
  }
}

# Allow only https traffic in inbound rules from only ec2 security group #
resource "aws_vpc_security_group_ingress_rule" "allow_https_traffic_inbound_rules" {

  security_group_id            = aws_security_group.vpc_ep_sg.id
  referenced_security_group_id = aws_security_group.instances_sg.id
  from_port                    = local.https_port
  ip_protocol                  = local.tcp_protocol
  to_port                      = local.https_port
}

