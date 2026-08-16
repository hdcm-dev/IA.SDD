# Reglas constructivas — 02 Especificación funcional

**Carpeta target (por unidad de entrega):** `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/02-Especificacion-Funcional/`
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Unidad de entrega
**Subagente target del orquestador:** Analista Funcional / Ingeniero de Requisitos (AG-02)
**Versión de las reglas:** 5.2

---

## 0. Posición en la cadena SDD

La categoría 02 es el nodo central de la cadena de trazabilidad D6. Recibe insumos de 00 (visión, alcance) y 01 (necesidades de negocio NB-XXXXX) y produce los artefactos que sirven como ancla para 03 (UX/UI), 04 (prompts si aplica), 05 (arquitectura y ADR), 06 (US/BT), 07 (sprints), 08 (tests) y 10 (ejemplos). Su salida define el qué del sistema sin invadir el cómo. Aplica de manera obligatoria a los ocho tipos D8.

---

## 1. Especialidad asignada

### 1.1 Especialidad base

Analista Funcional senior, equivalente AG-02 del catálogo SDD. Su perfil profesional combina elicitación, formalización y modelado de requisitos. Traduce cada NB-XXXXX en uno o más casos de uso (CU) verificables, identifica las reglas de negocio (RN) que restringen el dominio y, cuando aplica, levanta el modelo conceptual de datos junto con sus reglas conceptuales (RC). Se alinea con IREB CPRE para elicitación y gestión, con formato de casos de uso al estilo Cockburn y con criterios de aceptación en BDD (Given/When/Then).

### 1.2 Variantes según tipo de unidad de entrega (8 valores D8)

| Tipo | Especialidad específica | Justificación |
| --- | --- | --- |
| library | Analista Funcional + API Designer | El foco está en la superficie pública. Cada CU describe un contrato de uso. |
| web-monolith | Analista Funcional senior | Flujos UI/UX-driven, con CU que cruzan presentación, dominio y persistencia. |
| web-microservices | Analista Funcional + Domain Modeler (DDD) | Bounded contexts, aggregates, eventos de dominio. CU acotado por servicio. |
| desktop-app | Analista Funcional + UX Researcher | Flujos offline-first, sincronización diferida, criterios de continuidad. |
| mobile-app-maui | Analista Funcional + Mobile UX Analyst | Flujos táctiles, permisos del sistema operativo y ciclo de vida de la app. |
| rest-api | Analista Funcional + API Designer (OpenAPI/AsyncAPI) | Cada endpoint público es un CU con contrato declarativo y códigos de error. |
| cli-tool | Analista Funcional + CLI UX | Comandos, subcomandos y flags como CU, con exit codes definidos. |
| worker-service | Analista Funcional + Event Modeler | Mensajes y triggers como entrada de cada CU; idempotencia explícita. |

### 1.3 Multi-especialidad

La categoría 02 se combina con otras especialidades cuando el dominio lo requiere:

- AG-05 Arquitecto, en unidades de entrega con DDD o con bounded contexts múltiples, para alinear el modelo conceptual con el modelo lógico que se produce en 05.
- AG-04 Ingeniero de Prompts, cuando algún CU delega parte del flujo en un LLM (clasificación, extracción, generación), para fijar contratos de prompt y criterios de evaluación.
- AG-03 DX/UX, cuando el CU describe interacción humana significativa, para que las decisiones de experiencia no contaminen el flujo funcional.
- AG-08 QA, para revisar que cada criterio Given/When/Then sea automatizable y trazable a un test en 08.

El AG-02 mantiene siempre la titularidad del artefacto; las demás especialidades aportan revisiones acotadas.

---

## 2. Documentos que produce esta categoría

### 2.1 Tabla maestra

| Archivo | Obligatorio para | Recomendado | Omitir para | Descripción |
| --- | --- | --- | --- | --- |
| `Especificacion-Funcional.md` | Todos los tipos D8 | — | — | Índice maestro de CU, RN y referencia al modelo. Incluye matriz NB→CU→RN→US. |
| `Definicion-<Concepto-Central>.md` | Proyectos de código con un concepto técnico central (por ejemplo lenguaje declarativo, modelo de pagos, taxonomía de eventos) | library con superficie estrecha | Tipos sin concepto central | Define vocabulario, semántica y elementos del concepto en un único documento. |
| `Casos-De-Uso/CU-XXXXX-<Nombre>.md` | Todos los tipos D8, con un mínimo declarado en §2.2 | — | — | Un caso de uso por archivo. |
| `Reglas-De-Negocio/RN-XXXXX-<Nombre>.md` | Proyectos de código con reglas regulatorias o dominio fuerte | Resto de las unidades de entrega | Proyectos de código triviales sin estado ni invariantes | Una regla de negocio por archivo. Invariante atemporal. |
| `Modelo-Datos/Modelo-Conceptual.md` | Proyectos de código con persistencia (web-monolith, web-microservices, rest-api, worker-service, mobile-app-maui) | desktop-app si guarda local | library puro sin estado, cli-tool sin estado | Modelo conceptual estilo ER o de clases de dominio. |
| `Modelo-Datos/reglas-conceptuales-de-modelo/RC-XXXXX-<Nombre>.md` | Proyectos de código con modelo rico (más de diez entidades o invariantes de integridad explícitas) | — | Resto | Una regla conceptual por archivo, focalizada en integridad de dominio. |
| `Glosario-Funcional.md` | **Todos los tipos D8** | — | — | Vocabulario del dominio que esta categoría acuña. Regla de inclusión en §3.3. Es artefacto propio y no sección de otro documento: la categoría 02 es la que más vocabulario introduce y alimenta a las siete siguientes, así que su glosario no puede depender de un flag. |
| `README.md` de la sección | Recomendado para todos | — | — | Índice navegable de CU, RN, modelo, RC y glosario con su estado actual. |

