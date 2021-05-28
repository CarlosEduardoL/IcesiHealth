##################
# Provider setup # 
terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
##################

## Use existing VPC
data "aws_vpc" "automation-vpc" {
  id = var.icesi_health_group_2_vpc_id
}