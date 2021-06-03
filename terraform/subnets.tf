# Create NAT
resource "aws_eip" "nat-eip" {
  vpc  = true
  tags = {
    responsible = var.tag_responsible
  }
}

resource "aws_nat_gateway" "terraform-nat" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.front_subnet_1.id
  tags          = {
    responsible = var.tag_responsible
  }
}


# Create public and private route tables
resource "aws_route_table" "private" {
  vpc_id = var.icesi_health_group_2_vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform-nat.id
  }
  tags   = {
    Name        = "Private",
    responsible = var.tag_responsible
  }
}

## Front public subnets ##
resource "aws_subnet" "front_subnet_1" {
  vpc_id                  = var.icesi_health_group_2_vpc_id
  cidr_block              = var.front_subnet_cidr_1
  map_public_ip_on_launch = true
  availability_zone_id    = "use2-az1"

  tags = {
    responsible = var.tag_responsible
    Name        = "front_subnet_1"
  }
}

resource "aws_subnet" "front_subnet_2" {
  vpc_id                  = var.icesi_health_group_2_vpc_id
  cidr_block              = var.front_subnet_cidr_2
  map_public_ip_on_launch = true
  availability_zone_id    = "use2-az2"

  tags = {
    responsible = var.tag_responsible
    Name        = "front_subnet_2"
  }
}



## Back private subnets ##
resource "aws_subnet" "back_subnet_1" {
  vpc_id                  = var.icesi_health_group_2_vpc_id
  cidr_block              = var.back_subnet_cidr_1
  availability_zone_id    = "use2-az1"
  map_public_ip_on_launch = false

  tags = {
    responsible = var.tag_responsible
    Name        = "back_subnet_1"
  }
}

resource "aws_subnet" "back_subnet_2" {
  vpc_id                  = var.icesi_health_group_2_vpc_id
  cidr_block              = var.back_subnet_cidr_2
  availability_zone_id    = "use2-az2"
  map_public_ip_on_launch = false

  tags = {
    responsible = var.tag_responsible
    Name        = "back_subnet_2"
  }
}

resource "aws_subnet" "db_subnet" {
  vpc_id               = var.icesi_health_group_2_vpc_id
  cidr_block           = var.db_subnet_cidr
  availability_zone_id = "use2-az1"
  map_public_ip_on_launch = false

  tags = {
    responsible = var.tag_responsible
    Name        = "db_subnet"
  }
}

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.back_subnet_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.back_subnet_2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-3" {
  subnet_id      = aws_subnet.db_subnet.id
  route_table_id = aws_route_table.private.id
}