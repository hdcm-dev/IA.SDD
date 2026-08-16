# Reglas constructivas — README raíz de la unidad de entrega

**Carpeta target:** `SDD/Docs/`
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Producto
**Archivo target:** `SDD/Docs/README.md`
**Subagente target del orquestador:** Arquitecto de Soluciones Senior (AG-ROOT)
**Versión de las reglas:** 5.4

---

## 1. Especialidad asignada

### 1.1 Especialidad base

Arquitecto de Soluciones Senior, equivalente al AG-ROOT del catálogo de especialidades. Su rol es garantizar la coherencia integral del producto desde una perspectiva sistémica, asegurando que el README raíz funcione como punto de entrada efectivo, narrativa técnica ejecutiva, presentación de la jerarquía de unidades de entrega y mapa navegable hacia la documentación de cada unidad de entrega y del producto. Su responsabilidad no es producir contenido de detalle (eso corresponde a los AG-00 a AG-11), sino integrar, vincular y validar la coherencia transversal entre las unidades de entrega del producto. Su alcance abarca: definición de la estructura documental, redacción del README maestro, presentación de la tabla de unidades de entrega con su tipo D8 y dependencias, validación de enlaces internos, diseño del flujo de lectura por rol de intervención y alineación entre la visión del producto y la organización de las carpetas.

### 1.2 Variantes según tipo de unidad de entrega

| Tipo de unidad de entrega (D8) | Especialidad específica | Justificación |
| --- | --- | --- |
| library | Arquitecto de Soluciones + Curador de Librería | El README debe priorizar instalación, API pública, ejemplos de consumo y compatibilidad semántica. |
| web-monolith | Arquitecto de Soluciones Senior | Estructura clásica; el énfasis está en flujos funcionales y onboarding general. |
| web-microservices | Arquitecto de Soluciones + Arquitecto Distribuido | Requiere mapa de servicios, diagrama de despliegue y matriz de contratos entre componentes. |
| desktop-app | Arquitecto de Soluciones + Especialista Cross-Platform | Debe declarar compatibilidad por sistema operativo, empaquetado y dependencias nativas. |
| mobile-app-maui | Arquitecto de Soluciones + Mobile Lead | Foco en plataformas objetivo, ciclo de publicación en tiendas y permisos del dispositivo. |
| rest-api | Arquitecto de Soluciones + API Designer | Énfasis en quick-start de consumo, autenticación, versionado de endpoints y referencia OpenAPI. |
| cli-tool | Arquitecto de Soluciones + CLI Designer | El README es la primera ayuda visible; debe contener instalación, comandos y ejemplos de uso. |
| worker-service | Arquitecto de Soluciones + Streaming/Event Engineer | Requiere descripción del modelo de eventos, fuentes, sinks y reintentos. |

El orquestador lee esta tabla y selecciona la variante según el `tipo_unidad_entrega` de la unidad de entrega principal del producto (leído del manifiesto), porque el README raíz se genera una vez a nivel producto.

### 1.3 Multi-especialidad

Cuando el README raíz necesita atender roles de intervención mixtos, se admite combinar AG-ROOT con el Technical Writer (AG-11) para refinar la narrativa orientada a desarrollador externo, y con el Analista de Negocio (AG-01) para validar que la propuesta de valor expuesta en la sección de identidad coincide con la visión declarada en `SDD/Docs/00-Contexto/`. En unidades de entrega `library` y `cli-tool` se recomienda incorporar a AG-10 (Developer Advocate) para curar el bloque de quick-start. La regla es: AG-ROOT mantiene la propiedad del documento; las multi-especialidades aportan revisión y enmienda, no autoría compartida.

---

## 2. Documentos que produce esta categoría

### 2.1 Tabla maestra de documentos

| Archivo | Obligatorio para | Recomendado para | Omitir para | Descripción |
| --- | --- | --- | --- | --- |
| `SDD/Docs/README.md` | Todos los tipos D8 | — | — | Punto de entrada de la documentación de la unidad de entrega y ancla del árbol SDD. |
| `SDD/Docs/CHANGELOG.md` | library, rest-api, cli-tool | web-monolith, web-microservices, worker-service, desktop-app, mobile-app-maui | — | Bitácora de cambios con relevancia para integradores externos. |
| `SDD/Docs/CONTRIBUTING.md` | library, cli-tool | rest-api, worker-service | web-monolith | Guía de contribución cuando la unidad de entrega admite aportes externos. |
| `SDD/Docs/LICENSE.md` | library, cli-tool | rest-api | — | Texto de licencia visible desde el árbol de documentación. |

### 2.2 Reglas de inclusión/exclusión por tipo de unidad de entrega

El README raíz es siempre obligatorio. Lo que varía es la presencia de bloques internos según el tipo:

- `library`: incluye sección de instalación, API pública y compatibilidad de versiones.
- `web-monolith`: incluye flujos de negocio principales y enlace a la guía de despliegue.
- `web-microservices`: incluye listado de servicios y diagrama de interacción.
- `desktop-app`: incluye matriz de sistemas operativos soportados y empaquetadores.
- `mobile-app-maui`: incluye plataformas objetivo, versiones mínimas y ciclo de publicación.
- `rest-api`: incluye quick-start con `curl`, autenticación y referencia al contrato.
- `cli-tool`: incluye instalación, comandos principales y ejemplos.
- `worker-service`: incluye fuentes y sinks de eventos, política de reintentos y observabilidad.

Los archivos `CHANGELOG.md`, `CONTRIBUTING.md` y `LICENSE.md` se incluyen en `SDD/Docs/` solo cuando la unidad de entrega requiere comunicación con integradores externos al equipo.

---

## 3. Nomenclatura y vinculación

### 3.1 Patrón de nombres

El archivo es `README.md` literal, sin versión en el nombre. El versionado vive en la cabecera del documento mediante el campo `Versión` y se actualiza siguiendo la regla D5 (inicio en v1.0). Los archivos satélite mencionados en §2.1 también van en mayúsculas convencionales: `CHANGELOG.md`, `CONTRIBUTING.md`, `LICENSE.md`.

