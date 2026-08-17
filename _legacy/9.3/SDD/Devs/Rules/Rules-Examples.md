# Reglas constructivas — 10 Examples

**Carpeta target (por unidad de entrega):** `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/10-Examples/`
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Unidad de entrega
**Subagente target del orquestador:** Developer Advocate / Sample Engineer Senior (AG-10)
**Versión de las reglas:** 6.3

---

## 0. Posición en la cadena SDD

La categoría 10 materializa el sistema en código ejecutable concreto. Recibe upstream de 02 (casos de uso que cada sample ilustra) y de 05 (arquitectura y contratos públicos que cada sample respeta). Su downstream metodológico dentro de SDD es la categoría 11, que explica, contextualiza y enlaza los samples sin duplicar su código. Fuera del ciclo de especificación la leen los integradores, los mantenedores nuevos de la unidad de entrega y los evaluadores técnicos del cliente.

A diferencia de la categoría 11, que explica los conceptos y guía el recorrido intercalando snippets, la categoría 10 produce unidades de entrega completos y funcionales que se clonan, se ejecutan en un entorno limpio y se modifican como punto de partida. La diferencia es operativa: 10 demuestra con código ejecutable y verificable, 11 explica y referencia.

Esta categoría se condiciona por **quién va a consumir el artefacto**, y no por el tipo D8. El motivo de la obligación es que «el integrador del artefacto necesita ejemplos reproducibles para arrancar»: donde no hay integrador previsible, la obligación no tiene a quién servir.

La pregunta la responde un campo que el manifiesto ya declara por unidad de entrega: **`redistribuible`**.

| Condición | Obligatoriedad de la categoría 10 |
| --- | --- |
| `redistribuible` == true | **Obligatoria**, con la progresión completa de §2.2 |
| `redistribuible` == false y `tiene_portal_developers` == true | **Obligatoria**, con el piso reducido de §2.2 |
| `redistribuible` == false y sin portal de developers | **Recomendada**. Su omisión no requiere ADR de apartamiento: la obligación está condicionada, no dispensada |

Un unidad de entrega de tipo `library` que viaja adentro de la publicación autocontenida de otro
proyecto del mismo producto no tiene integrador que lo consuma por gestor de paquetes, y no lo va a
tener sin cambiar la decisión de empaquetado del producto entero. Condicionar sobre el tipo lo
obligaba igual, y las tablas de §2.1 y §2.2 —que son las que el orquestador lee para filtrar
documentos, por `Master-Prompt.md` §8— decían `library: obligatorio` sin condición alguna, mientras
la cláusula de omisión vivía en la prosa de esta sección. Dos partes de la misma regla daban
respuestas distintas, y la que el orquestador ejecutaba era la incondicional.

La auditoría de Fase 0 (`Bootstrap/Audit-SDD1.md`) detectó dos déficits del fuente SDD 1.0 que SDD corrige aquí. Primero, los archivos del fuente nombran los ejemplos por dominio (`ejemplo-02-multa.md`, `ejemplo-03-multaapp-nuget.md`), atando el sample al producto particular y descartando la idea de progresión didáctica. SDD obliga a nombrar por nivel de complejidad o por capacidad demostrada (`ejemplo-01-basico`, `ejemplo-02-intermedio`, `ejemplo-03-avanzado`, o variantes por capacidad como `ejemplo-01-cliente-http-basico`, `ejemplo-02-postman-collection`). Segundo, los markdown del fuente no llevan sufijo de versión; SDD obliga al sufijo uniforme `.md` para todos los archivos versionables de esta categoría, incluyendo `README.md` cuando se considere artefacto versionable (en este caso se mantiene `README.md` sin sufijo por convención de índice).

### 0.1 Las dos aristas del sample

Un sample ejecutable sirve para dos cosas distintas, y esta categoría exige ambas. Confundirlas produce ejemplos bonitos que no prueban nada, o tests disfrazados de ejemplo que nadie entiende.

| Arista | Qué hace el sample | A quién le sirve |
| --- | --- | --- |
| **A — Referencia de integración** | Demuestra cómo incorporar la unidad de entrega en una aplicación propia: caso realista, autocontenido, ejecutable siguiendo su README local | Al integrador, que copia el patrón y lo adapta |
| **B — Arnés de autovalidación** | Verifica que cada incremento construido sigue satisfaciendo los casos de uso especificados. El sample declara, además de qué ilustra, **qué verifica** | Al equipo que construye, y a los agentes de IA que codifican contra la especificación |

La arista A es el rol histórico de la categoría y no cambia. La arista B es lo que convierte al sample en instrumento de control: cada uno lleva un `Contrato de verificación` (§4.6) con una aserción evaluable por una máquina, y ese contrato se ejecuta durante la codificación. Un sample cuyo criterio de aceptación falla es un hallazgo, no un documento pendiente.

Ambas aristas viven en el mismo artefacto. Está prohibido partir el sample en una versión ilustrativa y otra verificable: divergirían, y la ilustrativa quedaría desactualizada primero.

### 0.2 Momento de generación: dos pasadas

La categoría no se produce de una sola vez, porque su arista B requiere código que en la fase de especificación todavía no existe.

| Pasada | Cuándo | Qué produce |
| --- | --- | --- |
| **De diseño** | Pre-código, dentro de la cadena de especificación | Los markdown explicativos completos y el `Contrato de verificación` con su `criterio_aceptacion` ya declarado. El campo `evidencia` se marca `No verificado — sin código`. Las carpetas de `/samples` quedan esqueletadas, con su README local y su comando previsto |
| **De ejecución** | Durante la codificación, ante cada incremento | El sample se implementa, se corre, y `evidencia` se completa con la salida real y su fecha. El estado del contrato pasa a `Verificado` o a `Falla` |

Declarar el criterio de aceptación antes de escribir el código es deliberado: obliga a definir qué se va a considerar correcto mientras todavía se puede discutir, y no después, cuando la implementación ya sesgó la respuesta. Es la misma lógica por la que un test se escribe contra la especificación y no contra el código que ya está.

**Anclaje de industria.** La arista B corresponde a las prácticas de *Specification by Example* y *Executable Specification*, donde el ejemplo concreto opera simultáneamente como documentación y como criterio de aceptación automatizable.

---

## 1. Especialidad asignada

### 1.1 Especialidad base

Developer Advocate / Sample Engineer Senior, equivalente al AG-10 del catálogo SDD. Perfil profesional que construye aplicaciones de referencia ejecutables que demuestran cómo usar el producto en escenarios reales. A diferencia del Technical Writer (AG-11) que documenta conceptos y guías, el Developer Advocate produce código que se compila, se corre y se observa. Cada sample es una unidad de entrega autocontenido con su propia documentación, sus prerequisitos, sus comandos de arranque y su resultado esperado verificable.

El rol combina Sample Engineering (construcción de unidades de entrega de referencia progresivos) con curaduría editorial: decide qué capacidades exhibe cada sample, cómo escalan en complejidad, qué CU ilustran y qué punto de extensión del sistema cubren. Cuando la unidad de entrega se expone públicamente, el rol también incluye Developer Relations (DevRel) y Developer Education, pero esas facetas se activan en unidades de entrega con comunidad de integradores externos, no en toda unidad de entrega interno.

### 1.2 Variantes según tipo de unidad de entrega (8 valores D8)

