# Ejemplos de aplicación: Documentación en Go

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

Buenas prácticas para documentar código Go, desde comentarios básicos hasta documentación avanzada y generación automática.

## Ejemplo simple

Comentario de función y paquete:

```go
// Package mathutils provides utility math functions.
package mathutils

// Multiply returns the product of two integers.
func Multiply(a, b int) int {
    return a * b
}
```

## Ejemplo intermedio

Documentación de estructuras y métodos:

```go
// User represents a user in the system.
type User struct {
    ID   string
    Name string
}

// String returns the user's name.
func (u User) String() string {
    return u.Name
}
```

## Ejemplo avanzado

Generación de documentación automática con GoDoc y ejemplos de uso:

```go
// ExampleAdd muestra cómo usar la función Add.
func ExampleAdd() {
    fmt.Println(Add(2, 3))
    // Output: 5
}
```

## Anti-patrones frecuentes

- Comentarios en español o poco claros.
- No documentar paquetes ni funciones públicas.
- No usar ejemplos en la documentación.

## Checklist de revisión

- [ ] ¿Los comentarios están en inglés y son claros?
- [ ] ¿Se documentan paquetes, funciones y estructuras públicas?
- [ ] ¿Se incluyen ejemplos de uso?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **GoDoc:** Herramienta para generar documentación a partir de comentarios.
- **Ejemplo de uso:** Fragmento de código que muestra cómo utilizar una función.

## Referencias

- [GoDoc: documenting Go code](https://blog.golang.org/godoc)
