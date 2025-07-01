#!/bin/bash

# validate-setup.sh
# Script para validar la configuración del toolkit

echo "🔍 Validando configuración del toolkit-agent-hub..."
echo ""

# Verificar estructura
echo "📁 Estructura del repositorio:"
for dir in rules prompts tools examples scripts; do
    if [ -d "$dir" ]; then
        echo "✅ /$dir"
    else
        echo "❌ /$dir [FALTANTE]"
    fi
done

echo ""
echo "📄 Archivos clave:"
if [ -f "Makefile" ]; then echo "✅ Makefile"; else echo "❌ Makefile [FALTANTE]"; fi
if [ -f "scripts/setup-vscode-symlinks.sh" ]; then echo "✅ setup-vscode-symlinks.sh"; else echo "❌ setup-vscode-symlinks.sh [FALTANTE]"; fi
if [ -f "README.md" ]; then echo "✅ README.md"; else echo "❌ README.md [FALTANTE]"; fi

echo ""
echo "🔧 Scripts ejecutables:"
if [ -x "scripts/setup-vscode-symlinks.sh" ]; then
    echo "✅ setup-vscode-symlinks.sh (ejecutable)"
else
    echo "❌ setup-vscode-symlinks.sh (no ejecutable)"
fi

echo ""
echo "📋 Reglas disponibles:"
ls -1 rules/*.instructions.md 2>/dev/null | while read file; do
    echo "✅ $(basename "$file")"
done

echo ""
echo "🎯 Comandos Make disponibles:"
make help | grep -E "^\s+[a-z-]+" | head -5

echo ""
echo "✅ Validación completada"