### 2.2 Reglas de inclusión y exclusión por tipo

| Tipo D8 | Mínimo de CU | RN obligatorias | Modelo conceptual | RC obligatorias |
| --- | --- | --- | --- | --- |
| library | 5 | No (recomendadas si hay reglas de dominio en la API) | No | No |
| web-monolith | 8 | Sí | Sí | Solo si modelo > 10 entidades |
| web-microservices | 6 por bounded context | Sí | Sí, uno por contexto | Solo si modelo > 10 entidades por contexto |
| desktop-app | 6 | Sí | Recomendado si guarda local | No |
| mobile-app-maui | 6 | Sí | Sí, si hay almacenamiento offline | No |
| rest-api | 1 por recurso público + 5 transversales | Sí | Sí | Sí, si modelo > 10 entidades |
| cli-tool | 1 por comando + 3 transversales | Recomendadas | No (salvo persistencia local) | No |
| worker-service | 1 por tipo de mensaje + 3 transversales | Sí | Sí, si guarda estado | Sí, si modelo > 10 entidades |

El mínimo es piso, no techo. La cota superior queda definida por la cobertura completa de las NB-XXXXX declaradas en 01.

---

## 3. Nomenclatura y vinculación

### 3.1 Patrón de nombres

- `CU-XXXXX-<Nombre>.md`, con cinco dígitos en `XXXXX` (`Root-Rules.md` §9.2), Título-Con-Guiones en el slug y guion medio antes de la versión.
- `RN-XXXXX-<Nombre>.md`, mismas reglas.
- `RC-XXXXX-<Nombre>.md` para reglas conceptuales del modelo.
- `Modelo-Conceptual.md` para el modelo conceptual de datos.
- `Definicion-<Concepto>.md` para el documento opcional de concepto central.
- `Especificacion-Funcional.md` para el índice maestro.
- `Glosario-Funcional.md` para el vocabulario de la categoría: nombre fijo, sin variante de dominio.

Queda prohibido el patrón heredado `nb-01-desacople.v1.0.md` u homólogos. La versión siempre va con guion medio `-v`, jamás con guion bajo `_v` ni con punto `.v`. El slug va en Título-Con-Guiones (cada palabra capitalizada, separadas por guion medio); quedan prohibidas las variantes todo-minúsculas, camelCase, con espacios o con acentos.

### 3.2 Convenciones de prefijos y sufijos

- `CU-`: caso de uso. Acción funcional con flujo, actores y criterios de aceptación.
- `RN-`: regla de negocio. Invariante atemporal del dominio. No describe acción; describe restricción.
- `RC-`: regla conceptual del modelo. Restricción de integridad expresada sobre entidades y relaciones.
- `E-`: **código de error**. Ver abajo.
- Nombre lógico sin sufijo de versión en el nombre; la versión vive en el campo `Versión` de la cabecera (D4). La versión menor avanza por aclaración o corrección; la mayor avanza por cambio de alcance del CU/RN/RC.

**Forma y ámbito de los códigos de error.** §4.2 punto 6 exige que cada error de un caso de uso lleve
código, y hasta acá no declaraba qué forma tiene ese código, en qué ámbito es único ni quién lo
asigna. Un identificador cuya forma no está declarada lo inventa quien lo necesita primero: con un
solo agente redactando el resultado es consistente por accidente, y con varios subagentes generando
en paralelo sobre el mismo dominio los prefijos naturales coinciden con certeza y no por azar.

- **Forma**: `E-<DOMINIO>-NNNNN`, donde `<DOMINIO>` es un segmento corto en mayúsculas que nombra el
  área funcional del error, y el número sigue el ancho de `Root-Rules.md` §9.2.
- **Ámbito**: producto, como todo identificador (`Root-Rules.md` §9.1). Dos unidades de entrega del
  mismo producto no pueden emitir el mismo código de error, ni siquiera para situaciones análogas.
  Un prefijo que coincide **parcialmente** entre proyectos es peor que la divergencia total, porque
  invita a suponer una correspondencia que no existe.
- **Quién lo asigna**: la categoría 02 de la unidad de entrega **dueño del error**, dentro del rango
  que el mapa de `Master-Prompt.md` §3.4 le asignó. Ninguna otra categoría acuña códigos de error, ni
  siquiera cuando los necesita para citarlos: los escala (`Root-Rules.md` §9.5).

**Identificadores de los flujos alternativos.** Cada flujo alternativo de un caso de uso lleva su
identificador `FA-NN` dentro del caso de uso que lo contiene, para que otra categoría pueda citarlo
sin tener que ponerle nombre. Un identificador que una categoría necesita y que su categoría de
origen no emite termina inventado aguas abajo, que es el peor lugar posible: el que lo acuña no es su
dueño.

### 3.3 Vinculación cross-doc

