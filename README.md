# Task2
###################################################

SOLUCION DE APP

- Ansible
- Docker
- Jenkins
- Sharedlib
- pipeline

PREREQUISITO

- terraform version: Terraform v0.12.2
- Sistema operativo: Centos 7.x
- Cuenta de servicio creado con archivo .json

-> Creacion de keyfile

- ssh-keygen -t rsa -f ~/.ssh/challenge -C challengeuser
- chmod 400 challenge
- ssh -i challenge challengeuser@ip

-> El archivo terraform.tfvars con el siguiente contenido el cual debe de reemplazado por nuevos valores para el despliegue

- project_name         = "nombre"
- gcp_credentials_path  = ".json"
- region               = "region"
- zone                 = "zona"
- ssh_username         = "nombre"
- ssh_pub_key_path     = "clave publica"
- ssh_priv_key_path     = "clave privada"

PASOS DE EJECUCION

1) git clone "repositorio"
2) cd task2
3) Cambio de datos en archivo: terraform.tfvars
4) sh deploy.sh --> Siendo:
- La tarea 1: CREAR el cluster.
- La tarea 2: DESTROY el cluster.
- La tarea 3: OUTPUT de la instalacion

4) Despliegue de Job
Ir a la url http://IP:8080
- Ejecutar el job, ya se encuentra creado y configurado para realizar la prueba.
