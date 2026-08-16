# Reglas constructivas — 06 Backlog técnico

**Carpeta target (por unidad de entrega):** `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/06-Backlog-Tecnico/`
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Unidad de entrega
**Subagente target del orquestador:** Scrum Master / Agile Coach senior (AG-06)
**Versión de las reglas:** 4.3

---

## 0. Posición en la cadena SDD

La categoría 06 es la bisagra entre el diseño y la ejecución dentro de la cadena de trazabilidad D6. Recibe upstream de 01 (necesidades de negocio NB-XXXXX), 02 (CU, RN, modelo conceptual) y 05 (arquitectura de producto, ADRs y modelo lógico). Produce los artefactos que alimentan 07 (sprint plan), 08 (acceptance tests y QA) y 10 (developer guide cuando se trata de onboarding al backlog). Su salida define qué se construye y en qué orden, sin entrar en el detalle de planificación temporal por sprint, que vive en 07. Aplica de manera obligatoria a los ocho tipos D8: ningún tipo está exento de producir un product backlog priorizado, un backlog técnico y una Definition of Ready acotada.

---

## 1. Especialidad asignada

### 1.1 Especialidad base

Scrum Master con perfil de Agile Coach orientado al backlog, equivalente al AG-06 del catálogo SDD. Su perfil profesional combina la facilitación ágil con la curaduría del backlog: asegura que las historias de usuario cumplan INVEST, que la priorización MoSCoW refleje el valor real de negocio, que cada historia trace a uno o más CU y que la Definition of Ready filtre trabajo no refinado antes del Sprint Planning. Conecta la capa funcional (CU y RN de 02) y la capa técnica (componentes y ADRs de 05) con el trabajo planificable en sprints. Se alinea con la Scrum Guide 2020 para los artefactos de producto, con el método MoSCoW (DSDM Atern) para priorización y con la práctica de Backlog Refinement como mecanismo continuo de curaduría.

### 1.2 Variantes según tipo de unidad de entrega (8 valores D8)

| Tipo | Especialidad específica | Justificación |
| --- | --- | --- |
| library | Scrum Master + Backlog Curator | El foco está en la API pública y la consumibilidad; las épicas se arman por superficie de Abstractions y por capacidades del motor interno. |
| web-monolith | Scrum Master | Épicas por capacidad funcional del producto; flujo estándar de US con criterios BDD y trazabilidad CU. |
| web-microservices | Scrum Master + Tech Lead Distribuido | Épicas por bounded context, con BT que reflejan acuerdos de contrato entre servicios y dependencias inter-equipo. |
| desktop-app | Scrum Master + Product Owner | Épicas por flujo de operación local; el PO arbitra alcance entre funcionalidad y experiencia desktop. |
| mobile-app-maui | Scrum Master + Mobile Lead | Épicas por capacidad móvil (offline, sincronización, permisos, ciclo de vida); BT específicas de plataforma cuando aplica. |
| rest-api | Scrum Master + API Product Owner | Épicas por recurso o por dominio del contrato OpenAPI; el API PO arbitra retro-compatibilidad y deprecaciones. |
| cli-tool | Scrum Master | Épicas por comando o pipeline; BT por contrato de stdout/stderr y exit codes. |
| worker-service | Scrum Master + Operations Lead | Épicas por flujo de mensajes y por capacidades operativas (idempotencia, dead-letter, backpressure); el Ops Lead arbitra prioridades operativas. |

El orquestador lee esta tabla y, según el `tipo_unidad_entrega` de la unidad de entrega en curso (leído del manifiesto de producto), selecciona la variante correspondiente y la combina con la especialidad base. La variante se aplica una vez por cada unidad de entrega del producto.

### 1.3 Multi-especialidad

La categoría 06 admite revisiones acotadas por otras especialidades:

- AG-02 Analista Funcional, para validar que cada US traza a un CU y que la columna `CU relacionados` está poblada sin huérfanas.
- AG-05 Arquitecto, para validar que cada BT se justifica en un componente, una ADR o un contrato declarado en 05, sin BT inventadas.
- AG-08 QA, para validar que los criterios de aceptación de cada US son verificables y aptos para alimentar los acceptance tests de 08.
- AG-07 PM ágil, para alinear capacidad y secuencia con el plan de sprints de 07 sin invadir su titularidad.

El AG-06 mantiene siempre la titularidad del artefacto; las demás especialidades aportan revisiones acotadas.

---

## 2. Documentos que produce esta categoría

### 2.1 Tabla maestra

| Archivo | Obligatorio para | Recomendado | Omitir para | Descripción |
| --- | --- | --- | --- | --- |
| `Product-Backlog.md` | Todos los tipos D8 | — | — | Índice maestro priorizado de historias de usuario con MoSCoW, story points, trazabilidad a CU y a épicas. |
| `Backlog-Tecnico.md` | Todos los tipos D8 | — | — | Vista del backlog desde la lente técnica, organizada por épicas técnicas y por BT-XXXXX con dependencias, fuente upstream y criterios de aceptación. |
| `historias-usuario/US-XXXXX-<Nombre>.md` | Proyectos de código con más de 20 US | Proyectos de código con 10 a 20 US | Proyectos de código con menos de 10 US (US inline en `Product-Backlog.md`) | Un archivo por historia, con criterios BDD, INVEST check, trazabilidad y DoR. |
| `tareas-tecnicas/BT-XXXXX-<Nombre>.md` | Proyectos de código con más de 30 BT | Proyectos de código con 15 a 30 BT | Proyectos de código con menos de 15 BT (BT inline en `Backlog-Tecnico.md`) | Un archivo por tarea técnica, con justificación, dependencias, tipo y trazabilidad a US. |
| `Definition-Of-Ready.md` | Todos los tipos D8 | — | — | Criterios DoR para US y para BT, con aprobador y excepciones admitidas. |
| `README.md` de la sección | Recomendado para todos | — | — | Índice navegable del backlog: épicas, US Must Have, BT prioritarias y DoR vigente. |

