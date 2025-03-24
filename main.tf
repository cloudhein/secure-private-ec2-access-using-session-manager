# Create VPC Interface Endpoints
resource "aws_vpc_endpoint" "vpc_interace_ep" {

  for_each          = local.vpc_interface_endpoints

  vpc_id            = aws_vpc.secure-vpc.id
  service_name      = each.key
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.vpc_ep_sg.id,
  ]

  private_dns_enabled = true
  ip_address_type     = "ipv4"
  subnet_ids = [
    aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id
  ]

  depends_on = [
    aws_subnet.private-subnet-1,
    aws_subnet.private-subnet-2
  ]
}
