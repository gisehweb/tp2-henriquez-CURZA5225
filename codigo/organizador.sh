#!/bin/bash
# Trabajo Práctico 2 - Automatización y Scripting
# Alumna: Gisella Henriquez - Legajo CURZA5225
# Script: organizador.sh
# Objetivo: Ordenar y clasificar archivos en carpetas según extensión

# Validar argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio_destino>"
    exit 1
fi

destino="$1"

if [ ! -d "$destino" ]; then
    echo "Error: el directorio '$destino' no existe o no es accesible."
    exit 1
fi

# Crear carpetas dentro del destino
mkdir -p "$destino/imagenes" "$destino/documentos" "$destino/comprimidos" "$destino/otros"

# Recorrer archivos en el destino
for archivo in "$destino"/*; do
    [ -f "$archivo" ] || continue
    nombre=$(basename "$archivo")

    case "$nombre" in
        *.jpg|*.png)
            mv "$archivo" "$destino/imagenes/$nombre"
            ;;
        *.pdf|*.txt|*.docx)
            mv "$archivo" "$destino/documentos/$nombre"
            ;;
        *.zip|*.tar.gz|*.rar)
            mv "$archivo" "$destino/comprimidos/$nombre"
            ;;
        *.old)
            nuevo="${nombre%.old}_backup"
            mv "$archivo" "$destino/otros/$nuevo"
            ;;
        *)
            mv "$archivo" "$destino/otros/$nombre"
            ;;
    esac
done

echo "Organización completada en '$destino'."