### 2.2 Reglas de inclusión y exclusión por tipo

| Tipo D8 | Estimación recomendada | Refinement mínimo | BT mínimas | Énfasis del backlog |
| --- | --- | --- | --- | --- |
| library | Fibonacci o T-shirt | 1 sesión por sprint | 10 (fundaciones, API, tests) | API pública y consumibilidad |
| web-monolith | Fibonacci | 1 sesión por sprint | 8 (capas, persistencia, autenticación) | Capacidad funcional end-to-end |
| web-microservices | Fibonacci por bounded context | 1 sesión por contexto por sprint | 12 por contexto | Contratos inter-servicio y deploy independiente |
| desktop-app | T-shirt o Fibonacci | 1 sesión por sprint | 8 (persistencia local, distribución) | Flujo de operación local y experiencia |
| mobile-app-maui | Fibonacci | 1 sesión por sprint | 10 (offline, sync, permisos) | Capacidad móvil y ciclo de vida |
| rest-api | Fibonacci | 1 sesión por sprint | 10 (recursos, autenticación, errores) | Contrato REST y retro-compatibilidad |
| cli-tool | T-shirt | 1 sesión por sprint | 6 (parser, comandos, contrato stdout/stderr) | Pipeline de comandos y exit codes |
| worker-service | Fibonacci | 1 sesión por sprint | 10 (mensajería, idempotencia, dead-letter) | Flujo de mensajes y resiliencia operativa |

Los mínimos son piso, no techo. La cantidad real surge del refinamiento iterativo a partir de los CU y de las ADRs vigentes.

---

## 3. Nomenclatura y vinculación

### 3.1 Patrón de nombres

- `product-backlog.md` para el índice maestro de historias.
- `backlog-tecnico.md` para la vista técnica por épicas.
- `historias-usuario/US-XXXXX-<Nombre>.md` para cada historia individual, con cinco dígitos en `XXXXX` (`Root-Rules.md` §9.2), Título-Con-Guiones en el slug y guion medio antes de la versión.
- `tareas-tecnicas/BT-XXXXX-<Nombre>.md` para cada tarea técnica individual, con cinco dígitos en `XXXXX` (`Root-Rules.md` §9.2), Título-Con-Guiones estricto y guion medio antes de la versión.
- `definition-of-ready.md` para la DoR.

Queda prohibido el patrón heredado `product-backlog.v1.0.md`; la versión siempre va con guion medio `-v`, jamás con guion bajo `_v` ni con punto `.v`. El slug va en Título-Con-Guiones (cada palabra capitalizada, separadas por guion medio); quedan prohibidas las variantes todo-minúsculas, camelCase, con espacios o con acentos.

### 3.2 Convención crítica de identificadores uniformes

La auditoría de Fase 0 del bootstrap (`Bootstrap/Audit-SDD1.md`) detectó que el fuente Motor DSL usa identificadores heterogéneos: `US-00001` con dos dígitos en el product-backlog y `BT-001` con tres dígitos en el backlog técnico. La lección de esa auditoría —**el ancho tiene que ser uniforme**— sigue vigente y es la que gobierna acá; lo que cambió es el ancho, que hoy lo fija `Root-Rules.md` §9.2 para todo el framework:

1. Todos los identificadores de US, BT y EP llevan **cinco dígitos uniformes** (`US-00001` a `US-99999`), y son únicos en el producto (`Root-Rules.md` §9.1).
2. Queda prohibido mezclar anchos dentro del producto; los esquemas de numeración son consistentes entre artefactos y entre unidades de entrega.
3. El ancho se dimensiona por el **total histórico** y no por el vigente, porque un identificador retirado no libera su número (`Root-Rules.md` §9.3).

**Qué dejó de ser necesario.** La versión anterior de esta sección obligaba a descomponer en épicas o en sub-backlogs por bounded context «antes de saltar a tres dígitos», si un proyecto superaba las 99 US. Esa regla existía para administrar un techo que ya no existe: la descomposición en épicas sigue siendo buena práctica de backlog, y deja de ser una obligación derivada del ancho del identificador.

Esta convención asegura coherencia visual entre product-backlog y backlog-tecnico y compatibilidad con herramientas de búsqueda y matriz de trazabilidad.

### 3.3 Convención de archivos individuales para US y BT

- Para unidades de entrega con más de 20 US, cada historia vive en su archivo individual bajo `historias-usuario/`. Esto permite versionar cada US, asignarla a un autor distinto y revisarla por separado.
- Para unidades de entrega con más de 30 BT, cada tarea técnica vive en su archivo individual bajo `tareas-tecnicas/`. Esto permite trazar dependencias técnicas por archivo y bloquear individualmente sin tocar el backlog completo.
- Para unidades de entrega por debajo de esos umbrales, las US y BT pueden vivir inline en el `Product-Backlog.md` y el `Backlog-Tecnico.md` respectivamente, sin perder la estructura de secciones obligatoria.
- En ambos modos (inline o por archivo), los criterios de aceptación, la trazabilidad y el DoR check deben estar presentes; no se admite "US sin criterios" ni "BT sin justificación" en ningún modo.

