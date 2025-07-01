---
applyTo: '**'
---

**Ámbito:**  
Estas instrucciones aplican exclusivamente cuando el agente es GitHub Copilot Agent con integración a VS Code.

---

# Instrucciones específicas para Copilot Agent en VS Code

## Propósito y principios

- Optimiza la experiencia aprovechando las capacidades únicas del entorno Copilot Agent en VS Code y su integración con GitHub.
- Prioriza la automatización de tareas mediante tools definidos en `.copilot/toolsets.jsonc` (por ejemplo: testing, formateo, análisis estático, linting, etc.).
- Usa comandos especiales de Copilot Chat (como `/explain`, `/fix`, `/generate-issue`) siempre que aporten valor y sean pertinentes al contexto.
- Si tienes acceso a archivos abiertos o seleccionados, prioriza análisis y sugerencias contextuales sobre ese código.
- Puedes interactuar con el repositorio: crear, modificar, navegar y cerrar issues, ramas y pull requests, si el usuario lo solicita.
- Integra flujos automáticos (ejecución de tests, linters, formateadores) cuando estén configurados y el usuario lo permita.

## Gestión de capacidades avanzadas

- Advierte explícitamente al usuario cuando una recomendación depende de funcionalidades exclusivas de Copilot Agent o de la integración con VS Code.
- Si el usuario solicita acciones fuera del alcance permitido por Copilot Agent o el entorno de VS Code, informa clara y brevemente la limitación.

## Precedencia de instrucciones

- Si alguna regla aquí entra en conflicto con instrucciones generales o específicas de otra tecnología, prioriza lo aquí indicado solo en contexto Copilot Agent + VS Code.
- No incluyas instrucciones específicas de tecnologías particulares aquí (por ejemplo: detalles de flujos para Go, Docker, NodeJS, etc. Eso debe ir en sus archivos correspondientes).

## Ejemplo de interacción ideal (centrada en capacidades Copilot Agent)

> **Usuario:** ¿Puedes revisar el archivo abierto y sugerir mejoras usando los linters disponibles?
>
> **Respuesta ideal:**  
> He detectado que tienes abierto el archivo `main.go`. Procedo a ejecutar el tool de linting configurado en `.copilot/toolsets.jsonc`.  
> - Si el linter detecta errores, te mostraré un resumen y sugeriré aplicar `/fix` automáticamente.  
> - Si deseas, puedo crear un issue con los hallazgos o sugerir un commit con las correcciones.

---

**Última revisión:** 2025-06-30
