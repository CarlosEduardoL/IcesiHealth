####################################################
## Define CIDR blocks for the two private subnets ##
####################################################

variable "back_subnet_cidr_1" {
  type        = string
  description = "CIDR for the first private subnet"
  default     = "10.0.12.0/24"
}

variable "back_subnet_cidr_2" {
  type        = string
  description = "CIDR for the second private subnet"
  default     = "10.0.13.0/24"
}

##############################
## Security group variables ##
##############################

#########
## SSH ##
#########

variable "back_sg_description" {
  type    = string
  default = "Security group for the back instance"
}

variable "back_sg_ingress_ssh_description" {
  type    = string
  default = "Allowed SSH from anywhere"
}

variable "back_sg_ingress_ssh_port" {
  type        = number
  default     = 22
  description = "This is the port for the inbound rule that allowed SSH to the backend instance"
}

variable "back_sg_ingress_ssh_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed SSH to the backend instance"
}

variable "back_sg_ingress_ssh_cird" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "This is the list of CIDR"
}

#########
## APP ##
#########

variable "back_sg_ingress_app_description" {
  type        = string
  default     = "Allow traffic trough port 8089 from anywhere"
  description = "This is the description for the inbound rule that allowed traffic through the port 8080 from the internet to the backend"
}

variable "back_sg_ingress_app_port" {
  type        = number
  default     = 8089
  description = "This is the port for the inbound rule that allowed traffic through the port 8089 from the internet to the backend"
}

variable "back_sg_ingress_app_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed traffic through the port 8089 from the internet to the backend"
}

variable "back_sg_ingress_app_cird" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "This is the list of CIDR"
}

############################################
## Security group Load Balancer Variables ##
############################################

variable "backend_lb_sg_description" {
  type    = string
  default = "backend load balancer security group"
}

variable "backend_lb_sg_in_traffic_description" {
  type        = string
  default     = "Allowed traffic from anywhere"
  description = "This is the description for the inbound rule that allowed traffic to the load balancer"
}

variable "backend_lb_sg_in_traffic_port" {
  type        = number
  default     = 8089
  description = "This is the port for the inbound rule that allowed traffic to the load balancer"
}

variable "backend_lb_sg_in_traffic_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed traffic to the load balancer"
}

variable "backend_lb_sg_in_traffic_cird" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "This is the list of CIDR"
}

###############################
## Launch Template Variables ##
###############################

variable "backend_launch_template_name" {
  type    = string
  default = "terraform-launch-template-back-automation"
}

variable "backend_launch_template_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "backend_launch_template_instance_name" {
  default = "tf-instance-back-icesi-health"
}

############################
## Target Group Variables ##
############################

variable "backend_tg_target_type" {
  type    = string
  default = "instance"
}

variable "backend_tg_protocol" {
  type    = string
  default = "HTTP"
}

variable "backend_tg_port" {
  type    = number
  default = 8089
}

#############################
## Load Balancer Variables ##
#############################

variable "backend_lb_name" {
  type    = string
  default = "front-tf-ALB-automation"
}

variable "backend_lb_type" {
  type    = string
  default = "application"
}

variable "backend_lbl_protocol" {
  type    = string
  default = "HTTP"
}

variable "backend_lbl_port" {
  type    = string
  default = 8089
}