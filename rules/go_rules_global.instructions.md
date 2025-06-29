---
applyTo: '**'
---

# Go Global Rules

Este archivo contiene reglas realmente transversales para Go, aplicables a cualquier proyecto o equipo.

## Principios
- Prefiere la standard library para todo lo posible.
- Evita dependencias externas salvo en adapters.
- Inyecta dependencias por interfaz.
- Evita anti-patrones globales (nombres genéricos, servicios anémicos, lógica duplicada).

## Ejemplos

### Ejemplo inicial
```go
// Uso de la standard library
import "net/http"
```

### Ejemplo intermedio
```go
// Inyección de dependencias por interfaz
func NewService(repo Repository) *Service {
    return &Service{repo: repo}
}
```

### Ejemplo avanzado
```go
// Aislamiento de dependencias externas
package adapters

import "github.com/some/external"

// ...
```

## Anti-patrones
- ❌ Uso excesivo de librerías externas sin justificación.
- ❌ Lógica de negocio acoplada a frameworks.
- ❌ Nombres de paquetes o tipos ambiguos.

## Recomendaciones para equipos
- Evalúa dependencias externas periódicamente.
- Documenta las decisiones de arquitectura.
- Fomenta la revisión cruzada de código y dependencias.

## Referencias cruzadas
- Para detalles de DDD, ver `go_rules_ddd.instructions.md`.
- Para estilo de código, ver `go_rules_coding.instructions.md`.