### 3.4 Vinculación cross-doc

- Upstream: cada US referencia al menos un CU de 02 y opcionalmente una NB de 01. Cada BT referencia un componente, una ADR o un contrato de 05; o un CU si la BT lo cubre como tarea técnica derivada.
- Downstream: cada US alimenta el sprint plan de 07 (asignación a sprint y velocity) y los acceptance tests de 08 (escenarios Given/When/Then).
- El `Product-Backlog.md` referencia el `Backlog-Tecnico.md` y viceversa.
- La DoR referencia el `Product-Backlog.md` como filtro de entrada y la Definition of Done de 08 como filtro de salida (sin solaparlas).

### 3.5 README de la sección

Recomendado para todos los tipos. Debe listar el `Product-Backlog.md`, el `Backlog-Tecnico.md`, el resumen de épicas vigentes, las US Must Have del MVP, las BT prioritarias y la DoR vigente. Sirve como punto de entrada navegable para revisores externos (AG-02, AG-05, AG-07, AG-08).

### 3.6 Política de versionado

Una sola versión vigente por nombre lógico para todos los artefactos. Cuando el backlog evoluciona de manera significativa (por ejemplo, una nueva épica grande o un cambio de alcance del MVP), se pasa de `v1.0` a `v2.0` y la versión anterior se mueve a `_legacy/` con estado `Superado`. Para `US-XXXXX` y `BT-XXXXX` aplica una regla diferente: una vez que una US o BT entró a un sprint y se cerró con `Done`, no cambia de versión; si la funcionalidad evoluciona, se crea una nueva US o BT con el siguiente identificador disponible.

---

## 4. Estructura de redacción

### 4.1 Cabecera obligatoria

Cada artefacto inicia con un H1 y un bloque markdown de metadatos:

```markdown
# US-XXXXX — <Título de la historia>

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** US-XXXXX-<Nombre>.md
**Versión:** <X.Y>
**Estado:** Borrador | Ready | En curso | Done | Descartada
**Fecha:** YYYY-MM-DD
**Autor:** {{equipo-o-rol}}
**Épica:** EP-XXXXX
**Prioridad MoSCoW:** Must | Should | Could | Won't (v1.0)
**Estimación:** <story points o T-shirt>
```

Para `product-backlog`, `backlog-tecnico`, `BT-XXXXX` y `definition-of-ready` aplica la misma cabecera adaptando el título y los campos pertinentes (la BT lleva `Tipo` en vez de `Prioridad MoSCoW`).

**Tabla de contenido.** Todo documento generado que supere las tres secciones de primer nivel incluye una tabla de contenido inmediatamente después de la cabecera de metadatos, con enlaces ancla a cada sección de primer y de segundo nivel. La tabla de contenido no cuenta como sección de contenido ni altera la estructura obligatoria del documento: se ubica entre la cabecera y la primera sección, y las secciones obligatorias siguen siendo las que declara §4.2. Los documentos breves —fichas de una sola sección, entradas de índice— quedan exceptuados.

El ajuste es de navegabilidad. Estos documentos los lee principalmente un agente de IA que recorre la cadena de especificación acumulando contexto, y para ese lector la tabla de contenido es indiferente. Existe para el agente humano que entra a consultar un punto concreto sin haber leído el documento entero.

### 4.2 Secciones obligatorias de `Product-Backlog.md`

1. Objetivos del producto. Una a tres oraciones que enuncien el propósito del backlog y el MVP buscado.
2. Épicas. Tabla con identificador `EP-XXXXX`, nombre, descripción breve y sprints estimados.
3. Historias por épica. Tabla con `US-XXXXX`, título, MoSCoW, story points, estado, CU relacionados y épica.
4. Métricas de avance. Resumen por prioridad (cantidad y SP), porcentaje cerrado, deuda en backlog.
5. Refinamiento. Cadencia de refinement, responsables y formato (Planning Poker, T-shirt, etc.).

### 4.3 Secciones obligatorias de `Backlog-Tecnico.md`

1. Épicas técnicas. Cada épica con objetivo, alcance, fuente upstream (ADR, componente o contrato) y BT contenidas.
2. BT por épica. Tabla con `BT-XXXXX`, título, tipo (spike, feature, refactor, devops, docs), prioridad, estimación, fuente (NB, CU, ADR, contrato), dependencias y criterios de aceptación.
3. Trazabilidad BT↔US↔CU. Tabla cruzada que permita, para cada BT, identificar las US que la consumen y los CU upstream.

### 4.4 Secciones obligatorias de `US-XXXXX-<Nombre>.md`

1. Historia. Bloque `Como [rol], quiero [acción], para [valor]` con valor explícito.
2. Contexto. Por qué existe esta historia, qué NB o CU la motivan, qué problema resuelve.
3. Criterios de aceptación. Lista de escenarios en formato Given/When/Then, mínimo dos escenarios, con al menos un happy path y un edge case.
4. Trazabilidad. Tabla con NB de origen, CU relacionados, BT derivadas y tests previstos en 08.
5. Prioridad y estimación. MoSCoW declarada con justificación, story points (Fibonacci o T-shirt) y técnica usada.
6. DoR check. Lista de los criterios DoR vigentes con su estado (cumplido o pendiente).
7. Notas y supuestos. Aclaraciones que no son criterios pero documentan decisiones de scope o ambigüedades resueltas.

