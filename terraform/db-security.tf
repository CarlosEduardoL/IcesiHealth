resource "aws_security_group" "sg-db" {
  description = var.db_sg_description
  vpc_id = data.aws_vpc.automation-vpc.id

  ingress {
    description = var.db_sg_ingress_ssh_description
    from_port = var.db_sg_ingress_ssh_port
    to_port = var.db_sg_ingress_ssh_port
    protocol = var.db_sg_ingress_ssh_protocol
    cidr_blocks = var.db_sg_ingress_ssh_cird
  }

  ingress {
    description = var.db_sg_ingress_app_description
    from_port = var.db_sg_ingress_app_port
    to_port = var.db_sg_ingress_app_port
    protocol = var.db_sg_ingress_app_protocol
    cidr_blocks = var.db_sg_ingress_app_cird
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