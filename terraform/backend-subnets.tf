resource "aws_subnet" "back_subnet_1" {
  vpc_id     = var.icesihealth_2_vpc_id
  cidr_block = var.back_subnet_cidr_1

  tags = {
    responsible = var.tag_responsible
    Name        = "back_subnet_1"
  }
}

resource "aws_subnet" "back_subnet_2" {
  vpc_id     = var.icesihealth_2_vpc_id
  cidr_block = var.back_subnet_cidr_2

  tags = {
    responsible = var.tag_responsible
    Name        = "back_subnet_2"
  }
}