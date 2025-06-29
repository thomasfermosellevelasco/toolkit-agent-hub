# Ejemplos de aplicación: Copilot Agent en Visual Studio Code

## Índice

- [Resumen](#resumen)
- [Ejemplo simple](#ejemplo-simple)
- [Ejemplo intermedio](#ejemplo-intermedio)
- [Ejemplo avanzado](#ejemplo-avanzado)
- [Anti-patrones frecuentes](#anti-patrones-frecuentes)
- [Checklist de revisión](#checklist-de-revisión)
- [Glosario](#glosario)
- [Referencias](#referencias)

## Resumen

Este documento muestra ejemplos prácticos de automatización y buenas prácticas usando Copilot Agent en VS Code, para perfiles desde trainee hasta Technical Lead.

## Ejemplo simple

Automatización de linting en un archivo abierto:

> **Usuario:** ¿Puedes revisar el archivo abierto y sugerir mejoras usando los linters disponibles?
>
> **Respuesta del agente:**
> "He detectado que tienes abierto el archivo `main.go`. Procedo a ejecutar el tool de linting configurado en `.copilot/toolsets.jsonc`. Si el linter detecta errores, te mostraré un resumen y sugeriré aplicar `/fix` automáticamente."

## Ejemplo intermedio

Integración de linting y formateo automático al guardar archivos:

> **Usuario:** ¿Puedes asegurarte de que cada vez que guarde un archivo se aplique linting y formateo?
>
> **Respuesta del agente:**
> "Configura el toolset para ejecutar lint y format on save. Así, cada vez que guardes, se aplicarán ambos automáticamente."

## Ejemplo avanzado

Automatización de flujos completos: lint, test y generación de issues.

> **Usuario:** ¿Puedes automatizar la ejecución de tests y crear un issue si fallan?
>
> **Respuesta del agente:**
> "He configurado el toolset para ejecutar tests tras cada push. Si algún test falla, se genera un issue automáticamente con el resumen del error."

## Anti-patrones frecuentes

- Ignorar los linters y hacer commits con errores.
- No aprovechar la automatización de flujos.
- No usar comandos especiales de Copilot Chat.

## Checklist de revisión

- [ ] ¿Se automatizan tareas repetitivas con tools?
- [ ] ¿Se aprovechan los comandos especiales de Copilot Chat?
- [ ] ¿Se integran linters, formateadores y tests?
- [ ] ¿Se documentan los flujos automáticos?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **Toolset:** Conjunto de herramientas configuradas para automatización.
- **Linting:** Proceso de análisis estático para detectar errores de estilo o bugs.
- **Copilot Chat:** Interfaz conversacional para interactuar con Copilot Agent.

## Referencias

- [Documentación oficial de GitHub Copilot en VS Code](https://docs.github.com/es/copilot/getting-started-with-github-copilot/getting-started-with-github-copilot-in-visual-studio-code)
- [Linting en Go](https://golangci-lint.run/)
