
WSL
cd /mnt/d/Genesis/Ansible
ansible --version

#copiar archivo pem
cp /mnt/d/Genesis/Terraform/huaweicloud-terraform/examples/basic-app-bd/keys/id_rsa_ecs.pem ~/.ssh/id_rsa_ecs.pem
cp /mnt/d/Genesis/Terraform/huaweicloud-terraform/examples/basic-app-dew/keys/id_rsa_ecs.pem ~/.ssh/id_rsa_ecs.pem
chmod 600 ~/.ssh/id_rsa_ecs.pem

#copiar dump
cp /mnt/d/Genesis/Ansible/files/db/cliente-dump.sql ~/

#copiar aplicacion
cp /mnt/d/Genesis/Demo/cliente-crud-bd/target/*.jar files/app/
cp /mnt/d/Genesis/Apps/app-basic-java-dew/target/*.jar files/app/

#copiar static-web
cp /mnt/d/Genesis/Demo/static-front-end/*.* files/static-web/

ssh-keygen -f /home/alejandro/.ssh/known_hosts -R '110.238.69.203'

ansible -i inventory/hosts all -m ping
ansible-inventory -i inventory/hosts --list

ansible-playbook -i inventory/hosts playbooks/restore-db.yml

ansible-playbook -i inventory/hosts playbooks/deploy-java.yml
ansible-playbook -i inventory/hosts playbooks/redeploy-java.yml
ansible-playbook -i inventory/hosts playbooks/restart-java.yml
ansible-playbook -i inventory/hosts playbooks/deploy-static-web.yml

obsutil version:5.4.11, obssdk version:2.2.12

http://182.160.24.235:8080/clientes
http://110.238.69.203:8080/dew-info


https://obs-front-end-alejandro.obs.la-south-2.myhuaweicloud.com/index.html
http://obs-front-end-alejandro.obs-website.la-south-2.myhuaweicloud.com/index.html
obs-front-end-alejandro.obs-website.la-south-2.myhuaweicloud.com

http://obs-front-end-alejandro.obs-website.la-south-2.myhuaweicloud.com/

#ver log del servidor 
ssh -i ~/.ssh/id_rsa_ecs.pem root@110.238.69.203
systemctl status mi-servicio-java  
sudo journalctl -u mi-servicio-java.service --since "1 minutes ago"



