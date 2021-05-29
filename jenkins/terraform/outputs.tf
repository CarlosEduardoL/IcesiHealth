resource "aws_instance" "jenkins_instance" {
  
  instance_type      = var.jenkins_instance_type
  ami          = var.jenkins_instance_ami 
  key_name = "estudiantes_automatizacion_2021_2"   
  vpc_security_group_ids = [ aws_security_group.security_jenkins_port.id ]
  subnet_id = "subnet-0c4d638d6183bde99"


  tags = {
      "responsible" = var.tag_responsible
      "Name" = "Jenkins group_2021_2"
  }
}
resource "aws_security_group" "security_jenkins_port" {
  name        = "security_jenkins_port"
  description = "security group for jenkins"
  vpc_id      = data.aws_vpc.automation-vpc.id
  
 ingress {
    from_port   = var.jenkins_sg_ingress_ssh_port
    to_port     = var.jenkins_sg_ingress_ssh_port
    protocol    = var.jenkins_sg_ingress_ssh_protocol
    cidr_blocks = var.jenkins_sg_ingress_ssh_cird
  }
  ingress {
    description = var.jenkins_sg_ingress_jenkins_description
    from_port   = var.jenkins_sg_ingress_jenkins_port
    to_port     = var.jenkins_sg_ingress_jenkins_port
    protocol    = var.jenkins_sg_ingress_jenkins_protocol
    cidr_blocks = var.jenkins_sg_ingress_jenkins_cird
  }

  egress {
    description = "Outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
      "responsible" = var.tag_responsible
  }

}