### 4.5 Secciones obligatorias de `BT-XXXXX-<Nombre>.md`

1. Descripción. Qué se construye, refactoriza o investiga; alcance acotado a una tarea ejecutable en menos de un sprint.
2. Justificación. Qué NB, CU, ADR o contrato exige esta tarea; sin justificación upstream no hay BT.
3. Criterios de aceptación. Lista de verificación técnica (la BT compila, los tests pasan, el contrato se respeta, la deuda queda saldada).
4. Dependencias. BT o US que deben estar terminadas antes; bloqueos externos identificados.
5. Tipo. Feature, spike, refactor, devops o docs. Spike implica caja temporal explícita.
6. Estimación. Story points o T-shirt, con técnica declarada.
7. Trazabilidad a US. US que consumen esta BT (mínimo una; BT sin US consumidora debe justificarse como infraestructura compartida).

### 4.6 Secciones obligatorias de `Definition-Of-Ready.md`

1. Criterios DoR para US. Lista enumerada con criterios verificables (mínimo cinco, máximo ocho).
2. Criterios DoR para BT. Lista enumerada con criterios técnicos (mínimo cuatro, máximo seis).
3. Excepciones admitidas. Casos donde la DoR puede flexibilizarse (por ejemplo, spike exploratorio) y quién aprueba la excepción.
4. Aprobador. Rol responsable de validar que un ítem cumple la DoR antes de entrar a Sprint Planning.

### 4.7 Tablas tipo y formatos recurrentes

Tabla de estimación con técnicas disponibles:

| Técnica | Escala | Recomendado para | Limitación |
| --- | --- | --- | --- |
| Fibonacci | 1, 2, 3, 5, 8, 13, 21 | Equipos con velocity estable | Necesita historial de sprints previos |
| T-shirt | XS, S, M, L, XL | Equipos nuevos o backlog inicial | Menos preciso para forecast |
| Horas ideales | 1h, 2h, 4h, 8h | BT técnicas con alcance ya cerrado | Pierde la idea relativa de complejidad |

Tabla de INVEST check por historia:

| Atributo | Verificación |
| --- | --- |
| Independent | Se puede planificar sin esperar a otra US del mismo sprint |
| Negotiable | El alcance admite ajuste en refinamiento |
| Valuable | El valor para el rol está explícito en el `para [...]` |
| Estimable | El equipo tiene información suficiente para estimarla |
| Small | Cabe en un sprint con holgura |
| Testable | Los criterios de aceptación son verificables |

Tabla de priorización MoSCoW con justificación:

| Prioridad | Significado | Criterio práctico | Distribución sugerida |
| --- | --- | --- | --- |
| Must | Imprescindible para el MVP | Sin esto no se cumple el propósito del sistema | 50 a 60 % del backlog inicial |
| Should | Importante pero no bloqueante | El MVP funciona sin esto pero queda incompleto | 20 a 30 % |
| Could | Deseable si hay capacidad | Agrega valor; puede esperar a v2 | 10 a 20 % |
| Won't (v1.0) | Fuera de alcance explícito | Documentado para no perderse | sin tope |

Tabla de trazabilidad de la US:

| Dimensión | Referencia |
| --- | --- |
| NB upstream | NB-XXXXX |
| CU cubiertos | CU-XXXXX, CU-YY |
| BT derivadas | BT-XXXXX, BT-YY |
| Tests previstos | <referencia tentativa a 08> |

### 4.8 Anti-patrones a evitar

| Anti-patrón | Problema | Solución |
| --- | --- | --- |
| US sin valor explícito | La cláusula `para [...]` está vacía o es un sinónimo de la acción | Forzar la verbalización del beneficio para el rol antes de aceptar la US |
| BT que en realidad es una US | "Implementar parser" disfrazado de tarea técnica oculta el valor de negocio | Reformular como US si tiene valor para un rol; mantener como BT solo si soporta una US declarada |
| DoR sin criterios verificables | "La historia debe estar clara" no es verificable | Cada criterio DoR debe poder responderse con sí o no de manera objetiva |
| Estimación sin técnica declarada | Mezcla de SP y horas sin convención | Declarar la técnica en el `Product-Backlog.md` y mantenerla en todas las US |
| Backlog sin refinement con cadencia | El backlog envejece sin curaduría; entra trabajo crudo al sprint | Política explícita de refinement (mínimo una sesión por sprint) documentada en §5 del backlog |
| IDs heterogéneos | `US-00001` y `BT-001` conviviendo rompen búsquedas y matrices de trazabilidad (lección documentada del fuente Motor DSL) | Forzar el ancho uniforme de `Root-Rules.md` §9.2 en US, BT y EP |
| Todo Must Have | No hay priorización real; el equipo no puede recortar alcance | Forzar distribución 60/20/20 entre Must, Should y Could como ejercicio mínimo |
| US huérfanas de CU | No se puede validar completitud del sistema contra la especificación funcional | Columna `CU relacionados` obligatoria; AG-02 firma trazabilidad |
| BT sin US consumidora | Tarea técnica que nadie usa; deuda inventada | Cada BT debe declarar al menos una US que la consume o justificarse como infraestructura compartida con ADR explícita |
| Criterios de aceptación vagos | "Funciona correctamente" no se puede testear | Formato Given/When/Then obligatorio en US Must y Should |
| DoR de 15 criterios | Nada nunca está ready; el filtro se vuelve burocrático | Máximo 8 criterios DoR para US y 6 para BT |

---

## 5. Preguntas guía para el subagente

