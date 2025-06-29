# Ejemplos de aplicación: Docker Compose

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

Ejemplos prácticos de uso de Docker Compose para definir y orquestar servicios, aplicando buenas prácticas para equipos de todos los niveles.

## Ejemplo simple

Archivo Compose básico para una app web y base de datos:

```yaml
version: '3.8'
services:
  web:
    image: myapp:latest
    ports:
      - "8080:80"
  db:
    image: postgres:13
```

## Ejemplo intermedio

Incluye variables de entorno, volúmenes y dependencias:

```yaml
version: '3.8'
services:
  web:
    image: myapp:latest
    ports:
      - "8080:80"
    environment:
      - ENV=production
    depends_on:
      - db
  db:
    image: postgres:13
    volumes:
      - db_data:/var/lib/postgresql/data
    environment:
      - POSTGRES_PASSWORD=example
volumes:
  db_data:
```

## Ejemplo avanzado

Integración con Dockerfile, healthchecks y redes personalizadas:

```yaml
version: '3.8'
services:
  web:
    build: .
    ports:
      - "8080:80"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:80/health"]
      interval: 30s
      timeout: 10s
      retries: 3
    networks:
      - frontend
  db:
    image: postgres:13
    networks:
      - backend
networks:
  frontend:
  backend:
```

## Anti-patrones frecuentes

- No especificar versiones de servicios o imágenes.
- No usar volúmenes para persistencia.
- No definir healthchecks ni redes.

## Checklist de revisión

- [ ] ¿Se especifica la versión de Compose?
- [ ] ¿Se usan volúmenes y variables de entorno?
- [ ] ¿Se definen healthchecks y redes?
- [ ] ¿Se integran con Dockerfile cuando corresponde?
- [ ] ¿Se siguen las reglas de markdownlint?

## Glosario

- **Healthcheck:** Comprobación automática del estado de un servicio.
- **Volumen:** Almacenamiento persistente para datos de contenedores.
- **Red personalizada:** Red definida por el usuario para aislar servicios.

## Referencias

- [Documentación oficial de Docker Compose](https://docs.docker.com/compose/)
