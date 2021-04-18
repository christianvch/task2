#! /bin/bash
clear
i="y"
while [ $i = "y" ]
do
echo "1.CREATE"
echo "2.DESTROY"
echo "3.OUTPUT"
echo "Seleccione la tarea (1 al 3)"
read ch
case $ch in
    1)echo "CREATE"
      terraform init
      terraform plan
      terraform apply -auto-approve;;
    2)echo "DESTROY"
      terraform destroy -auto-approve;;
    3)echo "OUTPUT"
     terraform output;;
    *)echo "Tu selección es incorrecta";;

esac
echo "Quieres continuar (y/n)) ?"
read i
if [ $i != "y" ]
then
    exit
fi
done
