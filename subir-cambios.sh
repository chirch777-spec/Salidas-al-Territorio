#!/bin/bash
# Subir últimos cambios al repositorio remoto (ejecutar en Git Bash)
cd "$(dirname "$0")"

git add .
git status
echo ""
read -p "Mensaje del commit (ej: Actualizar interfaz): " MSG
[ -n "$MSG" ] && git commit -m "$MSG" || git commit -m "Actualizar proyecto"
git push origin principal
echo ""
echo ">>> Cambios subidos a GitHub."
