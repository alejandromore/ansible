
WSL
cd /mnt/d/Genesis/Ansible
ansible --version

#copiar archivo pem
ls -l ~/.ssh/
cp /mnt/d/Genesis/Terraform/huaweicloud-terraform/examples/app-obs-dew-ecs-rds/keys/*.pem ~/.ssh/
cp ./files/keys/*.pem ~/.ssh/
chmod 600 ~/.ssh/*.pem
true > ~/.ssh/known_hosts

#copiar dump
cp /mnt/d/Genesis/Ansible/files/db/cliente-dump.sql ~/

#copiar aplicacion
cp /mnt/d/Genesis/Apps/app-basic-java-dew-rds/target/*.jar files/app/

#copiar static-web
cp /mnt/d/Genesis/Demo/static-front-end/*.* files/static-web/

export ANSIBLE_HOST_KEY_CHECKING=False
ansible -i inventory/hosts all -m ping

#agrega tu llave al agente SSH en tu laptop
ssh-agent bash
ssh-add -l
ssh-add ~/.ssh/ky-ecs-private.pem
ssh-add ~/.ssh/id_rsa_ecs.pem
#conecta al servidor bastion
ssh root@110.238.65.22
#conecta usando -A para forward del agente:
ssh -A root@101.44.13.58 -t ssh root@10.1.75.68

ssh -i ~/.ssh/id_rsa_ecs.pem root@110.238.65.22

mkdir ~/java-debs
cd ~/java-debs
apt download openjdk-17-jdk curl net-tools
apt download openjdk-17-jdk openjdk-17-jre openjdk-17-jdk-headless curl net-tools
apt download openjdk-17-jdk-headless openjdk-17-jre-headless curl net-tools

#ejecucion de playbooks
ansible-playbook -i inventory/hosts playbooks/restore-db.yml
ansible-playbook -i inventory/hosts playbooks/deploy-java.yml
ansible-playbook -i inventory/hosts playbooks/redeploy-java.yml
ansible-playbook -i inventory/hosts playbooks/restart-java.yml
ansible-playbook -i inventory/hosts playbooks/deploy-static-web.yml

obsutil version:5.4.11, obssdk version:2.2.12

http://182.160.24.235:8080/clientes
http://110.238.69.203:8080/dew-info
http:/110.238.69.203:8080/healthCheck
curl http:/110.238.69.203:8080/healthCheck
curl http:/localhost:8080/dew-info
curl http:/localhost:8080/healthCheck
curl http:/localhost:8080/clientes

curl http://101.44.13.58:8080/healthCheck
curl http://101.44.13.58:8080/clientes


https://obs-front-end-alejandro.obs.la-south-2.myhuaweicloud.com/index.html
http://obs-front-end-alejandro.obs-website.la-south-2.myhuaweicloud.com/index.html
obs-front-end-alejandro.obs-website.la-south-2.myhuaweicloud.com

http://obs-front-end-alejandro.obs-website.la-south-2.myhuaweicloud.com/

#ver log del servidor 
ssh -i ~/.ssh/id_rsa_ecs.pem root@110.238.69.203
systemctl status mi-servicio-java  
sudo journalctl -u mi-servicio-java.service --since "1 minutes ago"



