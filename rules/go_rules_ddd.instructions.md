---
applyTo: '**'
---

# Go DDD Rules

Este archivo contiene reglas y ejemplos estrictamente de Domain-Driven Design (DDD) en Go. El objetivo es modelar el dominio de forma fiel y robusta.

## Principios
- El modelo de dominio es el corazón de la aplicación.
- Usa lenguaje ubicuo y mantiene límites claros.
- La lógica de dominio debe estar aislada de la infraestructura.
- Aplica el patrón de atributos y encapsulamiento estricto.

## Ejemplos

### Ejemplo inicial
```go
type Task struct {
    id         string
    attributes TaskAttributes
}

func (t *Task) ID() string { return t.id }
```

### Ejemplo intermedio
```go
func NewTask(id, title string) (*Task, error) {
    if id == "" || title == "" {
        return nil, errors.New("invalid input")
    }
    return &Task{
        id: id,
        attributes: TaskAttributes{title: title},
    }, nil
}
```

### Ejemplo avanzado
```go
// Encapsulamiento y mutación segura
func (t *Task) UpdateTitle(title string) error {
    if title == "" {
        return errors.New("title required")
    }
    t.attributes.title = title
    return nil
}
```

## Anti-patrones
- ❌ Campos públicos en entidades.
- ❌ Validaciones fuera del constructor o mutadores.
- ❌ Lógica de dominio en servicios en vez de entidades.

## Recomendaciones para equipos
- Revisa el uso de invariantes en code reviews.
- Mantén el dominio libre de dependencias externas.
- Documenta el lenguaje ubicuo y los límites del dominio.

## Referencias cruzadas
- Para reglas de documentación, ver `go_rules_documentation.instructions.md`.
- Para testing, ver `go_rules_testing.instructions.md`.
- Para manejo de errores, ver `go_rules_error_handling.instructions.md`.
