---
applyTo: '**'
---

# Go Coding Style Rules

Este archivo contiene reglas de estilo, organización y convenciones de código en Go. Su objetivo es asegurar la legibilidad, mantenibilidad y escalabilidad del código en equipos de cualquier tamaño.

## Principios
- Usa nombres descriptivos y consistentes para variables, funciones y tipos.
- Organiza los paquetes por dominio y responsabilidad, evitando paquetes genéricos como `utils` o `common`.
- Prefiere la standard library siempre que sea posible.
- Inyecta dependencias por interfaz, no por tipo concreto.
- Mantén funciones y métodos cortos y con una sola responsabilidad.
- Evita el uso de variables globales.

## Ejemplos

### Ejemplo inicial
```go
// Bad: nombre poco claro y función hace varias cosas
func DoIt(a, b int) int {
    log.Println("sumando")
    return a + b
}

// Good: nombre claro y función con única responsabilidad
func Add(a, b int) int {
    return a + b
}
```

### Ejemplo intermedio
```go
// Bad: paquete genérico y función sin contexto
package utils

func Process(data string) string {
    // ...
}

// Good: paquete específico y función contextualizada
package payment

func FormatAmount(amount float64) string {
    // ...
}
```

### Ejemplo avanzado
```go
// Inyección de dependencias por interfaz

type Logger interface {
    Info(msg string)
    Error(msg string)
}

type PaymentService struct {
    logger Logger
}

func NewPaymentService(logger Logger) *PaymentService {
    return &PaymentService{logger: logger}
}
```

## Anti-patrones
- ❌ Nombres genéricos: `data`, `info`, `manager`.
- ❌ Funciones que hacen más de una cosa.
- ❌ Uso de variables globales para compartir estado.
- ❌ Paquetes "catch-all" como `common` o `helpers`.

## Recomendaciones para equipos
- Realiza code reviews enfocados en claridad y consistencia.
- Documenta las convenciones adoptadas y revisa periódicamente.
- Automatiza el formateo y linting con herramientas como `gofmt` y `golangci-lint`.

## Referencias cruzadas
- Para reglas globales, ver `go_rules_global.instructions.md`.
- Para DDD, ver `go_rules_ddd.instructions.md`.