**Al archivarse, el README raíz sí recibe el sufijo de versión**: `_legacy/<YYYY-MM-DD>/README-v<X.Y>.md`, con la versión tomada de su cabecera. El nombre estable rige para el archivo vivo, que es el punto de entrada del árbol; sin sufijo en el snapshot, dos archivados del mismo artefacto colisionan y el segundo sobrescribe al primero sin error. La regla completa, con su tabla de exenciones, vive en `Master-Prompt.md` §5.1. De los tres archivos satélite, `CHANGELOG.md` está exento por acumulativo; `CONTRIBUTING.md` y `LICENSE.md` siguen la regla del README.

### 3.2 Convenciones de prefijos / sufijos

El propio README raíz no usa prefijos. Para los archivos linkeados desde el README, se respetan los patrones canónicos de las 12 categorías:

- `NB-XXXXX-<Nombre>.md` (necesidades de negocio).
- `CU-XXXXX-<Nombre>.md` (casos de uso).
- `RN-XXXXX-<Nombre>.md` (reglas de negocio).
- `ADR-XXXXX-<Nombre>.md` (decisiones de arquitectura).
- `US-XXXXX-<Nombre>.md` (historias de usuario).
- `BT-XXXXX-<Nombre>.md` (backlog técnico).
- `sprint-XX-<Nombre>.md` (planes de sprint).
- `ejemplo-XXXXX-<Nombre>.md` (ejemplos progresivos).

Todos los nombres respetan Título-Con-Guiones estricto (D3) y sufijo de versión con guion medio (D4).

### 3.3 Vinculación cross-doc (trazabilidad upstream/downstream)

- Upstream: el README raíz consume `PRODUCT-MANIFEST` y `PRODUCT-INTAKE` producidos en la fase de intake. De allí extrae el nombre del producto, la propuesta de valor, la enumeración de proyectos de código con su tipo D8 y dependencias, y los stacks declarados.
- Downstream: el README raíz enlaza a las categorías de nivel producto (`00-Contexto`, `01-Necesidades-Negocio`), a la vista y el pipeline de producto en `Producto/`, y a la documentación de cada unidad de entrega bajo `Unidades-Entrega/<Nombre-Unidad-Entrega>/`. No enlaza directamente a artefactos internos; eso lo hace el README de cada sección o de cada unidad de entrega.

### 3.4 README de la sección

No aplica. Este archivo es el README de la raíz de `SDD/Docs/`. Los README de sección (uno por cada carpeta numerada) son responsabilidad de los respectivos AG-00 a AG-11 y se rigen por su propio archivo de reglas.

---

## 4. Estructura de redacción del documento

### 4.1 Cabecera obligatoria

La cabecera del `README.md` generado debe seguir este bloque, completando los valores entre llaves dobles a partir de PRODUCT-INTAKE:

```markdown
# {{Nombre-Producto}}

| Campo | Valor |
| --- | --- |
| Producto | {{Nombre-Producto}} |
| Versión del documento | 1.0 |
| Estado | Borrador / Propuesto / Aprobado / Vigente / Superado / Archivado |
| Fecha | YYYY-MM-DD |
| Stack principal | {{stack-declarado}} |
| Composición | {{N}} unidades de entrega (ver tabla de unidades de entrega) |
| Proyecto de código principal | {{nombre-proyecto-principal}} |
| Documento | README raíz del producto |
```

Nota: el README raíz, por ser el ancla del árbol, no declara un bloque "Trazabilidad upstream/downstream" en su cabecera. Esa trazabilidad se materializa en el cuerpo del documento generado: la tabla de unidades de entrega (sección 2), el mapa de la documentación (sección 4) con las categorías de nivel producto (00, 01), la vista y el pipeline de producto (`Producto/`), y la documentación de cada unidad de entrega bajo `Unidades-Entrega/<Nombre-Unidad-Entrega>/`.

### 4.2 Secciones obligatorias

El README generado debe contener, como mínimo, las siguientes secciones en este orden:

1. Identidad del producto: propósito en 2 a 3 párrafos, propuesta de valor, audiencia objetivo.
2. Unidades de entrega del producto: tabla con cada unidad de entrega (`Nombre-Unidad-Entrega`, tipo D8, rol, dependencias, bandera redistribuible), con la unidad de entrega principal señalado. Refleja el `PRODUCT-MANIFEST`.
3. Stack y composición: tabla con el stack de cada proyecto de código y las plataformas soportadas.
4. Mapa de la documentación: las categorías de nivel producto (`00-Contexto`, `01-Necesidades-Negocio`), la vista y el pipeline de producto en `Producto/`, y la documentación de cada unidad de entrega bajo `Unidades-Entrega/<Nombre-Unidad-Entrega>/`, cada una con descripción de propósito y enlace.
5. Flujo de lectura recomendado por rol de intervención: al menos 3 roles diferenciados, con orden de lectura sugerido y justificación.
6. Cómo contribuir y cómo regenerar la documentación: enlace a `CONTRIBUTING.md` si aplica y proceso de regeneración con los subagentes SDD.
7. Estado actual y roadmap: tabla de estado por unidad de entrega y por categoría, y enlace al roadmap detallado en `00-Contexto`.
8. Glosario rápido: mínimo 10 términos del dominio del producto, breves, sin reemplazar el glosario completo de la categoría UX/UI.
9. Contacto y responsables: tabla con rol, responsable y canal de comunicación.
10. Control de cambios: tabla con versión, fecha y descripción del cambio.

### 4.3 Secciones opcionales según tipo de unidad de entrega

| Sección | Aplica a | Notas |
| --- | --- | --- |
| Diagrama de despliegue | web-microservices, worker-service | Incluir vista de servicios, colas, almacenamiento y red. |
| Compatibilidad de plataformas | mobile-app-maui, desktop-app, cli-tool | Tabla con sistema operativo, versión mínima y observaciones. |
| Cómo consumir como dependencia | library | Comando de instalación, importación mínima y ejemplo de 5 líneas. |
| Quick-start | rest-api, cli-tool | Bloque ejecutable con 3 a 5 comandos para validar el camino feliz. |
| Modelo de eventos | worker-service | Listar fuentes, sinks, formato de payload y política de reintentos. |
| Política de versionado y soporte | library, rest-api | Tabla con versiones vigentes, fin de soporte y ruta de migración. |

### 4.4 Tablas tipo y formatos recurrentes

El documento debe usar las siguientes tablas estandarizadas:

Tabla de unidades de entrega del producto (refleja el `PRODUCT-MANIFEST`).

