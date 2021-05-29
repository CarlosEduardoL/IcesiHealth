variable "aws_region"{
    type = string
    default = "us-east-2"
    description = "Designed AWS region to deploy"
}

variable "icesihealt_2_vpc_id" {
  type = string
  default = "vpc-025ce59ecf7aed804"
  description = "ID for the deploy VPC on the project"
}

variable "public_subnet_id_2c" {
  type = string
  default = "subnet-0c4d638d6183bde99"
}

variable "public_subnet_id_2a" {
  type = string
  default = "subnet-02018063ae6cb01aa"
}
variable "jenkins_sg_ingress_ssh_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed SSH to the ec2 instance"
}

variable "jenkins_sg_ingress_ssh_description" {
  type    = string
  default = "Allowed SSH from anywhere"
}

variable "jenkins_sg_ingress_ssh_port" {
  type        = number
  default     = 22
  description = "This is the port for the inbound rule that allowed SSH to the ec2 instance"
}
variable "jenkins_sg_ingress_ssh_cird" {
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
  description = "This is the list of CIDR"
}

variable "jenkins_sg_ingress_jenkins_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed jenkins to the ec2 instance"
}

variable "jenkins_sg_ingress_jenkins_description" {
  type    = string
  default = "Allowed jenkins from anywhere"
}

variable "jenkins_sg_ingress_jenkins_port" {
  type        = number
  default     = 8080
  description = "This is the port for the inbound rule that allowed jenkins to the ec2 instance"
}
variable "jenkins_sg_ingress_jenkins_cird" {
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
  description = "This is the list of CIDR"
}

variable "tag_responsible" {
  type    = string
  default = "estudiantes_automatizacion_2021_2"
  description = "Tag of mandator use by buisness rules"
}