### 5.1 Upstream

- ¿Cada US referencia al menos un CU de 02? ¿Hay US que se infieren de los CU pero no están en el backlog?
- ¿Cada BT se justifica en un componente, una ADR o un contrato de 05? Si no, ¿por qué existe?
- ¿Las NB de 01 están todas representadas por al menos una épica o una US?
- ¿Hay ADRs en 05 que disparan BT de configuración o de adopción y todavía no se reflejaron en el backlog?

### 5.2 Scope

- ¿La distribución MoSCoW es realista o todo es Must?
- ¿Hay US que en realidad son épicas (más de un sprint)? ¿Hay épicas que son una sola US?
- ¿El MVP definido por las US Must cubre el propósito del sistema declarado en 00?
- ¿El umbral de archivos individuales (20 US y 30 BT) está aplicado correctamente?

### 5.3 Trazabilidad

- ¿Cada US tiene su columna `CU relacionados` poblada sin huérfanas?
- ¿Cada BT declara al menos una US consumidora o se justifica como infraestructura compartida con ADR?
- ¿La matriz BT↔US↔CU del `Backlog-Tecnico.md` está completa y al día?
- ¿Los criterios de aceptación están alineados con los escenarios previstos en 08?

### 5.4 Calidad

- ¿Las US cumplen INVEST? ¿Hay alguna no estimable, no testeable o demasiado grande?
- ¿Los criterios de aceptación están en Given/When/Then con al menos dos escenarios por US Must?
- ¿La DoR tiene entre 5 y 8 criterios verificables, sin solapamiento con la Definition of Done de 08?
- ¿Hay una política de refinement con cadencia explícita?

### 5.5 Convenciones

- ¿Todos los identificadores usan el ancho uniforme de `Root-Rules.md` §9.2? ¿Hay rastros de anchos heredados del fuente?
- ¿Los slugs están en Título-Con-Guiones estricto?
- ¿Los nombres de archivo respetan `.md` y no `.md`?
- ¿Las US y BT individuales viven en sus carpetas (`historias-usuario/` y `tareas-tecnicas/`) cuando aplica el umbral?

---

## 6. Criterios de aceptación

**Naturaleza de cada criterio.** Cada ítem lleva su marca: `[enumerable]` si se decide contando o
comparando —existencia, forma, recuento, resolución de un enlace— y `[interpretativo]` si solo se
decide leyendo los dos lados. Los enumerables son los que la compuerta mecánica de
`Master-Prompt.md` §10.0 tiene que cubrir; los interpretativos son para lo que el audit existe.

La clasificación es **conservadora por diseño**: ante la duda, un criterio se marca interpretativo.
El error no es simétrico —declarar mecanizable algo que no lo es produce falsa confianza, que es peor
que la ausencia de verificación—, así que marcar de más un interpretativo solo cuesta atención del
auditor, y marcar de menos un enumerable dejaría un hueco que nadie mira.

- [ ] [enumerable] Existe `Product-Backlog.md` con las cinco secciones del §4.2 y una tabla de épicas con identificadores `EP-XXXXX` con el ancho de `Root-Rules.md` §9.2.
- [ ] [enumerable] Existe `Backlog-Tecnico.md` con las tres secciones del §4.3 y la tabla cruzada BT↔US↔CU completa.
- [ ] [enumerable] Existe `Definition-Of-Ready.md` con criterios DoR para US (entre 5 y 8) y para BT (entre 4 y 6), excepciones y aprobador declarado.
- [ ] [interpretativo] Todos los identificadores `US-XXXXX`, `BT-XXXXX` y `EP-XXXXX` usan el ancho uniforme de `Root-Rules.md` §9.2 y son únicos en el producto; no quedan rastros de `BT-001` heredados del fuente.
- [ ] [interpretativo] Cada US tiene al menos un CU relacionado declarado en la columna `CU relacionados`; no hay US huérfanas.
- [ ] [interpretativo] Cada BT tiene fuente upstream declarada (NB, CU, ADR o contrato) y al menos una US consumidora o justificación de infraestructura compartida.
- [ ] [interpretativo] La distribución MoSCoW no es 100 % Must; hay reparto razonable entre Must, Should y Could.
- [ ] [interpretativo] Cada US Must y Should tiene criterios de aceptación en Given/When/Then con al menos dos escenarios.
- [ ] [interpretativo] Si la unidad de entrega supera 20 US, existen archivos individuales bajo `historias-usuario/`; si supera 30 BT, existen archivos individuales bajo `tareas-tecnicas/`.
- [ ] [enumerable] Ningún archivo de la carpeta de trabajo lleva sufijo de versión en el nombre; cada uno declara su versión en el campo `Versión` de su cabecera (D4).
- [ ] [interpretativo] La DoR no se solapa con la Definition of Done de 08; la DoR habla de cuándo empezar, la DoD de cuándo terminar.
- [ ] [interpretativo] No hay menciones a stacks concretos, productos comerciales ni protocolos específicos del dominio fuente.
- [ ] [enumerable] Todo documento con más de tres secciones de primer nivel incluye tabla de contenido inmediatamente después de la cabecera, con enlaces ancla a las secciones de primer y de segundo nivel. Los documentos breves quedan exceptuados.
- [ ] [interpretativo] **El vocabulario del método va al glosario operativo de `Master-Prompt.md` §15 y se cita sin redefinir; el del producto, al glosario que corresponda.** Los términos que el framework acuña e impone a esta categoría no son vocabulario que la categoría acuñe: no van a un glosario del producto.
- [ ] [interpretativo] Todo término que esta categoría acuña o precisa, y que aparece en más de uno de sus artefactos, está declarado en `Glosario-Funcional.md` de 02 y `Glosario-Tecnico.md` de 11, con sus referentes cuando tiene más de uno. Las US y los BT no acuñan vocabulario propio: reusan el de 02 y el de 05. Un término nuevo en una US es señal de que falta en el glosario de la categoría que lo origina.
- [ ] [interpretativo] El apuntamiento a `Glosario-Tecnico.md` de la 11 se declara como **referencia pendiente** (`Root-Rules.md` §12) mientras esa categoría no se haya emitido: la 11 se emite en la Fase H y esta categoría es anterior. Al emitirse, la reapertura de `Master-Prompt.md` §6 cierra la referencia.
- [ ] [interpretativo] Ninguna forma desnuda de un término polisémico queda sin resolver en un artefacto que se lee por secciones (`Vocabulario-Rules.md` §9.2).
- [ ] [interpretativo] Ninguna polisemia con contextos disjuntos se reporta como defecto ni se corrige calificando todas las ocurrencias (criterio negativo de `Vocabulario-Rules.md` §9.1).