| Proyecto de código | Tipo D8 | Rol | Dependencias | Redistribuible |
| --- | --- | --- | --- | --- |
| <Nombre-Proyecto-Codigo> (principal) | rest-api | API pública del producto | <Nombre-Proyecto-Codigo> | false |
| <Nombre-Proyecto-Codigo> | library | Dominio compartido | — | false |

Tabla A: Mapa de documentación.

| Sección | Propósito | Responsable | Enlace |
| --- | --- | --- | --- |
| 00-Contexto (producto) | Visión, alcance, roadmap del negocio | AG-00 | [00-Contexto](00-Contexto/) |
| 01-Necesidades-Negocio (producto) | Necesidades de negocio | AG-01 | [01-Necesidades-Negocio](01-Necesidades-Negocio/) |
| Producto (producto) | Vista de producto y pipeline de producto | AG-05, AG-09 | [Producto](Producto/) |
| Unidades-Entrega/<Nombre-Unidad-Entrega> (por unidad de entrega) | Documentación 02 a 11 de la unidad de entrega | AG-02 a AG-11 | [Unidades-Entrega/<Nombre-Unidad-Entrega>](Unidades-Entrega/<Nombre-Unidad-Entrega>/) |

Tabla B: Flujo de lectura por rol de intervención.

| Rol | Orden recomendado | Por qué |
| --- | --- | --- |
| Product Manager | 00 → 01 → 06 → 07 | Necesita entender visión, necesidades y backlog. |
| Desarrollador | 00 → 02 → 05 → 10 → 11 | Necesita contexto, especificación, arquitectura y ejemplos. |
| QA | 00 → 02 → 08 | Necesita ver requisitos y estrategia de pruebas. |
| DevOps | 00 → 05 → 09 | Necesita arquitectura y pipeline. |

Tabla C: Estado actual.

| Categoría | Estado | Versión vigente |
| --- | --- | --- |
| 00-Contexto | Vigente | 1.0 |
| 01-Necesidades-Negocio | Borrador | 0.9 |

### 4.5 Anti-patrones a evitar

| Anti-patrón | Problema | Solución |
| --- | --- | --- |
| README sin tabla de unidades de entrega ni enlaces a la documentación de cada unidad de entrega | Rompe la navegación SDD y oculta la jerarquía del producto | Incluir la tabla de unidades de entrega y la Tabla A con las categorías de producto y un enlace a la carpeta de cada unidad de entrega. |
| Stack mencionado sin versión | Imposible reproducir entornos y validar compatibilidad | Declarar siempre `tecnología @ versión` en la cabecera y en §2. |
| Flujo de lectura único sin variantes por rol | Cada rol de intervención se pierde en información no relevante | Producir mínimo 3 flujos por rol en Tabla B. |
| README como wiki extensa | Duplica contenido de las categorías y se desactualiza primero | Mantener el README en 200 a 400 líneas y delegar el detalle a cada categoría. |
| Roadmap inline en el README | Genera dos fuentes de verdad sobre el roadmap | Enlazar a `00-Contexto/Roadmap-Producto.md` y no replicar contenido. |
| Glosario que reemplaza al de UX/UI | El glosario rápido se convierte en glosario completo y diverge | Limitar a 10 a 20 términos esenciales y enlazar al glosario de la categoría UX/UI. |
| Estado libre fuera del enum | Estados ambiguos como "casi listo" o "WIP" | Usar exclusivamente: Borrador, Propuesto, Aprobado, Vigente, Superado, Archivado. |

---

## 5. Preguntas guía para el subagente

### 5.1 Comprensión del input upstream

- ¿Cuál es el nombre canónico del producto en Título-Con-Guiones y cuáles son las unidades de entrega que la componen según el `PRODUCT-MANIFEST`?
- ¿Cuál es la unidad de entrega principal y qué variante de §1.2 corresponde a su tipo D8? ¿Qué tipo D8 lleva cada unidad de entrega?
- ¿Cuáles son las dependencias entre proyectos de código y los stacks con versiones y plataformas objetivo de cada uno?
- ¿Cuál es la propuesta de valor del producto en una sola línea y en un párrafo?
- ¿Qué roles de intervención se han identificado en el intake como prioritarios?

### 5.2 Decisiones de scope

- ¿Qué contenido es propio del README raíz del producto y qué debe quedar en la documentación de cada unidad de entrega o categoría?
- ¿Se incluyen secciones opcionales de §4.3 según los tipos D8 presentes en el producto?
- ¿Qué archivos satélite de §2.1 acompañan al README en este producto?
- ¿El README aporta valor en cada bloque o algún bloque está duplicando la documentación de unidades de entrega o categorías?

### 5.3 Trazabilidad

- ¿La tabla de unidades de entrega y las categorías de nivel producto están enlazadas con un párrafo breve de propósito, y cada unidad de entrega enlaza a su carpeta `Unidades-Entrega/<Nombre-Unidad-Entrega>/`?
- ¿Los enlaces apuntan a rutas existentes en `SDD/Docs/`?
- ¿La cadena Visión → NB → CU → RN → ADR → US → BT → Sprint → Test → Pipeline está visible al menos como referencia conceptual en §3?
- ¿El roadmap del README es un enlace y no una copia?

### 5.4 Calidad

- ¿La longitud final está entre 200 y 400 líneas?
- ¿Se respetó D1 (español rioplatense neutro, sin emojis, sin negritas decorativas)?
- ¿Las tablas tienen filas completas sin valores "TBD" ni placeholders sin cerrar?
- ¿El glosario tiene al menos 10 términos del dominio?
- ¿Cada rol de intervención de §4.4 Tabla B tiene un orden de lectura justificado?
- ¿Se evitaron los anti-patrones de §4.5?
- ¿Se respetó el enum cerrado de estados?
- ¿Se respetó D7 evitando ejemplos prohibidos en el contenido?

---

## 6. Criterios de aceptación del entregable

**Naturaleza de cada criterio.** Cada ítem lleva su marca: `[enumerable]` si se decide contando o
comparando —existencia, forma, recuento, resolución de un enlace— y `[interpretativo]` si solo se
decide leyendo los dos lados. Los enumerables son los que la compuerta mecánica de
`Master-Prompt.md` §10.0 tiene que cubrir; los interpretativos son para lo que el audit existe.

