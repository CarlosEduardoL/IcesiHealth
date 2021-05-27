variable "jenkins_instance_type" {
  type = string
  default = "t2.micro"
}

variable "jenkins_instance_name" {
  type = string
  default = "Ec2_Jenkins_instance"

}
variable "jenkins_instance_ami" {
  type = string
  default = "ami-08962a4068733a2b6"  
}