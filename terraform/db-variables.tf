variable "db_subnet_cidr" {
  type        = string
  description = "CIDR for the second private subnet"
  default     = "10.0.14.0/24"
}

##############################
## Security group variables ##
##############################

#########
## SSH ##
#########

variable "db_sg_description" {
  type    = string
  default = "Security group for the db instance"
}

variable "db_sg_ingress_ssh_description" {
  type    = string
  default = "Allowed SSH from anywhere"
}

variable "db_sg_ingress_ssh_port" {
  type        = number
  default     = 22
  description = "This is the port for the inbound rule that allowed SSH to the db instance"
}

variable "db_sg_ingress_ssh_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed SSH to the db instance"
}

variable "db_sg_ingress_ssh_cird" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "This is the list of CIDR"
}

########
## DB ##
########

variable "db_sg_ingress_app_description" {
  type        = string
  default     = "Allow traffic trough port 8089 from anywhere"
  description = "This is the description for the inbound rule that allowed traffic through the port 8080 from the internet to the db"
}

variable "db_sg_ingress_app_port" {
  type        = number
  default     = 5984
  description = "This is the port for the inbound rule that allowed traffic through the port 5984 from the vpc to the db"
}

variable "db_sg_ingress_app_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed traffic through the port 5984 from the vpc to the db"
}

variable "db_sg_ingress_app_cird" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "This is the list of CIDR"
}

variable "db_instance_type" {
  type    = string
  default = "t2.micro"
}