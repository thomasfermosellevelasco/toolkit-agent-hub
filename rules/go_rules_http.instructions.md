---
applyTo: '**'
---

# Go HTTP Rules

Este archivo contiene reglas específicas para el manejo de HTTP en Go. Una buena organización de la capa HTTP mejora la mantenibilidad y la seguridad.

## Principios
- Organiza handlers por dominio y responsabilidad.
- Usa DTOs embebidos salvo que sean compartidos.
- Valida input contra OpenAPI antes de pasar a servicios.
- Mapea correctamente los errores a códigos HTTP.

## Ejemplos

### Ejemplo inicial
```go
// Handler simple
func (h *UserHandler) Create(w http.ResponseWriter, r *http.Request) {
    // ...
}
```

### Ejemplo intermedio
```go
// Validación de input y mapeo de errores
func (h *UserHandler) Update(w http.ResponseWriter, r *http.Request) {
    var req UpdateUserRequest
    if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
        http.Error(w, "invalid input", http.StatusBadRequest)
        return
    }
    // ...
}
```

### Ejemplo avanzado
```go
// Uso de middlewares y DTOs compartidos
func LoggingMiddleware(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        log.Printf("%s %s", r.Method, r.URL.Path)
        next.ServeHTTP(w, r)
    })
}

// Enrutamiento por dominio
mux.Handle("/users", LoggingMiddleware(userHandler))
```

## Anti-patrones
- ❌ Handlers con demasiada lógica de negocio.
- ❌ No validar el input antes de llamar a servicios.
- ❌ No mapear errores a códigos HTTP adecuados.

## Recomendaciones para equipos
- Usa middlewares para lógica transversal (logging, auth).
- Mantén los handlers pequeños y enfocados.
- Documenta los endpoints y los DTOs.

## Referencias cruzadas
- Para reglas de error handling, ver `go_rules_error_handling.instructions.md`.
