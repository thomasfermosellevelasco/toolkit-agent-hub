# Makefile for toolkit-agent-hub
# Provides convenient commands for managing VS Code symlinks and toolkit operations

.PHONY: help setup-vscode cleanup-vscode backup-vscode restore-vscode status test-symlinks

# Configuration
VSCODE_PROMPTS_DIR := $(HOME)/Library/Application Support/Code/User/prompts
BACKUP_SUFFIX := $(shell date +%Y%m%d_%H%M%S)
SCRIPT_DIR := ./scripts

# Default target
help: ## Show this help message
	@echo "🛠️  Comandos disponibles para toolkit-agent-hub:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "📖 Ejemplos de uso:"
	@echo "  make setup-vscode     # Configurar enlaces para VS Code"
	@echo "  make status          # Ver estado actual"
	@echo "  make cleanup-vscode  # Limpiar y restaurar backup"

setup-vscode: ## Configurar enlaces simbólicos para VS Code
	@echo "🔗 Configurando enlaces simbólicos para VS Code..."
	@$(SCRIPT_DIR)/setup-vscode-symlinks.sh

setup-vscode-force: ## Configurar enlaces sin confirmación
	@echo "🔗 Configurando enlaces simbólicos (forzado)..."
	@$(SCRIPT_DIR)/setup-vscode-symlinks.sh --force

dry-run: ## Mostrar qué haría setup-vscode sin ejecutar
	@echo "🔍 Simulando configuración de enlaces..."
	@$(SCRIPT_DIR)/setup-vscode-symlinks.sh --dry-run

cleanup-vscode: ## Eliminar enlaces simbólicos y restaurar backup más reciente
	@echo "🧹 Limpiando enlaces simbólicos..."
	@if [ -d "$(VSCODE_PROMPTS_DIR)" ]; then \
		echo "Eliminando enlaces simbólicos..."; \
		find "$(VSCODE_PROMPTS_DIR)" -type l -name "*.instructions.md" -delete 2>/dev/null || true; \
		echo "✅ Enlaces eliminados"; \
	fi
	@LATEST_BACKUP=$$(ls -1dt "$(VSCODE_PROMPTS_DIR).backup-"* 2>/dev/null | head -1); \
	if [ -n "$$LATEST_BACKUP" ]; then \
		echo "Restaurando desde: $$LATEST_BACKUP"; \
		mkdir -p "$(VSCODE_PROMPTS_DIR)"; \
		cp -r "$$LATEST_BACKUP/"* "$(VSCODE_PROMPTS_DIR)/" 2>/dev/null || true; \
		echo "✅ Backup restaurado desde: $$LATEST_BACKUP"; \
	else \
		echo "⚠️  No se encontraron backups para restaurar"; \
	fi

backup-vscode: ## Crear backup manual de configuración actual
	@echo "📦 Creando backup manual..."
	@if [ -d "$(VSCODE_PROMPTS_DIR)" ]; then \
		BACKUP_DIR="$(VSCODE_PROMPTS_DIR).backup-$(BACKUP_SUFFIX)"; \
		cp -r "$(VSCODE_PROMPTS_DIR)" "$$BACKUP_DIR"; \
		echo "✅ Backup creado: $$BACKUP_DIR"; \
	else \
		echo "⚠️  No existe configuración para respaldar"; \
	fi

status: ## Mostrar estado actual de enlaces simbólicos
	@echo "🔍 Estado de enlaces simbólicos en VS Code:"
	@echo ""
	@if [ -d "$(VSCODE_PROMPTS_DIR)" ]; then \
		cd "$(VSCODE_PROMPTS_DIR)"; \
		FOUND_FILES=false; \
		for file in *.instructions.md; do \
			if [ -f "$$file" ] || [ -L "$$file" ]; then \
				FOUND_FILES=true; \
				if [ -L "$$file" ]; then \
					TARGET=$$(readlink "$$file"); \
					if [ -f "$$TARGET" ]; then \
						echo "✅ $$file → $$TARGET"; \
					else \
						echo "❌ $$file → $$TARGET [ENLACE ROTO]"; \
					fi; \
				else \
					echo "📄 $$file (archivo regular)"; \
				fi; \
			fi; \
		done; \
		if [ "$$FOUND_FILES" = false ]; then \
			echo "📂 No se encontraron archivos .instructions.md"; \
		fi; \
	else \
		echo "❌ Directorio no encontrado: $(VSCODE_PROMPTS_DIR)"; \
	fi
	@echo ""
	@echo "📊 Backups disponibles:"
	@ls -1dt "$(VSCODE_PROMPTS_DIR).backup-"* 2>/dev/null | head -5 | \
		while read backup; do echo "   📦 $$(basename "$$backup")"; done || \
		echo "   (No hay backups disponibles)"

test-symlinks: ## Verificar integridad de enlaces simbólicos
	@echo "🧪 Verificando integridad de enlaces..."
	@$(SCRIPT_DIR)/setup-vscode-symlinks.sh --dry-run

list-backups: ## Listar todos los backups disponibles
	@echo "📦 Backups disponibles:"
	@ls -1dt "$(VSCODE_PROMPTS_DIR).backup-"* 2>/dev/null | \
		while read backup; do \
			SIZE=$$(du -sh "$$backup" 2>/dev/null | cut -f1); \
			DATE=$$(basename "$$backup" | sed 's/.*backup-//'); \
			echo "   📦 $$DATE ($$SIZE)"; \
		done || echo "   (No hay backups disponibles)"

clean-old-backups: ## Eliminar backups anteriores a 30 días
	@echo "🧹 Limpiando backups antiguos (>30 días)..."
	@find "$(HOME)/Library/Application Support/Code/User" -name "prompts.backup-*" -type d -mtime +30 -exec rm -rf {} + 2>/dev/null || true
	@echo "✅ Limpieza completada"

# Development targets
lint-scripts: ## Verificar sintaxis de scripts
	@echo "🔍 Verificando sintaxis de scripts..."
	@shellcheck $(SCRIPT_DIR)/*.sh 2>/dev/null || echo "⚠️  shellcheck no disponible, instalar con: brew install shellcheck"

validate-rules: ## Validar archivos de reglas
	@echo "🔍 Validando archivos de reglas..."
	@for file in rules/*.instructions.md; do \
		if [ -f "$$file" ]; then \
			echo "✅ $$(basename "$$file")"; \
		fi; \
	done

# Quick shortcuts
install: setup-vscode ## Alias para setup-vscode
uninstall: cleanup-vscode ## Alias para cleanup-vscode
check: status ## Alias para status
