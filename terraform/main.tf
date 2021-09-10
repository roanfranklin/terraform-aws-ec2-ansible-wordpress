terraform {
  required_version = ">= 0.13"
  required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 3.0"
   }
 }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "maquina_wp" {
  ami = "${var.amis["us-east-1-ubuntu18"]}"
  instance_type = "${var.instance_type.micro}"
  key_name = "myaws-remf-key"
  tags = {
    Name = "maquina_ansible_com_worpress"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_geral.id}"]

  provisioner "local-exec" {
    command = "ansible-playbook -i ${self.public_dns}, ../ansible/provisionar.yml -u ubuntu --private-key ${var.ssh_key_private.pri} --ssh-common-args='-o StrictHostKeyChecking=no'"
  }
}
