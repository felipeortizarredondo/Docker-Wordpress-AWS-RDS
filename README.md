# Docker-Wordpress-AWS-RDS
Conectarmos un wordpress a traves de Docker y las plataformas que se utilizara es un EC2 de AWS y la base de datos creado por RDS AURORA

# Docker WordPress con Amazon RDS Aurora

Este github proporciona instrucciones sobre cómo implementar WordPress en un contenedor Docker que se conecta a una base de datos en Amazon RDS Aurora.

## Prerrequisitos

- Este docker funciona con un entorno linux distribución ubuntu-server
- Docker instalado en tu instancia EC2 de AWS.
- Acceso a Amazon RDS con una instancia Aurora funcionando.

## Descarga del contenedor Docker

Puedes descargar el contenedor Docker utilizando "git clone":

  ```bash
  git clone https://github.com/felipeortizarredondo/Docker-Wordpress-AWS-RDS`
  ```

## Creación de la base de datos Aurora y conexión con EC2

Para crear una base de datos Aurora (compatible con MySQL) en Amazon RDS y conectarla a una instancia EC2, sigue los pasos siguientes:

1. Ve a Amazon RDS en la consola de AWS y haz click en "Crear base de datos".
2. Selecciona "Creación estándar".
3. En "Tipo de motor", selecciona "Aurora (compatible con MySQL)".
4. En "Plantillas", elige "Desarrollo y pruebas".
5. En "Identificador del clúster de base de datos", escribe un nombre de tu elección.
6. En "Credenciales", elige el "nombre de usuario maestro". Para fines de prueba, puedes usar "admin".
7. Para la "Contraseña maestra", elige una contraseña de al menos 8 caracteres. Esta se utilizará para conectarse a la base de datos más adelante.
8. En "Almacenamiento del clúster", selecciona "Aurora estándar" para mantener bajos los costos.
9. En "Configuración de la instancia", selecciona "Clases con ráfagas" y elige la que consideres apropiada. Para una base de datos pequeña, puedes usar la opción "db.t2.small".
10. En "Disponibilidad y durabilidad", selecciona "No crear una réplica de Aurora" si estás simplemente probando.
11. En "Conectividad", selecciona "Conectarse a un recurso informático de EC2". Esto establecerá una conexión interna con tu instancia EC2.
12. En "Autenticación de bases de datos", selecciona "Autenticación con contraseña".
13. Haz click en "Crear base de datos".

## Instalación de MySQL en EC2

Para instalar MySQL en tu instancia EC2, ejecuta los siguientes comandos:

```bash
sudo apt install software-properties-common apt-transport-https -y
```
```bash
sudo add-apt-repository ppa:ondrej/php -y
```
```bash
sudo apt-get update
```
```bash
sudo apt-get install mariadb-server mariadb-client
```

## Conexión a la base de datos y configuración de permisos

Para conectarte a la base de datos Aurora en RDS, primero necesitas conectarte a tu instancia EC2. Desde allí, ejecuta el siguiente comando para conectarte a tu base de datos:

  ```bash
  mysql -h nombre_del_punto_de_enlace -P 3306 -u admin -p
  ```

`NOTA:`
(Donde dice "nombre_del_punto_de_enlace" cambialo por el URL Tipo Instancia de Escritor)
Para ver ese dato debes ubicarte al servicio de Amazon RDS, Base de datos y veras tu base creada y seleccionala y veras mas abajo el URL que te indico en el paso anterior


Una vez conectado, puedes crear un nuevo usuario en la base de datos y otorgarle todos los privilegios con los siguientes comandos SQL:

```bash
CREATE USER 'wordpressuser'@'%' IDENTIFIED BY 'wordpresspassword';
```
```bash
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'%';
```
```bash
FLUSH PRIVILEGES;
```

## Verificación de la conexión

Para verificar que la conexión a la base de datos se ha establecido correctamente, puedes ejecutar el siguiente comando SQL desde la misma consola MySQL:

  ```bash
  SHOW DATABASES;
  ```
Para salir del terminal solo pon este comando

  ```bash
  QUIT;
  ```

Deberías ver la base de datos `wordpress` en la lista.

## Configurar conexión a la base de datos editando los parametros del dockerfile con este script

Debes posisiocionarte adentro del directorio "Docker-Wordpress-AWS-RDS" descargado previamente y ejecuta este comando para editar lel parametro para ajustar el `Nombre del punto de enlace` Copia tu URL de punto de enlace y pegalo donde indica el `script`

  ```bash
  sh config_database.sh
  ```

# Iniciar Docker WordPress

Este repositorio contiene un archivo Dockerfile y los archivos necesarios para ejecutar WordPress en un contenedor Docker.

## Prerrequisitos

- Docker instalado en tu máquina.

## Instrucciones de uso

Sigue los pasos a continuación para ejecutar el contenedor Docker de WordPress:

1. ubicate dentro del directorio "Docker-Wordpress-AWS-RDS" descargado
1. Construye la imagen del contenedor Docker utilizando el siguiente comando:

  ```bash
  docker build -t Docker-Wordpress-AWS-RDS .
  ```