| Tipo | Especialidad específica | Justificación |
| --- | --- | --- |
| library | Sample Engineer | Apps consumidoras progresivas (consola, mini-app) que invocan la librería vía package manager. Cada sample muestra un nivel distinto de la superficie pública. |
| web-monolith | Sample Engineer | Datos seed para arrancar la app de demostración, scripts de bootstrap, screenshots de UI y opcionalmente un tema custom mínimo. |
| web-microservices | Sample Engineer + Demo Orchestrator | docker-compose end-to-end con todos los servicios más un cliente de prueba (curl, Postman, Bruno). Demo Orchestrator garantiza que el entorno levante con un comando. |
| desktop-app | Sample Engineer | Plugin de demostración y tema custom que prueban los puntos de extensión declarados en 05. |
| mobile-app-maui | Sample Engineer | Proyecto de código móvil multiplataforma demo con storyboard de pantallas, datos mock y un escenario offline-first. |
| rest-api | Sample Engineer + API Demo | Cliente HTTP de referencia (curl + lenguaje del integrador típico), colección Postman o Bruno, SDK generado a partir del contrato OpenAPI. |
| cli-tool | Sample Engineer | Recetas multi-OS (Windows, Linux, macOS) con scripts batch/bash equivalentes y casos de uso reales por subcomando. |
| worker-service | Sample Engineer | docker-compose con broker (RabbitMQ, Kafka o equivalente) y productor de prueba que dispara mensajes representativos al worker. |

El orquestador lee esta tabla y, según el `tipo_unidad_entrega` de la unidad de entrega en curso (leído del manifiesto de producto), selecciona la variante correspondiente y la combina con la especialidad base. La variante se aplica una vez por cada unidad de entrega del producto.

### 1.3 Multi-especialidad

La categoría 10 colabora con varias especialidades durante la redacción y la revisión:

- AG-02 Analista Funcional, para identificar qué CU debe ilustrar cada sample y validar la trazabilidad declarada.
- AG-05 Arquitecto, para garantizar que los samples respeten los contratos públicos y los puntos de extensión definidos.
- AG-08 QA, para que cada sample tenga al menos un test ejecutable que sirva de verificación automatizada del resultado esperado.
- AG-09 DevOps, para que los samples se construyan en un job del pipeline CI y se verifique periódicamente que siguen siendo ejecutables.
- AG-11 Technical Writer / Documentation Lead, dueño de la categoría 11, que explica, contextualiza y enlaza estos samples desde el cuerpo documental de entrega sin duplicar su código.

El AG-10 mantiene titularidad de los artefactos. Las demás especialidades aportan revisión sectorial y consumen los samples como ejemplo verificable de las decisiones tomadas en sus categorías.

---

## 2. Documentos que produce esta categoría

### 2.1 Tabla maestra

| Archivo | Obligatorio para | Recomendado | Omitir para | Descripción |
| --- | --- | --- | --- | --- |
| `README.md` | `redistribuible` == true, o `tiene_portal_developers` == true | Resto de las unidades de entrega | — | Índice de samples con tabla maestra (nivel, tiempo de setup, CU ilustrados, ubicación en `/samples`). |
| `ejemplo-01-basico.md` o `ejemplo-01-<Progresion>.md` | `redistribuible` == true, o `tiene_portal_developers` == true | Resto de las unidades de entrega | — | Markdown explicativo del sample de nivel básico. |
| `ejemplo-02-intermedio.md` o `ejemplo-02-<Progresion>.md` | `redistribuible` == true, en los tipos con progresión de tres de §2.2 | Resto | Proyectos de código con `redistribuible` == false | Markdown explicativo del sample de nivel intermedio. |
| `ejemplo-03-avanzado.md` o `ejemplo-03-<Progresion>.md` | `redistribuible` == true, en los tipos con progresión de tres de §2.2 | Resto | Proyectos de código con `redistribuible` == false | Markdown explicativo del sample de nivel avanzado o de integración. |
| `Imagenes/` (carpeta) | Cuando los markdown referencian screenshots o assets visuales | — | Samples sin UI | Carpeta de assets versionados (PNG, SVG). Sin assets binarios pesados; preferir vectoriales. |

Cada markdown explicativo se acompaña de una unidad de entrega ejecutable en `/samples/<carpeta-correspondiente>/` del repositorio. La categoría 10 documenta el sample; la materialización en código vive en `/samples` y se gobierna desde §16.1 del PRODUCT-INTAKE (materialización de `/samples`).

### 2.2 Cantidad mínima de samples por tipo

| Tipo D8 | Samples mínimos | Niveles cubiertos |
| --- | --- | --- |
| library | 3 | básico + intermedio + avanzado |
| web-monolith | 2 | datos seed + tema custom (si hay punto de extensión visual) |
| web-microservices | 2 | compose mínimo + compose end-to-end |
| desktop-app | 2 | plugin demo + tema custom |
| mobile-app-maui | 3 | app básica + sync offline + multiplataforma |
| rest-api | 3 | cliente HTTP básico + colección Postman/Bruno + SDK tipado |
| cli-tool | 3 | recetas Windows + recetas Linux + recetas macOS |
| worker-service | 2 | compose con broker + productor de prueba |

Estos son pisos, y **el piso rige cuando `redistribuible` == true**. Un unidad de entrega no
redistribuible que emite la categoría por tener portal de developers, o por decisión del equipo, tiene
piso de **un** sample: el que cubra el camino de entrada más frecuente. La progresión de tres existe
para el integrador que arranca de cero y necesita subir de nivel; sin integrador externo, obligar a
tres produce dos artefactos que existen para satisfacer un piso.

Un unidad de entrega puede agregar samples adicionales para cubrir capacidades extra (autenticación,
multi-tenancy, observabilidad), siempre que cada uno mantenga la nomenclatura por progresión o por
capacidad y declare su nivel.

### 2.3 Matriz tipo D8 → carpetas en `/samples`

La carpeta `/samples` del repositorio refleja directamente los archivos documentados en `docs/10-Examples/`. Hay correspondencia 1:1 entre cada `ejemplo-XXXXX-<Nombre>.md` y una carpeta ejecutable en `/samples/`.

| Tipo D8 | Estructura mínima de `/samples` |
| --- | --- |
| library | `/samples/01-basico-consola/`, `/samples/02-intermedio-con-extensiones/`, `/samples/03-avanzado-integracion-real/` |
| web-monolith | `/samples/01-datos-seed/`, `/samples/02-tema-custom/` (este último sólo si hay punto de extensión visual) |
| web-microservices | `/samples/01-compose-minimo/`, `/samples/02-compose-end-to-end/` |
| desktop-app | `/samples/01-plugin-demo/`, `/samples/02-tema-custom/` |
| mobile-app-maui | `/samples/01-app-basica/`, `/samples/02-sync-offline/`, `/samples/03-multiplatform-demo/` |
| rest-api | `/samples/01-cliente-http-basico/`, `/samples/02-postman-collection/`, `/samples/03-sdk-tipado-generado/` |
| cli-tool | `/samples/01-recetas-windows/`, `/samples/02-recetas-linux/`, `/samples/03-recetas-mac/` |
| worker-service | `/samples/01-compose-broker/`, `/samples/02-productor-de-prueba/` |

Esta tabla es vinculante: el contenido de `/samples` no se inventa; se deriva del tipo D8 declarado y se ajusta sólo agregando carpetas extra, nunca renombrando las base por nombres atados al dominio.

---

## 3. Nomenclatura y vinculación

### 3.1 Patrón de nombres

- `ejemplo-XXXXX-<Progresion>.md` para el markdown explicativo de cada sample.
- `XXXXX` es el número correlativo con el ancho de `Root-Rules.md` §9.2, empezando en `00001` y respetando la progresión.
- `<Progresion>` describe nivel de complejidad o capacidad demostrada, en Título-Con-Guiones estricto. Valores admitidos por nivel: `basico`, `intermedio`, `avanzado`. Valores admitidos por capacidad: `cliente-http-basico`, `postman-collection`, `sdk-tipado-generado`, `plugin-demo`, `tema-custom`, `compose-minimo`, `compose-end-to-end`, `recetas-windows`, `recetas-linux`, `recetas-mac`, `compose-broker`, `productor-de-prueba`, `app-basica`, `sync-offline`, `multiplatform-demo`, `datos-seed`, `con-extensiones`, `integracion-real`.
- Sufijo `.md` obligatorio y uniforme. Queda prohibido el patrón heredado sin versión (por ejemplo `ejemplo-01-simple.md` del fuente). Queda prohibido el sufijo de dominio (por ejemplo `ejemplo-02-multa`, `ejemplo-03-multaapp-nuget`, `ejemplo-04-factura`, `ejemplo-05-recibo`, o cualquier otro nombre atado al producto particular).
- `README.md` de la sección sin sufijo de versión. Es el índice navegable. Al archivarse sí recibe el sufijo: `_legacy/<YYYY-MM-DD>/README-v<X.Y>.md`, con la versión tomada del campo `Versión` de su cabecera, porque en el snapshot la versión es lo que lo identifica y sin ella dos archivados del mismo día colisionan. La regla general y su tabla de exenciones viven en `Master-Prompt.md` §5.1.

