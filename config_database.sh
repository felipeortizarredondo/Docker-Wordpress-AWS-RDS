#!/bin/bash

# Solicitar al usuario los valores de los parámetros
read -p "Ingrese el nombre del punto de enlace de la base de datos ejemplo: [db-wordpress.cluster-chbrcmzpmf7a.us-east-1.rds.amazonaws.com]" db_host

# Reemplazar los valores de las variables de entorno en el Dockerfile
sed -i "s/ENV WORDPRESS_DB_HOST=.*/ENV WORDPRESS_DB_HOST=${db_host}/" Dockerfile

echo "¡Dockerfile actualizado exitosamente!"
