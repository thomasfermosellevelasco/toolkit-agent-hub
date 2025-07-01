#!/bin/bash

# setup-vscode-symlinks.sh
# Script para configurar enlaces simbólicos entre toolkit-agent-hub y VS Code
# Autor: toolkit-agent-hub
# Fecha: 2025-06-30

set -e  # Salir en caso de error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuración
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VSCODE_PROMPTS_DIR="$HOME/Library/Application Support/Code/User/prompts"
BACKUP_DIR="$VSCODE_PROMPTS_DIR.backup-$(date +%Y%m%d_%H%M%S)"

# Función para mostrar ayuda
show_help() {
    echo -e "${BLUE}🔗 Setup de Enlaces Simbólicos para VS Code${NC}"
    echo ""
    echo "Uso: $0 [opciones]"
    echo ""
    echo "Opciones:"
    echo "  -h, --help     Mostrar esta ayuda"
    echo "  -f, --force    Forzar creación sin confirmación"
    echo "  -d, --dry-run  Mostrar qué se haría sin ejecutar"
    echo ""
    echo "Este script crea enlaces simbólicos desde VS Code hacia toolkit-agent-hub"
    echo "para mantener las instrucciones sincronizadas automáticamente."
}

# Función para verificar prerequisitos
check_prerequisites() {
    echo -e "${BLUE}🔍 Verificando prerequisitos...${NC}"
    
    # Verificar que estamos en el directorio correcto
    if [[ ! -f "$TOOLKIT_DIR/README.md" ]]; then
        echo -e "${RED}❌ Error: No se detectó el repositorio toolkit-agent-hub${NC}"
        echo "   Directorio actual: $TOOLKIT_DIR"
        exit 1
    fi
    
    # Verificar que existe la carpeta rules
    if [[ ! -d "$TOOLKIT_DIR/rules" ]]; then
        echo -e "${RED}❌ Error: No se encontró la carpeta 'rules' en el toolkit${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ Prerequisitos verificados${NC}"
}

# Función para crear backup
create_backup() {
    if [[ -d "$VSCODE_PROMPTS_DIR" && "$(ls -A "$VSCODE_PROMPTS_DIR" 2>/dev/null)" ]]; then
        echo -e "${YELLOW}📦 Creando backup en: $BACKUP_DIR${NC}"
        cp -r "$VSCODE_PROMPTS_DIR" "$BACKUP_DIR"
        echo -e "${GREEN}✅ Backup creado exitosamente${NC}"
    else
        echo -e "${YELLOW}📝 No hay configuración previa para respaldar${NC}"
    fi
}

# Función para crear enlaces simbólicos
create_symlinks() {
    echo -e "${BLUE}🔗 Creando enlaces simbólicos...${NC}"
    
    mkdir -p "$VSCODE_PROMPTS_DIR"
    
    local src_folders=("rules" "prompts" "tools")
    local created=0
    local skipped=0
    
    for src in "${src_folders[@]}"; do
        find "$TOOLKIT_DIR/$src" -type f \( -name "*.md" -o -name "*.json" -o -name "*.jsonc" \) 2>/dev/null | while IFS= read -r file; do
            local rel_path="${file#$TOOLKIT_DIR/}"
            local prefix="${rel_path%%/*}"
            local base="${rel_path##*/}"
            # Excluir README.md
            if [[ "$base" =~ ^README\.md$ ]]; then
                continue
            fi
            local dest_name="${prefix}_${base}"
            local dest_path="$VSCODE_PROMPTS_DIR/$dest_name"
            if [[ -f "$file" ]]; then
                if [[ -f "$dest_path" || -L "$dest_path" ]]; then
                    if [[ "$DRY_RUN" == "true" ]]; then
                        echo -e "${YELLOW}[DRY-RUN] Eliminaría: $dest_name${NC}"
                    else
                        rm "$dest_path"
                    fi
                fi
                if [[ "$DRY_RUN" == "true" ]]; then
                    echo -e "${GREEN}[DRY-RUN] Crearía enlace: $dest_name → $rel_path${NC}"
                else
                    ln -sf "$file" "$dest_path"
                    echo -e "${GREEN}✅ Enlace creado: $dest_name${NC}"
                fi
                created=$((created+1))
            else
                echo -e "${YELLOW}⚠️  Archivo fuente no encontrado: $rel_path${NC}"
                skipped=$((skipped+1))
            fi
        done
    done
    
    echo ""
    echo -e "${GREEN}📊 Resumen:${NC}"
    echo -e "   • Enlaces creados: $created"
    echo -e "   • Archivos omitidos: $skipped"
}