### 3.2 Reglas de progresión

La numeración refleja un orden de lectura recomendado de menor a mayor complejidad. Sample 01 introduce el camino feliz mínimo; sample 02 agrega complejidad típica del caso intermedio (configuración, datos reales, integraciones simples); sample 03 demuestra el caso avanzado o el punto de extensión principal. Si la unidad de entrega opta por progresión por capacidad en lugar de por nivel, cada sample debe igual declarar su nivel implícito en §2 del markdown (básico, intermedio o avanzado).

Está prohibida la numeración por dominio de la unidad de entrega. La progresión `multa → multaapp-nuget` del fuente es exactamente lo que SDD corrige: ese par mezcla nombre de caso de uso con nombre de mecanismo de distribución, sin transmitir progresión didáctica. SDD obliga a que el slug responda a "qué demuestra el sample respecto al anterior", no a "qué dominio modela".

### 3.3 Vinculación cross-doc

- Upstream: cada sample declara qué CU de 02 ilustra y qué bloque arquitectónico de 05 ejercita. La trazabilidad vive en §8 del markdown explicativo.
- Downstream: la categoría 11 referencia cada sample desde el cuerpo documental de entrega, lo contextualiza y lo enlaza sin duplicar su código. Fuera del ciclo de especificación, el sample lo leen los integradores, los evaluadores técnicos y los equipos de adopción.
- Vinculación con el código: cada markdown apunta a la carpeta concreta de `/samples/XX-<Progresion>/` del repositorio. La estructura del código sigue la misma progresión que la documentación.

### 3.4 Política de versionado

Cada markdown declara su versión en la cabecera y no en el nombre. La primera emisión es siempre `1.0`. Cuando el sample se reescribe sustancialmente (cambia el escenario, el nivel o el conjunto de capacidades demostradas), se promueve a `-v2.0` y la versión anterior se archiva en `_legacy/` con estado `Superado`. Cambios menores que no alteran la progresión ni el escenario (correcciones de typos, refresh de screenshots, ajustes de prerequisitos) van en `-v1.1`, `-v1.2`, etc. dentro de la misma rama mayor.

El código en `/samples/` se versiona junto con el repositorio principal: no lleva sufijo propio, pero su CI debe garantizar que siempre compila contra la versión actual del producto.

### 3.5 README de la sección

El `README.md` de `/Docs/10-Examples/` lista los samples vigentes en una tabla maestra con columnas: número, slug, nivel, tiempo de setup estimado, CU ilustrados, ubicación en `/samples`. El README se actualiza cada vez que se agrega, renombra o jubila un sample.

---

## 4. Estructura de redacción

### 4.1 Cabecera obligatoria

Cada markdown explicativo inicia con un H1 y un bloque de metadatos uniforme:

```markdown
# Ejemplo XX — <Nombre descriptivo del sample>

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** ejemplo-XXXXX-<Progresion>.md
**Versión:** <X.Y>
**Estado:** Borrador | Propuesto | Aprobado | Vigente | Superado | Archivado
**Fecha:** YYYY-MM-DD
**Autor:** {{equipo-o-rol}}
**Nivel:** Básico | Intermedio | Avanzado
**Ubicación del código:** `/samples/XX-<Progresion>/`
```

### 4.2 Secciones obligatorias del markdown explicativo

1. **Objetivo del sample.** Una a tres oraciones que describen qué capacidad demuestra el sample y qué aprende el desarrollador después de ejecutarlo. Responde a "¿por qué este sample existe?".
2. **Nivel.** Declaración explícita del nivel (básico, intermedio o avanzado) con justificación breve respecto al sample anterior. Si la progresión es por capacidad, igualmente se declara el nivel implícito.
3. **Prerequisites.** Lista de herramientas, runtimes, SDKs, credenciales y dependencias externas necesarias para ejecutar el sample. Sin ambigüedad; cada ítem tiene versión mínima cuando aplica.
4. **Cómo correrlo.** Comandos paso a paso copiables, máximo cinco pasos para llegar a la primera ejecución exitosa. Cada comando se ejecuta en un entorno limpio reproducible.
5. **Estructura del código.** Árbol resumido de la carpeta `/samples/XX-<Progresion>/` con descripción breve por archivo o subcarpeta relevante.
6. **Qué esperar.** Output exacto que el desarrollador verá después de ejecutar el sample, ya sea texto en consola, payload HTTP, screenshot de UI o archivo generado. Si hay UI, screenshot bajo `Imagenes/`.
7. **Variaciones sugeridas.** Tabla con dos a cuatro variaciones que el desarrollador puede probar modificando el sample, con descripción de qué cambiar y qué resultado esperar. Sirve de puente didáctico hacia el sample siguiente.
8. **Trazabilidad.** Tabla con los CU, NB, ADR o NFR de 02/05 que el sample ilustra. Cada fila enlaza al artefacto fuente.
9. **Contrato de verificación.** Bloque obligatorio de la arista B, con los cinco campos de §4.6. Es lo que distingue a un sample de una demo.
10. **Control de cambios.** Tabla de versiones del propio markdown con fecha, versión y descripción del cambio.

Son **diez** secciones obligatorias. La sección 9 es la incorporación de la arista B; las nueve restantes conservan su definición previa.

### 4.3 Estructura del `README.md` de la sección

1. Propósito de la carpeta: qué encuentra el lector en `/Docs/10-Examples/` y en `/samples/`.
2. Tabla maestra de samples vigentes.
3. Convenciones de los samples (autocontenidos, ejecutables en entorno limpio, trazabilidad obligatoria, niveles declarados).
4. Cómo agregar un sample nuevo: referencia al §6 de estas reglas y al template del markdown explicativo.
5. Vínculo con el cuerpo documental de entrega de 11 y con la arquitectura de 05.

### 4.4 Tablas tipo

Tabla maestra del `README.md`:

| Sample | Nivel | Tiempo de setup | CU ilustrados | Ubicación |
| --- | --- | --- | --- | --- |
| `Ejemplo-01-Basico.md` | Básico | < 5 min | CU-00001, CU-00002 | `/samples/01-basico/` |
| `Ejemplo-02-Intermedio.md` | Intermedio | 10-15 min | CU-00003, CU-00004, CU-00005 | `/samples/02-intermedio/` |
| `Ejemplo-03-Avanzado.md` | Avanzado | 20-30 min | CU-00006, CU-00007, CU-00008 | `/samples/03-avanzado/` |

Tabla tipo de unidad de entrega vs estructura de `/samples` (replica resumida de §2.3 al pie del README):

| Tipo D8 | Estructura de `/samples` |
| --- | --- |
| library | `01-basico-consola/`, `02-intermedio-con-extensiones/`, `03-avanzado-integracion-real/` |
| rest-api | `01-cliente-http-basico/`, `02-postman-collection/`, `03-sdk-tipado-generado/` |
| cli-tool | `01-recetas-windows/`, `02-recetas-linux/`, `03-recetas-mac/` |
| (resto) | Ver §2.3 de las reglas constructivas. |

Tabla de trazabilidad por sample (en §8 de cada markdown):

