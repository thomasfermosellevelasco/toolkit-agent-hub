# Ejemplos de aplicación: Testing en Go

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

Buenas prácticas para testing en Go, desde tests unitarios básicos hasta técnicas avanzadas y cobertura.

## Ejemplo simple

Test unitario básico:

```go
func TestAdd(t *testing.T) {
    result := Add(2, 3)
    if result != 5 {
        t.Errorf("expected 5, got %d", result)
    }
}
```

## Ejemplo intermedio

Tests con tablas de datos (table-driven tests):

```go
type testCase struct {
    a, b, want int
}

func TestAddCases(t *testing.T) {
    cases := []testCase{
        {2, 3, 5},
        {0, 0, 0},
        {-1, 1, 0},
    }
    for _, c := range cases {
        got := Add(c.a, c.b)
        if got != c.want {
            t.Errorf("Add(%d, %d) = %d; want %d", c.a, c.b, got, c.want)
        }
    }
}
```

## Ejemplo avanzado

Cobertura y mocks:

```go
//go:generate mockgen -source=service.go -destination=mock_service.go -package=service
```

## Anti-patrones frecuentes

- No usar nombres estándar para tests.
- No cubrir casos límite.
- No usar mocks para dependencias externas.

## Checklist de revisión

- [ ] ¿Se usan nombres estándar para los tests?
- [ ] ¿Se cubren casos límite y de error?
- [ ] ¿Se usan mocks cuando corresponde?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **Table-driven test:** Técnica para probar múltiples casos con una sola función.
- **Mock:** Objeto simulado para pruebas.

## Referencias

- [Testing techniques (Go Blog)](https://blog.golang.org/table-driven-tests)
