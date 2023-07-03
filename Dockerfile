# Use an official Wordpress runtime as a parent image
FROM wordpress:latest

# Set working directory in the container
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable for Wordpress to connect to Aurora
ENV WORDPRESS_DB_HOST=db-wordpress.cluster-chbrcmzpmf7a.us-east-1.rds.amazonaws.com
ENV WORDPRESS_DB_USER=wordpressuser
ENV WORDPRESS_DB_PASSWORD=wordpresspassword
ENV WORDPRESS_DB_NAME=wordpress

# Run Wordpress when the container launches