| Artefacto upstream | Tipo | Cómo lo ilustra este sample |
| --- | --- | --- |
| CU-XXXXX | Caso de uso | El sample ejecuta el flujo principal del CU end-to-end. |
| ADR-XXXXX | Decisión arquitectónica | El sample materializa la decisión declarada en el ADR. |
| NFR-XXXXX | Requisito no funcional | El sample mide el SLA del NFR mediante un script o test. |

Tabla de contratos de verificación del `README.md` de la sección, que da la vista de conjunto de la arista B:

| Sonda | Sample | Verifica | Comando | Estado | Última corrida |
| --- | --- | --- | --- | --- | --- |
| `VER-00001` | `Ejemplo-01-Basico.md` | CU-00001, CU-00002 | `make sample-01` | Verificado | 2026-08-14 |
| `VER-00002` | `Ejemplo-02-Intermedio.md` | CU-00003, US-00012 | `make sample-02` | Falla | 2026-08-14 |
| `VER-00003` | `Ejemplo-03-Avanzado.md` | CU-00006, CU-00007 | `make sample-03` | No verificado — sin código | — |

El estado `Falla` no se oculta ni se resuelve borrando la fila: se escala como hallazgo del incremento en curso.

### 4.5 Anti-patrones a evitar

| Anti-patrón | Problema | Solución |
| --- | --- | --- |
| Samples nombrados por dominio de la unidad de entrega | Atan el ejemplo al producto particular y rompen la progresión didáctica (lección del fuente: `multa`, `multaapp-nuget`) | Nombrar por nivel o por capacidad, nunca por entidad del dominio |
| Samples sin nivel declarado | El lector no sabe qué orden seguir y no hay progresión | Cada sample declara nivel explícito en §2 |
| Samples no ejecutables o desactualizados | El dev clona y no le compila; la documentación pierde credibilidad | CI que compila y ejecuta cada sample en cada push |
| Samples que duplican el `/src` sin agregar valor demostrativo | Inflan el repositorio sin enseñar nada nuevo | Cada sample demuestra una capacidad distinta o un punto de extensión |
| Falta de trazabilidad a CU | El sample existe en el vacío y no se sabe qué requisito ejercita | §8 obligatoria con tabla de upstream |
| Samples sin versión en el nombre | Hace imposible saber a qué versión del producto pertenecen (lección del fuente: `ejemplo-01-simple.md` sin sufijo) | Sufijo `.md` obligatorio en todos los markdown explicativos |
| Más de cinco pasos para correr el sample | Fricción de adopción; el dev abandona antes de ver el resultado | Refactorizar a scripts de bootstrap o usar contenedores |
| Dependencias externas no documentadas | El sample falla en máquinas limpias y nadie sabe por qué | Prerequisites exhaustivos con versión mínima |
| Output esperado no documentado | El dev no sabe si su ejecución fue exitosa | §6 con output exacto o screenshot |
| Samples sólo en un OS sin justificar | Excluye a parte de los integradores objetivo | Cubrir al menos los OS declarados en §17 P.9 del PRODUCT-INTAKE |
| Mezclar progresión por nivel y por dominio en un misma unidad de entrega | El lector pierde el hilo de lectura | Elegir una progresión (nivel o capacidad) y aplicarla consistentemente |
| `criterio_aceptacion` redactado como prosa | «Verificar que el servicio responda correctamente» obliga a que alguien interprete qué es correcto; el contrato deja de ser evaluable y la arista B se cae | Exit code, código y cuerpo de respuesta HTTP, o snapshot comparable |
| Sample sin `Contrato de verificación` | Vuelve a ser una demo: ilustra pero no prueba nada, y no aporta sonda a la matriz de sensado | Sección 9 obligatoria en los diez apartados del markdown explicativo |
| `evidencia` inventada o copiada de otro sample | Documenta una corrida que nunca ocurrió; es exactamente lo que D9 prohíbe | Pegar la salida textual de la última ejecución real, con su fecha |
| `evidencia` sin fecha | No se sabe contra qué versión del código se verificó, y la evidencia envejece en silencio | Fecha obligatoria en el campo `evidencia` |
| Contrato de verificación duplicado como test separado del sample | Divergen: el test se actualiza y el sample queda viejo, o al revés | El contrato apunta al comando que corre el sample; el test vive dentro de `/samples/XX-<Progresion>/tests/` |
| Sample verificado que se declara Done con el contrato en `Falla` | Convierte un hallazgo real en deuda invisible | Un `criterio_aceptacion` que falla se escala como hallazgo del incremento, no se posterga |


### 4.6 Contrato de verificación

Sección 9 obligatoria de todo markdown explicativo. Declara qué verifica el sample, con qué comando y contra qué aserción. Se escribe en la pasada de diseño y se completa en la pasada de ejecución.

| Campo | Contenido | Obligatorio |
| --- | --- | --- |
| `verifica` | Lista de identificadores de casos de uso (`CU-XXXXX`) y user stories (`US-XXXXX`) que el sample ejercita, tomados de 02 y de 06. Cada entrada declara además **qué pasos del flujo principal recorre la salida prometida y cuáles no** | Sí |
| `discrimina` | Por cada aserción del `criterio_aceptacion`, qué caso de uso deja de cumplirse si esa aserción falla | Sí |
| `comando` | Comando exacto de ejecución, copy-paste, desde la raíz del repositorio | Sí |
| `precondiciones` | Estado mínimo requerido: servicios levantados, datos seed, variables de entorno | Sí |
| `criterio_aceptacion` | Aserción evaluable, no prosa. Exit code esperado, respuesta HTTP con código y cuerpo, o snapshot de salida comparable | Sí |
| `evidencia` | Salida real obtenida en la última corrida, con fecha | Sí, una vez que existe código |

**Regla dura de la declaración: ejercitar no es nombrar, y verdadero no es verificable.**

Un caso de uso está **recorrido** cuando alguna línea de la salida prometida **cambia como
consecuencia** de un paso de su flujo principal, de modo que si ese paso se rompe, la aserción falla.
Si ninguna línea depende de él, correr el sample y verificar su criterio no dice nada sobre ese caso
de uso: el sample pasa igual con el caso de uso enteramente roto.

De ahí las dos obligaciones del contrato, que son dos y no una porque la primera sola no alcanza:

1. **Declaración falsable.** Cada caso de uso declarado dice qué pasos de su flujo recorre la salida
   prometida y cuáles no. «Ilustra `CU-00025`» no se puede refutar sin discutir qué significa
   ilustrar; «recorre los pasos 3 a 7 y no el 2» se refuta leyendo siete renglones.
2. **Declaración verificable.** Cada aserción declara en `discrimina` qué caso de uso deja de
   cumplirse si ella falla, y **no se admite un caso de uso declarado que ninguna aserción
   discrimine**. Sin esto la declaración puede ser verdadera y seguir sin ser verificable: la sonda
   pasa en verde con el caso de uso roto.

**Cómo se produce la declaración falsa, para reconocerla al escribirla.** No se inventa un caso de
uso: se confunde **precondición con flujo ejercitado**. El sample necesita que ese caso de uso haya
ocurrido para poder correr, y de «lo necesita» se pasa a «lo ejercita» sin que medie ninguna
comprobación. El salto es cómodo de dar porque las dos cosas son ciertas por separado. Lo empuja la
**afinidad de tema** —el sample y el caso de uso hablan de lo mismo, así que la elección se siente
evidente y no se verifica—, y en la pasada de diseño no hay **código que desmienta**: la salida
prometida la escribe la misma mano que escribe la trazabilidad, en el mismo rato.

**Regla dura de la aserción.** El `criterio_aceptacion` debe ser evaluable por una máquina sin interpretación. Es válido `curl -sf localhost:8080/health` con exit code `0` y cuerpo `{"status":"healthy"}`. No es válido «verificar que el servicio responda correctamente»: eso obliga a que alguien decida qué significa «correctamente», y esa decisión es exactamente lo que el contrato debe fijar por escrito.

