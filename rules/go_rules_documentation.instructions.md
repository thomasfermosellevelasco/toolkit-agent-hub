---
applyTo: '**'
---

# Go Documentation Rules

Este archivo centraliza todas las reglas y ejemplos sobre documentación en Go. Documentar correctamente el código facilita la colaboración, el onboarding y la automatización.

## Principios generales
- Todo tipo, función, método, interfaz y campo exportado debe tener un comentario claro y conciso.
- Los comentarios deben explicar el propósito, comportamiento y restricciones, no repetir el código.
- Usa formato estándar GoDoc y mantén la línea inicial como una frase completa.

## Ejemplos

### Ejemplo inicial
```go
// User representa un usuario del sistema.
type User struct {
    // ID es el identificador único del usuario.
    ID string
}
```

### Ejemplo intermedio
```go
// UserService provee operaciones sobre usuarios.
type UserService interface {
    // CreateUser crea un nuevo usuario.
    //   - ctx: contexto para cancelación.
    //   - name: requerido, no puede ser vacío.
    // Devuelve el usuario creado o error.
    CreateUser(ctx context.Context, name string) (User, error)
}
```

### Ejemplo avanzado
```go
// PaymentProcessor procesa pagos y notifica eventos.
//
// Garantías:
//   - Thread-safe.
//   - No persiste estado entre ejecuciones.
type PaymentProcessor interface {
    Process(amount float64) error
}
```

## Anti-patrones
- ❌ Comentarios que solo repiten el nombre del método.
- ❌ Falta de comentarios en tipos exportados.
- ❌ Comentarios desactualizados o engañosos.

## Recomendaciones para equipos
- Revisa la documentación en code reviews.
- Usa herramientas como `golint` para detectar faltantes.
- Mantén la documentación actualizada con los cambios de código.

## Referencias cruzadas
- Para reglas de testing, ver `go_rules_testing.instructions.md`.
- Para reglas de DDD, ver `go_rules_ddd.instructions.md`.
