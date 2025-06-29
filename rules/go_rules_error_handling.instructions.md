---
applyTo: '**'
---

# Go Error Handling Rules

Este archivo centraliza las reglas de manejo de errores en Go. Un manejo adecuado de errores mejora la robustez y la experiencia de usuario.

## Principios
- Solo el dominio crea errores de validación de input.
- Usa `fmt.Errorf("context: %w", err)` para wrapping.
- No filtrar detalles sensibles en respuestas HTTP.
- Distingue claramente entre errores de dominio y de infraestructura.

## Ejemplos

### Ejemplo inicial
```go
if err != nil {
    return fmt.Errorf("creating user: %w", err)
}
```

### Ejemplo intermedio
```go
// Error de validación de dominio
if name == "" {
    return ErrInvalidName
}

// Error de infraestructura
if err := db.Save(user); err != nil {
    return fmt.Errorf("db error: %w", err)
}
```

### Ejemplo avanzado
```go
// Mapeo de errores a HTTP
if errors.Is(err, ErrInvalidInput) {
    http.Error(w, err.Error(), http.StatusBadRequest)
    return
}
if err != nil {
    http.Error(w, "internal error", http.StatusInternalServerError)
}
```

## Anti-patrones
- ❌ No envolver errores con contexto.
- ❌ Devolver errores de infraestructura como errores de usuario.
- ❌ Filtrar detalles sensibles en respuestas.

## Recomendaciones para equipos
- Usa errores sentinela (`var ErrX = errors.New(...)`) para control de flujo.
- Documenta los errores esperados en las interfaces.
- Revisa el manejo de errores en code reviews.

## Referencias cruzadas
- Para reglas de DDD, ver `go_rules_ddd.instructions.md`.
- Para reglas globales, ver `go_rules_global.instructions.md`.
