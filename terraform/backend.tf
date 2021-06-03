##########################################
## Resource to create a launch template ##
##########################################
resource "aws_launch_template" "launch-template-back" {
  image_id               = var.ami_id
  name                   = var.backend_launch_template_name
  instance_type          = var.backend_launch_template_instance_type
  key_name               = var.key_name
  user_data              = base64encode(templatefile("./back.sh", {
    db_host = aws_instance.db_instance.private_ip, tag = "latest"
  }))
  vpc_security_group_ids = [
    aws_security_group.sg-back-instance.id]

  tags = {
    "responsible" = var.tag_responsible
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      "responsible" = var.tag_responsible
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      "responsible" = var.tag_responsible,
      "Name"        = var.backend_launch_template_instance_name,
      "Type"        = "Back"
    }
  }
}

########################################
## Resource to create a target group  ##
########################################
resource "aws_lb_target_group" "back-target-group" {
  target_type = var.backend_tg_target_type
  protocol    = var.backend_tg_protocol
  port        = var.backend_tg_port
  vpc_id      = data.aws_vpc.automation-vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}

##############################################
## Resource to create an auto scaling group ##
##############################################
resource "aws_autoscaling_group" "back-tf-automation-asg" {
  max_size            = 1
  min_size            = 0
  desired_capacity    = 1
  vpc_zone_identifier = [
    aws_subnet.back_subnet_1.id,
    aws_subnet.back_subnet_2.id]
  target_group_arns   = [
    aws_lb_target_group.back-target-group.arn]

  launch_template {
    id      = aws_launch_template.launch-template-back.id
    version = "$Latest"
  }

  tags = [
    {
      responsible = var.tag_responsible
    }]
}

########################################
## Resource to create a listener rule ##
########################################
resource "aws_lb_listener" "http_back" {
  load_balancer_arn = aws_lb.back-tf-application-load-balancer.arn
  protocol          = var.backend_lbl_protocol
  port              = var.backend_lbl_port

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.back-target-group.arn
  }
}

#####################################################
## Resource to create an application load balancer ##
#####################################################
resource "aws_lb" "back-tf-application-load-balancer" {
  name               = var.backend_lb_name
  load_balancer_type = var.backend_lb_type
  subnets            = [
    aws_subnet.back_subnet_1.id,
    aws_subnet.back_subnet_2.id]
  security_groups    = [
    aws_security_group.sg-load-balancer-back.id]

  tags = {
    "responsible" = var.tag_responsible
  }
}