---

## 7. Ejemplos genéricos

### 7.1 Ejemplo 1 — US individual para un web-monolith de turnos médicos

Fragmento ilustrativo, no documento completo:

```markdown
# US-00005 — El paciente cancela un turno

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** US-00005-Paciente-Cancela-Turno.md
**Versión:** 1.0
**Estado:** Ready
**Fecha:** 2026-05-17
**Autor:** Equipo Producto
**Épica:** EP-00002 Reserva de turnos
**Prioridad MoSCoW:** Must
**Estimación:** 5 SP (Fibonacci)

## 1. Historia
Como paciente, quiero cancelar un turno previamente reservado, para liberar el horario si no puedo asistir y permitir que otra persona lo tome.

## 2. Contexto
NB-00002 exige que la disponibilidad de turnos refleje la realidad en tiempo real. CU-00004 describe el flujo de cancelación y RN-00005 fija la ventana mínima de aviso. Sin esta US, los turnos no asistidos quedan ocupando agenda y bloquean reservas legítimas.

## 3. Criterios de aceptación
- Given un turno reservado con más de 24 h de anticipación, When el paciente confirma la cancelación, Then el sistema libera el horario y muestra confirmación con la hora liberada.
- Given un turno reservado con menos de 2 h de anticipación, When el paciente intenta cancelar, Then el sistema advierte la penalidad pero permite continuar y registra la cancelación tardía.
- Given un turno que ya pasó, When el paciente intenta cancelarlo, Then el sistema informa que no es posible cancelar un turno vencido.

## 4. Trazabilidad
| Dimensión | Referencia |
| --- | --- |
| NB upstream | NB-00002 |
| CU cubiertos | CU-00004 |
| BT derivadas | BT-00012, BT-00015 |
| Tests previstos | acceptance/AT-04-cancelacion-turno |

## 5. Prioridad y estimación
Must porque sin cancelación la agenda queda contaminada por turnos no asistidos. 5 SP estimado por Planning Poker con la técnica Fibonacci adoptada por el equipo.

## 6. DoR check
- [x] Criterios de aceptación en Given/When/Then
- [x] Estimada en SP
- [x] CU relacionado identificado
- [x] Sin dependencias bloqueantes
- [x] Datos de prueba disponibles (fixtures de turnos)

## 7. Notas y supuestos
La política de penalidad por cancelación tardía queda fuera del alcance de esta US; se cubre en US-00009. Esta US asume autenticación previa del paciente (US-00001).
```

### 7.2 Ejemplo 2 — BT individual para un rest-api de pagos

Fragmento ilustrativo, no documento completo:

```markdown
# BT-00012 — Spike de comparación de mecanismos de persistencia

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** BT-00012-Spike-Comparacion-Orm.md
**Versión:** 1.0
**Estado:** Ready
**Fecha:** 2026-05-17
**Autor:** Equipo Plataforma
**Épica:** EP-T3 Persistencia del bounded context de pagos
**Tipo:** Spike
**Estimación:** 3 SP (Fibonacci) con caja temporal de 2 días

## 1. Descripción
Investigar y comparar dos mecanismos de persistencia candidatos para el bounded context de pagos, en función de los criterios de transaccionalidad, soporte de migraciones versionadas y curva de adopción del equipo.

## 2. Justificación
ADR-00003 declara la decisión de adoptar una base relacional pero deja abierta la elección del mecanismo de mapeo. CU-00006 (registrar pago) y CU-00008 (idempotencia de confirmación) exigen transacciones ACID con clave de idempotencia, lo que condiciona la selección. NB-00004 fija un objetivo de latencia p95 que también condiciona la elección.

## 3. Criterios de aceptación
- Existe un informe comparativo con dos alternativas evaluadas en transaccionalidad, migraciones y rendimiento bajo carga sintética.
- El informe propone una recomendación con argumento técnico y trade-offs explícitos.
- La recomendación se eleva como ADR candidata; el spike no decide por sí solo, alimenta una ADR posterior.

## 4. Dependencias
- ADR-00003 aceptada (persistencia relacional).
- BT-00010 (modelo lógico inicial) completada para tener entidades reales contra las que medir.

## 5. Tipo
Spike con caja temporal de 2 días. Si al final del plazo no hay recomendación clara, se documenta el bloqueo y se eleva al arquitecto.

## 6. Estimación
3 SP con caja temporal explícita. La técnica Fibonacci se mantiene aunque la BT sea spike para no romper la cadencia de velocity.

## 7. Trazabilidad a US
| US | Por qué consume esta BT |
| --- | --- |
| US-00008 (registrar pago) | Necesita la decisión de persistencia tomada antes de implementarse |
| US-00009 (consultar estado de pago) | Lectura sobre el mismo mecanismo |
```

