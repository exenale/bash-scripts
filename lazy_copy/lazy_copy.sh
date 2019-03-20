#!/usr/bin/env bash
set -e


EVENT_TYPES=( "prod1" "prod2" )
BG_NAME=( "prod1" "prod2" )
BG_NAME2=( "PROD" "PROD2" )
FIELD=( "ID" "Sku" "Price" )
FILE_FIELD=( "id" "sku" "price" )
cd  ~/path/to/file

for ((i=0;i<${#EVENT_TYPES[@]};++i)); do
  
  for ((k=0;k<${#FIELD[@]};++k)); do
    echo "Bulding ${EVENT_TYPES[i]} file ${FILE_FIELD[k]}"
    cat originalt_missing_${FILE_FIELD[k]}_data.go \
      | sed s/'original'/${BG_NAME[i]}/g \
      | sed s/'original'/${EVENT_TYPES[i]}/g  \
      | sed s/"original${FIELD[k]}DataID"/"${BG_NAME2[i]}Missing${FIELD[k]}DataID"/g \
      | sed s/"original${FIELD[k]}Data"/"${BG_NAME2[i]}Missing${FIELD[k]}Data"/g \
      > ${BG_NAME[i]}_missing_${FILE_FIELD[k]}_data.go
  done
  
done