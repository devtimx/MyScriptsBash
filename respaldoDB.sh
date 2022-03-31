#!/bin/sh
clear
echo " *** SCRIPT PARA RESPALDAR DB *** "
echo " SELECCIONA UNA OPCIÓN:"
echo " 1.-DB 1"
echo " 2.-DB 2"
echo " 3.-Salir"
echo ""
read -p "OPCIÓN: " OPCION
DATE=`date +'%d-%m-%Y-%H'`
RESPALDO="$HOME/$DATE-RESPALDO.tar.bz2"
case $OPCION in
1)	
pg_dump DB01 > respaldo1.dump
tar -c respaldo_DB1.dump | bzip2 > "$RESPALDO"
exit;;
2)
pg_dump DB2 > respaldo1.dump
tar -c respaldo_DB2.dump | bzip2 > "$RESPALDO"
exit;;
3) exit;;
*) echo " OPCIÓN NO VÁLIDA "
exit 1;;
esac
exit 0