Formato del bloque, en YAML para que un agente lo parsee sin ambigüedad:

```yaml
verificacion:
  id: VER-00001
  verifica:
    - id: CU-00003
      recorre: "pasos 2 a 5 del flujo principal"
      no_recorre: "paso 6, la notificación diferida"
    - id: CU-00004
      recorre: "paso 1, la validación de entrada"
      no_recorre: "pasos 2 a 4"
    - id: US-00012
      recorre: "el criterio de aceptación 1"
      no_recorre: "los criterios 2 y 3"
  comando: "dotnet run --project samples/02-intermedio"
  precondiciones:
    - "Servicio de persistencia levantado en el puerto declarado en §17 P.9"
    - "Variable de entorno APP_ENV=local"
    - "La publicación de la fuente está activa: es estado previo y no algo que este sample ejercite"
  criterio_aceptacion:
    exit_code: 0
    stdout_contiene: "Filas procesadas: 1250"
  discrimina:
    - asercion: "exit_code: 0"
      rompe: CU-00004
    - asercion: "stdout_contiene: Filas procesadas: 1250"
      rompe: CU-00003
  evidencia:
    fecha: 2026-08-14
    salida: "Filas procesadas: 1250\nTiempo: 0.84s"
    estado: Verificado
```

En la pasada de diseño, cuando todavía no hay código, el mismo contrato se declara completo salvo la evidencia:

```yaml
verificacion:
  id: VER-00001
  verifica: [CU-00003, CU-00004, US-00012]
  comando: "dotnet run --project samples/02-intermedio"
  precondiciones:
    - "Servicio de persistencia levantado en el puerto declarado en §17 P.9"
    - "Variable de entorno APP_ENV=local"
  criterio_aceptacion:
    exit_code: 0
    stdout_contiene: "Filas procesadas: 1250"
  evidencia:
    estado: "No verificado — sin código"
```

Lo único que cambia entre una pasada y la otra es el bloque `evidencia`. El resto del contrato se escribe una vez y no se retoca, salvo que cambie la especificación que verifica.

**Identificador.** Cada contrato lleva un `VER-XXXXX` único dentro de la unidad de entrega. Los enlaces y las trazas apuntan a ese identificador, no a la ruta del archivo. Es el mismo criterio que ya rige para `CU-XXXXX`, `ADR-XXXXX` y `SUP-XXXXX`.

**Vinculación con el sensado de deriva.** Los contratos de verificación de esta categoría son sondas de la matriz de sensado de deriva, gobernada por `Deriva-Rules.md`. La matriz cubría hasta ahora superficies de UX aprobadas en la maqueta (`SUP-XXXXX`, `CMP-XXXXX`, `EST-XXXXX`, `NAV-XXXXX`, `DM-XXXXX`); con `VER-XXXXX` pasa a cubrir también contratos y comportamiento. La mecánica de sensado vive en `Deriva-Rules.md` §2 y §4; estas reglas solo declaran qué aporta la categoría 10.
---

## 5. Preguntas guía para el subagente

### 5.1 Qué CU se ilustran

- ¿Qué CU de 02 cubre cada sample y por qué se eligió ese conjunto?
- ¿Hay algún CU crítico que no esté ilustrado por ningún sample?
- ¿Algún sample cubre más de un CU? ¿Está justificada la combinación o se podrían separar?
- ¿La progresión de samples respeta el orden natural de lectura de los CU?

### 5.2 Scope de cada sample

- ¿El sample es autocontenido o requiere servicios externos no triviales?
- ¿La cantidad de pasos para llegar a la primera ejecución exitosa es menor o igual a cinco?
- ¿El nivel declarado se condice con la complejidad real del código?
- ¿El sample demuestra al menos una capacidad que el anterior no demostraba?

### 5.3 Trazabilidad

- ¿Cada sample declara explícitamente los CU, ADR y NFR que ilustra en §8?
- ¿La trazabilidad apunta a artefactos vigentes (no a versiones jubiladas)?
- ¿Los puntos de extensión declarados en 05 tienen al menos un sample que los exhibe?

### 5.4 Calidad del sample

- ¿El código compila en un entorno limpio sin warnings nuevos?
- ¿El output esperado documentado coincide con la ejecución real?
- ¿Hay un test en `/samples/XX-<Nombre>/tests/` que verifica el output esperado?
- ¿El sample sigue siendo reproducible bajo los OS declarados en §17 P.9 del PRODUCT-INTAKE?
- ¿La estructura del código respeta las convenciones de §16 del PRODUCT-INTAKE?

### 5.5 Contrato de verificación (arista B)

- ¿Cada sample declara qué verifica, y no solo qué ilustra?
- ¿El `criterio_aceptacion` es evaluable por una máquina, o encubre un juicio humano bajo palabras como «correctamente», «adecuado» o «razonable»?
- ¿El `comando` corre desde la raíz del repositorio y es copy-paste, sin pasos implícitos?
- ¿Las `precondiciones` alcanzan para que el comando funcione en una máquina limpia, o dan por sabido algo del entorno del que las escribió?
- ¿El conjunto de sondas `VER-XXXXX` cubre los CU críticos de la unidad de entrega, o quedan casos de uso sin ninguna sonda que los ejercite?
- ¿Hay dos sondas que verifican lo mismo? ¿Está justificada la redundancia?
- En la pasada de ejecución: ¿la `evidencia` es la salida real de la última corrida, con su fecha, o se arrastra de una corrida anterior?
- ¿Algún contrato está en estado `Falla` sin hallazgo abierto que le corresponda?

### 5.6 Mantenimiento

- ¿Existe un pipeline CI que compila y ejecuta los samples periódicamente?
- ¿Los samples se actualizan junto con cambios mayores del producto?
- ¿Las versiones de prerequisites están alineadas con §17 P.9 del PRODUCT-INTAKE?

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

- [ ] [enumerable] Existe `README.md` con tabla maestra de samples, columnas nivel, tiempo de setup, CU ilustrados, ubicación.
- [ ] [enumerable] Existen al menos los samples mínimos declarados en §2.2 para el tipo D8 de la unidad de entrega.
- [ ] [interpretativo] Cada sample tiene su markdown explicativo `ejemplo-XXXXX-<Progresion>.md` con las diez secciones obligatorias.
- [ ] [interpretativo] Cada sample es ejecutable con comandos copiables en entorno limpio en menos o igual a cinco pasos.
- [ ] [interpretativo] Cada sample declara su nivel (básico, intermedio o avanzado) explícitamente en §2.
- [ ] [interpretativo] Cada sample declara trazabilidad a CU, ADR o NFR en §8 con al menos una fila.
- [ ] [interpretativo] Los nombres de archivo usan progresión por nivel o por capacidad, nunca por dominio de la unidad de entrega.
- [ ] [interpretativo] Todos los markdown explicativos declaran su versión en el campo `Versión` de su cabecera; ninguno la lleva en el nombre.
- [ ] [interpretativo] El README de la carpeta lista los samples en tabla con todas las columnas declaradas en §4.4.
- [ ] [interpretativo] Cada sample declara tiempo de setup estimado en la tabla maestra del README.
- [ ] [interpretativo] Cada sample documenta el output esperado en §6 con texto exacto o screenshot.
- [ ] [interpretativo] Cada sample documenta prerequisites con versiones mínimas en §3.
- [ ] [interpretativo] La estructura de `/samples/` del repositorio coincide con la matriz declarada en §2.3 para el tipo D8 de la unidad de entrega.
- [ ] [enumerable] Existe pipeline CI que valida que los samples compilan y ejecutan (recomendado fuerte; obligatorio para `library`, `rest-api` y `cli-tool`).

Criterios propios de la arista B:

