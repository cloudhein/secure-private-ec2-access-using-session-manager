locals {
  instance_type = var.instance_config.instance_type
  instance_name = var.instance_config.instance_name
  environment   = var.instance_config.environment

  anywhere     = "0.0.0.0/0"
  https_port   = 443
  tcp_protocol = "tcp"

  vpc_interface_endpoints = toset([
    "com.amazonaws.${var.region}.ssm",
    "com.amazonaws.${var.region}.ssmmessages",
    "com.amazonaws.${var.region}.ec2messages"
  ])
}
