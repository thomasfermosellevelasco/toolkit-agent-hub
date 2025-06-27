# 📚 Examples

Esta carpeta contiene ejemplos de uso y casos prácticos para recursos de agentes de IA.

## 📦 Qué va aquí

- **GitHub Copilot:** Ejemplos en formato `.instructions.md`, `.prompts.md`, `.json` según el tipo de recurso.
- **Windsurf:** Ejemplos en formato `.md` para reglas/prompts y `.md` o scripts para tools.

### 📝 Convención de nombres

- Si un ejemplo debe ser usado por ambos agentes, crea ambos archivos con el mismo nombre base y la extensión requerida por cada uno.
- Ejemplo: `example-rule.instructions.md` (Copilot) y `example-rule.md` (Windsurf).

## 📚 Ejemplos por agente

### 🤖 GitHub Copilot

#### Simple Copilot

```markdown
# Naming conventions.instructions.md
All variables must be in camelCase.
```

#### Intermedio Copilot

```markdown
# Refactor.prompts.md
Suggest possible refactorings to improve code readability and performance.
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
# Naming conventions.md
Todas las variables deben estar en camelCase.
```

#### Intermedio Windsurf

```markdown
# Refactor.md
Sugiere posibles refactorizaciones para mejorar la legibilidad y el rendimiento del código siguiente.
```

#### Avanzado Windsurf

```markdown
# custom-linter.md
- Todas las funciones deben manejar excepciones.
- Usa el logger estándar para registrar errores.
- Prohíbe el uso de `console.log` en producción.
```
