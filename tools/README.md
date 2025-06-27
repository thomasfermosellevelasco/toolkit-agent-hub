# 🛠️ Tools

Esta carpeta contiene recursos ligeros y configuraciones para ampliar o mejorar las capacidades de los agentes de IA.

## 📦 Qué va aquí

- **GitHub Copilot:** Archivos `.json`, `.md` o scripts de configuración (ej: `format-on-save.json`)
- **Windsurf:** Archivos `.md` o scripts de configuración (ej: `custom-linter.md`)

### 📝 Convención de nombres

- Si un tool debe ser usado por ambos agentes, crea ambos archivos con el mismo nombre base y la extensión requerida por cada uno.
- Ejemplo: `format-on-save.json` (Copilot) y `format-on-save.md` (Windsurf)

## 📚 Ejemplos por agente

### 🤖 GitHub Copilot

#### Simple Copilot

```json
{
  "tool": "format-on-save",
  "description": "Enables auto-format on save in VSCode."
}
```

#### Intermedio Copilot

```json
{
  "tool": "custom-linter",
  "config": {
    "rules": ["no-console", "prefer-const"]
  }
}
```

#### Avanzado Copilot

```json
{
  "tool": "ci-integration",
  "description": "Run tests and linting on every push.",
  "script": "npm run test && npm run lint"
}
```

---

### 🌊 Windsurf

#### Simple Windsurf

```markdown
# format-on-save.md
Activa el formateo automático al guardar en el editor.
```

#### Intermedio Windsurf

```markdown
# custom-linter.md
- Prohíbe el uso de `console.log` en producción.
- Prefiere `const` sobre `let` cuando sea posible.
```

#### Avanzado Windsurf

```markdown
# ci-integration.md
- Ejecuta pruebas y linting en cada push usando el script: `npm run test && npm run lint`.
```
