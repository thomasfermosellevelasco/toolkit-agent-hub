# Ejemplos de aplicación: Reglas globales para Go

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

Buenas prácticas para la organización de proyectos Go, desde la estructura básica hasta la modularización avanzada.

## Ejemplo simple

Estructura mínima recomendada:

```text
myapp/
├── cmd/
│   └── myapp/
│       └── main.go
```

## Ejemplo intermedio

Separación de lógica interna y utilidades:

```text
myapp/
├── cmd/
│   └── myapp/
│       └── main.go
├── internal/
│   └── user/
│       └── service.go
```

## Ejemplo avanzado

Proyecto modularizado y reutilizable:

```text
myapp/
├── cmd/
│   └── myapp/
│       └── main.go
├── internal/
│   └── user/
│       └── service.go
├── pkg/
│   └── utils/
│       └── math.go
```

## Anti-patrones frecuentes

- Todo en la raíz del proyecto.
- No separar lógica interna de utilidades.
- No usar carpetas estándar (`cmd`, `internal`, `pkg`).

## Checklist de revisión

- [ ] ¿Se usa la estructura estándar de carpetas?
- [ ] ¿Se separa la lógica interna de utilidades?
- [ ] ¿El proyecto es modular y escalable?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **cmd:** Carpeta para los entrypoints de la aplicación.
- **internal:** Lógica interna no exportada a otros proyectos.
- **pkg:** Paquetes reutilizables por otros proyectos.

## Referencias

- [Standard Go Project Layout](https://github.com/golang-standards/project-layout)