- Upstream: cada CU declara una o más NB que implementa. No puede existir CU huérfano. La revisión de cobertura es bidireccional: cada NB debe tener al menos un CU y cada CU debe tener al menos una NB.
- Downstream: cada CU enumera las US que se generarán en 06, los componentes esperados en 05 y los tests previstos en 08.
- RN es atemporal: no cambia con la versión del producto. Si cambia, la versión nueva de la RN se publica y la anterior se archiva (ver §3.5).
- RC se vincula al modelo conceptual y a las RN o CU que la justifican.
- El modelo conceptual se vincula a CU y RN, no al revés. Es el AG-02 quien decide qué CU lo consumen.
- **Glosario, regla de inclusión.** Todo término del dominio que aparezca en más de un artefacto de 02 —dos CU, un CU y una RN, el modelo y un CU— debe estar en `Glosario-Funcional.md`. Un término que vive en un solo artefacto se define ahí y no entra.
- **Glosario, regla de no duplicación.** Si un término ya está declarado en el glosario de 00 (`Vision-Producto` §9, glosario del dominio del cliente) con la misma semántica, se referencia y no se redefine. Si el sentido difiere, el glosario de 02 declara la diferencia en lugar de pisarla.
- **Glosario, regla de polisemia.** Todo término del dominio con más de un referente lleva entrada que **enumera los referentes** y declara qué forma corresponde a cada uno. El criterio de cuándo esto hace falta es `Vocabulario-Rules.md` §9: se desambigua cuando los sentidos comparten contexto de lectura, y el contexto de lectura de un subagente es la sección. La forma desnuda de una familia calificada —«el registro», cuando el corpus ya usa «registro de auditoría» y «registro del contenedor»— es el caso que hay que resolver; las formas calificadas no lo son.
- El glosario es upstream de 03: `Rules-UX-UI-DX.md` §3.3 obliga a `Glosario-UX.md` a referenciar los términos de 02 en lugar de duplicarlos, lo que exige que exista un artefacto al que referenciar.

### 3.4 README de la sección

Recomendado para todos los tipos. Debe listar CU, RN, modelo y RC vigentes con propósito en una línea y estado actual. Sirve como punto de entrada navegable para revisores externos (AG-05, AG-06, AG-08).

### 3.5 Política de versionado

Una sola versión vigente por nombre lógico. Cuando un CU pasa de `v1.0` a `v2.0`:

1. Se crea `CU-XXXXX-<Nombre>.md` en la carpeta principal.
2. La versión `v1.0` se mueve a `Casos-De-Uso/_legacy/` con estado `Superado` y una nota al inicio que apunte a la versión vigente.
3. El índice `Especificacion-Funcional.md` referencia únicamente la versión vigente.
4. Las RN, RC y referencias downstream se actualizan en la misma operación.

Un nombre lógico tiene un solo archivo en la carpeta principal. Al superarse, se copia a `_legacy/` con el sufijo de la versión que preserva y el archivo vivo pasa a la versión nueva. La lección está documentada en la auditoría de Fase 0 del bootstrap: en el fuente convivían versiones paralelas sin marcado de deprecación y no había forma de saber cuál regía. en `Bootstrap/Audit-SDD1.md` Fase 0.

---

## 4. Estructura de redacción

### 4.1 Cabecera obligatoria

Cada artefacto inicia con un H1 y un bloque markdown de metadatos:

```markdown
# CU-XXXXX — <Nombre del caso de uso>

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** CU-XXXXX-<Nombre>.md
**Versión:** <X.Y>
**Estado:** Borrador | Propuesto | Aprobado | Vigente | Superado | Archivado
**Fecha:** YYYY-MM-DD
**Autor:** {{equipo-o-rol}}
```

Para RN, RC y modelo conceptual aplica la misma cabecera adaptando el prefijo y la descripción del documento.

**Tabla de contenido.** Todo documento generado que supere las tres secciones de primer nivel incluye una tabla de contenido inmediatamente después de la cabecera de metadatos, con enlaces ancla a cada sección de primer y de segundo nivel. La tabla de contenido no cuenta como sección de contenido ni altera la estructura obligatoria del documento: se ubica entre la cabecera y la primera sección, y las secciones obligatorias siguen siendo las que declara §4.2. Los documentos breves —fichas de una sola sección, entradas de índice— quedan exceptuados.

El ajuste es de navegabilidad. Estos documentos los lee principalmente un agente de IA que recorre la cadena de especificación acumulando contexto, y para ese lector la tabla de contenido es indiferente. Existe para el agente humano que entra a consultar un punto concreto sin haber leído el documento entero.

### 4.2 Secciones obligatorias de un CU

1. Propósito. Una a tres oraciones que respondan qué resuelve el CU y para quién.
2. Actores. Tabla con actor, tipo (primario/secundario/sistema) y rol.
3. Precondiciones. Lista de condiciones previas verificables.
4. Flujo principal. Pasos numerados con actor y acción.
5. Flujos alternativos. Cada uno con su identificador `FA-NN`, su disparador y su punto de retorno.
6. Excepciones y errores. Cada error con su código en la forma de §3.2, causa y respuesta del sistema.
7. Postcondiciones. Estado del sistema en caso de éxito y de fallo.
8. Criterios de aceptación Given/When/Then. Mínimo tres por CU, con valores concretos.
9. Trazabilidad. Tabla con NB upstream, RN aplicables, US a generar en 06, componentes en 05, tests en 08.
10. Notas y supuestos. Decisiones explícitas de alcance y dependencias externas.
11. Control de cambios. Tabla con versión, fecha y descripción.

**Conjuntos cerrados, marcados como tales.** Cuando un caso de uso, una regla de negocio o el modelo
conceptual declaran un conjunto cerrado —los valores admitidos de un campo, los estados de una
entidad, los códigos de resultado de una operación, una clasificación—, el conjunto se **marca
explícitamente como cerrado** en lugar de enumerarse en prosa, con la lista completa de sus valores y
el artefacto que lo declara.

