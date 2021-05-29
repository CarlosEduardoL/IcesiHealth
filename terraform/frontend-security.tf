resource "aws_security_group" "sg-front-instance" {
  description = var.front_sg_description
  vpc_id      = data.aws_vpc.automation-vpc.id

  ingress {
    description = var.front_sg_ingress_ssh_description
    from_port   = var.front_sg_ingress_ssh_port
    to_port     = var.front_sg_ingress_ssh_port
    protocol    = var.front_sg_ingress_ssh_protocol
    cidr_blocks = var.front_sg_ingress_ssh_cird
  }

  ingress {
    description = var.front_sg_ingress_app_description
    from_port   = var.front_sg_ingress_app_port
    to_port     = var.front_sg_ingress_app_port
    protocol    = var.front_sg_ingress_app_protocol
    cidr_blocks = var.front_sg_ingress_app_cird
  }

  egress {
    description = "Outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}

resource "aws_security_group" "sg-load-balancer-front" {
  description = var.frontend_lb_sg_description
  vpc_id      = data.aws_vpc.automation-vpc.id

  ingress {
    description = var.frontend_lb_sg_in_traffic_description
    from_port   = var.frontend_lb_sg_in_traffic_port
    to_port     = var.frontend_lb_sg_in_traffic_port
    protocol    = var.frontend_lb_sg_in_traffic_protocol
    cidr_blocks = var.frontend_lb_sg_in_traffic_cird
  }

  egress {
    description = "Outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}