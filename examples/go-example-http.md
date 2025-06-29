# Ejemplos de aplicación: HTTP en Go

## Índice

- [Resumen](#resumen)
- [Ejemplo simple](#ejemplo-simple)
- [Ejemplo intermedio](#ejemplo-intermedio)
- [Ejemplo avanzado](#ejemplo-avanzado)
- [Anti-patrones frecuentes](#anti-patrones-frecuentes)
- [Checklist de revisión](#checklist-de-revisión)
- [Glosario](#glosario)
- [Referencias](#referencias)

## Resumen

Buenas prácticas para la implementación de handlers HTTP en Go, desde lo básico hasta la integración avanzada.

## Ejemplo simple

Handler básico:

```go
func helloHandler(w http.ResponseWriter, r *http.Request) {
    w.WriteHeader(http.StatusOK)
    w.Write([]byte("Hello, world!"))
}
```

## Ejemplo intermedio

Manejo de rutas y parámetros:

```go
func userHandler(w http.ResponseWriter, r *http.Request) {
    id := r.URL.Query().Get("id")
    w.Write([]byte("User ID: " + id))
}
```

## Ejemplo avanzado

Uso de middlewares y logging:

```go
func loggingMiddleware(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        log.Printf("%s %s", r.Method, r.URL.Path)
        next.ServeHTTP(w, r)
    })
}
```

## Anti-patrones frecuentes

- No establecer el código de estado en la respuesta.
- No validar parámetros de entrada.
- No usar middlewares para logging o autenticación.

## Checklist de revisión

- [ ] ¿Se establecen los códigos de estado correctamente?
- [ ] ¿Se validan los parámetros de entrada?
- [ ] ¿Se usan middlewares para logging y seguridad?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **Handler:** Función que responde a una petición HTTP.
- **Middleware:** Función que envuelve handlers para añadir funcionalidad.

## Referencias

- [net/http package (GoDoc)](https://pkg.go.dev/net/http)