La clasificación es **conservadora por diseño**: ante la duda, un criterio se marca interpretativo.
El error no es simétrico —declarar mecanizable algo que no lo es produce falsa confianza, que es peor
que la ausencia de verificación—, así que marcar de más un interpretativo solo cuesta atención del
auditor, y marcar de menos un enumerable dejaría un hueco que nadie mira.

- [ ] [interpretativo] La tabla de unidades de entrega del producto está presente con, por cada unidad de entrega, su tipo D8, rol y dependencias, señala la unidad de entrega principal y refleja el `PRODUCT-MANIFEST` sin divergencias.
- [ ] [interpretativo] El mapa de la documentación (Tabla A) enlaza las categorías de nivel producto (00, 01), la vista y el pipeline de producto (`Producto/`) y la carpeta de cada unidad de entrega (`Unidades-Entrega/<Nombre-Unidad-Entrega>/`), con su path correcto.
- [ ] [interpretativo] La composición del producto (número de unidades de entrega y unidad de entrega principal) está reflejada en la cabecera.
- [ ] [enumerable] El flujo de lectura está diferenciado para al menos 3 roles de intervención en la Tabla B, con justificación por rol.
- [ ] [enumerable] El glosario rápido tiene mínimo 10 términos del dominio de la unidad de entrega, definidos en una línea cada uno.
- [ ] [enumerable] Todos los enlaces internos del README apuntan a rutas que existen en `SDD/Docs/`; no hay enlaces rotos.
- [ ] [interpretativo] La cabecera respeta el bloque obligatorio de §4.1 con todos los campos completos.
- [ ] [enumerable] El documento tiene entre 200 y 400 líneas en su versión final.
- [ ] [enumerable] No aparecen emojis, negritas decorativas, ni términos del dominio prohibido por D7.
- [ ] [enumerable] El control de cambios al pie del documento tiene al menos una entrada inicial v1.0.
- [ ] [enumerable] El estado declarado en la cabecera pertenece al enum cerrado: Borrador, Propuesto, Aprobado, Vigente, Superado o Archivado.
- [ ] [interpretativo] **El vocabulario del método va al glosario operativo de `Master-Prompt.md` §15 y se cita sin redefinir; el del producto, al glosario que corresponda.** Los términos que el framework acuña e impone a esta categoría no son vocabulario que la categoría acuñe: no van a un glosario del producto.
- [ ] [interpretativo] Todo término que esta categoría acuña o precisa, y que aparece en más de uno de sus artefactos, está declarado en el glosario rápido del README raíz, que esta regla ya exige con mínimo de diez términos, y los glosarios de categoría que referencia, con sus referentes cuando tiene más de uno. El glosario rápido no reemplaza a los de categoría: enlaza a ellos.
- [ ] [interpretativo] Ninguna forma desnuda de un término polisémico queda sin resolver en un artefacto que se lee por secciones (`Vocabulario-Rules.md` §9.2).
- [ ] [interpretativo] Ninguna polisemia con contextos disjuntos se reporta como defecto ni se corrige calificando todas las ocurrencias (criterio negativo de `Vocabulario-Rules.md` §9.1).

---

## 7. Ejemplos genéricos

### 7.1 Ejemplo A: Producto multi-proyecto de gestión de turnos

```markdown
# Gestion-De-Turnos

| Campo | Valor |
| --- | --- |
| Producto | Gestion-De-Turnos |
| Versión del documento | 1.0 |
| Estado | Vigente |
| Fecha | 2026-03-10 |
| Stack principal | C#/.NET, PostgreSQL 16 |
| Composición | 4 unidades de entrega (ver tabla de unidades de entrega) |
| Proyecto de código principal | Gestion-De-Turnos-API |
| Documento | README raíz del producto |

## 1. Identidad del producto

Producto para la gestión de turnos médicos en centros de salud de mediana escala.
Expone una API de turnos, comparte un dominio común, envía recordatorios de forma
asincrónica y reutiliza un paquete de validaciones independiente del producto.

## 2. Proyectos de código del producto

| Proyecto de código | Tipo D8 | Rol | Dependencias | Redistribuible |
| --- | --- | --- | --- | --- |
| Gestion-De-Turnos-API (principal) | rest-api | API pública de turnos | Gestion-De-Turnos-Domain, Aplicada-Validaciones | false |
| Gestion-De-Turnos-Domain | library | Dominio y reglas compartidas | Aplicada-Validaciones | false |
| Gestion-De-Turnos-Notificaciones | worker-service | Recordatorios asincrónicos | Gestion-De-Turnos-Domain | false |
| Aplicada-Validaciones | library | Validaciones reusables | — | true |

## 4. Mapa de la documentación

| Sección | Propósito | Responsable | Enlace |
| --- | --- | --- | --- |
| 00-Contexto | Visión, alcance, roadmap | AG-00 | [00-Contexto](00-Contexto/) |
| Producto | Vista y pipeline de producto | AG-05, AG-09 | [Producto](Producto/) |
| Unidades-Entrega/Gestion-De-Turnos-API | Documentación de la unidad de entrega | AG-02 a AG-11 | [api](Unidades-Entrega/Gestion-De-Turnos-API/) |
```

### 7.2 Ejemplo B: Producto de una unidad de entrega (caso degenerado), librería de parsing CSV

```markdown
# csv-parser-lib

| Campo | Valor |
| --- | --- |
| Producto | csv-parser-lib |
| Versión del documento | 1.0 |
| Estado | Vigente |
| Fecha | 2026-04-22 |
| Stack principal | TypeScript 5.5, Node 20 |
| Composición | 1 unidad de entrega (caso degenerado) |
| Proyecto de código principal | csv-parser-lib |
| Documento | README raíz del producto |

## 1. Identidad del producto

Librería liviana para parseo y validación de archivos CSV con soporte de
streaming, inferencia de tipos opcional y reporte estructurado de errores.
Pensada para integrarse en pipelines de ingesta de datos.

## 2. Proyectos de código del producto

| Proyecto de código | Tipo D8 | Rol | Dependencias | Redistribuible |
| --- | --- | --- | --- | --- |
| csv-parser-lib (principal) | library | Librería de parseo (única) | — | false |

## 3. Cómo consumir como dependencia

Instalación mínima desde el registro de paquetes del lenguaje, importación
del módulo y ejemplo de 5 líneas que parsea un archivo y devuelve filas.

## 3. Mapa de la documentación

| Categoría | Propósito | Responsable | Enlace |
| --- | --- | --- | --- |
| 02-Especificacion-Funcional | Contrato de la API pública | AG-02 | [02-Especificacion-Funcional](02-Especificacion-Funcional/) |
| 10-Examples | Ejemplos ejecutables y verificables | AG-10 | [10-Examples](10-Examples/) |
| 11-Documentacion | Cuerpo documental de entrega | AG-11 | [11-Documentacion](11-Documentacion/) |

## 4. Flujo de lectura recomendado

| Rol | Orden recomendado | Por qué |
| --- | --- | --- |
| Desarrollador integrador | 10 → 11 → 02 | Empezar por ejemplos y luego ver el contrato |
| Mantenedor de la librería | 00 → 05 → 06 → 09 | Arquitectura, backlog y pipeline |
| QA | 02 → 08 | Validar contrato y matriz de pruebas |
```

