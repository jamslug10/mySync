#!/bin/bash
# Show the menu
echo
echo
echo "**** mySync - a Dropbox and Google Drive rclone wrapper ****"
echo
echo "Opciones de sincronización:"
echo
echo "Sincronizar los cambios locales en Dropbox [1]"
echo "Sincronizar los cambios en Dropbox en el portátil [2]"
echo "Sincronizar los cambios locales en GDrive [3]"
echo "Sincronizar los cambios en GDrive en el portátil [4]"
echo
read -p "¿Qué tipo de sincronización desea realizar? (1 - 4): " syncType

case $syncType in
  1)
    rclone sync /home/jamslug/Documents/Dropbox/ Dropbox: --dry-run
    read -p "¿desea proceder con la sincronización? (Si[1]/No[0]): " confirmation
    if [[ $confirmation = 1 ]]; then
      rclone sync /home/jamslug/Documents/Dropbox/ Dropbox:
    else
      echo "operación cancelada por el usuario"
    fi
    ;;
  2)
    rclone sync Dropbox: /home/jamslug/Documents/Dropbox/ --dry-run
    read -p "¿desea proceder con la sincronización? (Si[1]/No[0]): " confirmation
    if [[ $confirmation = 1 ]]; then
      rclone sync Dropbox: /home/jamslug/Documents/Dropbox/
    else
      echo "operación cancelada por el usuario"
    fi
    ;;
  3)
    rclone sync /home/jamslug/Documents/GDrive/ Drive: --dry-run
    read -p "¿desea proceder con la sincronización? (Si[1]/No[0]): " confirmation
    if [[ $confirmation = 1 ]]; then
      rclone sync /home/jamslug/Documents/GDrive/ Drive:
    else
      echo "operación cancelada por el usuario"
    fi
    ;;
  4)
    rclone sync Drive: /home/jamslug/Documents/GDrive/ --dry-run
    read -p "¿desea proceder con la sincronización? (Si[1]/No[0]): " confirmation
    if [[ $confirmation = 1 ]]; then
      rclone sync Drive: /home/jamslug/Documents/GDrive/
    else
      echo "operación cancelada por el usuario"
    fi
    ;;
esac
echo
fortune
echo
