# 🧰 toolkit-agent-hub

> 🧭 **Resumen:**
> Este repositorio es un toolkit universal y portable de recursos textuales y de configuración para agentes de IA en desarrollo de software (GitHub Copilot, Windsurf, proximamente Cursor, Zed, etc.). Aquí encontrarás reglas, prompts, tools y ejemplos organizados de forma agnóstica al agente/editor. La estructura y convenciones permiten compartir y mantener recursos reutilizables, claros y bien documentados para cualquier flujo de trabajo.

---

## 🗂️ Visión general de recursos

| Carpeta      | Contenido principal                                   |
|-------------|-------------------------------------------------------|
| `/rules/`   | Reglas y convenciones para la interaccion con agentes |
| `/prompts/` | Prompts y plantillas reutilizables                    |
| `/tools/`   | Recursos ligeros tipo tools (no ejecutables)          |
| `/examples/`| Ejemplos de uso y casos practicos                     |

## 🎯 ¿Cuál es el objetivo de este repo?

Este repositorio busca unificar la forma de trabajar con agentes de inteligencia artificial en distintos entornos y editores. Aqui encontraras:

- **Reglas e instrucciones**: Guias para el uso eficiente y coherente de agentes IA.
- **Prompts reutilizables**: Ejemplos y plantillas para acelerar tareas comunes.
- **Tools y fragmentos de configuracion**: Recursos ligeros para mejorar la interaccion con agentes.
- **Buenas practicas de uso**: Sugerencias para mantener la consistencia y calidad en tu flujo de trabajo.

> **Nota:** Este repositorio _no contiene MCPs, sistemas ejecutables ni codigo fuente de agentes_. Su proposito es ser un toolkit portable de recursos textuales y de configuracion.

## 🤝 ¿Por qué centralizar estos recursos?

- **Portabilidad**: Clona este repo en cualquier maquina y mantén tu forma de trabajar sin depender del entorno.
- **Consistencia**: Unifica criterios y reglas entre diferentes agentes y editores.
- **Escalabilidad**: Permite sumar nuevas reglas, prompts o tools para otros agentes facilmente.
- **Colaboracion**: Facilita compartir y mejorar el toolkit con otros usuarios y equipos.

## 📦 Que puedes encontrar aqui

- `/rules/`: Reglas y convenciones para la interaccion con agentes.
- `/prompts/`: Prompts y plantillas reutilizables.
- `/tools/`: Recursos ligeros tipo tools (no ejecutables).
- `/examples/`: Ejemplos de uso y casos practicos.

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
- **Skills:** Habilidades especificas del agente.
- **MCP (Model Context Protocol):** Soporte para integraciones avanzadas.

### Windsurf

- **Rules:** Reglas explicitas definidas por el usuario.
- **Memories:** Aprendizajes automaticos generados por el agente.
- **Workflow:** Secuencias automatizadas de pasos/tareas.
- **MCP Servers:** Integracion de herramientas externas mediante MCP.

## 📝 Convencion de nombres

Para mantener la universalidad y compatibilidad entre agentes, se recomienda:

- **GitHub Copilot:** Usa extensiones como `.instructions.md`, `.prompts.md`, `.json` segun el tipo de recurso.
- **Windsurf:** Usa `.md` para reglas y prompts, y `.md` o scripts de configuracion para tools.
- Si un recurso debe ser usado por ambos agentes, crea ambos archivos con el mismo nombre base y la extension requerida por cada uno.
- Ejemplo: `naming-conventions.instructions.md` (Copilot) y `naming-conventions.md` (Windsurf).

Consulta el README de cada carpeta para detalles y ejemplos por agente.

---

## 🚀 Guia de contribucion

- Propón nuevas reglas, prompts o tools mediante un Pull Request.
- Asegurate de que sean claros, utiles y portables.
- Indica si el recurso es universal o especifico de un agente.
- Documenta el proposito y el uso esperado.

## 💡 Sugerencias y buenas practicas

- Manten las reglas e instrucciones claras y concisas.
- Diferencia entre recursos especificos de un agente y los que son universales.
- Documenta siempre los cambios y nuevas incorporaciones.
- Si detectas mejores practicas, ¡compartelas aqui!