Un conjunto cerrado marcado es identificable, y por lo tanto verificable entre categorías. Sin la
marca, otra categoría puede necesitar un valor más para que su parte funcione, especificarlo, y
quedar vigente y aprobada al mismo tiempo que ésta: cada categoría internamente coherente y el
producto documentado incoherente, sin que ningún audit lo detecte, porque los audits verifican cada
categoría contra su regla y su upstream y ninguno cruzaba dos buscando contradicciones sobre el mismo
referente.

**Extender un conjunto cerrado de otra categoría no lo decide un subagente.** Si esta categoría
necesita un valor que otra declaró cerrado, aplica la detención por arbitraje de `Master-Prompt.md`
§7.0: la pregunta va al humano y queda en el registro de decisiones pendientes. Escribir la
divergencia como nota dentro del artefacto no alcanza: una nota tiene el mismo peso visual que el
resto del texto y no interrumpe a nadie.

#### 4.2.1 Secciones obligatorias de una RN

1. Enunciado de la regla. Formal, declarativo, una sola oración cuando se pueda.
2. Justificación. Origen regulatorio, contractual o de negocio.
3. Ámbito de aplicación. Procesos, CU y momentos en los que la regla se evalúa.
4. Consecuencia si se viola. Rechazo, advertencia, compensación.
5. CU afectados. Lista explícita.
6. Pruebas que la verifican. Referencia a casos de prueba previstos en 08.
7. Control de cambios.

#### 4.2.2 Secciones obligatorias del modelo conceptual

1. Entidades. Una por subsección, con propósito y ejemplo de instancia.
2. Atributos clave. Sin tipos físicos (eso vive en 05). Solo nombre y semántica.
3. Relaciones. Verbalizadas en lenguaje natural.
4. Cardinalidades. Notación uniforme (1, N, 0..1, 1..N).
5. Reglas conceptuales. Enlace a cada RC-XXXXX que el modelo invoca.
6. Referencia al glosario. Puntero a `Glosario-Funcional.md`, con la lista de los términos del modelo que ese glosario declara. El glosario **no vive acá**: este documento es condicional según §2.1 y el vocabulario de la categoría no puede depender de que la unidad de entrega tenga persistencia.
7. Diagrama. Mermaid embebido o referencia a archivo aparte.
8. Trazabilidad. Tabla que liga cada entidad a los CU y RN que la consumen.
9. Control de cambios.

#### 4.2.3 Secciones obligatorias de una RC

1. Enunciado. Restricción de integridad expresada sobre entidades y relaciones.
2. Entidades involucradas. Lista explícita.
3. Tipo de restricción. Identidad, referencial, cardinalidad, valor permitido, derivación.
4. Mecanismo de verificación conceptual. Cómo se comprueba sin entrar en detalles físicos.
5. RN o CU que la justifican.
6. Control de cambios.

#### 4.2.4 Secciones obligatorias del glosario funcional

1. Cabecera obligatoria de §4.1, con trazabilidad upstream al glosario del dominio de 00.
2. Tabla de términos, una fila por término: término canónico, definición operativa en una o dos líneas, artefactos de 02 donde aparece, y sinónimos o alias si los hay.
3. Términos con más de un referente. Una subsección por término polisémico: los referentes enumerados, la forma que corresponde a cada uno, y la evidencia de que los contextos colisionan (`Vocabulario-Rules.md` §9.4, que remite a D9). Si ningún término lo requiere, la sección declara «ninguno verificado» y no se omite.
4. Términos referenciados y no redefinidos. Lista de los términos que ya declara el glosario del dominio de 00, con puntero. Materializa la regla de no duplicación de §3.3.
5. Control de cambios.

Un glosario cuya tabla de términos está vacía no cumple: la categoría 02 acuña vocabulario por construcción, y cinco casos de uso mínimos no se escriben sin nombrar entidades ni actores.

### 4.3 Secciones opcionales por tipo de unidad de entrega

Se permiten secciones adicionales según el tipo D8, sin desplazar las obligatorias:

- §12 Performance esperado del CU, sólo para rest-api, worker-service y mobile-app-maui.
- §13 Interacción multiusuario y concurrencia, sólo para web-monolith y web-microservices.
- §14 Permisos del sistema operativo, sólo para mobile-app-maui y desktop-app.
- §15 Idempotencia y reintento, sólo para worker-service y rest-api.
- §16 Contrato de stdout/stderr y exit codes, sólo para cli-tool.
- §17 Compatibilidad de versión pública, sólo para library.

### 4.4 Tablas tipo y formatos recurrentes

Se estandariza el uso de las siguientes tablas:

Tabla de criterios de aceptación:

| ID | Given | When | Then |
| --- | --- | --- | --- |
| CA-01 | <contexto> | <acción> | <resultado verificable> |

Tabla de trazabilidad del CU:

| Dimensión | Referencia |
| --- | --- |
| Necesidad de negocio | NB-XXXXX |
| Reglas de negocio aplicables | RN-XXXXX, RN-YY |
| Historias de usuario a generar | US-XXXXX (en 06) |
| Componentes esperados | <referencia tentativa a 05> |
| Tests previstos | <referencia tentativa a 08> |

Tabla del modelo conceptual:

| Entidad | Atributo | Semántica | Restricción conceptual |
| --- | --- | --- | --- |

Diagrama de flujo del CU expresado como pasos numerados o Mermaid sequenceDiagram cuando el flujo lo amerite.

### 4.5 Anti-patrones a evitar

