# terraform-aws-ec2-ansible-wordpress
Terrraform ( AWS EC2 - Ansible - Wordpress )

### Initial
Diretório *terraform* para provisionar a intancia na AWS já instalando o Wordpress usando o Ansible.

### Variables

- Região: Norte da Virginha = us-east-1
- Instancia (tipo): t2.micro
- AMI:
  - ubuntu18
  - ubuntu20 (selecionada)

### Start
```
terraform init
terraform plan
terraform apply
```