# Función para verificar enlaces
verify_symlinks() {
    echo -e "${BLUE}🔍 Verificando enlaces creados...${NC}"
    
    local success=0
    local failed=0
    
    if [[ -d "$VSCODE_PROMPTS_DIR" ]]; then
        for file in "$VSCODE_PROMPTS_DIR"/*.instructions.md; do
            if [[ -L "$file" ]]; then
                local target=$(readlink "$file")
                if [[ -f "$target" ]]; then
                    echo -e "${GREEN}✅ $(basename "$file") → $target${NC}"
                    ((success++))
                else
                    echo -e "${RED}❌ $(basename "$file") → $target [ENLACE ROTO]${NC}"
                    ((failed++))
                fi
            elif [[ -f "$file" ]]; then
                echo -e "${YELLOW}📄 $(basename "$file") [ARCHIVO REGULAR]${NC}"
            fi
        done 2>/dev/null || true
    fi
    
    if [[ $failed -gt 0 ]]; then
        echo -e "${RED}⚠️  Se encontraron $failed enlaces rotos${NC}"
        return 1
    elif [[ $success -gt 0 ]]; then
        echo -e "${GREEN}🎉 Todos los enlaces están funcionando correctamente${NC}"
    else
        echo -e "${YELLOW}📝 No se encontraron enlaces simbólicos${NC}"
    fi
}

# Función principal
main() {
    echo -e "${GREEN}🔗 Configurando enlaces simbólicos para VS Code...${NC}"
    echo -e "${BLUE}Repositorio: $TOOLKIT_DIR${NC}"
    echo -e "${BLUE}Destino: $VSCODE_PROMPTS_DIR${NC}"
    echo ""
    
    # Verificar prerequisitos
    check_prerequisites
    
    # Confirmar ejecución si no está en modo force
    if [[ "$FORCE" != "true" && "$DRY_RUN" != "true" ]]; then
        echo -e "${YELLOW}⚠️  Este proceso:${NC}"
        echo "   • Creará un backup de tu configuración actual"
        echo "   • Reemplazará archivos existentes con enlaces simbólicos"
        echo "   • Los archivos se sincronizarán automáticamente con git pull"
        echo ""
        read -p "¿Continuar? (y/N): " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}⏹️  Operación cancelada por el usuario${NC}"
            exit 0
        fi
    fi
    
    # Crear backup
    if [[ "$DRY_RUN" != "true" ]]; then
        create_backup
    fi
    
    # Crear enlaces simbólicos
    create_symlinks
    
    # Verificar enlaces
    if [[ "$DRY_RUN" != "true" ]]; then
        echo ""
        verify_symlinks
        
        echo ""
        echo -e "${GREEN}🎉 ¡Configuración completada!${NC}"
        echo -e "${YELLOW}📝 Notas importantes:${NC}"
        if [[ -d "$BACKUP_DIR" ]]; then
            echo "   • Backup creado en: $BACKUP_DIR"
        fi
        echo "   • Reinicia VS Code para aplicar los cambios"
        echo "   • Los archivos se actualizarán automáticamente con 'git pull'"
        echo "   • Para revertir, ejecuta: make cleanup-vscode"
    fi
}

# Parsear argumentos
FORCE=false
DRY_RUN=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -f|--force)
            FORCE=true
            shift
            ;;
        -d|--dry-run)
            DRY_RUN=true
            shift
            ;;
        *)
            echo -e "${RED}❌ Opción desconocida: $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

# Ejecutar función principal
main