- [ ] [interpretativo] Cada sample declara su `Contrato de verificación` en §9 con los cinco campos de §4.6, y un identificador `VER-XXXXX` único dentro de la unidad de entrega.
- [ ] [interpretativo] Ningún `criterio_aceptacion` está redactado como prosa: todos son exit code, respuesta HTTP con código y cuerpo, o snapshot de salida comparable.
- [ ] [interpretativo] El `comando` de cada contrato se ejecuta desde la raíz del repositorio y es copy-paste.
- [ ] [interpretativo] Las `precondiciones` de cada contrato bastan para reproducir la corrida en una máquina limpia.
- [ ] [interpretativo] Todo CU declarado crítico en 02 tiene al menos una sonda `VER-XXXXX` que lo ejercita, o la ausencia está justificada en `Decisiones-Proyecto.md`.
- [ ] [interpretativo] En la pasada de diseño: el campo `evidencia` de cada contrato declara `No verificado — sin código`, y ninguna carpeta de `/samples` promete una corrida que no se hizo.
- [ ] [interpretativo] En la pasada de ejecución: cada `evidencia` contiene la salida textual real de la última corrida con su fecha, y ningún contrato queda en estado `Falla` sin hallazgo abierto.
- [ ] [interpretativo] El `README.md` de la sección incluye la tabla de contratos de verificación de §4.4 con el estado de cada sonda.
- [ ] [interpretativo] Las sondas `VER-XXXXX` están incorporadas a la matriz de sensado de deriva según `Deriva-Rules.md` §2 y §4.
- [ ] [interpretativo] **El vocabulario del método va al glosario operativo de `Master-Prompt.md` §15 y se cita sin redefinir; el del producto, al glosario que corresponda.** Los términos que el framework acuña e impone a esta categoría no son vocabulario que la categoría acuñe: no van a un glosario del producto.
- [ ] [interpretativo] Todo término que esta categoría acuña o precisa, y que aparece en más de uno de sus artefactos, está declarado en `Glosario-Funcional.md` de 02 y `Glosario-Tecnico.md` de 11, con sus referentes cuando tiene más de uno. Un sample no acuña vocabulario: si necesita un término que no está declarado, el defecto está aguas arriba.
- [ ] [interpretativo] El apuntamiento a `Glosario-Tecnico.md` de la 11 se declara como **referencia pendiente** (`Root-Rules.md` §12) mientras esa categoría no se haya emitido: la 11 se emite en la Fase H y esta categoría es anterior. Al emitirse, la reapertura de `Master-Prompt.md` §6 cierra la referencia.
- [ ] [interpretativo] Ninguna forma desnuda de un término polisémico queda sin resolver en un artefacto que se lee por secciones (`Vocabulario-Rules.md` §9.2).
- [ ] [interpretativo] Ninguna polisemia con contextos disjuntos se reporta como defecto ni se corrige calificando todas las ocurrencias (criterio negativo de `Vocabulario-Rules.md` §9.1).

---

## 7. Ejemplos genéricos

### 7.1 Ejemplo 1 — `Ejemplo-02-Intermedio-Extensibilidad.md` para una librería de parsing CSV

Fragmento ilustrativo, no documento completo:

```markdown
# Ejemplo 02 — Parser custom con extensión de tipo

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** Ejemplo-02-Intermedio-Extensibilidad.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-05-17
**Nivel:** Intermedio
**Ubicación del código:** `/samples/02-intermedio-con-extensiones/`

## 1. Objetivo del sample

Demostrar cómo registrar un parser custom en la librería para soportar un tipo de columna no incluido por defecto. Al finalizar, el desarrollador sabe implementar la interfaz `IColumnParser`, registrarla en la configuración y validar la salida con un dataset de prueba.

## 2. Nivel

Intermedio. Asume que el lector ya completó el ejemplo 01 (lectura básica de CSV). Agrega el punto de extensión principal de la librería.

## 3. Prerequisites

- Runtime objetivo, versión mínima declarada en §17 P.9 del PRODUCT-INTAKE.
- Gestor de paquetes del ecosistema.
- Editor con soporte para el lenguaje de la unidad de entrega.

## 4. Cómo correrlo

1. Clonar el repositorio.
2. Entrar a la carpeta del sample: `cd samples/02-intermedio-con-extensiones`.
3. Restaurar dependencias con el gestor de paquetes del ecosistema.
4. Ejecutar el comando de arranque del sample.
5. Inspeccionar la salida en consola.

## 5. Estructura del código

```
02-intermedio-con-extensiones/
├── README.md
├── src/
│   ├── Program.<ext>            # Punto de entrada
│   ├── CustomColumnParser.<ext> # Implementación del parser custom
│   └── data/sample.csv          # Dataset de entrada
└── tests/
    └── parser_custom_test.<ext> # Verifica el output esperado
```

## 6. Qué esperar

Salida esperada en consola:

```
Filas procesadas: 100
Tipo custom detectado en columna `monto_complejo`: 100 ocurrencias
Errores de parsing: 0
```

## 7. Variaciones sugeridas

| Variación | Qué cambiar | Resultado |
| --- | --- | --- |
| Registrar dos parsers custom | Agregar segundo `IColumnParser` | El pipeline detecta y aplica el correcto por columna |
| Forzar error de parsing | Modificar una fila del CSV | El sample reporta error con línea y columna afectada |

## 8. Trazabilidad

| Artefacto upstream | Tipo | Cómo lo ilustra este sample |
| --- | --- | --- |
| CU-00003 | Caso de uso | Implementa el flujo "registrar parser custom" |
| ADR-00004 | Decisión arquitectónica | Materializa el patrón de extensión por interfaz |

## 9. Contrato de verificación

```yaml
verificacion:
  id: VER-00002
  verifica: [CU-00003, US-00012]
  comando: "dotnet run --project samples/02-intermedio-con-extensiones"
  precondiciones:
    - "SDK del runtime instalado, versión mínima declarada en §3"
    - "Sin servicios externos: el sample es autocontenido"
  criterio_aceptacion:
    exit_code: 0
    stdout_contiene: "Parser custom registrado: PipeDelimited"
  evidencia:
    fecha: 2026-08-14
    salida: "Parser custom registrado: PipeDelimited\nFilas procesadas: 3"
    estado: Verificado
```

## 10. Control de cambios

| Versión | Fecha | Descripción |
| --- | --- | --- |
| 1.0 | 2026-05-17 | Emisión inicial del sample: contrato de verificación y evidencia de corrida. |
```

### 7.2 Ejemplo 2 — `Ejemplo-01-Basico-Cliente-HTTP.md` para una REST API de pagos

Fragmento ilustrativo, no documento completo:

