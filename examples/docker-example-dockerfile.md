# Ejemplos de aplicación: Dockerfile

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

Este documento muestra ejemplos prácticos de buenas prácticas y anti-patrones en la creación de Dockerfiles, aplicando las reglas del repositorio y facilitando la comprensión para perfiles desde trainee hasta Technical Lead.

## Ejemplo simple

Construcción básica de una imagen Go usando multi-stage build para reducir el tamaño y mejorar la seguridad.

```dockerfile
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp

FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/myapp .
CMD ["./myapp"]
```

## Ejemplo intermedio

Incluye manejo de dependencias, variables de entorno y exposición de puertos.

```dockerfile
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN go build -o myapp

FROM alpine:3.18
WORKDIR /app
ENV ENV=production
COPY --from=builder /app/myapp .
EXPOSE 8080
CMD ["./myapp"]
```

## Ejemplo avanzado

Integración con Docker Compose y automatización de tests en el build.

```dockerfile
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go test ./... && go build -o myapp

FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/myapp .
HEALTHCHECK --interval=30s --timeout=3s CMD ./myapp health || exit 1
CMD ["./myapp"]
```

## Anti-patrones frecuentes

```dockerfile
FROM golang:latest
COPY . .
RUN go build -o myapp
CMD ["./myapp"]
```

*Problemas: imagen pesada, sin separación de etapas, sin control de versiones, mayor superficie de ataque.*

## Checklist de revisión

- [ ] ¿El Dockerfile usa multi-stage build?
- [ ] ¿Se especifican versiones de las imágenes base?
- [ ] ¿Se minimiza la superficie de ataque?
- [ ] ¿Se usan variables de entorno y puertos explícitos?
- [ ] ¿Se evita copiar archivos innecesarios?
- [ ] ¿Se siguen las reglas de markdownlint?
- [ ] ¿Incluye referencias y enlaces útiles?

## Glosario

- **Multi-stage build**: Técnica para reducir el tamaño de la imagen final usando varias etapas en el Dockerfile.
- **Superficie de ataque**: Conjunto de puntos vulnerables en una imagen o sistema.
- **HEALTHCHECK**: Instrucción para definir chequeos de salud automáticos en el contenedor.

## Referencias

- [Best practices for writing Dockerfiles (Docker Docs)](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Documentación oficial de Docker](https://docs.docker.com/engine/reference/builder/)
- [Guía de estilo de Markdownlint](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md)

> ℹ️ **Nota:** Si no estás familiarizado con Docker o multi-stage builds, revisa primero la [documentación oficial de Docker](https://docs.docker.com/get-started/).
