#!/bin/bash
# Nombre: backup_tar.sh
# Crear copia empaquetadas de carpetas con la fecha del día, 
# y elimina las copias mas antiguas

# Inicia copia de la carpeta del Sistema

tar cvfz /backup/bk_sistemas_$(date +"%Y-%m-%d").tgz /home/samba/sistemas
tar cvfz /backup/bk_datos_$(date +"%Y-%m-%d").tgz /home/samba/datos
tar cvfz /backup/bk_archivos_$(date +"%Y-%m-%d").tgz /home/samba/archivos
tar cvfz /backup/bk_planillas_$(date +"%Y-%m-%d").tgz /home/documentos/planillas

# Elimina los copias comprimidas con mas de 20 días
find /backup/ -name \*.tgz -mtime +20 -print0 | xargs -rt0 rm -v
