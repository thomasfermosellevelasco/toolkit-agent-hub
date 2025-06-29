# Toolset Git para Copilot Agent en VS Code

## Índice

- [Resumen](#resumen)
- [Comandos disponibles](#comandos-disponibles)
- [Funcionamiento y advertencias](#funcionamiento-y-advertencias)
- [Ejemplo de uso seguro](#ejemplo-de-uso-seguro)
- [Checklist de revisión](#checklist-de-revisión)
- [Referencias](#referencias)

## Resumen

Este archivo documenta el uso del toolset `git-tool.jsonc` para operaciones Git automatizadas desde GitHub Copilot Agent en Visual Studio Code. El objetivo es facilitar flujos de trabajo comunes de Git, integrando advertencias y buenas prácticas para evitar operaciones destructivas accidentales.

## Comandos disponibles

El toolset incluye los siguientes comandos:

| Comando            | Descripción breve                                                                                 | ¿Destructivo? |
|--------------------|--------------------------------------------------------------------------------------------------|:-------------:|
| git-status         | Muestra el estado del repositorio                                                                | No            |
| git-add            | Añade archivos al área de stage                                                                  | No            |
| git-commit         | Genera un commit con los archivos en stage                                                       | No            |
| git-push           | Envía los commits locales al remoto                                                              | No            |
| git-pull           | Actualiza la rama local con cambios del remoto                                                   | No            |
| git-log            | Muestra el historial de commits                                                                  | No            |
| git-branch         | Lista ramas locales y remotas                                                                    | No            |
| git-checkout       | Cambia a otra rama existente                                                                     | No            |
| git-stash          | Guarda cambios actuales en un stash temporal                                                     | No            |
| git-stash-pop      | Recupera el último stash y aplica los cambios (**destructivo**)                                  | Sí            |
| git-diff           | Muestra diferencias entre archivos y el último commit                                            | No            |
| git-reset          | Deshace cambios en stage o historial (**destructivo**)                                           | Sí            |
| git-restore        | Descarta cambios en archivos (**destructivo**)                                                   | Sí            |
| git-fetch          | Trae cambios del remoto sin mezclar                                                              | No            |
| git-merge          | Une ramas                                                                                        | No            |
| git-rebase         | Reaplica commits sobre otra base                                                                 | No            |
| git-remote         | Lista remotos configurados                                                                       | No            |
| git-tag            | Lista o crea tags                                                                                | No            |
| git-tag-create     | Crea un tag anotado (**destructivo**)                                                            | Sí            |
| git-cherry-pick    | Aplica un commit específico de otra rama (**destructivo**)                                       | Sí            |
| git-rm             | Elimina archivos del control de versiones (**destructivo**)                                      | Sí            |
| git-mv             | Renombra o mueve archivos (**destructivo**)                                                      | Sí            |
| git-show           | Muestra detalles de un commit o tag                                                              | No            |
| git-config         | Muestra configuración local o global de git                                                      | No            |

> ⚠️ **Advertencia:** Los comandos marcados como destructivos requieren confirmación explícita antes de ejecutarse y muestran advertencias automáticas.

## Funcionamiento y advertencias

- El agente detecta si un comando es destructivo mediante el tag `"destructive"` en el toolset.
- Antes de ejecutar un comando destructivo, el agente:
  - Explica el impacto y los riesgos.
  - Solicita confirmación explícita del usuario.
  - Sugiere alternativas seguras si existen.

- Ejemplo de advertencia automática:

> ⚠️ **Advertencia de seguridad:**
>
> El comando solicitado (`git reset --hard HEAD~1`) es una operación destructiva y no reversible.
>
> - Este comando eliminará todos los cambios no guardados y reescribirá el historial hasta el commit especificado.
> - ¿Deseas continuar? Responde "Sí, continuar" para ejecutar o "No" para cancelar.

## Ejemplo de uso seguro

```bash
# Solicitud del usuario:
git reset --hard HEAD~1
```

> ⚠️ **Advertencia:** Esta operación puede ser destructiva y no reversible.
> ¿Deseas continuar? (Sí/No)
```bash
