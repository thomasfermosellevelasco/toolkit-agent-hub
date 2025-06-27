# 📝 Rules

Esta carpeta contiene reglas e instrucciones universales para agentes de IA en desarrollo de software.

## 📦 Qué va aquí

- **GitHub Copilot:** Archivos `.instructions.md` (ej: `naming-conventions.instructions.md`)
- **Windsurf:** Archivos `.md` (ej: `naming-conventions.md`)

### 📝 Convención de nombres

- Si una regla debe ser usada por ambos agentes, crea ambos archivos con el mismo nombre base y la extensión requerida por cada uno.
- Ejemplo: `naming-conventions.instructions.md` (Copilot) y `naming-conventions.md` (Windsurf)

## 📚 Ejemplos por agente

### 🤖 GitHub Copilot

#### Simple Copilot

```markdown
# Naming conventions.instructions.md
All variables must be in camelCase.
```

#### Intermedio Copilot

```markdown
# Error handling.instructions.md
All functions must handle exceptions and log errors using the standard logger.
```

#### Avanzado Copilot

```markdown
# Secure API usage.instructions.md
- All API keys must be stored in environment variables.
- Use HTTPS for all external requests.
- Validate all user input before processing.
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
# Error handling.md
Todas las funciones deben manejar excepciones y registrar errores usando el logger estándar.
```

#### Avanzado Windsurf

```markdown
# Secure API usage.md
- Todas las API keys deben almacenarse en variables de entorno.
- Usar HTTPS para todas las peticiones externas.
- Validar toda entrada de usuario antes de procesar.
```