---

## 8. Prompt-snippet sugerido para el subagente

```text
Sos un {{ESPECIALIDAD-VARIANTE}} (Arquitecto de Soluciones Senior más la variante D8 de la unidad de entrega principal) responsable de redactar el README raíz del producto {{NOMBRE_PRODUCTO}}.

Insumos:
- PRODUCT-MANIFEST: {{path}} (enumeración de unidades de entrega, tipo D8, rol, dependencias, nombres de código).
- PRODUCT-INTAKE: {{path}}
- Documentos upstream ya generados: las categorías de producto (00, 01), la vista y el pipeline de producto (`Producto/`) y la documentación de cada unidad de entrega (`Unidades-Entrega/<Nombre-Unidad-Entrega>/`).

Reglas de redacción: §4 de Root-Rules.md.
Trazabilidad esperada: presentar la tabla de unidades de entrega (D8, rol, dependencias) y enlazar las categorías de producto y la carpeta de cada unidad de entrega con descripción de propósito.
Criterios de calidad: §6 de Root-Rules.md.
Restricciones: respetar D1 a D9; no incluir emojis, negritas decorativas, ni términos del dominio prohibido por D7.

Salida: SDD/Docs/README.md (sin versión en el nombre, con versión 1.0 en la cabecera).
```

---

## 9. Sistema de identificadores

**Alcance transversal.** Esta sección y las tres siguientes no gobiernan el README raíz: gobiernan a
todas las categorías. Viajan en los insumos obligatorios de todo despacho de subagente
(`Master-Prompt.md` §8), por la misma razón por la que la 5.1 sumó ahí `Vocabulario-Rules.md`: una
regla que las reglas de categoría citan y que no llega al despacho no la lee nadie.

### 9.1 Ámbito de unicidad

Todo identificador declara en qué ámbito es único, y ese ámbito es el **producto**. Un `CU-00014` es
uno solo en todo el producto, cualquiera sea la cantidad de unidades de entrega que lo componen.

Es la lectura que hace resolver la trazabilidad que el framework ya exige: la tabla de trazabilidad a
casos de uso de `Rules-Necesidades-Negocio.md` §4.4 cita el caso de uso por identificador desnudo,
desde un artefacto de nivel producto y sin columna de unidad de entrega. Con ámbito de proyecto de
código esa cita no resuelve.

Consecuencias operativas, en un producto de más de una unidad de entrega:

- El orquestador deriva y publica el **mapa de rangos de identificadores** antes de despachar la
  primera categoría, y lo incluye en cada despacho (`Master-Prompt.md` §3.4). Ningún subagente
  inventa su rango.
- **La unicidad es dentro de cada familia, y el reparto también.** `CU-00014` tiene que ser único
  entre los `CU`; que exista un `NB-00014` no lo vuelve ambiguo, porque el prefijo los distingue. Por
  eso solo se reparten bloques a las familias que **más de una unidad de entrega produce**: una
  familia que se produce en un solo nivel conserva su numeración natural. Repartir donde no hay
  colisión posible obliga a renumerar sin motivo, y renumerar es la operación más cara y más riesgosa
  del método.
- La numeración dentro de un rango es contigua. El salto entre el fin de un rango y el principio del
  siguiente no es una numeración no contigua que haya que justificar: es el reparto declarado.
- En el caso degenerado —una sola unidad de entrega— el producto y la entrega son el mismo espacio
  de nombres y no hay reparto que hacer.

### 9.2 Ancho

Los identificadores llevan prefijo y **cinco dígitos uniformes**: `CU-00014`, `EST-00015`,
`SD-00374`. El ancho es del framework y no se negocia por familia, por producto ni por agente.

Cinco dígitos no es una cifra elegida por comodidad tipográfica: es la respuesta a que el ancho de un
identificador es una **decisión de capacidad** y no una convención de forma. Una convención de forma
se aplica igual en todos lados; una decisión de capacidad depende de cuánto hay que contar, y un
ancho fijado sobre colecciones enumeradas a mano no sirve para colecciones que se construyen por
combinación. Fijar el ancho una vez, con holgura, es lo que evita que cada agente que se choca con el
techo elija una salida distinta y dos líneas de base del mismo framework queden incomparables.

Las tres propiedades que el ancho uniforme aporta se conservan enteras: los identificadores ordenan
lexicográficamente igual que numéricamente, alinean en columna, y se reconocen de un vistazo.

**Familias alcanzadas.** Toda familia que catalogue elementos de una colección de un producto: `NB`,
`CU`, `RN`, `RC`, `ADR`, `US`, `BT`, `EP`, `TC`, `NFR`, `SUP`, `CMP`, `EST`, `NAV`, `DM`, `SD`,
`VER`, `EV`, `EVE`, `ISSUE`, `OPS`, `EXT`, `STAGE`, `ENV`, `DOD` y equivalentes.

**Regla de agotamiento.** Cinco dígitos se eligieron con holgura sobre la colección más grande que la
evidencia registra, pero la regla que faltaba no era el número: era **qué hacer si el rango igualmente
se agota**. La salida del método es **una sola, y es ampliar el ancho de esa familia**, declarando la
ampliación en la línea que encabeza su tabla y migrando sus filas con el árbol de
`Migracion-Rules.md` §4.3.1. Queda prohibido fragmentar el identificador en uno compuesto —las
referencias de una sola pieza dejarían de resolver— y queda prohibido comprimir el inventario
agrupando elementos: un elemento sin identificador no se puede rastrear, y lo que no se rastrea no se
sensa.

