---
applyTo: |
  **/*.md
  **/*.markdown
---

# 📝 Instrucciones y Buenas Prácticas para Markdown

## Principios Fundamentales

- Utiliza Markdown para documentación técnica y general, asegurando claridad y legibilidad para toda la audiencia (desde trainees hasta Project Leads o Technical Leads, con o sin contexto previo).
- Los lectores pueden carecer de contexto previo: añade información enriquecida, descripciones detalladas o referencias externas para facilitar la comprensión y el onboarding.
- Sigue las reglas de [markdownlint](https://github.com/DavidAnson/markdownlint) para mantener la coherencia y calidad.
- Prioriza la estructura y el orden lógico del contenido mediante encabezados claros, listas, tablas y bloques de código.
- Emplea enlaces y referencias a documentación oficial o externa siempre que aporte valor.
- Usa imágenes y diagramas para complementar y facilitar la comprensión, preferiblemente con [Mermaid](https://mermaid-js.github.io/) o [PlantUML](https://plantuml.com/), y recurre a gráficos de texto solo si los anteriores no son viables.
- Mantén un lenguaje claro, conciso, profesional e inclusivo.
  - Evita jerga ambigua o demasiado local, salvo que el documento esté dirigido a una audiencia específica y contextualizada.
  - Si el equipo es diverso o internacional (por ejemplo, con integrantes de Argentina, México, España u otros países), prefiere expresiones neutras y ejemplos comprensibles para hispanohablantes de distintos países.
  - Adapta el nivel de formalidad y los ejemplos al contexto y cultura del equipo, priorizando la claridad y la inclusión.
- **No incluyas información sensible, credenciales o datos privados en los documentos. Si por algún motivo es necesario referenciar datos sensibles, enmascáralos (ej: `****`, `<token>`, `<clave>`) y advierte explícitamente que es un valor sensible.**
- Usa emojis de apoyo cuando aporten visualización o llamados de atención, pero nunca como único medio para transmitir información importante.

---

## Estructura recomendada

```markdown
# Título principal

## Índice
- [Resumen](#resumen)
- [Contenido](#contenido)
- [Diagramas y gráficos](#diagramas-y-gráficos)
- [Anti-patrones frecuentes](#anti-patrones-frecuentes)
- [Checklist de revisión](#checklist-de-revisión)

## Resumen
Breve descripción del propósito o contexto.

## Contenido
- Punto clave 1
- Punto clave 2

### Subtítulo o sección específica

Texto descriptivo.

#### Ejemplo de bloque de código
```bash
comando o fragmento de código
```

#### Ejemplo de tabla

| Encabezado 1 | Encabezado 2 |
|--------------|--------------|
| Valor 1      | Valor 2      |

#### Ejemplo de lista
- Elemento 1
- Elemento 2

#### Ejemplo de cita
> Este es un bloque de cita o nota importante.

#### Ejemplo de advertencia (admonition)
> ⚠️ **Advertencia:** Ten cuidado con...

#### Ejemplo de enlace
[Texto del enlace](https://enlace.com)

#### Ejemplo de imagen
![Descripción de la imagen significativa](ruta/o/url/de/la/imagen.png)

#### Ejemplo de información sensible enmascarada
```env
API_KEY=****
DB_PASSWORD=<clave>
```
> ℹ️ **Nota:** Los valores sensibles están enmascarados y nunca deben incluirse en texto plano en la documentación.

#### Enlaces internos
[Ir a la sección de Diagramas y gráficos](#diagramas-y-gráficos)

```

---

## Contexto y enriquecimiento para la audiencia

- La documentación debe ser comprensible tanto para perfiles junior (trainee) como para roles senior (Project Lead, Technical Lead, etc.), incluyendo aquellos que pueden no estar contextualizados.
- Valida si el lector probablemente cuenta con el contexto necesario. Si no es así, agrega secciones introductorias, referencias, diagramas explicativos o glosarios.
- Ejemplo de advertencia sobre falta de contexto:
  > ℹ️ **Nota:** Si no estás familiarizado con el flujo de despliegue, revisa primero la sección "Visión General del Proceso" y el glosario al final de este documento.
- Incluye enlaces internos (índices, referencias a secciones) y externos (documentación oficial, tutoriales) para facilitar la profundización según el perfil y la necesidad del lector.
- Si un concepto es clave para la comprensión y no es trivial, explícalo brevemente o enlaza a su definición.

---

## Accesibilidad y usabilidad

- Usa texto alternativo descriptivo y significativo en todas las imágenes (`![Descripción accesible](url)`).
- Prefiere tablas simples y evita tablas complejas salvo necesidad justificada.
- Mantén líneas de texto cortas (máximo 120 caracteres) y cuida el espaciado.
- No uses emojis, colores o formato como único medio para indicar información importante.
- Mantén siempre una jerarquía lógica y progresiva en los encabezados (no saltar de H1 a H3 sin pasar por H2).
- Si el documento es extenso, incluye un índice de contenidos al principio y usa enlaces internos.

---

## Consistencia visual y de estilo

- Mantén un estilo visual consistente:
  - Formato de encabezados homogéneo.
  - Sangrías y espaciados claros en listas y bloques de código.
  - No mezcles idiomas en el mismo documento.
  - Adapta el tono y el registro lingüístico según el público objetivo, considerando diferencias regionales (por ejemplo, entre Argentina, México, España). Cuando el público sea mixto o internacional, usa lenguaje neutro y evita expresiones demasiado locales.
- Si usas términos técnicos, acrónimos o nombres propios, mantenlos uniformes a lo largo del documento y, si es necesario, crea un glosario al final.
- Si usas imágenes externas o diagramas generados por terceros, cita siempre la fuente o autoría.

---

## Estructura y colaboración

- Utiliza pull requests para cambios en la documentación y revisa ortografía y gramática antes de aprobar.
- Si la documentación cambia frecuentemente, incluye un historial de cambios o un enlace a un "Changelog".
- Si hay términos técnicos recurrentes o conceptos clave, mantén un glosario común al final del archivo o enlaza a uno centralizado.

---

## Diagramas y gráficos

- **Mermaid:**  
  Úsalo para flujos, diagramas de secuencia, Gantt, árboles, etc.
  ```mermaid
  graph TD
      A[Inicio] --> B{¿Condición?}
      B -- Sí --> C[Acción 1]
      B -- No --> D[Acción 2]
  ```
- **PlantUML:**  
  Alternativa para diagramas más avanzados.
  ```plantuml
  @startuml
  Alice -> Bob: Hola Bob
  Bob --> Alice: Hola Alice
  @enduml
  ```
- **Gráficos de texto:**  
  Solo si no es posible usar Mermaid o PlantUML.
  ```
  +------+
  | Node |
  +------+
     |
  +------+
  | End  |
  +------+
  ```

---

## Anti-patrones frecuentes

- Encabezados desordenados o sin jerarquía adecuada (saltos de H1 a H3, etc.).
- Listas y tablas mal formateadas.
- Líneas excesivamente largas (más de 120 caracteres).
- Uso excesivo de mayúsculas, negrita o subrayado.
- Información sensible, credenciales o datos privados en texto plano (no enmascarados o sin advertencia).
- Falta de referencias, enlaces rotos o imágenes sin descripción.
- Mala estructura o ausencia de índice en documentos extensos.
- Diagramas solo como imágenes estáticas cuando pueden ser editables (usar Mermaid/PlantUML).
- No seguir las reglas de markdownlint.
- Documentos que asumen demasiado contexto y no explican conceptos clave para nuevos integrantes.
- No mantener un estilo visual y de formato homogéneo a lo largo del documento.
- Uso de glosarios o términos técnicos inconsistentes o ausentes.
- Uso de jerga local o expresiones regionales que no sean comprensibles para toda la audiencia, salvo casos justificados.

---

## Checklist de revisión

- [ ] ¿El documento tiene una estructura lógica y encabezados claros?
- [ ] ¿Incluye un índice de contenidos si el documento es extenso?
- [ ] ¿Se utilizan listas, tablas, citas y bloques de código cuando corresponde?
- [ ] ¿Se siguen las reglas de markdownlint?
- [ ] ¿Los diagramas usan Mermaid o PlantUML si es posible?
- [ ] ¿No contiene información sensible ni credenciales en texto plano? (¿Los valores sensibles están enmascarados y advertidos?)
- [ ] ¿Las imágenes tienen texto alternativo descriptivo y significativo?
- [ ] ¿Los enlaces y referencias funcionan correctamente?
- [ ] ¿El lenguaje es claro, profesional, inclusivo y adaptado a la audiencia? ¿Se evita jerga local innecesaria?
- [ ] ¿No hay saltos indebidos en la jerarquía de encabezados?
- [ ] ¿Incluye contexto o referencias para usuarios sin conocimiento previo?
- [ ] ¿Se advierte cuando puede faltar contexto y se añaden referencias o explicaciones introductorias?
- [ ] ¿Se mantiene un estilo visual y de formato homogéneo?
- [ ] ¿Existe glosario si hay términos técnicos recurrentes?
- [ ] ¿Se cita la fuente de imágenes externas o diagramas de terceros?
- [ ] ¿Se revisa ortografía y gramática antes de aprobar PRs?
- [ ] ¿Se incluye historial de cambios si la documentación es cambiante?

---

## 📚 Referencias Oficiales y Recursos

- [Guía de estilo de Markdownlint](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md)
- [Markdown Guide](https://www.markdownguide.org/)
- [Mermaid Live Editor](https://mermaid.live/)
- [PlantUML Online Server](https://www.plantuml.com/plantuml/)
- [Documentación oficial de Markdown (GitHub)](https://docs.github.com/en/get-started/writing-on-github)