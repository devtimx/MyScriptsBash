#!/bin/sh                                                                      

DATE=`date +'%d-%m-%Y'`
RESPALDO="$HOME/Respaldos/$DATE-schema-MY_DB.tar.gz"
cd $HOME/Respaldos/
pg_dump --schema-only DB > schemarespaldo1.dump
tar cvvfz "$RESPALDO" schemarespaldo1.dump
