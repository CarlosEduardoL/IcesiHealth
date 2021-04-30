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
  description = "This is the port for the inbound rule that allowed traffic through the port 8080 from the internet to the backend"
}

variable "back_sg_ingress_app_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed traffic through the port 8080 from the internet to the backend"
}

variable "front_sg_ingress_app_cird" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "This is the list of CIDR"
}