```markdown
# Ejemplo 01 — Cliente HTTP básico con curl

**Unidad de entrega:** {{Nombre-Unidad-Entrega}}
**Documento:** Ejemplo-01-Basico-Cliente-HTTP.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-05-17
**Nivel:** Básico
**Ubicación del código:** `/samples/01-cliente-http-basico/`

## 1. Objetivo del sample

Demostrar el camino feliz mínimo de la API: confirmar un pago con un POST autenticado y consultar su estado con un GET. Cubre el flujo end-to-end más simple que un integrador necesita para validar credenciales y conectividad.

## 2. Nivel

Básico. Punto de entrada absoluto. No requiere SDK, sólo curl y una clave de API válida.

## 3. Prerequisites

- curl (cualquier versión moderna).
- Una clave de API obtenida desde el portal de la unidad de entrega.
- Endpoint base del ambiente sandbox.

## 4. Cómo correrlo

1. Exportar la clave de API en una variable de entorno: `export API_KEY=<valor>`.
2. Ejecutar el script `./confirmar-pago.sh` desde la carpeta del sample.
3. Observar el `payment_id` en la respuesta JSON.
4. Ejecutar `./consultar-pago.sh <payment_id>` para ver el estado.
5. Comparar la respuesta con el output esperado de §6.

## 5. Estructura del código

```
01-cliente-http-basico/
├── README.md
├── confirmar-pago.sh         # POST /v1/payments
├── consultar-pago.sh         # GET /v1/payments/<id>
└── ejemplo-payload.json      # Payload de ejemplo del POST
```

## 6. Qué esperar

Respuesta del POST:

```json
{
  "payment_id": "pay_abc123",
  "estado": "confirmado",
  "monto": 1500.00,
  "moneda": "ARS"
}
```

## 7. Variaciones sugeridas

| Variación | Qué cambiar | Resultado |
| --- | --- | --- |
| Reintentar con clave de idempotencia | Reenviar el mismo POST con header `Idempotency-Key` | No se duplica el pago |
| Forzar error de validación | Enviar monto negativo en el payload | Respuesta `problem+json` con código `400` |

## 8. Trazabilidad

| Artefacto upstream | Tipo | Cómo lo ilustra este sample |
| --- | --- | --- |
| CU-00001 | Caso de uso | Confirma un pago válido end-to-end |
| CU-00003 | Caso de uso | Consulta el estado de un pago confirmado |
| NFR-00001 | Latencia p95 | El sample mide latencia con `curl -w` |

## 9. Contrato de verificación

```yaml
verificacion:
  id: VER-00001
  verifica: [CU-00001, CU-00003]
  comando: "./samples/01-cliente-http-basico/run.sh"
  precondiciones:
    - "API levantada en el puerto declarado en §3"
    - "Variable de entorno API_TOKEN con un token de sandbox válido"
  criterio_aceptacion:
    http_status: 201
    body_json:
      estado: "confirmado"
    latencia_p95_ms: "<= 300"
  evidencia:
    estado: "No verificado — sin código"
```

## 10. Control de cambios

| Versión | Fecha | Descripción |
| --- | --- | --- |
| 1.0 | 2026-05-17 | Emisión inicial del sample: contrato de verificación y evidencia de corrida. |
```

Los dos fragmentos son ilustrativos. Cada unidad de entrega adapta el dominio respetando la estructura, la nomenclatura por progresión y el sufijo de versión obligatorio.

---

## 8. Prompt-snippet sugerido

```text
Sos un {{ESPECIALIDAD-VARIANTE-10}} responsable de redactar los markdown explicativos de los samples de la unidad de entrega {{NOMBRE_UNIDAD_ENTREGA}}, de definir su contrato de verificación y de coordinar la materialización en código en /samples.

Insumos:
- PRODUCT-INTAKE: {{path}} (sección §13 tipo D8, §16 estructura de repo, §18 estrategia de samples)
- Upstream: 02 (CU que cada sample ilustra), 05 (arquitectura y puntos de extensión), 06 (US que cada sample verifica).

A generar (según el `tipo_unidad_entrega` de la unidad de entrega, leído del manifiesto):
- README.md con tabla maestra de samples.
- ejemplo-XXXXX-<Progresion>.md por cada sample (mínimo según §2.2 de Rules-Examples.md).
- Carpeta /samples/XX-<Progresion>/ con código ejecutable, README propio, tests de verificación.
- Contrato de verificación VER-XXXXX por sample, en la sección 9 del markdown explicativo.

Reglas de redacción: §4 de Rules-Examples.md (diez secciones obligatorias por markdown).
Nomenclatura: sufijo uniforme `.md` (corrección obligatoria del fuente, que omitía la versión). Progresión por nivel (basico/intermedio/avanzado) o por capacidad. Prohibido nombrar por dominio del proyecto de código (corrección obligatoria respecto al fuente: nada de `multa`, `multaapp-nuget`, `factura`, `recibo`).
Trazabilidad: cada sample referencia al menos un CU, ADR o NFR en §8.
Doble arista: cada sample declara qué ilustra (arista A) y qué verifica (arista B). El contrato de §9 lleva `verifica`, `comando`, `precondiciones`, `criterio_aceptacion` y `evidencia`, según §4.6.
Aserción evaluable: el `criterio_aceptacion` es exit code, respuesta HTTP con código y cuerpo, o snapshot comparable. Prohibida la prosa del tipo «verificar que responda correctamente».
Pasada en curso: en la pasada de diseño (pre-código) `evidencia` se declara `No verificado — sin código` y las carpetas de /samples quedan esqueletadas. En la pasada de ejecución se completa con la salida real y su fecha, sin inventar ni copiar corridas.
Ejecutabilidad: cada sample arranca en menos o igual a cinco pasos en entorno limpio.
Output esperado: documentado en §6 con texto exacto o screenshot.
Estructura de /samples: respetar la matriz §2.3 de Rules-Examples.md según tipo D8.
Criterios de calidad: §6 de Rules-Examples.md.

Restricciones: no introducir productos comerciales ni protocolos del dominio fuente. Idioma rioplatense técnico, tildes correctas, sin emojis ni negritas decorativas.

Salida: SDD/Docs/Unidades-Entrega/{{NOMBRE_UNIDAD_ENTREGA}}/10-Examples/<estructura> + /samples/<estructura> en el repo del producto.
```

---

## 9. Control de cambios

