---
applyTo: |
  **/Dockerfile
  **/Dockerfile.*
  **/*.Dockerfile
---

# 🐳 Instrucciones y Buenas Prácticas para Dockerfile

## Principios Fundamentales

- Utiliza imágenes base oficiales y versionadas (ej: `python:3.12-alpine`, no `latest`).
- Minimiza el tamaño de la imagen: elimina dependencias, herramientas y archivos innecesarios.
- Aprovecha el cache de capas: ordena las instrucciones desde las menos cambiantes a las más cambiantes para reducir tiempo de build.
- Usa `.dockerignore` para excluir archivos/carpetas no requeridos (logs, tests, docs, secretos, etc.).
- No copies archivos sensibles (secretos, llaves, `.env`) a la imagen.
- Utiliza un usuario no-root con la instrucción `USER` para mayor seguridad.
- Expón solo los puertos realmente necesarios con la instrucción `EXPOSE`.
- Documenta el propósito de cada paso complejo con comentarios en inglés.
- Usa multi-stage builds para separar dependencias de build y runtime si aplica.
- Utiliza la instrucción `HEALTHCHECK` en la imagen cuando sea relevante.
- Evita hardcodear variables de entorno sensibles en el Dockerfile; prioriza el uso de variables externas o mecanismos de secrets.
- Prevé la persistencia de datos mediante el uso de volúmenes, pero no los declares directamente en el Dockerfile (hazlo en Compose o comandos de ejecución).

---

## Manejo seguro de variables de entorno y secretos

- **No establezcas valores sensibles directamente en el Dockerfile** (ej: contraseñas, llaves).
- Usa la instrucción `ENV` solo para configuración no sensible o valores por defecto.
- Los valores sensibles deben ser provistos en tiempo de ejecución (Compose, `docker run`, mecanismos de secrets).
- Ejemplo correcto:
  ```dockerfile
  # BAD PRACTICE (avoid)
  ENV DB_PASSWORD=mysecret

  # GOOD PRACTICE
  ENV DB_HOST=database
  ENV DB_PORT=5432
  # DB_PASSWORD is provided at runtime via Compose or CLI
  ```

---

## Uso de HEALTHCHECK en Dockerfile

- Implementa `HEALTHCHECK` para definir cómo Docker verifica el estado de salud de tu contenedor.
- Esto mejora la orquestación y permite que Compose o Swarm gestionen reinicios y dependencias.
- Ejemplo:
  ```dockerfile
  HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1
  ```
- Si tu servicio expone un endpoint de salud, úsalo; de lo contrario, define un comando básico que refleje el funcionamiento real del proceso principal.

---

## Ejemplo de Dockerfile recomendado

```dockerfile
# Usa imagen oficial y versionada
FROM node:20-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia solo los archivos de dependencias para aprovechar cache
COPY package*.json ./

# Instala dependencias de producción
RUN npm ci --only=production

# Copia el resto del código fuente
COPY . .

# Define variables de entorno no sensibles
ENV NODE_ENV=production

# Configura healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=5 \
  CMD node healthcheck.js

# Utiliza un usuario no-root
USER node

# Expón solo el puerto necesario
EXPOSE 3000

# Comando por defecto
CMD ["node", "index.js"]
```

---

## Relación con Docker Compose y buenas prácticas conjuntas

- **Persistencia de datos:** No utilices `VOLUME` para datos de aplicación en el Dockerfile por defecto; define los volúmenes en Docker Compose, donde puedes controlar el destino y el ciclo de vida.
- **Exposición de puertos:** Usa solo `EXPOSE` para documentar puertos internos; la publicación real de puertos debe hacerse en Compose (con `ports`) según el entorno.
- **Variables sensibles:** Recuerda que deben gestionarse fuera del Dockerfile (Compose, secrets, archivos externos).

---

## Anti-patrones frecuentes

- Usar `FROM imagen:latest`.
- No usar `.dockerignore`.
- Copiar todo el contexto sin filtrar (`COPY . .`).
- Instalar dependencias y copiar código en un solo paso (pierde cache).
- Hardcodear secretos en `ENV` o en archivos copiados.
- No especificar usuario no-root.
- No documentar instrucciones complejas.
- Incluir archivos temporales, logs o credenciales en la imagen.
- Omitir `HEALTHCHECK` cuando el servicio lo permite.

---

## Checklist de revisión

- [ ] ¿La imagen base es oficial y versionada?
- [ ] ¿Se aprovecha el cache de capas (dependencias antes que código)?
- [ ] ¿Se utiliza `.dockerignore`?
- [ ] ¿No hay archivos sensibles/copias innecesarias?
- [ ] ¿Se especifica un usuario no-root?
- [ ] ¿Se usa `HEALTHCHECK` cuando es relevante?
- [ ] ¿Se expone solo el puerto necesario?
- [ ] ¿No se define información sensible en `ENV`?
- [ ] ¿Los pasos complejos están documentados?
- [ ] ¿La imagen es lo más pequeña posible?

---

## 📚 Referencias Oficiales

- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Docker Security Cheat Sheet (OWASP)](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html)
- [Docker Ignore Documentation](https://docs.docker.com/engine/reference/builder/#dockerignore-file)
- [HEALTHCHECK en Dockerfile](https://docs.docker.com/engine/reference/builder/#healthcheck)