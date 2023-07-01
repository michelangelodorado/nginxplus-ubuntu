sudo apt update
sudo mkdir /etc/ssl/nginx
sudo cp nginx-repo.crt /etc/ssl/nginx/
sudo cp nginx-repo.key /etc/ssl/nginx/
sudo apt-get install apt-transport-https lsb-release ca-certificates wget gnupg2 ubuntu-keyring
wait
wget -qO - https://cs.nginx.com/static/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
wait
wget -qO - https://cs.nginx.com/static/keys/app-protect-security-updates.key | gpg --dearmor | sudo tee /usr/share/keyrings/app-protect-security-updates.gpg >/dev/null
wait
printf "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] https://pkgs.nginx.com/plus/ubuntu `lsb_release -cs` nginx-plus\n" | sudo tee /etc/apt/sources.list.d/nginx-plus.list
printf "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] https://pkgs.nginx.com/app-protect/ubuntu `lsb_release -cs` nginx-plus\n" | sudo tee /etc/apt/sources.list.d/nginx-app-protect.list
printf "deb [signed-by=/usr/share/keyrings/app-protect-security-updates.gpg] https://pkgs.nginx.com/app-protect-security-updates/ubuntu `lsb_release -cs` nginx-plus\n" | sudo tee -a /etc/apt/sources.list.d/nginx-app-protect.list
printf "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] https://pkgs.nginx.com/modsecurity/ubuntu `lsb_release -cs` nginx-plus\n" | sudo tee /etc/apt/sources.list.d/nginx-modsecurity.list
printf "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] https://pkgs.nginx.com/plus-quic/ubuntu `lsb_release -cs` nginx-plus\n" | sudo tee /etc/apt/sources.list.d/nginx-plus-quic.list
sudo wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90pkgs-nginx
wait
sudo apt-get update -y
sudo apt-get install -y nginx-plus app-protect app-protect-attack-signatures
wait
#sudo apt-get install nginx-plus nginx-plus-module-modsecurity
#sudo apt-get install nginx-plus-quic 
nginx -v