Los dos fragmentos son ilustrativos. Cada unidad de entrega adapta el dominio respetando la estructura.

---

## 8. Prompt-snippet sugerido

```text
Sos un {{ESPECIALIDAD-VARIANTE}} responsable de redactar el backlog técnico de la unidad de entrega {{NOMBRE_UNIDAD_ENTREGA}}.

Insumos:
- PRODUCT-INTAKE: {{path}}
- Upstream: 01 (NB-XXXXX), 02 (CU, RN, modelo conceptual), 05 (arquitectura de producto, ADRs, modelo lógico, contratos).

A generar (según tipo {{TIPO}} de D8):
- Product-Backlog.md con las cinco secciones obligatorias y la tabla de épicas EP-XXXXX.
- Backlog-Tecnico.md con épicas técnicas, BT por épica y matriz BT↔US↔CU.
- historias-usuario/US-XXXXX-<Nombre>.md si la unidad de entrega supera 20 US; en caso contrario, US inline en el product-backlog.
- tareas-tecnicas/BT-XXXXX-<Nombre>.md si la unidad de entrega supera 30 BT; en caso contrario, BT inline en el backlog-tecnico.
- Definition-Of-Ready.md con criterios DoR para US (5-8) y BT (4-6), excepciones y aprobador.
- README.md de la sección (recomendado).

Reglas de redacción: §4 de Rules-Backlog-Tecnico.md.
Nomenclatura: cinco dígitos uniformes para US-XXXXX, BT-XXXXX y EP-XXXXX, únicos en el producto; slug Título-Con-Guiones; sin sufijo de versión en el nombre; la versión vive en el campo `Versión` de la cabecera (D4).
Convención crítica: corregir la herencia del antecedente Motor DSL que mezclaba anchos; forzar el ancho uniforme de `Root-Rules.md` §9.2 en todos los identificadores.
Trazabilidad: cada US referencia al menos un CU; cada BT referencia NB, CU, ADR o contrato; matriz BT↔US↔CU completa.
INVEST + MoSCoW: cada US Must y Should cumple INVEST y tiene criterios Given/When/Then con al menos dos escenarios.
Estimación: declarar técnica (Fibonacci, T-shirt u horas ideales) y mantenerla consistente en todo el backlog.
Criterios de calidad: §6 de Rules-Backlog-Tecnico.md.

Restricciones: no introducir stacks concretos, productos comerciales ni protocolos del dominio fuente. Idioma rioplatense técnico, tildes correctas, sin emojis.

Salida: SDD/Docs/Unidades-Entrega/{{NOMBRE_UNIDAD_ENTREGA}}/06-Backlog-Tecnico/<estructura>.
```

---

## 9. Control de cambios