| Anti-patrón | Problema | Solución |
| --- | --- | --- |
| CU que mezcla flujo funcional con detalle de interfaz | Invade 03 UX/UI y vuelve frágil el CU | Mover el detalle visual a 03; mantener en 02 sólo qué hace y para quién |
| RN escrita como CU | Confunde acción con invariante; rompe la trazabilidad | Reescribir como enunciado declarativo atemporal |
| Modelo conceptual con tipos físicos (varchar(255), int(11)) | Invade 05 modelo lógico | Mantener nombres y semántica; los tipos viven en 05 |
| Sufijo de versión en el nombre del archivo vivo | Reintroduce la segunda lógica de versionado que D4 eliminó, y con ella la colisión silenciosa al archivar | Un solo archivo por nombre lógico; la versión en la cabecera y el sufijo solo en `_legacy/` |
| Casing inconsistente (`NB-00001-Desacople` vs `NB-00002-estandarizacion`) | Inconsistencia que rompe automatizaciones | Forzar Título-Con-Guiones estricto |
| Sufijo de versión en el nombre del archivo vivo | Reintroduce la segunda lógica de versionado que D4 eliminó, y con ella la colisión al archivar | El archivo vivo no lleva sufijo; la versión va en la cabecera |
| CU sin escenarios de error | Solo flujo feliz; el sistema queda subdefinido | Agregar al menos una excepción por CU |
| Criterios de aceptación narrativos sin valores concretos | No automatizables; no anclan tests | Reescribir Given/When/Then con valores explícitos |
| CU con más de un actor primario | Ambigüedad de responsabilidad | Separar en dos CU o reorganizar el flujo |
| RN ambigua o subjetiva | No verificable | Reescribir hasta que un test pueda decidir cumplimiento |
| Numeración no contigua de CU sin justificación | Huecos confusos en el catálogo | Documentar la causa o renumerar |
| Glosario ausente porque la unidad de entrega no tiene modelo conceptual | El vocabulario de la categoría queda sin declarar en `library` y `cli-tool`, que igual acuñan sus casos de uso y sus reglas | `Glosario-Funcional.md` es obligatorio para los ocho tipos D8 y no depende de ningún flag |
| Término polisémico fuera del glosario | Un subagente aguas abajo que lee una sección suelta no puede resolver a qué referente apunta, y elige uno | Entrada de glosario que enumera los referentes, o forma calificada en las ocurrencias que colisionan |
| Calificar todas las ocurrencias de un término cuyos contextos son disjuntos | Carga el texto sin resolver nada; es la corrección típica de un falso positivo | Verificar la colisión antes de corregir (`Vocabulario-Rules.md` §9.1) |
| Glosario que redefine términos ya declarados en 00 | Dos definiciones del mismo término en la misma cadena documental | Referenciar el término de 00 y declarar solo la diferencia, si la hay |

---

## 5. Preguntas guía para el subagente

### 5.1 Upstream

- ¿Cada CU cubre al menos una NB de la unidad de entrega? ¿Hay NB sin CU? Esto último debe disparar una alerta y no un silencio.
- ¿Qué partes de la visión y del alcance (00) y de las NB (01) se materializan como CU? ¿Cuáles quedan deliberadamente fuera y por qué?
- ¿Existe un concepto técnico central que merezca un documento `Definicion-<Concepto>.md` propio?

### 5.2 Scope

- ¿Cuántos CU son razonables para el tipo D8 de la unidad de entrega? Library con menos de diez; microservicios con más de quince repartidos por bounded context.
- ¿Hay CU que en realidad son sub-flujos de otros? Si la respuesta es sí, fusionarlos o anidarlos como flujo alternativo.
- ¿Hay flujos de error que se repiten en varios CU? Si la respuesta es sí, considerar un CU transversal de manejo de errores.

### 5.3 Trazabilidad

- ¿Cada CU declara explícitamente su NB upstream?
- ¿Cada CU enumera RN que lo restringen, sin inventarlas?
- ¿Cada CU lista las US que se realizarán en 06, sin invadir el detalle de implementación?
- ¿El modelo conceptual referencia los CU y RN que lo justifican?

### 5.4 Calidad

- ¿Cada CU tiene mínimo tres criterios Given/When/Then con valores concretos?
- ¿Cada flujo alternativo tiene un escenario disparador y un punto de retorno explícito?
- ¿Cada excepción declara recuperación, handoff o terminación controlada?
- ¿Cada RN es verificable por un test automatizable?
- ¿Qué términos del dominio aparecen en más de un artefacto de esta categoría? ¿Están todos en `Glosario-Funcional.md`?
- ¿Hay algún término usado con más de un referente? Antes de calificarlo: ¿sus contextos **colisionan** en el sentido de `Vocabulario-Rules.md` §9.2, o se distinguen solos? Solo el primer caso se corrige.
- ¿Queda alguna forma desnuda de un término que ya se usa calificado en otro lado? Ése es el caso a resolver, no las formas calificadas.

### 5.5 Versionado

- ¿Existe alguna versión anterior en la carpeta principal? Si la respuesta es sí, archivarla en `_legacy/` antes de publicar la nueva.
- ¿El índice maestro apunta solamente a la versión vigente?

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

