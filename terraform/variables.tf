variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "Designed AWS region to deploy"
}

variable "icesi_health_group_2_vpc_id" {
  type        = string
  default     = "vpc-025ce59ecf7aed804"
  description = "ID for the deploy VPC on the project"
}

variable "tag_responsible" {
  type        = string
  default     = "estudiantes_automatizacion_2021_2"
  description = "Tag of mandatory use by business rules (icesi)"
}

variable "ami_id" {
  type    = string
  default = "ami-00399ec92321828f5"
}

variable "key_name" {
  type    = string
  default = "estudiantes_automatizacion_2021_2"
}