provider "aws" {
  region = var.region
}

resource "aws_instance" "maquina_wp" {
  ami = "${var.amis["us-east-1-ubuntu18"]}"
  instance_type = "${var.instance_type.micro}"
  key_name = "didox-terraform-key"
  tags = {
    Name = "maquina_ansible_com_worpress"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_geral.id}"]
}


resource "null_resource" "before" {
}

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 60"
  }
  triggers = {
    "before" = "${null_resource.before.id}"
  }
}

resource "null_resource" "after" {
  depends_on = ["null_resource.delay"]

  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.maquina_wp.public_dns},  ../ansible/provisionar.yml -u ubuntu  --private-key ${var.ssh_key_private.pri}" 
  }
}

# para liberar a internet interna da maquina, colocar regra do outbound "Outbound rules" como "All traffic"
# ssh -i ~/.ssh/terraform-aws ubuntu@ec2-54-234-131-240.compute-1.amazonaws.com 
# conferir 