- [ ] [enumerable] Existe `Especificacion-Funcional.md` con índice maestro y matriz NB→CU→RN→US.
- [ ] [enumerable] La cantidad de CU cumple el mínimo declarado para el tipo D8 de la unidad de entrega.
- [ ] [enumerable] Cada CU contiene las once secciones obligatorias del §4.2.
- [ ] [interpretativo] Cada CU declara trazabilidad NB→CU→US y al menos tres criterios Given/When/Then con valores concretos.
- [ ] [enumerable] Cada RN contiene las siete secciones obligatorias del §4.2.1 y enumera CU afectados explícitos.
- [ ] [interpretativo] Si el tipo D8 exige modelo de datos, existe `Modelo-Datos/Modelo-Conceptual.md` con diagrama o tabla equivalente.
- [ ] [interpretativo] Si el modelo supera diez entidades, existen RC-XXXXX en `Modelo-Datos/reglas-conceptuales-de-modelo/` con las seis secciones obligatorias del §4.2.3.
- [ ] [enumerable] Existe `Glosario-Funcional.md` con las cinco secciones obligatorias de §4.2.4 y su tabla de términos no está vacía.
- [ ] [enumerable] Cada error declarado en §4.2 punto 6 lleva código en la forma `E-<DOMINIO>-NNNNN` de §3.2, dentro del rango asignado a la unidad de entrega, y ningún código colisiona con el de otra unidad de entrega del producto.
- [ ] [enumerable] Cada flujo alternativo lleva su identificador `FA-NN`.
- [ ] [enumerable] Ningún identificador de esta categoría fue acuñado por otra categoría, y esta categoría no acuñó identificadores para artefactos de otra (`Root-Rules.md` §9.5).
- [ ] [interpretativo] Todo conjunto cerrado que esta categoría declara está marcado como tal, con su lista completa de valores.
- [ ] [interpretativo] Ninguna otra categoría del árbol afirma algo incompatible sobre un conjunto cerrado que esta categoría declaró; si alguna lo necesita, la extensión está en el registro de decisiones pendientes y no como nota dentro de un artefacto.
- [ ] [interpretativo] Todo término del dominio que aparece en más de un artefacto de 02 está declarado en el glosario, con sus referentes cuando tiene más de uno. **El vocabulario del método** —el que el framework acuña e impone a la categoría, como `sonda` o `pasada de diseño`— no va en este glosario: vive en el glosario operativo de `Master-Prompt.md` §15 y se cita sin redefinir. `Glosario-Funcional.md` es del dominio del cliente.
- [ ] [interpretativo] Ningún término del glosario redefine con otra semántica un término ya declarado en el glosario del dominio de 00; los reusados se referencian.
- [ ] [interpretativo] Ninguna forma desnuda de un término polisémico queda sin resolver en un artefacto que se lee por secciones, según `Vocabulario-Rules.md` §9.2.
- [ ] [interpretativo] Ninguna polisemia con contextos disjuntos se reporta como defecto ni se corrige calificando todas las ocurrencias (criterio negativo de `Vocabulario-Rules.md` §9.1).
- [ ] [enumerable] Ningún archivo de la carpeta de trabajo lleva sufijo de versión en el nombre; cada uno declara su versión en el campo `Versión` de su cabecera (D4).
- [ ] [interpretativo] Ningún slug contiene mayúsculas, espacios, acentos ni caracteres no permitidos.
- [ ] [enumerable] Existe un solo archivo por nombre lógico en la carpeta principal; las versiones superadas viven en `_legacy/` con su sufijo de versión.
- [ ] [interpretativo] No hay menciones a stacks concretos, productos comerciales ni protocolos específicos del dominio fuente.
- [ ] [enumerable] Existe `README.md` de la sección si así lo decide el equipo (recomendado).
- [ ] [enumerable] Todo documento con más de tres secciones de primer nivel incluye tabla de contenido inmediatamente después de la cabecera, con enlaces ancla a las secciones de primer y de segundo nivel. Los documentos breves quedan exceptuados.

---

## 7. Ejemplos genéricos

### 7.1 Ejemplo 1 — Fragmento de CU para un web-monolith de salud

Fragmento ilustrativo, no documento completo:

```markdown
# CU-00003 — Asignar turno médico

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** CU-00003-Asignar-Turno-Medico.md
**Versión:** 1.0
**Estado:** Propuesto
**Fecha:** 2026-05-17
**Autor:** Equipo Funcional

## 1. Propósito
Permitir que un agente administrativo asigne un turno a un paciente sobre la agenda de un profesional, respetando los cupos y las reglas de superposición.

## 2. Actores
| Actor | Tipo | Rol |
| --- | --- | --- |
| Agente administrativo | Primario | Solicita la asignación |
| Sistema de agendas | Sistema | Valida cupos y reserva el horario |
| Paciente | Secundario | Recibe la confirmación |

## 8. Criterios de aceptación
| ID | Given | When | Then |
| --- | --- | --- | --- |
| CA-01 | Una agenda con cupo libre a las 10:00 | El agente solicita asignar a las 10:00 | El sistema reserva el turno y emite confirmación |
| CA-02 | Una agenda sin cupo libre a las 10:00 | El agente solicita asignar a las 10:00 | El sistema rechaza la solicitud con el código TURNO_SIN_CUPO |
| CA-03 | Un paciente con turno superpuesto vigente | El agente solicita asignar | El sistema rechaza con el código PACIENTE_SOLAPADO |

## 9. Trazabilidad
| Dimensión | Referencia |
| --- | --- |
| Necesidad de negocio | NB-00002 |
| Reglas de negocio aplicables | RN-00002, RN-00004 |
| Historias de usuario | US-00005, US-00006 |
```

### 7.2 Ejemplo 2 — Fragmento de RN para un rest-api de pagos

```markdown
# RN-00002 — Validez del identificador de pago

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** RN-00002-Validez-Identificador-Pago.md
**Versión:** 1.0
**Estado:** Aprobada
**Fecha:** 2026-05-17

## 1. Enunciado
Todo identificador de pago aceptado por el sistema debe ser único, opaco al cliente y emitido por el subsistema autorizado.

## 2. Justificación
Auditoría regulatoria del proceso de cobro. Evita colisiones de cobro y permite reconciliación trazable.

## 3. Ámbito de aplicación
- CU-00001 Registrar intento de pago.
- CU-00004 Confirmar pago.
- CU-00007 Reembolsar pago.

## 4. Consecuencia si se viola
El sistema rechaza la operación con el código IDENTIFICADOR_INVALIDO y no registra el intento.

## 5. CU afectados
CU-00001, CU-00004, CU-00007.
```