Que la salida sea una y esté declarada es el punto. Lo que producía el daño no era chocarse con el
techo: era que cada agente eligiera una salida distinta sin ningún criterio del método para preferir
una, y que dos corridas del mismo framework produjeran líneas de base incomparables.

**Las dos exclusiones, con su motivo:**

| Excluida | Por qué |
| --- | --- |
| `AG-XX` | Designa uno de los roles del catálogo de especialidades **del framework**, no un elemento de una colección de un producto. Su cardinalidad la fija el propio framework y no crece con el producto |
| El ordinal de iteración (`Sprint-XX`, `S0` a `S9`) | Es una posición de calendario que el roadmap de la categoría 00 numera, no un identificador de catálogo. Su referente es una ventana de tiempo del producto |

### 9.3 Estabilidad y capacidad, enunciadas juntas

Un identificador es **estable**: un elemento que se retira no libera su número; su fila queda con
estado `Retirado` y la fecha, para que una referencia vieja no apunte a otra cosa.

De ahí se sigue lo que hay que tener presente al dimensionar, y que hasta ahora ninguna regla decía:
**el rango no se recicla, así que se dimensiona por el total histórico y no por el vigente**. Las dos
reglas —estabilidad y ancho— son buenas por separado y se agravan mutuamente; se enuncian juntas para
que esa interacción deje de ser un descubrimiento de cada corrida.

### 9.4 Colecciones derivadas

Una colección **derivada** es la que se construye a partir de otras, con una entrada por elemento de
sus fuentes. La matriz de sensado de deriva de `Deriva-Rules.md` §2.3 es el caso canónico: su tamaño
es la suma de las demás tablas de la línea de base.

Una colección derivada se declara como tal en la tabla que la encabeza, nombrando sus fuentes. Es la
que con más seguridad desborda cualquier techo, porque hereda el tamaño de todo lo que la alimenta.

### 9.5 Titularidad

Toda categoría que acuñe un identificador declara, en §3.2 de su regla, su **prefijo**, su **forma**
y su **ámbito**. Un identificador cuya forma no está declarada lo inventa quien lo necesita primero,
y con varios subagentes generando en paralelo sobre el mismo dominio los prefijos naturales coinciden
con certeza y no por azar.

**Una categoría no acuña identificadores para artefactos de otra.** Si necesita citar un elemento que
su categoría de origen no identificó, lo **escala** al orquestador en lugar de ponerle nombre, y la
regla de la categoría de origen dice qué identificador emitir. Un identificador acuñado aguas abajo
queda en manos de quien no es su dueño, que es el peor lugar posible.

---

## 10. Datos derivados en la prosa

**Alcance transversal**, como §9.

Un dato **declarado** —el nombre de un caso de uso, el motivo de una regla— es autoridad: está bien
porque alguien lo decidió. Un dato **derivado** —cuántos hay, cuál es el total, cuántos de cada
tipo— no es autoridad: es el resultado de una operación sobre otra cosa, y su corrección depende de
que esa otra cosa no haya cambiado.

Todo número que un documento enuncia en prosa sobre una colección es un dato derivado. El defecto no
se comete al escribirlo, sino al modificar la colección tres versiones después, por otra mano y con
otro objetivo; y como el número es plausible por naturaleza, ningún lector lo cuestiona. Por eso las
cuatro reglas siguientes son estructurales y no una instrucción de cuidado.

**R1 · Preferir la forma que no cuenta.** «Los artefactos de la tabla» en lugar de «los veintiún
artefactos», salvo que el número aporte algo que la tabla no da. Es la única de las cuatro que
elimina el dato en vez de verificarlo: un documento que dice «los wireframes de la tabla de
cobertura» no puede desincronizarse nunca.

**R2 · Todo recuento que se escriba nombra su fuente.** «Los veinte artefactos de la tabla de §2». Un
recuento sin fuente declarada es irrecalculable; con fuente declarada, lo verifica cualquiera.

**R3 · Anclaje que no admite otro referente.** Un recuento se escribe de modo que su número no pueda
leerse como referido a otra colección. «Cuatro capas» no es anclable en un documento que habla de
capas de la condición de terminado y de capas de cobertura; «las cuatro capas de la matriz de
cobertura de §3» sí lo es. **Un recuento que no se puede anclar se reescribe con R1, no se
verifica**: una comprobación que evalúa todo par de número y sustantivo produce avisos falsos, y el
ruido en un instrumento de verificación es peor que su ausencia.

**R4 · El control de cambios registra el recuento cuando cambia**, del mismo modo que registra el
cambio que lo produjo. Un recuento que cambió sin entrada en el control de cambios es señal de que
alguien tocó la colección y no el número.

**R5 · Una referencia también es un dato derivado.** Una ruta relativa codifica dos cosas: **la
identidad** del documento destino y **la posición relativa** entre dos archivos. La primera es un
dato declarado; la segunda es una relación, y se rompe cuando algo la altera —el destino se renombra,
el documento se mueve, cambia de profundidad al reorganizarse el árbol, o se archiva y baja un
nivel—. Es el mismo defecto que R1 a R4 describen para los números, aplicado a las referencias.

De ahí las dos obligaciones:

- **La identidad de una referencia es el identificador del destino**, que es único en el producto
  (§9.1). Toda referencia a un artefacto identificado lo nombra: `[CU-00014](ruta)`, nunca solo la
  ruta. Con el identificador presente, la ruta se puede **recalcular**; sin él, hay que adivinar.
- **La ruta es derivada y se trata como tal.** Una ruta que no resuelve pero cuyo identificador
  existe en el árbol no es un hallazgo del documento: es un dato derivado desactualizado, y se
  **recalcula** (`Master-Prompt.md` §10.0).

La evidencia de que esto es recalculable y no interpretable: en una migración real, de 703 enlaces
rotos **los 703** se reconectaron resolviendo por identificador, sin una sola decisión humana. Un
dato que un guion recalcula al cien por ciento no debería estar escrito a mano.

**Métrica de éxito.** No es cuántos recuentos se verifican: es **cuántos dejaron de existir**.

