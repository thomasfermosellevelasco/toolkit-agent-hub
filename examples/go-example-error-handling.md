# Ejemplos de aplicación: Manejo de errores en Go

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

Buenas prácticas para el manejo de errores en Go, desde la verificación básica hasta la propagación y registro avanzado.

## Ejemplo simple

Verificación y retorno inmediato de errores:

```go
result, err := db.Query("SELECT * FROM users")
if err != nil {
    return err
}
```

## Ejemplo intermedio

Registro de errores y contexto adicional:

```go
result, err := db.Query("SELECT * FROM users")
if err != nil {
    log.Printf("query failed: %v", err)
    return err
}
```

## Ejemplo avanzado

Propagación de errores personalizados y wrapping:

```go
if err != nil {
    return fmt.Errorf("failed to query users: %w", err)
}
```

## Anti-patrones frecuentes

- Ignorar errores usando `_`.
- No registrar ni propagar errores.
- No agregar contexto a los errores.

## Checklist de revisión

- [ ] ¿Se verifica y retorna el error inmediatamente?
- [ ] ¿Se registran los errores relevantes?
- [ ] ¿Se agrega contexto al propagar errores?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **Wrapping:** Encapsular un error original en uno nuevo con contexto adicional.
- **Propagación:** Retornar el error a la función llamante.

## Referencias

- [Error handling and Go](https://blog.golang.org/error-handling-and-go)