### 7.3 Ejemplo 3 — Fragmento del modelo conceptual para un worker-service

```markdown
# Modelo conceptual

## 3.1 Mensaje recibido
Representa cada mensaje entrante procesado por el worker.

**Atributos clave**
- IdentificadorMensaje
- TipoEvento
- FechaRecepcion
- EstadoProcesamiento

## 4.1 MensajeRecibido — ResultadoProcesamiento
Un mensaje recibido produce uno y solo un resultado de procesamiento.
**Cardinalidad:** MensajeRecibido (1) —— (1) ResultadoProcesamiento

## 5. Reglas conceptuales
- RC-00001: IdentificadorMensaje es único en toda la historia del worker (idempotencia).
- RC-00002: Todo MensajeRecibido referencia un TipoEvento del catálogo vigente.
```

Los tres fragmentos son ilustrativos. Cada unidad de entrega adapta el dominio respetando la estructura.

---

## 8. Prompt-snippet sugerido

```text
Sos un {{ESPECIALIDAD-VARIANTE}} responsable de redactar la especificación funcional de la unidad de entrega {{NOMBRE_PROYECTO_CODIGO}}.

Insumos:
- PRODUCT-INTAKE: {{path}}
- Upstream: 00 (visión, alcance), 01 (NB-XXXXX).

A generar (según tipo {{TIPO}} de D8):
- Especificacion-Funcional.md (índice maestro con matriz NB→CU→RN→US).
- Casos-De-Uso/CU-XXXXX-<Nombre>.md (mínimo según §2.2).
- Reglas-De-Negocio/RN-XXXXX-<Nombre>.md (si aplica).
- Modelo-Datos/Modelo-Conceptual.md (si aplica).
- Modelo-Datos/reglas-conceptuales-de-modelo/RC-XXXXX-<Nombre>.md (si el modelo supera 10 entidades).
- README.md de la sección (recomendado).

Reglas de redacción: §4 de Rules-Especificacion-Funcional.md.
Nomenclatura: `CU-XXXXX-<Nombre>.md` con guion medio `-v` (no `_v` ni `.v`); slug en Título-Con-Guiones estricto.
Trazabilidad: cada CU debe enlazar a una NB y enumerar US a generar en 06.
Criterios de calidad: §6 de Rules-Especificacion-Funcional.md.
Política de versionado: §3.5; una sola versión vigente; anteriores a `_legacy/` con estado Superado.

Restricciones: no introducir stacks concretos, productos comerciales ni protocolos del dominio fuente. Idioma rioplatense técnico, tildes correctas, sin emojis.

Salida: SDD/Docs/Unidades-Entrega/{{NOMBRE_UNIDAD_ENTREGA}}/02-Especificacion-Funcional/<estructura>.
```

