# PRODUCT-MANIFEST-template

**Versión de la plantilla:** 6.0

Este campo versiona la **referencia de formato**. El campo `| Versión |` del bloque de producto de §1 pertenece al manifiesto que el orquestador deriva, y arranca en 1.0 en cada producto nuevo.

Referencia de formato del artefacto `PRODUCT-MANIFEST-<Slug-Producto>.md`. El manifiesto declara la jerarquía de proyectos de código de un producto: enumera los proyectos de código, su tipo D8, su rol, sus dependencias y sus nombres de código. Es la fuente única de verdad de la enumeración de proyectos de código para el resto del orquestador.

A partir de SDD con intake unificado, el manifiesto NO lo completa el usuario a mano: es un artefacto derivado. El usuario completa un único documento, `PRODUCT-INTAKE-<Slug-Producto>.md`, y de su §13 (Proyectos de código del producto) el orquestador construye este manifiesto durante la Fase de validación de intake, siguiendo las reglas de derivación de `Intake-Rules.md` §4, y lo presenta para confirmación humana. Este archivo describe el formato del artefacto generado; no es una plantilla a llenar.

## Guía de uso de esta referencia

1. El orquestador genera `PRODUCT-MANIFEST-<Slug-Producto>.md` en `SDD/Intake/` del repositorio destino a partir de `PRODUCT-INTAKE` §13, con la convención de nombres declarada en el perfil del intake.
2. Compone el bloque de producto y la tabla de proyectos de código según el esquema de §1 y §2 de esta referencia.
3. Aplica las validaciones de §4 (tipos D8, unidad de entrega principal único, sin colisión de nombres, dependencias resueltas, grafo acíclico). Si alguna falla, no deriva el manifiesto y lo reporta en la batería de validación de intake.
4. Presenta el manifiesto derivado al humano y espera confirmación explícita antes de tratarlo como canónico.
5. Toda regeneración posterior sigue el flujo de no-modificación de `Master-Prompt.md` §13.

Un producto de un solo proyecto de código es válido y es el caso degenerado: el manifiesto derivado tiene una sola fila y el orquestador aplana el layout, reproduciendo el comportamiento del template de tipo único.

---

## §1 Bloque de producto

Bloque obligatorio al inicio del documento. Reproducir y completar los placeholders:

Los cuatro primeros campos son los cuatro planos de identidad de [`Vocabulario-Rules.md`](../Rules/Vocabulario-Rules.md) §3. Solo `Slug-Producto` se deriva; los otros tres se toman del intake.

| Campo | Plano | Valor |
|---|---|---|
| `Nombre-Producto` | negocio | [Nombre del producto en prosa, del intake] |
| `Slug-Producto` | documentación | [derivado de `Nombre-Producto`, Título-Con-Guiones] |
| `Raiz-Codigo` | código | [declarado en el perfil del intake; admite separadores de segmento] |
| `Artefacto-Agrupacion` | código | [`Raiz-Codigo` más la extensión del ecosistema] |
| Unidad de entrega principal | — | [`Nombre-Unidad-Entrega` de la unidad de entrega cabeza, la señalada `(principal)` en §13.1 del intake] |
| Intake (origen) | `PRODUCT-INTAKE-<Slug-Producto>.md` (de su §13 se deriva este manifiesto) |
| Documento | `PRODUCT-MANIFEST-<Slug-Producto>.md` |
| Versión | 1.0 |
| Fecha | [YYYY-MM-DD] |
| Estado | Borrador / En revisión / Aprobado |

### §1.1 Procedencia del framework

Bloque obligatorio. Declara bajo qué normativa se generó esta documentación. El orquestador lo completa al derivar el manifiesto, leyendo la versión que cada archivo declara en su cabecera —el campo `Versión` en el master-prompt y en las reglas, `Versión de la plantilla` en las dos plantillas de intake—; no agrega ninguna lectura, porque ya abre cada uno de esos archivos para validar el intake y construir sus despachos.

| Artefacto del framework | Versión |
|---|---|
| Framework SDD (conjunto) | [entrada vigente del `CHANGELOG.md` del framework] |
| `Master-Prompt` | [versión de su cabecera] |
| `Root-Rules` | [versión de su cabecera] |
| `Rules-<Categoria>` | [una fila por cada regla de categoría efectivamente aplicada] |
| Reglas transversales aplicadas | [`Intake-Rules` y `Vocabulario-Rules` siempre; `Maqueta-Rules` y `Deriva-Rules` si se ejecutó la Fase B2; `Migracion-Rules` si el árbol atravesó una migración normativa. `Root-Rules` lleva fila propia arriba] |
| `PRODUCT-INTAKE-template` | [versión de la plantilla bajo la que se estructuró el intake] |
| `PRODUCT-MANIFEST-template` | [versión de la plantilla bajo la que se estructuró este manifiesto] |

