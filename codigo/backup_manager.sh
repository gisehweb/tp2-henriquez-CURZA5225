#!/bin/bash
# Trabajo Práctico 2 - Automatización y Scripting
# Alumna: Gisella Henriquez - Legajo CURZA5225
# Script: backup_manager.sh
# Objetivo: Respaldar archivos modificados en últimas 24h con lockfile

LOCKDIR="/var/lock/backup_CURZA5225.lock"
TMPDIR="/tmp/backup_CURZA5225"
LOGDIR="../logs"
FECHA=$(date +"%Y%m%d_%H%M%S")
TARFILE="$LOGDIR/backup_CURZA5225_$FECHA.tar.gz"

# Crear lockfile
if ! mkdir "$LOCKDIR" 2>/dev/null; then
    echo "❌ Error: ya existe una instancia en ejecución."
    exit 9
fi

# Asegurar eliminación del lockfile al salir
trap 'rmdir "$LOCKDIR"' EXIT

# Pausa de 30 segundos para comprobar lockfile y error 9
echo "⏳ Lockfile creado en $LOCKDIR. Esperando 30 segundos..."
sleep 30

# Crear directorio temporal
rm -rf "$TMPDIR"
mkdir -p "$TMPDIR"

# Buscar archivos modificados en últimas 24h dentro de codigo/
cd "$(dirname "$0")" || exit 1
find . -mtime -1 -type f -exec cp --parents {} "$TMPDIR" \;

# Empaquetar y comprimir
mkdir -p "$LOGDIR"
tar -czf "$TARFILE" -C /tmp "backup_CURZA5225"

echo "📌 Backup generado en $TARFILE"