| Versión | Fecha | Descripción |
| --- | --- | --- |
| 1.0 | 2026-05-17 | Versión inicial de las reglas constructivas de la categoría 11. Define el README de la sección y los markdown explicativos por sample con sufijo uniforme `.md`, fija la matriz tipo D8 vs estructura de `/samples`, establece cantidades mínimas de samples por tipo, formaliza las nueve secciones obligatorias del markdown explicativo y corrige dos antecedentes del fuente SDD 1.0: la nomenclatura por dominio (`multa`, `multaapp-nuget`) se reemplaza por progresión de complejidad o capacidad, y la ausencia de sufijo de versión se reemplaza por `.md` obligatorio en todos los archivos versionables. |
| 1.1 | 2026-06-09 | Validación ST-06: la categoría se genera por proyecto bajo `Proyectos/<Nombre-Proyecto>/11-Examples/`; la frase de cierre de §1.2 y la ruta de salida del prompt-snippet referencian el `project_type` del proyecto en curso (manifiesto), y la referencia a la materialización de `/samples` apunta a §4.1 del PROJECT-README. Tablas §1.2 sin reescritura. |
| 1.2 | 2026-06-10 | Migración de referencias de intake al documento unificado SOLUTION-INTAKE (unificación de intake). |
| 1.3 | 2026-07-26 | Intercambio de categorías 10 ↔ 11. La categoría de ejemplos pasa de 11 a 10 y su carpeta target de `11-Examples/` a `10-Examples/`; el subagente titular pasa de AG-11 a AG-10. Se invierte la dependencia declarada con la categoría de documentación: los ejemplos dejan de recibir upstream de la guía y pasan a ser upstream del cuerpo documental de entrega, con la formulación «10 demuestra con código ejecutable y verificable, 11 explica, referencia y enlaza». Se normaliza el vocabulario de actores: «consumidor» pasa a «integrador» y «audiencia» a rol de intervención donde designaban un actor. Las filas 1.0 y 1.1 conservan su redacción original por ser registro histórico. |
| 2.0 | 2026-07-26 | Redefinición de la categoría con doble arista (S2). Nuevo §0.1 con las aristas A de referencia de integración y B de arnés de autovalidación, y regla dura de no bifurcar el sample. Nuevo §0.2 con las dos pasadas de generación, de diseño pre-código y de ejecución durante la codificación. Nuevo §4.6 `Contrato de verificación` con sus cinco campos, su formato YAML, la regla de aserción evaluable y el identificador `VER-XXXXX`. §4.2 pasa de nueve a diez secciones obligatorias del markdown explicativo. §4.4 suma la tabla de contratos del README de sección. §4.5 suma siete anti-patrones propios de la arista B. Nuevo §5.5 de preguntas guía, con renumeración de mantenimiento a §5.6. §6 suma nueve criterios de aceptación. Los dos ejemplos de §7 incorporan su contrato, uno verificado y otro sin código todavía. §8 refleja la doble arista y la pasada en curso. Sube major porque la categoría incorpora un rol nuevo y un artefacto obligatorio; lo ya definido se conserva íntegro. |
| 2.1 | 2026-07-28 | Reparación de la política de archivado (Revisión SDD): §3.1 declara que el `README.md` índice de la sección recibe el sufijo de versión al archivarse, pese a emitirse sin sufijo. La regla general y su tabla de exenciones viven en `Master-Prompt.md` §5.1. |
| 3.0 | 2026-07-28 | Normalización del versionado (framework 4.0). El archivo vivo pierde el sufijo de versión del nombre y pasa a declarar su versión en el campo `Versión` de su cabecera; el sufijo `-v<X.Y>.md` queda reservado a las copias archivadas en `_legacy/`. Se actualizan los patrones de nombre, los ejemplos, las cabeceras modelo, los anti-patrones y los criterios de aceptación de la categoría. Sube major porque la documentación generada con la nomenclatura anterior deja de cumplir. Deriva de la reformulación de D4 y D5 en el `README.md` del framework. |
| 4.0 | 2026-07-29 | Renombre de vocabulario normativo (framework 5.0). El nivel superior pasa de «solución» a **producto**, la unidad de compilación de «proyecto» a **proyecto de código**, y los cuatro planos de identidad del producto se separan en campos propios (`Nombre-Producto`, `Slug-Producto`, `Raiz-Codigo`, `Artefacto-Agrupacion`). Se declara el nivel de aplicación de la regla en su cabecera, según `Vocabulario-Rules.md` §4 R3. Sube major porque los identificadores y los nombres de artefacto cambian, y la documentación generada con la nomenclatura anterior deja de cumplir. |
| 4.1 | 2026-07-29 | Criterio de gobierno del glosario en §6. Sube minor: agrega criterios de aceptación verificables sin cambiar el conjunto de artefactos de la categoría ni ninguna invariante, y ninguna documentación ya emitida deja de cumplir por sí sola. Los tres criterios exigen que todo término que la categoría acuña o precisa y usa en más de uno de sus artefactos esté declarado en el glosario que le corresponde, que ninguna forma desnuda de un término polisémico quede sin resolver en un artefacto que se lee por secciones, y —criterio negativo— que ninguna polisemia con contextos disjuntos se reporte como defecto. Materializan `Vocabulario-Rules.md` §9 en la categoría. **Origen**: el audit verificaba «glosario sin contradicciones», que un glosario incompleto cumple trivialmente, y esta regla no mencionaba la palabra «glosario» ni una vez. |
| 5.0 | 2026-08-15 | Obligatoriedad por consumidor y trazabilidad verificable (intervención reportes 00 a 11). **§0** deja de condicionar la categoría por tipo D8 y la condiciona por `redistribuible` del manifiesto y por `tiene_portal_developers`: el motivo de la obligación es que «el integrador del artefacto necesita ejemplos reproducibles», y donde no hay integrador previsible la obligación no tiene a quién servir. La cláusula de omisión, que vivía en la prosa de §0 mientras §2.1 y §2.2 —las tablas que el orquestador ejecuta— decían `library: obligatorio` sin condición, sube a las tablas. **§2.2** gana válvula: el piso de tres samples rige cuando `redistribuible` es true, y un proyecto de código no redistribuible tiene piso de uno. **§4.6** exige que cada caso de uso declarado diga qué pasos del flujo principal recorre la salida prometida y cuáles no, y agrega el bloque `discrimina`, que declara por aserción qué caso de uso deja de cumplirse si ella falla; no se admite un caso de uso que ninguna aserción discrimine. Se documenta cómo se produce la declaración falsa —confundir precondición con flujo ejercitado, elegir por afinidad de tema, y no tener código que desmienta en la pasada de diseño—. **§6** suma la primera cláusula del gobierno de glosario. Sube **major**: cambia el gating de la categoría por tipo D8 y el conjunto de campos obligatorios del contrato de verificación, de modo que la documentación generada con la versión anterior deja de cumplir. Origen: reportes `06` §6.1, `10` y `11`. Además, **§6 clasifica cada criterio de aceptación** como `[enumerable]` o `[interpretativo]`, con la nota que declara la política conservadora: ante la duda se marca interpretativo, porque declarar mecanizable lo que no lo es produce falsa confianza. Los enumerables son lo que la compuerta mecánica de `Master-Prompt.md` §10.0 debe cubrir. Origen adicional: reportes `09` y `10`. Se incorpora además el tratamiento de las obligaciones hacia una fase posterior que la comprobación del grafo de `Master-Prompt.md` §6 detectó al correrse sobre las doce reglas: las referencias afectadas se declaran con la forma de `Root-Rules.md` §12. |
| 6.0 | 2026-08-15 | **El nivel intermedio pasa a ser la unidad de entrega** (framework 8.0). La cabecera declara el nivel nuevo, la carpeta target pasa de `Proyectos/<Nombre-Proyecto-Codigo>/` a `Unidades-Entrega/<Nombre-Unidad-Entrega>/`, las variantes de §1.2 se seleccionan por `tipo_unidad_entrega` —que es el nombre nuevo de la variable D8, porque los ocho valores son formas de **entrega**— y la prosa normativa pasa a nombrar la unidad de entrega donde el referente era el nivel intermedio, conservándola donde el referente es la unidad de compilación. Sube **major**: cambia el nivel de aplicación de la categoría, su ruta de salida y el nombre de una variable bloqueante; la documentación generada con la versión anterior deja de cumplir. Origen: el pendiente declarado en `Vocabulario-Rules.md` §8 desde la 5.0, con la evidencia medida sobre tres destinos reales. |
| 6.1 | 2026-08-16 | Corrige la **ruta de salida** de su prompt de despacho de referencia, que seguía emitiendo a `SDD/Docs/Proyectos/{{NOMBRE_PROYECTO_CODIGO}}/` —el layout que la 8.0 reemplazó— y que además citaba un marcador que el contexto de despacho ya no define. Pasa a `SDD/Docs/Unidades-Entrega/{{NOMBRE_UNIDAD_ENTREGA}}/`. Corrige además las concordancias de género que la sustitución léxica de la 8.0 dejó al pasar «proyecto» a «unidad de entrega» (`Vocabulario-Rules.md` §9.5). Sube **patch**: ningún documento generado deja de cumplir. |
| 6.2 | 2026-08-16 | **La cabecera obligatoria de §4.1 declaraba el nivel anterior a la 8.0.** Cada documento generado copia esa plantilla literal, y empezaba con `**Proyecto de código:** {{Nombre-Proyecto-Codigo}}` cuando los documentos de las categorías 02 a 11 pertenecen a una **unidad de entrega** y viven bajo `Unidades-Entrega/`. Pasa a `**Unidad de entrega:** {{Nombre-Unidad-Entrega}}`. Los tres barridos anteriores no la vieron porque vive **dentro de un bloque de ejemplo cercado**, que ninguno abría; `SDD-Development-Guide.md` §VI.3.1 suma la regla. Sube **patch**: corrige el nivel declarado en la cabecera sin cambiar ninguna sección ni ningún artefacto. Se corrige además el **control de cambios de los dos samples de ejemplo** de §7, que tenían pegado el texto del control de cambios **de esta regla** —incluido «categoría 11», que es el número anterior de Examples—. |
| 6.3 | 2026-08-16 | El prompt de despacho de referencia decía «de la **unidad de entrega** `{{NOMBRE_PROYECTO_CODIGO}}`»: la prosa se migró en la 8.0 y **el marcador no**, con lo cual la primera línea que el subagente lee nombra el nivel correcto con la variable del nivel anterior, que el contexto de despacho ya no define. Pasa a `{{NOMBRE_UNIDAD_ENTREGA}}`. Sube **patch**. |