Las dos últimas filas son obligatorias como las demás: se completan siempre, porque los dos documentos de entrada existen en todo destino.

**Por qué las plantillas llevan fila propia.** Porque se versionan aparte de las reglas. Un cambio en la estructura de `PRODUCT-INTAKE-template` no mueve la versión de `Intake-Rules` ni la de ninguna regla de categoría, así que sin estas filas una reestructuración de plantilla no aparece en la comparación de versiones que el orquestador arma en `Master-Prompt.md` §2.1: los dos documentos de entrada del destino quedan sin forma de declarar que su estructura quedó atrás, y el intake nunca resulta candidato a nada. Es el mismo razonamiento que justifica el resto del bloque, aplicado a los dos artefactos que lo estaban dejando afuera.

**Para qué sirve.** Un árbol de `SDD/Docs/` generado hoy va a sobrevivir a varias versiones del framework. Sin este bloque no hay forma de saber contra qué reglas se produjo, y por lo tanto tampoco de saber qué documentos quedaron invalidados cuando una regla sube major, que es lo que el propio framework declara que ocurre. Con el bloque, y con el conjunto normativo de esa versión conservado en `_legacy/` del framework, se puede reconstruir la normativa exacta y planificar la actualización.

**Cuándo se actualiza.** Solo cuando el árbol se regenera bajo una versión distinta. Una corrección dentro de la misma versión del framework no lo toca: seguiría siendo cierto.

#### Decisiones de reconciliación

Tabla opcional, vacía mientras no haya habido ninguna. El orquestador agrega una fila cada vez que la reconciliación normativa de `Master-Prompt.md` §2.1 se resuelve con la salida **C**, es decir cuando el usuario decide continuar bajo la versión de origen teniendo una versión más nueva disponible.

| Fecha | Versión evaluada | Decisión | Motivo declarado |
|---|---|---|---|
| [YYYY-MM-DD] | [versión vigente del framework en ese momento] | Continuar bajo [versión de origen] | [lo que dijo el usuario] |

**Por qué se registra.** Sin este registro, el arranque siguiente vuelve a presentar la misma comparación y el usuario vuelve a contestarla, sin memoria de haberlo hecho. Con el registro, el orquestador informa la postergación en una línea y solo vuelve a preguntar si el framework avanzó más allá de la versión ya evaluada.

Las salidas **A** y **B** no dejan fila acá: la A emite su propio informe en `SDD/Docs/Audit/` y la B reescribe el bloque de procedencia con la versión nueva, que es registro suficiente de lo que pasó.

### §1.2 Perfil de convención de nombres

Configuración que el orquestador aplica de forma reproducible para derivar los nombres de código de cada proyecto de código. Declarar una vez por producto:

| Parámetro | Valor por defecto | Notas |
|---|---|---|
| `Raiz-Codigo` | — | Declarado en el intake. Admite separadores de segmento |
| Separador de segmentos | `.` | Separa la raíz de código del sufijo de rol, y los segmentos internos de la raíz |
| Prefijo de paquetes redistribuibles | `Aplicada` | Reemplaza la raíz de código cuando `redistribuible: true` |
| Extensión del agrupador | la del ecosistema | Con `Raiz-Codigo` compone `Artefacto-Agrupacion` |

---

## §2 Los dos ejes del producto

El manifiesto deriva **dos tablas y una matriz**, porque el producto tiene dos ejes que no coinciden:
el de entrega, que dice qué se despliega, y el de construcción, que dice qué se compila.

### §2.A Tabla de unidades de entrega

Se deriva de §13.1 del intake. Una fila por unidad de entrega. Es la que lleva el valor D8.

| `Nombre-Unidad-Entrega` | `tipo_unidad_entrega` (D8) | Rol en el producto | `redistribuible` | Integra con (runtime) | Estado | Path de documentación |
|---|---|---|---|---|---|---|
| [Nombre-Unidad-Entrega] | [uno de los 8 D8] | [una frase] | [true / false] | [lista o vacío] | [vigente / diferida] | [`SDD/Docs/Unidades-Entrega/<Nombre>/`] |