**Por qué esto vive acá y no en D9.** Se evaluó declarar que un recuento en prosa es una afirmación
sujeta a la invariante D9 de evidencia verificable, y **se descartó con motivo**. D9 está acotada a
afirmaciones **sobre el estado del sistema**, y `Deriva-Rules.md` §1 excluye explícitamente las
afirmaciones de diseño, de especificación y de contexto. Un recuento sobre una tabla del propio
documento no es ninguna de esas cosas: es una operación sobre el texto, no una observación del
sistema. Ampliar D9 para alcanzarlo diluiría el alcance de la invariante más cara de verificar del
framework, y estas cuatro reglas consiguen el mismo efecto —que el número deje de ser redacción y
pase a ser dato— sin tocar ninguna invariante. La decisión queda escrita para que no vuelva a
plantearse como pendiente.

---

## 11. Apartamiento declarado

**Alcance transversal**, como §9.

Un artefacto declarado obligatorio puede no emitirse si existe un **ADR que declare el
apartamiento**, con:

1. Qué obligación no se cumple y de qué regla y sección viene.
2. Por qué no aplica a esta unidad de entrega o a este producto.
3. Las alternativas descartadas, incluidas las que cumplirían la letra de la obligación.
4. Los disparadores concretos que superarían la decisión.

**Cuándo corresponde y cuándo no.** El apartamiento es la salida para lo que la obligación **no
contempla**. Donde la obligación está condicionada por un flag de la unidad de entrega —
`tiene_persistencia`, `redistribuible`, `requiere_maqueta`— la ausencia del artefacto se resuelve por
el flag y no hace falta ADR: un apartamiento usado para evadir una condición que ya existe es un
anti-patrón.

Un artefacto obligatorio ausente **con** su ADR de apartamiento se evalúa como decisión y no como
omisión. Ausente **sin** ADR es hallazgo P0.

---

## 12. Referencia pendiente

**Alcance transversal**, como §9.

Un artefacto puede referenciar algo que todavía no existe —típicamente porque la categoría que lo
emite corre en una fase posterior— si lo declara con esta forma:

1. **Que no existe**, nombrando la categoría y la fase en que se emitirá.
2. **Cuál es el origen provisorio** que rige mientras tanto, si lo hay.
3. **Cuándo se cierra**: qué evento obliga a volver sobre este artefacto.

Las dos salidas que esta forma reemplaza rompen otra regla del framework, y por eso ninguna de las
dos es admisible: **copiar el contenido** crea una segunda fuente de algo que otra regla declara
fuente única, y **dejar la referencia colgada** cumple la letra y sella el hueco, porque un audit que
comprueba «existe referencia explícita a X» la da por satisfecha.

**Cierre obligatorio.** Cuando la categoría referenciada se emite, las categorías que la
referenciaban en estado pendiente vuelven a la cola para cerrar la referencia, y la reapertura trae
consigo **el insumo que faltaba y no solo el turno** (`Master-Prompt.md` §6). Ninguna categoría emite
un artefacto de otra: que el resultado sea correcto no vuelve correcta la vía, porque la próxima vez
que ese artefacto haya que regenerarlo no va a estar claro quién lo hace.

Una referencia pendiente que sigue abierta al cierre del producto es hallazgo P0.

---

