# Utiliza una imagen de ejecución oficial de Wordpress como imagen base
FROM wordpress:latest

# Establece el directorio de trabajo en el contenedor
WORKDIR /var/www/html

# Copia el contenido del directorio actual al contenedor en /var/www/html
COPY . /var/www/html

# Expone el puerto 80 al mundo exterior del contenedor
EXPOSE 80

# Define variables de entorno para que Wordpress se conecte a Aurora
ENV WORDPRESS_DB_HOST=db-wordpress.cluster-chbrcmzpmf7a.us-east-1.rds.amazonaws.com
ENV WORDPRESS_DB_USER=wordpressuser
ENV WORDPRESS_DB_PASSWORD=wordpresspassword
ENV WORDPRESS_DB_NAME=wordpress
