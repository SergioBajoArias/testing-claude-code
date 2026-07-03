#!/usr/bin/env bash
# PostToolUse hook: audita cada fichero editado/escribiendo en .claude/logs/audit.log
# Entrada (stdin, JSON de Claude Code):
#   { "tool_name": "...", "tool_input": { "file_path": "/ruta/al/fichero" } }
# Registro por linea: <nombre_fichero> | <dd/mm/yyyy HH:mm:ss> | <checksum>

set -euo pipefail

# Resuelve el directorio del proyecto (raiz del repo) de forma robusta.
# Claude Code arranca el hook con cwd =Directorio del proyecto.
PROJECT_DIR="$(pwd)"
LOG_DIR="$PROJECT_DIR/.claude/logs"
LOG_FILE="$LOG_DIR/audit.log"

mkdir -p "$LOG_DIR"

# Lee el JSON de stdin.
PAYLOAD="$(cat)"

# Extrae file_path del JSON sin depender de jq (usa grep/sed, portable en Git Bash).
FILE_PATH="$(printf '%s' "$PAYLOAD" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed -E 's/.*"file_path"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/' | head -n1)"

# Si no hay file_path, no es una edición de fichero: salir sin registrar.
if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Solo nombres absolutos/relolativos resolubles: si el fichero no existe, salir.
if [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

# Nombre del fichero (ruta tal como se edito).
FILE_NAME="$FILE_PATH"

# Fecha de modificacion en formato dd/mm/yyyy HH:mm:ss (hora local).
MOD_DATE="$(date '+%d/%m/%Y %H:%M:%S')"

# Checksum del fichero editado. Preferimos sha256; si no esta disponible, md5;
# si tampoco, usamos cksum como ultimo recurso.
if command -v sha256sum >/dev/null 2>&1; then
  CHECKSUM="$(sha256sum "$FILE_PATH" | awk '{print $1}')"
elif command -v md5sum >/dev/null 2>&1; then
  CHECKSUM="$(md5sum "$FILE_PATH" | awk '{print $1}')"
else
  CHECKSUM="$(cksum "$FILE_PATH" | awk '{print $1"-"$2}')"
fi

# En Windows (Git Bash), sha256sum/md5sum preceden el hash con una barra invertida
# (\) cuando la ruta contiene backslashes (marca de escape de la ruta). La quitamos.
CHECKSUM="${CHECKSUM#\\}"

# Anade la linea de auditoria al log.
printf '%s | %s | %s\n' "$FILE_NAME" "$MOD_DATE" "$CHECKSUM" >> "$LOG_FILE"

exit 0
