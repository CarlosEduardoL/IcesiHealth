##########################################
## Resource to create a launch template ##
##########################################
resource "aws_launch_template" "launch-template-front" {
  image_id               = var.ami_id
  name                   = var.front_launch_template_name
  instance_type          = var.front_launch_template_instance_type
  vpc_security_group_ids = [
    aws_security_group.sg-front-instance.id]

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
      "Name"        = var.front_launch_template_instance_name
    }
  }
}

##############################################
## Resource to create an auto scaling group ##
##############################################
resource "aws_autoscaling_group" "front-tf-automation-asg" {
  max_size            = 1
  min_size            = 0
  desired_capacity    = 1
  vpc_zone_identifier = [
    aws_subnet.front_subnet_1.id,
    aws_subnet.front_subnet_2.id]
  target_group_arns   = [
    aws_lb_target_group.front-target-group.arn]

  launch_template {
    id      = aws_launch_template.launch-template-front.id
    version = "$Latest"
  }

  tags = [
    {
      responsible = var.tag_responsible
    }]
}

########################################
## Resource to create a target group  ##
########################################
resource "aws_lb_target_group" "front-target-group" {
  target_type = var.front_tg_target_type
  protocol    = var.front_tg_protocol
  port        = var.front_tg_port
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

########################################
## Resource to create a listener rule ##
########################################
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.front-tf-application-loag-balancer.arn
  protocol          = var.front_lbl_protocol
  port              = var.front_lbl_port

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front-target-group.arn
  }
}

#####################################################
## Resource to create an application load balancer ##
#####################################################
resource "aws_lb" "front-tf-application-loag-balancer" {
  name               = var.front_lb_name
  load_balancer_type = var.front_lb_type
  subnets            = [
    aws_subnet.front_subnet_1.id,
    aws_subnet.front_subnet_2.id]
  security_groups    = [
    aws_security_group.sg-load-balancer-front.id]

  tags = {
    "responsible" = var.tag_responsible
  }
}