resource "aws_security_group" "sg-back-instance" {
  description = var.back_sg_description
  vpc_id = data.aws_vpc.automation-vpc.id

  ingress {
    description = var.back_sg_ingress_ssh_description
    from_port = var.back_sg_ingress_ssh_port
    to_port = var.back_sg_ingress_ssh_port
    protocol = var.back_sg_ingress_ssh_protocol
    cidr_blocks = var.back_sg_ingress_ssh_cird
  }

  ingress {
    description = var.back_sg_ingress_app_description
    from_port = var.back_sg_ingress_app_port
    to_port = var.back_sg_ingress_app_port
    protocol = var.back_sg_ingress_app_protocol
    cidr_blocks = var.back_sg_ingress_app_cird
  }

  egress {
    description = "Outbound rule"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}

resource "aws_security_group" "sg-load-balancer-back" {
  description = var.backend_lb_sg_description
  vpc_id = data.aws_vpc.automation-vpc.id

  ingress {
    description = var.backend_lb_sg_in_traffic_description
    from_port = var.backend_lb_sg_in_traffic_port
    to_port = var.backend_lb_sg_in_traffic_port
    protocol = var.backend_lb_sg_in_traffic_protocol
    cidr_blocks = var.backend_lb_sg_in_traffic_cird
  }

  egress {
    description = "Outbound rule"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}