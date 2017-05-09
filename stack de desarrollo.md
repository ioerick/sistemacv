
# **LAPP**
[Instalar Apache + PHP]
>sudo aptitude update
>sudo apt-get install apache2 php5 libapache2-mod-php5

[Instalar PostgreSQL]
>sudo apt-get install postgresql php5-pgsql libapache2-mod-auth-pgsql

[Cambiar la contraseña de 'postgres']
>sudo su postgres -c psql
>ALTER USER postgres WITH PASSWORD '<nueva_contraseña>';
>sudo passwd -d postgres
>sudo su postgres -c passwd

[Reiniciar postgresql]
>sudo /etc/init.d/postgresql restart
>su – postgres

[Instalar phpPgAdmin]
>sudo apt-get install phpPgAdmin

[Crear enlace]
>sudo ln -s /usr/share/phppgadmin /var/www/phppgadmin

[Editar apache2.conf]
>sudo nano /etc/apache2/conf.d/phppgadmin

[Remplazar las lineas]
># allow from all
>allow from all

[Reiniciar apache2]
>sudo /etc/init.d/apache2 restart