## 13. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-05-17 | Reglas iniciales generadas durante bootstrap SDD |
| 1.1 | 2026-06-09 | Validación ST-06: el README raíz se genera a nivel solución; §1.2 usa la variante del proyecto principal del manifiesto. El README presenta la solución y la tabla de proyectos (la reformulación de contenido se completa en ST-08). |
| 1.2 | 2026-06-09 | Reformulación ST-08: el README raíz se reformula a documento de solución. La cabecera (§4.1) declara la solución, su composición y el proyecto principal en lugar de un único tipo D8. Se agrega la sección obligatoria "Proyectos de la solución" (§4.2) con la tabla de proyectos (D8, rol, dependencias, redistribuible). El mapa de documentación (§4.4) refleja las categorías de solución (00, 01), `Solucion/` y la carpeta de cada proyecto. Se actualizan §1.1, §3.3, anti-patrones, criterios de aceptación, preguntas guía, ejemplos (uno multi-proyecto y el caso degenerado) y el prompt-snippet. |
| 1.3 | 2026-06-10 | Migración de referencias de intake al documento unificado SOLUTION-INTAKE (unificación de intake). |
| 1.4 | 2026-07-26 | Intercambio de categorías 10 ↔ 11 en el layout canónico: el mapa de documentación pasa a listar `10-Examples/` (AG-10) y `11-Documentacion/` (AG-11), y el flujo de lectura del integrador invierte su orden a 10 → 11 → 02. Se reasignan los subagentes citados en §1.3. Se normaliza el vocabulario de actores: «consumidor» pasa a «integrador» y «audiencia» a «rol de intervención». |
| 1.5 | 2026-07-28 | Reparación de la política de archivado (Revisión SDD): §3.1 declara que el README raíz recibe el sufijo de versión al archivarse, tomado del campo `Versión` de su cabecera, y que `CHANGELOG.md` queda exento por acumulativo. Corrige la colisión silenciosa por la que dos archivados del mismo artefacto el mismo día se sobrescribían. La regla general y su tabla de exenciones viven en `Master-Prompt.md` §5.1. |
| 2.0 | 2026-07-28 | Normalización del versionado (framework 4.0). El archivo vivo pierde el sufijo de versión del nombre y pasa a declarar su versión en el campo `Versión` de su cabecera; el sufijo `-v<X.Y>.md` queda reservado a las copias archivadas en `_legacy/`. Se actualizan los patrones de nombre, los ejemplos, las cabeceras modelo, los anti-patrones y los criterios de aceptación de la categoría. Sube major porque la documentación generada con la nomenclatura anterior deja de cumplir. Deriva de la reformulación de D4 y D5 en el `README.md` del framework. |
| 2.1 | 2026-07-29 | Normalización de los ejemplos de `Slug-Producto` y `Nombre-Proyecto-Codigo` a Título-Con-Guiones con cada palabra capitalizada (D3 y `Master-Prompt.md` §3.2). Los ejemplos usaban minúsculas, variante que tres archivos de reglas prohíben explícitamente. |
| 3.0 | 2026-07-29 | Renombre de vocabulario normativo (framework 5.0). El nivel superior pasa de «solución» a **producto**, la unidad de compilación de «proyecto» a **proyecto de código**, y los cuatro planos de identidad del producto se separan en campos propios (`Nombre-Producto`, `Slug-Producto`, `Raiz-Codigo`, `Artefacto-Agrupacion`). Se declara el nivel de aplicación de la regla en su cabecera, según `Vocabulario-Rules.md` §4 R3. Sube major porque los identificadores y los nombres de artefacto cambian, y la documentación generada con la nomenclatura anterior deja de cumplir. |
| 3.1 | 2026-07-29 | Criterio de gobierno del glosario en §6. Sube minor: agrega criterios de aceptación verificables sin cambiar el conjunto de artefactos de la categoría ni ninguna invariante, y ninguna documentación ya emitida deja de cumplir por sí sola. Los tres criterios exigen que todo término que la categoría acuña o precisa y usa en más de uno de sus artefactos esté declarado en el glosario que le corresponde, que ninguna forma desnuda de un término polisémico quede sin resolver en un artefacto que se lee por secciones, y —criterio negativo— que ninguna polisemia con contextos disjuntos se reporte como defecto. Materializan `Vocabulario-Rules.md` §9 en la categoría. **Origen**: el audit verificaba «glosario sin contradicciones», que un glosario incompleto cumple trivialmente, y esta regla mencionaba el glosario sin verificarlo en §6. |
| 4.0 | 2026-08-15 | Cuatro secciones transversales nuevas, incorporadas por la intervención sobre los reportes 00 a 11 (framework 7.0). **§9 Sistema de identificadores**: ámbito de unicidad producto, ancho de cinco dígitos uniformes con sus familias alcanzadas y sus dos exclusiones declaradas, estabilidad y capacidad enunciadas juntas, colecciones derivadas, y titularidad con la prohibición de acuñar identificadores para artefactos de otra categoría. **§10 Datos derivados en la prosa**, con sus cuatro reglas y la restricción de que un recuento que no se puede anclar se reescribe en vez de verificarse. **§11 Apartamiento declarado**, que generaliza la figura que hoy solo admite `Rules-Documentacion.md` §2.5. **§12 Referencia pendiente**, con su cierre obligatorio y la exigencia de que la reapertura traiga el insumo. Las cuatro son transversales y entran en los insumos de todo despacho por `Master-Prompt.md` §8. Control de cambios pasa de §9 a §13. Sube **major**: el ancho de cinco dígitos hace que la documentación generada con dos dígitos deje de cumplir. Origen: reportes `01`, `05`, `06`, `08` (§9 y §11), `00` y `04` (§10), `02`, `03` y `07` (§12). Además, **§6 clasifica cada criterio de aceptación** como `[enumerable]` o `[interpretativo]`, con la nota que declara la política conservadora: ante la duda se marca interpretativo, porque declarar mecanizable lo que no lo es produce falsa confianza. Los enumerables son lo que la compuerta mecánica de `Master-Prompt.md` §10.0 debe cubrir. Origen adicional: reportes `09` y `10`. |
| 5.0 | 2026-08-15 | **El nivel intermedio pasa a ser la unidad de entrega** §10 registra además la decisión de **no** ampliar D9 a los recuentos en prosa, con su motivo: D9 está acotada a afirmaciones sobre el estado del sistema y un recuento sobre una tabla del propio documento no lo es; las cuatro reglas de §10 consiguen el mismo efecto sin tocar una invariante. (framework 8.0). La cabecera declara el nivel nuevo, la carpeta target pasa de `Proyectos/<Nombre-Proyecto-Codigo>/` a `Unidades-Entrega/<Nombre-Unidad-Entrega>/`, las variantes de §1.2 se seleccionan por `tipo_unidad_entrega` —que es el nombre nuevo de la variable D8, porque los ocho valores son formas de **entrega**— y la prosa normativa pasa a nombrar la unidad de entrega donde el referente era el nivel intermedio, conservándola donde el referente es la unidad de compilación. Sube **major**: cambia el nivel de aplicación de la categoría, su ruta de salida y el nombre de una variable bloqueante; la documentación generada con la versión anterior deja de cumplir. Origen: el pendiente declarado en `Vocabulario-Rules.md` §8 desde la 5.0, con la evidencia medida sobre tres destinos reales. |
| 5.1 | 2026-08-15 | §9.1 precisa que la unicidad y el reparto de rangos son **dentro de cada familia**: solo se reparten bloques a las familias que más de una unidad de entrega produce, y una familia producida en un solo nivel conserva su numeración natural. Sube **minor**: acota una consecuencia operativa sin cambiar el ámbito de unicidad. Origen: la migración de un destino real de dos unidades de entrega. |
| 5.2 | 2026-08-15 | §10 suma **R5: una referencia también es un dato derivado** (framework 8.4). Una ruta relativa codifica la identidad del destino y la posición relativa entre dos archivos; la segunda es una relación y se rompe cuando el destino se renombra, el documento se mueve o cambia de profundidad. Se declaran las dos obligaciones que lo resuelven: la identidad de una referencia es el identificador del destino, que es único en el producto y hace la ruta recalculable; y la ruta es derivada, de modo que una que no resuelve pero cuyo identificador existe en el árbol **se recalcula** en lugar de reportarse. Sube **minor**. Origen: cuatro de los seis huecos que una migración real destapó resultaron ser el mismo defecto, y de 703 enlaces rotos los 703 se reconectaron resolviendo por identificador, sin una sola decisión humana. |
| 5.3 | 2026-08-16 | Barrido del layout de la 8.0. El **Ejemplo A** de §7.1 seguía publicando su mapa de documentación sobre `Proyectos/<Nombre>/` —el layout que la 8.0 reemplazó—, con lo cual el ejemplo canónico de un README raíz contradecía a §2.1 del mismo archivo. El bloque de insumos de §8 nombra `Unidades-Entrega/<Nombre-Unidad-Entrega>/`. Concordancias de género de la sustitución léxica de la 8.0 (`Vocabulario-Rules.md` §9.5). Sube **patch**. |
| 5.4 | 2026-08-16 | §4.2 titulaba «Proyectos de código del producto» una sección cuyo contenido es la tabla de **unidades de entrega**: el título quedó del modelo anterior a la 8.0. Sube **patch**. |
