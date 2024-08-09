#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx

# Backup the original default configuration
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# Create a new default configuration
cat <<EOL | sudo tee /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}

server {
    listen 3000;
    listen [::]:3000;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOL

# Create a simple HTML file
cat <<EOL | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>My Web Page</title>
</head>
<body>
    <h1>My name is Sohaib</h1>
</body>
</html>
EOL

sudo systemctl restart nginx
sudo systemctl enable nginx
