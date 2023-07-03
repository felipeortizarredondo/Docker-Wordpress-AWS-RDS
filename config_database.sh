#!/bin/bash

# Solicitar al usuario los valores de los parámetros
read -p "Ingrese el host de la base de datos [db-wordpress.cluster-chbrcmzpmf7a.us-east-1.rds.amazonaws.com]: " db_host
db_host=${db_host:-db-wordpress.cluster-chbrcmzpmf7a.us-east-1.rds.amazonaws.com}

read -p "Ingrese el usuario de la base de datos [wordpressuser]: " db_user
db_user=${db_user:-wordpressuser}

read -p "Ingrese la contraseña de la base de datos [wordpresspassword]: " db_password
db_password=${db_password:-wordpresspassword}

read -p "Ingrese el nombre de la base de datos [wordpress]: " db_name
db_name=${db_name:-wordpress}

# Reemplazar los valores de las variables de entorno en el Dockerfile
sed -i "s/ENV WORDPRESS_DB_HOST=.*/ENV WORDPRESS_DB_HOST=${db_host}/" Dockerfile
sed -i "s/ENV WORDPRESS_DB_USER=.*/ENV WORDPRESS_DB_USER=${db_user}/" Dockerfile
sed -i "s/ENV WORDPRESS_DB_PASSWORD=.*/ENV WORDPRESS_DB_PASSWORD=${db_password}/" Dockerfile
sed -i "s/ENV WORDPRESS_DB_NAME=.*/ENV WORDPRESS_DB_NAME=${db_name}/" Dockerfile

echo "¡Dockerfile actualizado exitosamente!"
