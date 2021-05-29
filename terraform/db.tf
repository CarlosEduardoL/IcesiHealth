resource "aws_instance" "db_instance" {
  ami           = var.ami_id
  instance_type = var.db_instance_type
  subnet_id     = aws_subnet.db_subnet.id
  key_name               = var.key_name
  user_data     = base64encode(templatefile("./db.sh"))

  vpc_security_group_ids = [
    aws_security_group.sg-db.id
  ]
  tags                   = {
    "responsible" = var.tag_responsible,
    Name = "DB-instance-icesi-health"
  }
}