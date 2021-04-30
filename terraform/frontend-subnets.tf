resource "aws_subnet" "front_subnet_1" {
  vpc_id = var.icesihealth_2_vpc_id
  cidr_block = var.front_subnet_cidr_1
  map_public_ip_on_launch = true

  tags = {
    responsible = var.tag_responsible
    Name = "front_subnet_1"
  }
}

resource "aws_subnet" "front_subnet_2" {
  vpc_id = var.icesihealth_2_vpc_id
  cidr_block = var.front_subnet_cidr_2
  map_public_ip_on_launch = true

  tags = {
    responsible = var.tag_responsible
    Name = "front_subnet_2"
  }
}