| Versión | Fecha | Descripción |
| --- | --- | --- |
| 1.0 | 2026-05-17 | Versión inicial de las reglas constructivas de la categoría 06. Establece la convención obligatoria de dos dígitos uniformes en US, BT y EP como corrección del antecedente Motor DSL (mezcla `US-00001` y `BT-001`), define las cinco secciones del product-backlog, las tres del backlog-tecnico, las siete de cada US individual y las siete de cada BT individual, las variantes por tipo D8, los umbrales de archivos individuales (20 US y 30 BT) y los criterios de aceptación. |
| 1.1 | 2026-06-09 | Validación ST-06: la categoría se genera por proyecto bajo `Proyectos/<Nombre-Proyecto>/06-Backlog-Tecnico/`; la frase de cierre de §1.2 y la ruta de salida del prompt-snippet referencian el `project_type` del proyecto en curso (manifiesto). Tablas §1.2 sin reescritura. |
| 1.2 | 2026-06-10 | Migración de referencias de intake al documento unificado SOLUTION-INTAKE (unificación de intake). |
| 1.3 | 2026-07-26 | Navegabilidad para lectores humanos: §4.1 y §6 exigen tabla de contenido en todo documento generado que supere las tres secciones de primer nivel, con enlaces ancla de primer y segundo nivel y excepción para documentos breves. Es el único cambio: no se altera la estructura obligatoria de los documentos, no se agregan artefactos ni carga narrativa. |
| 2.0 | 2026-07-28 | Normalización del versionado (framework 4.0). El archivo vivo pierde el sufijo de versión del nombre y pasa a declarar su versión en el campo `Versión` de su cabecera; el sufijo `-v<X.Y>.md` queda reservado a las copias archivadas en `_legacy/`. Se actualizan los patrones de nombre, los ejemplos, las cabeceras modelo, los anti-patrones y los criterios de aceptación de la categoría. Sube major porque la documentación generada con la nomenclatura anterior deja de cumplir. Deriva de la reformulación de D4 y D5 en el `README.md` del framework. |
| 3.0 | 2026-07-29 | Renombre de vocabulario normativo (framework 5.0). El nivel superior pasa de «solución» a **producto**, la unidad de compilación de «proyecto» a **proyecto de código**, y los cuatro planos de identidad del producto se separan en campos propios (`Nombre-Producto`, `Slug-Producto`, `Raiz-Codigo`, `Artefacto-Agrupacion`). Se declara el nivel de aplicación de la regla en su cabecera, según `Vocabulario-Rules.md` §4 R3. Sube major porque los identificadores y los nombres de artefacto cambian, y la documentación generada con la nomenclatura anterior deja de cumplir. |
| 3.1 | 2026-07-29 | Criterio de gobierno del glosario en §6. Sube minor: agrega criterios de aceptación verificables sin cambiar el conjunto de artefactos de la categoría ni ninguna invariante, y ninguna documentación ya emitida deja de cumplir por sí sola. Los tres criterios exigen que todo término que la categoría acuña o precisa y usa en más de uno de sus artefactos esté declarado en el glosario que le corresponde, que ninguna forma desnuda de un término polisémico quede sin resolver en un artefacto que se lee por secciones, y —criterio negativo— que ninguna polisemia con contextos disjuntos se reporte como defecto. Materializan `Vocabulario-Rules.md` §9 en la categoría. **Origen**: el audit verificaba «glosario sin contradicciones», que un glosario incompleto cumple trivialmente, y esta regla no mencionaba la palabra «glosario» ni una vez. |
| 3.2 | 2026-08-15 | Criterio de gobierno de glosario, primera cláusula (intervención reportes 00 a 11). §6 pasa a distinguir el **vocabulario del método** —el que el framework acuña e impone a la categoría, que vive en el glosario operativo de `Master-Prompt.md` §15 y se cita sin redefinir— del **vocabulario del producto**, que va al glosario que corresponda. El criterio estaba replicado en once reglas mandando a nueve destinos distintos, casi todos glosarios del producto, y la política correcta estaba escrita una sola vez, en `Rules-Plan-Sprint.md` §6 y sobre términos que ya estaban resueltos. Sube **minor**: precisa un criterio existente. Origen: reporte `11`, propuesta 1. Además, **§6 clasifica cada criterio de aceptación** como `[enumerable]` o `[interpretativo]`, con la nota que declara la política conservadora: ante la duda se marca interpretativo, porque declarar mecanizable lo que no lo es produce falsa confianza. Los enumerables son lo que la compuerta mecánica de `Master-Prompt.md` §10.0 debe cubrir. Origen adicional: reportes `09` y `10`. Se incorpora además el tratamiento de las obligaciones hacia una fase posterior que la comprobación del grafo de `Master-Prompt.md` §6 detectó al correrse sobre las doce reglas: las referencias afectadas se declaran con la forma de `Root-Rules.md` §12. |
| 4.0 | 2026-08-15 | **El nivel intermedio pasa a ser la unidad de entrega** (framework 8.0). La cabecera declara el nivel nuevo, la carpeta target pasa de `Proyectos/<Nombre-Proyecto-Codigo>/` a `Unidades-Entrega/<Nombre-Unidad-Entrega>/`, las variantes de §1.2 se seleccionan por `tipo_unidad_entrega` —que es el nombre nuevo de la variable D8, porque los ocho valores son formas de **entrega**— y la prosa normativa pasa a nombrar la unidad de entrega donde el referente era el nivel intermedio, conservándola donde el referente es la unidad de compilación. Sube **major**: cambia el nivel de aplicación de la categoría, su ruta de salida y el nombre de una variable bloqueante; la documentación generada con la versión anterior deja de cumplir. Origen: el pendiente declarado en `Vocabulario-Rules.md` §8 desde la 5.0, con la evidencia medida sobre tres destinos reales. |
| 4.1 | 2026-08-16 | Corrige la **ruta de salida** de su prompt de despacho de referencia, que seguía emitiendo a `SDD/Docs/Proyectos/{{NOMBRE_PROYECTO_CODIGO}}/` —el layout que la 8.0 reemplazó— y que además citaba un marcador que el contexto de despacho ya no define. Pasa a `SDD/Docs/Unidades-Entrega/{{NOMBRE_UNIDAD_ENTREGA}}/`. Corrige además las concordancias de género que la sustitución léxica de la 8.0 dejó al pasar «proyecto» a «unidad de entrega» (`Vocabulario-Rules.md` §9.5). Sube **patch**: ningún documento generado deja de cumplir. |
| 4.2 | 2026-08-16 | **La cabecera obligatoria de §4.1 declaraba el nivel anterior a la 8.0.** Cada documento generado copia esa plantilla literal, y empezaba con `**Proyecto de código:** {{Nombre-Proyecto-Codigo}}` cuando los documentos de las categorías 02 a 11 pertenecen a una **unidad de entrega** y viven bajo `Unidades-Entrega/`. Pasa a `**Unidad de entrega:** {{Nombre-Unidad-Entrega}}`. Los tres barridos anteriores no la vieron porque vive **dentro de un bloque de ejemplo cercado**, que ninguno abría; `SDD-Development-Guide.md` §VI.3.1 suma la regla. Sube **patch**: corrige el nivel declarado en la cabecera sin cambiar ninguna sección ni ningún artefacto. |
| 4.3 | 2026-08-16 | El prompt de despacho de referencia decía «de la **unidad de entrega** `{{NOMBRE_PROYECTO_CODIGO}}`»: la prosa se migró en la 8.0 y **el marcador no**, con lo cual la primera línea que el subagente lee nombra el nivel correcto con la variable del nivel anterior, que el contexto de despacho ya no define. Pasa a `{{NOMBRE_UNIDAD_ENTREGA}}`. Sube **patch**. |
