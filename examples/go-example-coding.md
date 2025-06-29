# Ejemplos de aplicación: Reglas de codificación en Go

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

Ejemplos prácticos de buenas prácticas de codificación en Go, útiles para todos los niveles de experiencia.

## Ejemplo simple

Función y estructura idiomáticas:

```go
// Add sums two integers and returns the result.
func Add(a int, b int) int {
    return a + b
}

// User represents a user in the system.
type User struct {
    ID   string
    Name string
}
```

## Ejemplo intermedio

Uso de paquetes, visibilidad y comentarios:

```go
// Package mathutils provides math utilities.
package mathutils

// Multiply returns the product of two integers.
func Multiply(a, b int) int {
    return a * b
}
```

## Ejemplo avanzado

Aplicación de interfaces y composición:

```go
// Stringer is an interface for types that can describe themselves as a string.
type Stringer interface {
    String() string
}

// User implements Stringer.
func (u User) String() string {
    return u.Name
}
```

## Anti-patrones frecuentes

- Comentarios en español o poco claros.
- Nombres de funciones o variables no idiomáticos.
- Todo el código en un solo archivo.

## Checklist de revisión

- [ ] ¿Los nombres y comentarios están en inglés?
- [ ] ¿Se usan paquetes y visibilidad correctamente?
- [ ] ¿Se aplican interfaces y composición cuando corresponde?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **Paquete:** Unidad de organización de código en Go.
- **Visibilidad:** Control de acceso a funciones/variables (mayúscula = público).
- **Interface:** Contrato que define métodos que un tipo debe implementar.

## Referencias

- [Effective Go](https://go.dev/doc/effective_go)
- [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
