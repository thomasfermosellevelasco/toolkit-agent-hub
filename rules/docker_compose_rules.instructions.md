---
applyTo: |
  **/docker-compose*.yml
  **/docker-compose*.yaml
  **/compose.yml
  **/compose.yaml
  **/compose*.yml
  **/compose*.yaml
---

# 🐳 Instrucciones y Buenas Prácticas para Docker Compose

## Principios Fundamentales

- Usa nombres de servicios, redes y volúmenes claros y consistentes.
- Prioriza el uso de variables de entorno y secretos para gestionar credenciales y llaves.
- Prefiere el uso de `secrets` de Docker Compose sobre variables de entorno para información sensible, siempre que sea compatible con la imagen/servicio.
- Define redes (`networks`) explícitas para aislar servicios.
- Define volúmenes (`volumes`) explícitos para persistencia y reutilización de datos.
- No expongas puertos (`ports`) si los servicios solo se comunican entre contenedores; usa la red interna de Docker Compose.
- Limita recursos (`mem_limit`, `cpus`) cuando sea necesario.
- Usa `healthcheck` en servicios donde la imagen lo soporte para mejorar la resiliencia y la orquestación.
- Utiliza `depends_on` junto a `healthcheck` para controlar el arranque de servicios dependientes.
- **Configura la etiqueta `restart` de manera consciente y justificada en cada servicio.**
- **Aprovecha `profiles` para diferenciar ambientes (dev, test, prod) y evitar levantar servicios innecesarios.**
- Mantén los secretos y configuraciones sensibles fuera del archivo principal, usando archivos `.env` y/o mecanismos de Docker secrets.
- Separa configuraciones de override (`docker-compose.override.yml`) para ambientes específicos.
- Documenta servicios y opciones complejas con comentarios en inglés.

---

## Uso correcto de la etiqueta `restart`

La clave `restart` define la política de reinicio automático de los contenedores.  
**Buenas prácticas:**
- Usa `restart: unless-stopped` o `always` en servicios críticos que deben mantenerse activos.
- Prefiere `restart: on-failure` para bases de datos y servicios donde un fallo debe intentar resolverse, pero no debe ocultar errores de configuración.
- Evita `restart: always` en desarrollo, para no ocultar fallos graves.
- Documenta la razón de la política con comentarios.

