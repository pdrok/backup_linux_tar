# Backup en Linux con Tar
Copia de archivo o directorios en Linux con tar y elimina las copias antiguas.

## Como utilizar

Creamos una carpeta con el nombre script en el directorio root

```
mkdir /root/script
```

Creamos un  archivo [backup_tar.sh](backup_tar.sh), modificamos de acuerdo a las necesidades

```
#!/bin/bash

# Inicia copia de la carpeta del Sistema
tar cvfz /backup/bk_sistemas_$(date +"%Y-%m-%d").tgz /home/samba/Sistemas

# Elimina los copias comprimidas con mas de 20 días
find /backup/ -name \*.tgz -mtime +20 -print0 | xargs -rt0 rm -v
```
Le damos permiso de ejecucion `chmod +x /root/scripts/tar_backup.sh`


agregamos las siguientes linea al `/etc/crontab` para que este se ejecute todos los días a las 19:30

```
# Copia carpeta tar del sistema a las 19:30
30 19 	* * *   root	/root/scripts/tar_backup.sh

```

*Si se utiliza nano para editar el crontab hay que convertirlo a formato unix con `dos2unix /etc/crontab`, caso se utilize vi ó vim no es necesario.*
