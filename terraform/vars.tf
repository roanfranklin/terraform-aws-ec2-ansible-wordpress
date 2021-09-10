variable "region" {
  default = "us-east-1"
}

variable "amis" {
  default = {
    "us-east-1-ubuntu18" = "ami-0747bdcabd34c712a"
    "us-east-1-ubuntu20" = "ami-042e8287309f5df03"
  }
}

variable "instance_type" {
  default = {
    "micro" = "t2.micro"
  }
}
variable "ssh_key_private" {
  default = {
    "pri" = "~/.ssh/e5be39d5695ea15d98d0b199909cca0a"
  }
}