Valores cerrados de `tipo_unidad_entrega` (D8), exactamente 8:

```text
library, web-monolith, web-microservices, desktop-app, mobile-app-maui, rest-api, cli-tool, worker-service
```

### §2.B Tabla de proyectos de código

Se deriva de §13.2 del intake. Una fila por proyecto de código. **No lleva valor D8**: el tipo es
atributo de la entrega, no de la compilación.

**Agrupada por solución de código.** Un producto puede tener más de una solución de código
(`Vocabulario-Rules.md` §5), y cuando las tiene la tabla se emite **una vez por solución**, con su
encabezado. El motivo es que la solución de código es lo que delimita un comando de construcción:
dos proyectos de soluciones distintas no se construyen juntos, y su grafo de compilación no es uno
solo sino uno por solución. Con una sola solución —el caso frecuente— la tabla se emite una vez y el
encabezado la nombra igual, para que el lector sepa cuál es.

| `Nombre-Proyecto-Codigo` | `Identidad-Codigo` | Solución de código | Stack | Rol en la arquitectura | Dependencias de compilación | Path `/src` |
|---|---|---|---|---|---|---|
| [Nombre-Proyecto-Codigo] | [`<Raiz-Codigo>.<Sufijo>`] | [nombre] | [lenguaje y framework] | [una frase] | [lista o vacío] | [`src/<Identidad-Codigo>/`] |

### §2.C Matriz de composición

Se **deriva** de la columna «Compone» de §13.2 del intake; no se completa a mano. Cruza los dos ejes.

| | [Proyecto-A] | [Proyecto-B] | [Proyecto-Compartido] |
|---|---|---|---|
| [Unidad-1] | X | | X |
| [Unidad-2] | | X | X |

Una columna con más de una marca es un proyecto de código **compartido**. El orquestador la publica en
la vista de producto y la incluye en el despacho de cada unidad de entrega, con los compartidos
marcados: un subagente que va a proponer un cambio sobre un proyecto compartido tiene que saber a
quién más alcanza.

### §2.1 Regla de nombres de código

1. El nombre de código de cada proyecto de código se forma como `<Raiz-Codigo>.<Sufijo>`, donde `<Sufijo>` identifica el rol del proyecto de código.
2. Si `redistribuible: true`, el nombre arranca con el prefijo de organización del perfil (`Aplicada` por defecto) en lugar de la raíz de código, porque un paquete reusable necesita un espacio de nombres estable e independiente del producto que lo consume. Por ejemplo, bajo la raíz de código `Contoso.Turnos`, un paquete de validaciones reusable se llama `Aplicada.Validaciones`, no `Contoso.Turnos.Validaciones`.
3. El `<Sufijo>` se orienta por el `tipo_unidad_entrega` y el rol. Mapa orientativo, no cerrado:

| `tipo_unidad_entrega` | Sufijo orientativo |
|---|---|
| `rest-api` | `.WebApi` o `.Api` |
| `web-monolith` | `.Web` |
| `worker-service` | `.Worker` |
| `cli-tool` | `.Cli` |
| `desktop-app` | `.Ui` o `.Desktop` |
| `mobile-app-maui` | `.Mobile` |
| `library` | `.Core`, `.Abstractions`, `.Domain`, `.Infrastructure` u otro rol |
| `web-microservices` | un proyecto de código por servicio bajo `<Raiz-Codigo>.Services.<Servicio>` más `.Gateway` y `.BuildingBlocks` |

La regla se expresa de forma agnóstica de stack a propósito. El perfil de convención de §1.2 es donde un producto concreto materializa la convención de su ecosistema.

### §2.2 Derivación de nombres (a cargo del orquestador)

- `Slug-Producto` y cada `Nombre-Proyecto-Codigo` se derivan con el algoritmo de normalización del `Master-Prompt.md` §3: acentos y eñes a su equivalente ASCII, capitalización de la inicial de cada palabra (Título-Con-Guiones), unión de palabras con guion medio, colapso de guiones y recorte de guiones extremos.
- `Raiz-Codigo` se obtiene en PascalCase del nombre legible.
- `Identidad-Codigo` se compone por la regla de §2.1.

---

## §3 Los dos grafos

Los dos ejes producen **dos grafos dirigidos distintos**, y no coinciden. Declararlos por separado es
lo que evita que una arista de runtime se lea como una dependencia de compilación, o al revés.

