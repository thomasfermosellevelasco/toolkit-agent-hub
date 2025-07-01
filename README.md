# 🧰 toolkit-agent-hub

> 🧭 **Resumen:**
> Este repositorio es un toolkit universal y portable de recursos textuales y de configuración para agentes de IA en desarrollo de software (GitHub Copilot, Windsurf, próximamente Cursor, Zed, etc.). Aquí encontrarás reglas, prompts, tools y ejemplos organizados de forma agnóstica al agente/editor. La estructura y convenciones permiten compartir y mantener recursos reutilizables, claros y bien documentados para cualquier flujo de trabajo.

---

## 🗂️ Visión general de recursos

| Carpeta      | Contenido principal                                   |
|-------------|-------------------------------------------------------|
| `/rules/`   | Reglas y convenciones para la interacción con agentes |
| `/prompts/` | Prompts y plantillas reutilizables                    |
| `/tools/`   | Recursos ligeros tipo tools (no ejecutables)          |
| `/examples/`| Ejemplos de uso y casos prácticos                     |

## 🎯 ¿Cuál es el objetivo de este repo?

Este repositorio busca unificar la forma de trabajar con agentes de inteligencia artificial en distintos entornos y editores. Aquí encontrarás:

- **Reglas e instrucciones**: Guías para el uso eficiente y coherente de agentes IA.
- **Prompts reutilizables**: Ejemplos y plantillas para acelerar tareas comunes.
- **Tools y fragmentos de configuración**: Recursos ligeros para mejorar la interacción con agentes.
- **Buenas prácticas de uso**: Sugerencias para mantener la consistencia y calidad en tu flujo de trabajo.

> **Nota:** Este repositorio _no contiene MCPs, sistemas ejecutables ni código fuente de agentes_. Su propósito es ser un toolkit portable de recursos textuales y de configuración.

## 🤝 ¿Por qué centralizar estos recursos?

- **Portabilidad**: Clona este repo en cualquier máquina y mantén tu forma de trabajar sin depender del entorno.
- **Consistencia**: Unifica criterios y reglas entre diferentes agentes y editores.
- **Escalabilidad**: Permite sumar nuevas reglas, prompts o tools para otros agentes fácilmente.
- **Colaboración**: Facilita compartir y mejorar el toolkit con otros usuarios y equipos.

## 📦 Qué puedes encontrar aquí

- `/rules/`: Reglas y convenciones para la interacción con agentes.
- `/prompts/`: Prompts y plantillas reutilizables.
- `/tools/`: Recursos ligeros tipo tools (no ejecutables).
- `/examples/`: Ejemplos de uso y casos prácticos.

## 🧩 Funcionalidades por agente

| Funcionalidad/Concepto   | GitHub Copilot         | Windsurf        |
|-------------------------|------------------------|------------------|
| Custom Instructions     | Custom Instructions    | Rules            |
| Memories                | –                      | Memories         |
| Prompts File            | Prompts File           | –                |
| Prompt                  | Prompt                 | –                |
| Tool Set                | Tool Set               | –                |
| Workflow                | –                      | Workflow         |
| Extensions              | Extensions             | –                |
| Skills                  | Skills                 | –                |
| MCP                     | MCP                    | MCP Servers      |

### GitHub Copilot

- **Custom Instructions:** Directrices persistentes para guiar el comportamiento del agente.
- **Prompts File:** Archivo centralizado de prompts reutilizables.
- **Tool Set:** Conjunto de herramientas configurables.
- **Extensions:** Integraciones de terceros.
- **Skills:** Habilidades específicas del agente.
- **MCP (Model Context Protocol):** Soporte para integraciones avanzadas.

### Windsurf

- **Rules:** Reglas explícitas definidas por el usuario.
- **Memories:** Aprendizajes automáticos generados por el agente.
- **Workflow:** Secuencias automatizadas de pasos/tareas.
- **MCP Servers:** Integración de herramientas externas mediante MCP.

## 📝 Convención de nombres

Para mantener la universalidad y compatibilidad entre agentes, se recomienda:

- **GitHub Copilot:** Usa extensiones como `.instructions.md`, `.prompts.md`, `.json` según el tipo de recurso.
- **Windsurf:** Usa `.md` para reglas y prompts, y `.md` o scripts de configuración para tools.
- Si un recurso debe ser usado por ambos agentes, crea ambos archivos con el mismo nombre base y la extensión requerida por cada uno.
- Ejemplo: `naming-conventions.instructions.md` (Copilot) y `naming-conventions.md` (Windsurf).

Consulta el README de cada carpeta para detalles y ejemplos por agente.

---

## 🔗 Configuración para VS Code

### Instalación automatizada

Para sincronizar automáticamente las reglas con tu configuración local de VS Code:

```bash
# Opción 1: Script directo
./scripts/setup-vscode-symlinks.sh

# Opción 2: Make (recomendado)
make setup-vscode

# Opción 3: Simulación sin cambios
make dry-run
```

### Comandos útiles

```bash
# Ver estado de enlaces actuales
make status

# Crear backup manual antes de cambios
make backup-vscode

# Limpiar enlaces y restaurar último backup
make cleanup-vscode

# Forzar configuración sin confirmación
make setup-vscode-force

# Ver todos los comandos disponibles
make help
```

### ¿Qué hace la configuración?

- 🔗 **Enlaces simbólicos automáticos**: Crea enlaces desde `~/Library/Application Support/Code/User/prompts/` hacia **todos los archivos** de las carpetas `rules/`, `prompts/` y `tools/` del repositorio, de forma recursiva y sin mantenimiento manual.
- 📦 **Backup automático**: Realiza backup de tu configuración actual antes de cualquier cambio.
- 🔄 **Sincronización automática**: Los archivos se actualizan automáticamente cuando haces `git pull`.
- ✅ **Compatibilidad múltiple**: Funciona con GitHub Copilot, Windsurf y otros agentes compatibles.
- ⚡ **Revertible**: Fácil restauración con `make cleanup-vscode`.

### Detalles del enlace automático

- Todos los archivos `*.md`, `*.json`, `*.jsonc` de `rules/`, `prompts/` y `tools/` se enlazan automáticamente.
- El nombre del enlace en destino es: `<carpeta>_<nombrearchivo.ext>` (ejemplo: `rules_go_rules_ddd.instructions.md`).
- Se excluyen archivos `README.md` para evitar ruido en la configuración.
- No es necesario modificar el script al agregar nuevos recursos: cualquier archivo nuevo será enlazado automáticamente.

### Troubleshooting

**Si VS Code no reconoce los cambios:**

```bash
# Reinicia VS Code después de configurar enlaces
# O usa Command Palette: "Developer: Reload Window"
```

**Para verificar enlaces:**

```bash
make status
# O manualmente:
ls -la ~/Library/Application\ Support/Code/User/prompts/
```

**Para revertir completamente:**

```bash
make cleanup-vscode
# Esto elimina enlaces y restaura el último backup
```

---

## 🚀 Guía de contribución

- Propón nuevas reglas, prompts o tools mediante un Pull Request.
- Asegúrate de que sean claros, útiles y portables.
- Indica si el recurso es universal o específico de un agente.
- Documenta el propósito y el uso esperado.

## 💡 Sugerencias y buenas prácticas

- Mantén las reglas e instrucciones claras y concisas.
- Diferencia entre recursos específicos de un agente y los que son universales.
- Documenta siempre los cambios y nuevas incorporaciones.
- Si detectas mejores prácticas, ¡compártelas aquí!
