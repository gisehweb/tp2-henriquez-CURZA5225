#!/bin/bash
# Trabajo Práctico 2 - Automatización y Scripting
# Alumna: Gisella Henriquez - Legajo CURZA5225
# Script: chequear_paginas.sh
# Objetivo: Verificar disponibilidad de sitios web vía HTTP

# Archivo de sitios por defecto
archivo="sitios_CURZA5225.txt"

# Si no hay argumentos, usar archivo
if [ $# -eq 0 ]; then
    if [ ! -f "$archivo" ]; then
        echo "Error: no se ingresaron URLs y no existe el archivo $archivo"
        exit 1
    fi
    urls=$(cat "$archivo")
else
    urls="$@"
fi

# Crear carpeta logs si no existe
mkdir -p ../logs
log="../logs/chequeo_CURZA5225.log"

# Limpiar log previo
> "$log"

# Colores
verde="\e[32m"
amarillo="\e[33m"
rojo="\e[31m"
reset="\e[0m"

# Recorrer URLs
for url in $urls; do
    codigo=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    if [[ $codigo == 200 ]]; then
        echo -e "${verde}$url → $codigo${reset}"
    elif [[ $codigo =~ ^3 ]]; then
        echo -e "${amarillo}$url → $codigo${reset}"
    elif [[ $codigo =~ ^4 || $codigo =~ ^5 ]]; then
        echo -e "${rojo}$url → $codigo${reset}"
    else
        echo "$url → $codigo"
    fi
    echo "$url → $codigo" >> "$log"
done

echo "📌 Reporte guardado en $log"