**Grafo de integración**, derivado de la columna «Integra con» de §2.A. Ordena la **generación de la
documentación**: el orquestador recorre las unidades de entrega en su orden topológico, y las del
mismo nivel pueden generarse en paralelo.

**Grafo de compilación**, derivado de la columna «Dependencias de compilación» de §2.B. Es acíclico y
ordena el **build**: primero los proyectos sin dependencias, luego los que dependen solo de proyectos
ya resueltos. Vive en el pipeline de producto.

**Hay un grafo de compilación por solución de código**, no uno solo: la solución es lo que delimita
el comando de construcción. Una dependencia de compilación **entre soluciones distintas** no es una
arista de este grafo: es un consumo de artefacto publicado, y se declara como tal —la solución
consumidora referencia el paquete que la productora publica—. Confundirlas produce un orden de build
que ningún comando puede ejecutar.

Un front que le habla a una API por HTTP tiene una arista en el primero y ninguna en el segundo. Si
las dos coinciden es una propiedad de ese producto, no del método.

Representar el grafo como referencia visual (opcional pero recomendado):

```text
[proyecto-sin-deps]  ->  [proyecto-que-depende]  ->  [proyecto-principal]
```

---

## §4 Validaciones bloqueantes

El orquestador detiene la cadena y reporta si alguna de estas condiciones no se cumple:

- Algún `tipo_unidad_entrega` no pertenece al conjunto cerrado D8.
- No hay exactamente un unidad de entrega principal (hay cero o más de uno).
- Dos proyectos de código colisionan en `Nombre-Proyecto-Codigo` o en `Identidad-Codigo`.
- Una dependencia apunta a un proyecto de código que no existe en la tabla.
- El grafo de dependencias contiene un ciclo.
- El `PRODUCT-INTAKE` §13 (origen del manifiesto) no puede recorrerse para derivar la tabla: filas de ejemplo sin reemplazar, perfil de convención ausente o campos bloqueantes vacíos.

---

## §5 Ejemplo aplicado (producto multi-proyecto)

Bloque de producto:

**Este ejemplo usa una raíz de código de dos segmentos a propósito.** Es la forma normal en .NET, Java y Python, y la formulación anterior del framework no podía expresarla: derivaba la raíz del nombre de negocio concatenando sin separadores, con lo que la única manera de declarar `Contoso.Turnos` era escribirlo en el campo de negocio, contaminándolo. Los cuatro planos van separados y ninguno se parece a otro.

| Campo | Plano | Valor |
|---|---|---|
| `Nombre-Producto` | negocio | Gestión de Turnos |
| `Slug-Producto` | documentación | `Gestion-De-Turnos` |
| `Raiz-Codigo` | código | `Contoso.Turnos` |
| `Artefacto-Agrupacion` | código | `Contoso.Turnos.sln` |
| Unidad de entrega principal | — | `Gestion-De-Turnos-API` |
| Intake (origen) | — | `PRODUCT-INTAKE-Gestion-De-Turnos.md` |

Perfil de convención: separador `.`; prefijo de redistribuibles `Aplicada`; extensión del agrupador `.sln`.

Tabla de proyectos de código:

| `Nombre-Proyecto-Codigo` | `Identidad-Codigo` | `tipo_unidad_entrega` | Rol | `redistribuible` | Dependencias | Path `/src` |
|---|---|---|---|---|---|---|
| `Gestion-De-Turnos-API` | `Contoso.Turnos.WebApi` | `rest-api` | API pública de turnos (principal) | false | `Gestion-De-Turnos-Domain`, `Aplicada-Validaciones` | `src/Contoso.Turnos.WebApi/` |
| `Gestion-De-Turnos-Domain` | `Contoso.Turnos.Domain` | `library` | Dominio y reglas de negocio compartidas | false | `Aplicada-Validaciones` | `src/Contoso.Turnos.Domain/` |
| `Gestion-De-Turnos-Notificaciones` | `Contoso.Turnos.Worker` | `worker-service` | Envío asincrónico de recordatorios | false | `Gestion-De-Turnos-Domain` | `src/Contoso.Turnos.Worker/` |
| `Aplicada-Validaciones` | `Aplicada.Validaciones` | `library` | Paquete reusable de validaciones | true | — | `src/Aplicada.Validaciones/` |

Grafo de dependencias:

