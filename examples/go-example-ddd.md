# Ejemplos de aplicación: DDD en Go

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

Ejemplos de aplicación de Domain-Driven Design (DDD) en Go, desde la estructura básica hasta la integración avanzada.

## Ejemplo simple

Entidad y repositorio básico:

```go
// User is an aggregate root in the domain layer.
type User struct {
    ID   string
    Name string
}

type Repository interface {
    Save(user *User) error
    FindByID(id string) (*User, error)
}
```

## Ejemplo intermedio

Separación de capas y uso de interfaces:

```go
// Dominio
package user

type User struct {
    ID   string
    Name string
}

type Repository interface {
    Save(user *User) error
    FindByID(id string) (*User, error)
}

// Infraestructura
package userinfra

type InMemoryRepository struct {
    users map[string]*user.User
}
```

## Ejemplo avanzado

Integración con tests, inyección de dependencias y persistencia:

```go
// Test de integración con repositorio
func TestUserRepository(t *testing.T) {
    repo := userinfra.InMemoryRepository{users: map[string]*user.User{}}
    user := &user.User{ID: "1", Name: "Alice"}
    err := repo.Save(user)
    if err != nil {
        t.Fatal(err)
    }
    got, err := repo.FindByID("1")
    if err != nil || got.Name != "Alice" {
        t.Fatal("user not found or name mismatch")
    }
}
```

## Anti-patrones frecuentes

- Todo en un solo archivo, sin separación de capas.
- No usar interfaces para repositorios.
- Acoplamiento entre dominio e infraestructura.

## Checklist de revisión

- [ ] ¿Se separan dominio, infraestructura y aplicación?
- [ ] ¿Se usan interfaces para repositorios?
- [ ] ¿Se aplican tests de integración?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **Agregado:** Entidad raíz que agrupa objetos relacionados.
- **Repositorio:** Abstracción para persistencia de entidades.
- **Inyección de dependencias:** Técnica para desacoplar componentes.

## Referencias

- [Domain-Driven Design en Go (Go Patterns)](https://github.com/Sairyss/domain-driven-hexagon)
- [DDD Reference (Vaughn Vernon)](https://dddcommunity.org/learning-ddd/)
