variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "Designed AWS region to deploy"
}

variable "icesihealth_2_vpc_id" {
  type        = string
  default     = "vpc-025ce59ecf7aed804"
  description = "ID for the deploy VPC on the project"
}

variable "tag_responsible" {
  type        = string
  default     = "estudiantes_automatizacion_2021_2"
  description = "Tag of mandatory use by business rules (icesi)"
}

variable "front_subnet_1" {
  type    = string
  default = "subnet-0c4d638d6183bde99"
}

variable "public_subnet_id_2a" {
  type    = string
  default = "subnet-02018063ae6cb01aa"
}

variable "ami_id" {
  type    = string
  default = "ami-08962a4068733a2b6"
}