```text
Aplicada-Validaciones  ->  Gestion-De-Turnos-Domain  ->  Gestion-De-Turnos-API
                       \                              \-> Gestion-De-Turnos-Notificaciones
                        \-> Gestion-De-Turnos-API
```

Orden topológico:

```text
nivel 0: Aplicada-Validaciones
nivel 1: Gestion-De-Turnos-Domain
nivel 2: Gestion-De-Turnos-API, Gestion-De-Turnos-Notificaciones   (paralelizables)
```

---

## §6 Caso degenerado (producto de un proyecto de código)

Un producto con un único proyecto de código reproduce el comportamiento del template de tipo único.

Bloque de producto:

| Campo | Valor |
|---|---|
| Nombre de producto | Parser CSV |
| `Slug-Producto` | `Parser-Csv` |
| `Raiz-Codigo` | `ParserCsv` |
| Unidad de entrega principal | `Parser-Csv` |
| Intake (origen) | `PRODUCT-INTAKE-Parser-Csv.md` |

Tabla de proyectos de código:

| `Nombre-Proyecto-Codigo` | `Identidad-Codigo` | `tipo_unidad_entrega` | Rol | `redistribuible` | Dependencias | Path `/src` |
|---|---|---|---|---|---|---|
| `Parser-Csv` | `ParserCsv.Core` | `library` | Librería de parseo (única y principal) | false | — | `src/ParserCsv.Core/` |

El orquestador recorre un solo proyecto de código; el resultado equivale a la ejecución actual del template contra un único `tipo_unidad_entrega`.

---

## §7 Checklist de validación del manifiesto derivado

El orquestador verifica estos ítems al derivar el manifiesto desde `PRODUCT-INTAKE` §13, antes de presentarlo para confirmación. Todos deben cumplirse; si alguno falla, no deriva el manifiesto y lo reporta en la batería de validación de intake.

- [ ] El bloque de producto tiene nombre, `Slug-Producto`, `Raiz-Codigo`, unidad de entrega principal y referencias de intake completos.
- [ ] El bloque de procedencia de §1.1 declara la versión del conjunto, la del master-prompt, la de cada regla aplicada y la de las **dos plantillas de intake**. Ninguna de las dos filas de plantilla queda vacía.
- [ ] El perfil de convención de nombres está declarado (forma PascalCase, separador, prefijo de redistribuibles).
- [ ] La tabla de proyectos de código tiene al menos una fila y todos los campos obligatorios completos.
- [ ] Cada `tipo_unidad_entrega` pertenece al conjunto cerrado D8 de 8 valores.
- [ ] Hay exactamente un unidad de entrega principal.
- [ ] No hay colisiones de `Nombre-Proyecto-Codigo` ni de `Identidad-Codigo`.
- [ ] Cada dependencia referencia un proyecto de código existente en la tabla.
- [ ] El grafo de dependencias es acíclico.
- [ ] Cada proyecto de código marcado `redistribuible: true` arranca su nombre de código con el prefijo de organización del perfil.
- [ ] El control de cambios refleja la versión y fecha del documento.

---

## Control de cambios