---

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-05-17 | Reglas iniciales generadas durante bootstrap SDD. |
| 1.1 | 2026-06-09 | Validación ST-06: la categoría se genera por proyecto bajo `Proyectos/<Nombre-Proyecto>/02-Especificacion-Funcional/`; la frase de cierre de §1.2 y la ruta de salida del prompt-snippet referencian el `project_type` del proyecto en curso (manifiesto). Tablas §1.2 sin reescritura. |
| 1.2 | 2026-06-10 | Migración de referencias de intake al documento unificado SOLUTION-INTAKE (unificación de intake). |
| 1.3 | 2026-07-26 | Navegabilidad para lectores humanos: §4.1 y §6 exigen tabla de contenido en todo documento generado que supere las tres secciones de primer nivel, con enlaces ancla de primer y segundo nivel y excepción para documentos breves. Es el único cambio: no se altera la estructura obligatoria de los documentos, no se agregan artefactos ni carga narrativa. |
| 2.0 | 2026-07-28 | Normalización del versionado (framework 4.0). El archivo vivo pierde el sufijo de versión del nombre y pasa a declarar su versión en el campo `Versión` de su cabecera; el sufijo `-v<X.Y>.md` queda reservado a las copias archivadas en `_legacy/`. Se actualizan los patrones de nombre, los ejemplos, las cabeceras modelo, los anti-patrones y los criterios de aceptación de la categoría. Sube major porque la documentación generada con la nomenclatura anterior deja de cumplir. Deriva de la reformulación de D4 y D5 en el `README.md` del framework. |
| 3.0 | 2026-07-29 | Renombre de vocabulario normativo (framework 5.0). El nivel superior pasa de «solución» a **producto**, la unidad de compilación de «proyecto» a **proyecto de código**, y los cuatro planos de identidad del producto se separan en campos propios (`Nombre-Producto`, `Slug-Producto`, `Raiz-Codigo`, `Artefacto-Agrupacion`). Se declara el nivel de aplicación de la regla en su cabecera, según `Vocabulario-Rules.md` §4 R3. Sube major porque los identificadores y los nombres de artefacto cambian, y la documentación generada con la nomenclatura anterior deja de cumplir. |
| 4.0 | 2026-07-29 | **Gobierno del glosario de la categoría.** Sube major porque incorpora un artefacto obligatorio para los ocho tipos D8 y la documentación de 02 emitida sin él deja de cumplir. §2.1 declara `Glosario-Funcional.md` como artefacto propio: el glosario deja de ser el punto 6 de `Modelo-Conceptual.md`, que es condicional a la persistencia, de modo que un `library` o un `cli-tool` ya no queda sin glosario aunque acuñe sus cinco casos de uso mínimos y sus reglas de negocio. §4.2.2 punto 6 pasa a ser referencia al artefacto. §4.2.4 nueva fija sus cinco secciones obligatorias, incluida la de términos con más de un referente, que no se omite: si ninguno lo requiere, declara «ninguno verificado». §3.3 suma la regla de inclusión (todo término en más de un artefacto de 02), la de no duplicación frente al glosario del dominio de 00 y la de polisemia, que remite al criterio de `Vocabulario-Rules.md` §9. §5.4 suma tres preguntas guía y §4.5 cuatro anti-patrones, entre ellos calificar todas las ocurrencias de un término cuyos contextos son disjuntos. §6 suma cinco criterios verificables. **Corregido**: §0 citaba «11 (ejemplos)», número nuevo con el significado viejo, residuo del intercambio 10 ↔ 11; y §3.1, §3.5 y §5.1 nombraban `especificacion-funcional.md`, `modelo-conceptual.md` y `definicion-<concepto>.md` en todo-minúsculas, variante que el párrafo siguiente de la propia §3.1 prohíbe y que contradecía a §2.1. **Origen**: la categoría 02 es la que más vocabulario acuña y la única de las trece cuya palabra «glosario» aparecía una sola vez en todo el archivo, sin criterio de inclusión y sin verificación en §6. |
| 4.1 | 2026-08-15 | Identificadores, conjuntos cerrados y vocabulario del método (intervención reportes 00 a 11). **§3.2** declara la forma, el ámbito y el asignador de los **códigos de error**, que §4.2 punto 6 exigía sin regular: forma `E-<DOMINIO>-NNNNN`, ámbito producto, y los asigna la 02 del proyecto de código dueño del error dentro de su rango. Se agrega el identificador `FA-NN` de los flujos alternativos, que otra categoría necesitaba citar y terminaba acuñando aguas abajo. **§4.2** exige marcar como tales los **conjuntos cerrados** que la categoría declara, y remite la extensión de un conjunto ajeno a la detención por arbitraje de `Master-Prompt.md` §7.0 en lugar de admitir una nota dentro del artefacto. **§6** suma seis criterios, marcados por naturaleza, y precisa que el vocabulario del método no va en `Glosario-Funcional.md`, que es del dominio del cliente. Sube **minor**: agrega criterios y declaraciones sin cambiar el conjunto de artefactos de la categoría. Origen: reportes `01` (cinco incidentes de numeración, con cinco prefijos de código de error colisionando entre proyectos), `03` y `11`. Además, **§6 clasifica cada criterio de aceptación** como `[enumerable]` o `[interpretativo]`, con la nota que declara la política conservadora: ante la duda se marca interpretativo, porque declarar mecanizable lo que no lo es produce falsa confianza. Los enumerables son lo que la compuerta mecánica de `Master-Prompt.md` §10.0 debe cubrir. Origen adicional: reportes `09` y `10`. |
| 5.0 | 2026-08-15 | **El nivel intermedio pasa a ser la unidad de entrega** (framework 8.0). La cabecera declara el nivel nuevo, la carpeta target pasa de `Proyectos/<Nombre-Proyecto-Codigo>/` a `Unidades-Entrega/<Nombre-Unidad-Entrega>/`, las variantes de §1.2 se seleccionan por `tipo_unidad_entrega` —que es el nombre nuevo de la variable D8, porque los ocho valores son formas de **entrega**— y la prosa normativa pasa a nombrar la unidad de entrega donde el referente era el nivel intermedio, conservándola donde el referente es la unidad de compilación. Sube **major**: cambia el nivel de aplicación de la categoría, su ruta de salida y el nombre de una variable bloqueante; la documentación generada con la versión anterior deja de cumplir. Origen: el pendiente declarado en `Vocabulario-Rules.md` §8 desde la 5.0, con la evidencia medida sobre tres destinos reales. |
| 5.1 | 2026-08-16 | Corrige la **ruta de salida** de su prompt de despacho de referencia, que seguía emitiendo a `SDD/Docs/Proyectos/{{NOMBRE_PROYECTO_CODIGO}}/` —el layout que la 8.0 reemplazó— y que además citaba un marcador que el contexto de despacho ya no define. Pasa a `SDD/Docs/Unidades-Entrega/{{NOMBRE_UNIDAD_ENTREGA}}/`. Corrige además las concordancias de género que la sustitución léxica de la 8.0 dejó al pasar «proyecto» a «unidad de entrega» (`Vocabulario-Rules.md` §9.5). Sube **patch**: ningún documento generado deja de cumplir. |
| 5.2 | 2026-08-16 | **La cabecera obligatoria de §4.1 declaraba el nivel anterior a la 8.0.** Cada documento generado copia esa plantilla literal, y empezaba con `**Proyecto de código:** {{Nombre-Proyecto-Codigo}}` cuando los documentos de las categorías 02 a 11 pertenecen a una **unidad de entrega** y viven bajo `Unidades-Entrega/`. Pasa a `**Unidad de entrega:** {{Nombre-Unidad-Entrega}}`. Los tres barridos anteriores no la vieron porque vive **dentro de un bloque de ejemplo cercado**, que ninguno abría; `SDD-Development-Guide.md` §VI.3.1 suma la regla. Sube **patch**: corrige el nivel declarado en la cabecera sin cambiar ninguna sección ni ningún artefacto. |
