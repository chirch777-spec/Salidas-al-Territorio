#!/bin/bash
# Script para subir el proyecto a GitHub (ejecutar en Git Bash)

# 1. Asegurar que estamos en la carpeta del proyecto
cd "$(dirname "$0")"

# 2. Inicializar Git si no existe
if [ ! -d .git ]; then
  echo ">>> Inicializando repositorio Git..."
  git init
fi

# 3. Configurar usuario (solo si no está configurado)
if [ -z "$(git config user.name)" ]; then
  echo ""
  echo ">>> Primera vez: necesitas configurar tu nombre y email de GitHub."
  echo "    Ejemplo:"
  echo "    git config --global user.name \"Tu Nombre\""
  echo "    git config --global user.email \"tu@email.com\""
  echo ""
  read -p "Introduce tu nombre (ej: Cesar Hirch): " GIT_NAME
  read -p "Introduce tu email (el de tu cuenta GitHub): " GIT_EMAIL
  git config user.name "$GIT_NAME"
  git config user.email "$GIT_EMAIL"
fi

# 4. Añadir todos los archivos y hacer commit
echo ">>> Añadiendo archivos..."
git add .
echo ">>> Creando primer commit..."
git commit -m "Initial commit: App Salidas al Territorio" || true

# 5. Remoto y rama (corregido: 'origin' no 'origen')
if ! git remote get-url origin 2>/dev/null; then
  git remote add origin https://github.com/chirch777-spec/Salidas-al-Territorio.git
fi
git branch -M principal

# 6. Subir a GitHub
echo ""
echo ">>> Subiendo a GitHub (te pedirá usuario/contraseña o token)..."
git push -u origin principal

echo ""
echo ">>> Listo. Repositorio: https://github.com/chirch777-spec/Salidas-al-Territorio"
