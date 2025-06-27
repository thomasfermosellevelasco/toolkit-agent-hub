# 💬 Prompts

Esta carpeta contiene prompts y plantillas reutilizables para agentes de IA.

## 📦 Qué va aquí

- **GitHub Copilot:** Archivos `.prompts.md` o `.md` (ej: `refactor.prompts.md`)
- **Windsurf:** Archivos `.md` (ej: `refactor.md`)

### 📝 Convención de nombres

- Si un prompt debe ser usado por ambos agentes, crea ambos archivos con el mismo nombre base y la extensión requerida por cada uno.
- Ejemplo: `refactor.prompts.md` (Copilot) y `refactor.md` (Windsurf)

## 📚 Ejemplos por agente

### 🤖 GitHub Copilot

#### Simple Copilot

```markdown
# Resume.prompts.md
Summarize the following code block.
```

#### Intermedio Copilot

```markdown
# Refactor.prompts.md
Suggest possible refactorings to improve code readability and performance.
```

#### Avanzado Copilot

```markdown
# Test-and-improve.prompts.md
Given the following code, generate unit tests and suggest security and performance improvements.
```

---

### 🌊 Windsurf

#### Simple Windsurf

```markdown
# Resume.md
Resume el siguiente bloque de código.
```

#### Intermedio Windsurf

```markdown
# Refactor.md
Sugiere posibles refactorizaciones para mejorar la legibilidad y el rendimiento del código siguiente.
```

#### Avanzado Windsurf

```markdown
# Test-and-improve.md
Dado el siguiente código, genera pruebas unitarias y sugiere mejoras de seguridad y performance.
```