**Ejemplo:**
```yaml
services:
  app:
    restart: unless-stopped  # Se reinicia siempre excepto si es detenido manualmente
  db:
    restart: on-failure      # Solo reintenta si el proceso termina con error
```
Más info: [Docker Compose restart policy](https://docs.docker.com/compose/compose-file/compose-file-v3/#restart)

---

## Uso de `profiles` para ambientes

`profiles` permite que ciertos servicios solo se activen en contextos específicos (desarrollo, test, depuración, etc.), mejorando la flexibilidad del archivo Compose.

**Ejemplo:**
```yaml
services:
  app:
    image: myapp:latest
    profiles: ["prod", "dev"]
  debug-tool:
    image: debug:latest
    profiles: ["dev"]
  monitoring:
    image: prom/prometheus:latest
    profiles: ["prod"]
```
**Comandos para levantar servicios de un perfil específico:**
```bash
# Solo servicios marcados como "dev"
docker compose --profile dev up

# Servicios de los perfiles "dev" y "monitoring"
docker compose --profile dev --profile monitoring up

# Todos los servicios (ignora los perfiles)
docker compose --profile "*" up
```
Más info: [Docker Compose profiles](https://docs.docker.com/compose/profiles/)

---

## Healthchecks

- Utiliza la clave `healthcheck` para definir cómo Docker Compose debe verificar el estado de un servicio.
- Asócialo a servicios críticos para evitar dependencias rotas y permitir reinicios automáticos.
- Ejemplo:
  ```yaml
  services:
    app:
      healthcheck:
        test: ["CMD", "curl", "-f", "http://localhost:8080/health"]
        interval: 30s
        timeout: 10s
        retries: 5
  ```

---

## Manejo seguro de variables y secretos

- **Variables de entorno (`environment`):** Úsalas para configuración no sensible.
- **Secrets:** Úsalos para contraseñas, llaves y tokens.  
  Ejemplo:
  ```yaml
  secrets:
    db_password:
      file: ./secrets/db_password.txt
  
  services:
    db:
      image: postgres:16-alpine
      secrets:
        - db_password
      environment:
        - POSTGRES_PASSWORD_FILE=/run/secrets/db_password
  ```
- **Evita poner secretos en texto plano** en los archivos de Compose o `.env`.

---

## Redes y Volúmenes

- Define redes personalizadas y asigna a cada servicio solo las necesarias.
- Declara y asigna volúmenes para persistencia de datos, evitando compartir volúmenes innecesariamente.

---

## Ejemplo de docker-compose.yml recomendado

```yaml
services:
  app:
    build: .
    networks:
      - backend
      - frontend
    environment:
      - NODE_ENV=production
    depends_on:
      db:
        condition: service_healthy
    volumes:
      - ./logs:/app/logs
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8080/health"]
      interval: 30s
      timeout: 10s
      retries: 5
    restart: unless-stopped
    profiles: ["dev", "prod"]
    # No expone puertos externos innecesarios

  db:
    image: postgres:16-alpine
    environment:
      - POSTGRES_USER=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db_password
    volumes:
      - db_data:/var/lib/postgresql/data
    networks:
      - backend
    restart: on-failure
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U example"]
      interval: 30s
      timeout: 5s
      retries: 5
    secrets:
      - db_password
    profiles: ["prod"]
    # No expone puertos a la red externa

networks:
  backend:
  frontend:

volumes:
  db_data:

secrets:
  db_password:
    file: ./secrets/db_password.txt
```

---

## Ejemplos de comandos útiles

```bash
# Levantar todos los servicios (archivo por defecto)
docker compose up

# Levantar servicios de un perfil (ejemplo: dev)
docker compose --profile dev up

# Especificar archivo Compose alternativo
docker compose -f compose.dev.yml up

# Levantar en modo "detached" (background)
docker compose up -d

# Parar y eliminar contenedores, redes y volúmenes anónimos
docker compose down

# Ver logs de un servicio específico
docker compose logs app

# Ejecutar un comando en un contenedor de servicio
docker compose exec app bash

# Listar servicios y su estado
docker compose ps
```

---

## Anti-patrones frecuentes

- Definir credenciales en texto plano.
- No usar volúmenes para datos persistentes.
- Montar la raíz del proyecto en producción.
- Exponer puertos innecesarios o sensibles (por ejemplo, base de datos accesible desde fuera).
- No declarar dependencias (`depends_on`).
- No definir redes, dejando todos los servicios en la red por defecto.
- Compartir volúmenes entre servicios que no lo requieren.
- No usar healthchecks en servicios críticos.
- No utilizar mecanismos de secrets para información sensible.
- Uso incorrecto de la etiqueta `restart` (por ejemplo, `always` en servicios que deberían fallar rápido en desarrollo).
- No aprovechar `profiles` para separar ambientes.

---

## Checklist de revisión

- [ ] ¿Se están usando nombres claros para servicios, redes y volúmenes?
- [ ] ¿Se usan variables de entorno y/o secrets para credenciales/llaves?
- [ ] ¿Los secretos están fuera de los archivos de Compose y `.env`?
- [ ] ¿Los volúmenes y redes están explícitamente definidos?
- [ ] ¿No se exponen puertos innecesarios?
- [ ] ¿Se limita el acceso a recursos si aplica?
- [ ] ¿Se usan healthchecks en servicios críticos?
- [ ] ¿Se usa depends_on con condición de healthcheck cuando aplica?
- [ ] ¿Se aprovechan profiles y/o archivos override?
- [ ] ¿Se usa la etiqueta `restart` de forma justificada y documentada?
- [ ] ¿Los comentarios son claros y en inglés?
- [ ] ¿No hay secretos ni configuraciones sensibles en claro?

---

## Versión del schema

> ⚠️ **Nota:**  
> En versiones recientes de Docker Compose (v1.27.0+), el campo `version` es opcional y se recomienda omitirlo salvo que se requiera compatibilidad con versiones antiguas.  
> **Consulta con tu equipo qué versión de Compose utilizan**. Si necesitas compatibilidad hacia atrás, incluye `version: "3.9"` en el tope del archivo.

---

## 📚 Referencias Oficiales

- [Compose file reference](https://docs.docker.com/compose/compose-file/)
- [Best practices with Compose](https://docs.docker.com/compose/best-practices/)
- [Docker Compose CLI Documentation](https://docs.docker.com/compose/reference/)
- [Docker Environment Variables](https://docs.docker.com/compose/environment-variables/)
- [Redes en Docker Compose (Networking)](https://docs.docker.com/compose/networking/)
- [Persistencia de datos y volúmenes](https://docs.docker.com/storage/volumes/)
- [Docker Compose Healthcheck](https://docs.docker.com/compose/compose-file/compose-file-v3/#healthcheck)
- [Uso de Secrets en Compose](https://docs.docker.com/compose/use-secrets/)
- [Docker Compose restart policy](https://docs.docker.com/compose/compose-file/compose-file-v3/#restart)
- [Docker Compose profiles](https://docs.docker.com/compose/profiles/)