| Versión | Fecha | Cambios | Autor |
|---|---|---|---|
| 1.0 | [YYYY-MM-DD] | Manifiesto inicial del producto | [Autor] |
| 2.0 | 2026-06-10 | Reconversión a referencia de formato del artefacto derivado (unificación de intake). El manifiesto deja de completarse a mano: el orquestador lo deriva de `SOLUTION-INTAKE` §13 según `rules/Intake-Rules.md` §4 y lo presenta para confirmación. Se actualizan el intro, la guía de uso y el checklist; el esquema (bloque de solución, tabla de proyectos, validaciones) se conserva como formato de referencia. | Reformulación SDD |
| 2.1 | 2026-07-29 | La referencia de formato declara su propia versión en cabecera, que no tenía: era el único artefacto de `Intake/` sin campo `Versión` legible, aplicación incompleta de D4 y D6 equivalente a la que la plantilla de intake corrigió en su 1.3. Se normalizan los ejemplos de `Slug-Producto` y `Nombre-Proyecto-Codigo` a Título-Con-Guiones, con lo que el valor declarado y el nombre de archivo del intake citado dejan de contradecirse. Se corrigen dos rutas `rules/Intake-Rules.md` por su nombre lógico. | Revisión SDD |
| 3.0 | 2026-07-29 | Renombre de vocabulario normativo (framework 5.0). El nivel superior pasa de «solución» a **producto** y la unidad de compilación de «proyecto» a **proyecto de código**; los cuatro planos de identidad se separan en `Nombre-Producto`, `Slug-Producto`, `Raiz-Codigo` y `Artefacto-Agrupacion`. | Reformulación SDD |
| 3.1 | 2026-07-29 | Restitución de la fila histórica del control de cambios que la migración de la 5.0 había reescrito con el vocabulario nuevo, contra `SDD-Development-Guide.md` §VI.2: una fila ya escrita no se reescribe aunque un cambio posterior invalide lo que describe, porque corregirla hace que el registro mienta. La fila nueva declara el renombre; la vieja sigue nombrando lo que nombraba. | Revisión SDD |
| 4.0 | 2026-07-29 | Instrumentación de la comparación de versiones sobre los documentos de entrada (prerrequisito F1 de la migración normativa). **§1.1 suma dos filas obligatorias** al bloque de procedencia: la versión de `PRODUCT-INTAKE-template` y la de `PRODUCT-MANIFEST-template`, con el fundamento de que las plantillas se versionan aparte de las reglas y por lo tanto un cambio de su estructura no movía ninguna versión declarada; sin las filas, una reestructuración de plantilla era invisible para el diff normativo de `Master-Prompt.md` §2.1 y los dos documentos de entrada del destino no podían resultar candidatos de nada. El intro de la sección precisa que la versión de las plantillas se lee del campo `Versión de la plantilla` y no del campo `Versión`, que en ellas designa otra cosa. **§7 suma su ítem de checklist**, para que la omisión de cualquiera de las dos filas detenga la derivación en lugar de pasar sin verificarse. Sube **major** por el criterio de `SDD-Development-Guide.md` §VI.1: un manifiesto ya emitido no declara esas filas y deja de cumplir. El impacto sobre destinos existentes se declara en la entrada del `CHANGELOG.md` de la versión del conjunto que publica esta intervención. | Framework SDD (migración normativa) |
| 4.1 | 2026-07-29 | Completitud de la fila de reglas transversales de §1.1, que enumeraba `Intake-Rules`, `Maqueta-Rules` y `Deriva-Rules` y omitía a `Vocabulario-Rules`, pese a que `Master-Prompt.md` §8 la inyecta en **todo** despacho sin excepción de categoría. Era la misma clase de defecto que la 4.0 corrigió para las plantillas: una pieza que gobierna la generación sin poder declarar su versión en la procedencia, y por lo tanto con su salto de versión invisible para la comparación normativa. La fila pasa a distinguir las transversales que se aplican siempre de las condicionales, suma `Migracion-Rules` para los árboles que atravesaron una migración normativa, y remite a la fila propia de `Root-Rules` para no duplicarla. Sube minor: completa una enumeración sin cambiar la estructura del bloque. | Framework SDD (migración normativa) |
| 5.0 | 2026-08-15 | **El manifiesto deriva los dos ejes** La tabla de proyectos de código se agrupa **por solución de código** cuando el producto tiene más de una, y §3 declara que hay un grafo de compilación por solución: una dependencia entre soluciones distintas no es una arista del grafo sino un consumo de artefacto publicado. (framework 8.0). §2 pasa de una tabla de proyectos de código a §2.A unidades de entrega —la que lleva el valor D8, renombrado a `tipo_unidad_entrega`, con `redistribuible` y estado vigente o diferida—, §2.B proyectos de código —con su solución de código, su stack y sus dependencias de compilación, y **sin** valor D8— y §2.C la matriz de composición, derivada y no completada a mano, que hace visible el proyecto compartido. §3 declara los **dos grafos** por separado: el de integración, que ordena la generación de la documentación, y el de compilación, que ordena el build, con la aclaración de que no coinciden y no tienen por qué. Sube **major**: cambia la estructura del manifiesto y el nombre de un campo bloqueante; un manifiesto ya emitido deja de cumplir. |
| 6.0 | 2026-08-16 | **El bloque de producto de §1, sus validaciones bloqueantes de §4 y el checklist de §7 pedían un «proyecto de código principal», mientras el intake del que este manifiesto se deriva señala y valida una **unidad de entrega principal**.** El manifiesto —fuente única de verdad del producto— validaba un eje distinto del que su origen declara. Pasa a **`Unidad de entrega principal`**, con el valor tomado de la fila señalada `(principal)` en §13.1 del intake. Sube **major**: un manifiesto ya derivado declara el campo con el nombre anterior y no pasa el checklist de §7. |
