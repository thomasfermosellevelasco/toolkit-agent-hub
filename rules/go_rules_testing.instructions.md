---
applyTo: '**'
---

# Go Testing Rules

Este archivo centraliza las reglas de testing en Go. Un buen testing asegura calidad, confianza y facilita la evolución del software.

## Principios
- Usa Given/When/Then en la estructura de los tests.
- Cada test debe ser independiente y explícito.
- Prohibido el uso de table-driven tests para lógica de negocio.
- Usa `require` para aserciones.
- Nombra los tests de forma descriptiva.

## Ejemplos

### Ejemplo inicial
```go
func TestAdd_Success(t *testing.T) {
    // Given
    a, b := 2, 3
    // When
    result := Add(a, b)
    // Then
    require.Equal(t, 5, result)
}
```

### Ejemplo intermedio
```go
func TestUserService_CreateUser_Error_EmptyName(t *testing.T) {
    // Given
    service := NewUserService()
    // When
    _, err := service.CreateUser("")
    // Then
    require.Error(t, err)
    require.ErrorIs(t, err, ErrInvalidName)
}
```

### Ejemplo avanzado
```go
func TestOrderHandler_Create_Success(t *testing.T) {
    // Given
    handler := NewOrderHandler(...)
    req := httptest.NewRequest("POST", "/orders", bytes.NewBufferString(`{"item":"book"}`))
    w := httptest.NewRecorder()
    // When
    handler.Create(w, req)
    // Then
    require.Equal(t, http.StatusCreated, w.Code)
}
```

## Anti-patrones
- ❌ Table-driven tests para lógica de dominio.
- ❌ Tests que dependen de otros tests.
- ❌ Nombres de test poco claros.

## Recomendaciones para equipos
- Usa factories y helpers para setup repetitivo.
- Revisa la cobertura y calidad en code reviews.
- Automatiza la ejecución de tests en CI/CD.

## Referencias cruzadas
- Para reglas de documentación, ver `go_rules_documentation.instructions.md`.
- Para reglas de DDD, ver `go_rules_ddd.instructions.md`.
