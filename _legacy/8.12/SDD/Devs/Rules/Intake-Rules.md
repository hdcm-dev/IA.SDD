# Reglas de validación del intake unificado

**Archivo target:** `SDD/Intake/PRODUCT-INTAKE-<Slug-Producto>.md`
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Producto
**Lector:** la Fase de validación de intake del `Master-Prompt.md` (previa a la Fase A).
**Versión de las reglas:** 4.1

---

## §1 Propósito y posición

Esta es una regla meta, no una de las doce categorías numeradas: por eso lleva el prefijo `_`, como `Root-Rules.md`. Codifica cómo el orquestador valida la completitud del intake unificado antes de despachar cualquier subagente, y cómo deriva de él el `PRODUCT-MANIFEST` canónico.

La validación que define este archivo se distingue de los dos mecanismos preexistentes del orquestador y no los pisa:

- `Master-Prompt.md` §2 (detención por placeholders): scan sintáctico superficial de marcadores literales sin completar. Sigue vigente.
- `Master-Prompt.md` §9 (ambigüedad por subagente): detección reactiva, en runtime, cuando un subagente ya generando detecta un dato faltante. Sigue vigente.
- Estas reglas: validación de completitud semántica, proactiva y previa al despacho, que emite una batería consolidada de preguntas para evitar que la generación derive por subespecificación.

El orden es: el orquestador lee el intake, corre §2 (placeholders), corre esta validación (completitud semántica + derivación del manifiesto), se detiene hasta que el humano resuelve, y recién entonces entra a la Fase A. La ambigüedad de §9 queda para lo que aparezca en runtime pese a la validación previa.

---

## §2 Artefactos gobernados y campos bloqueantes

Esta sección declara dos cosas: qué artefactos gobierna esta regla (§2.1) y qué campos de ellos detienen la cadena cuando faltan (§2.2).

### §2.1 Tabla maestra de documentos

| Archivo | Obligatorio para | Recomendado para | Omitir para | Descripción |
|---|---|---|---|---|
| `PRODUCT-INTAKE-<Slug-Producto>.md` | Todos los tipos D8 | — | — | Documento de entrada único del producto, en sus tres partes: negocio (§1 a §12), composición (§13 a §16) y técnica por unidad de entrega (§17). Lo escribe y lo aprueba el Product Owner; su formato de referencia es `PRODUCT-INTAKE-template.md` |
| `PRODUCT-MANIFEST-<Slug-Producto>.md` | Todos los tipos D8 | — | — | Manifiesto canónico de la jerarquía de proyectos de código, derivado por el orquestador de §13.1, §13.2 y §13.3 del intake según §4 de esta regla y confirmado por el humano; su formato de referencia es `PRODUCT-MANIFEST-template.md` |

Los dos artefactos viven en `SDD/Intake/` del repositorio destino y son obligatorios para los ocho tipos D8. No hay gating por tipo: todo producto tiene exactamente un intake y exactamente un manifiesto, cualquiera sea la composición de sus proyectos de código. Es por eso que las tres columnas de gating quedan sin discriminar, y no por omisión.

**Por qué una regla transversal declara tabla maestra.** Porque es la dirección contra la cual el orquestador enumera artefactos. El paso 4 del diff normativo de `Master-Prompt.md` §2.1 enumera los documentos que una regla gobierna «leyendo su tabla maestra de documentos (§2.1 de la regla)», y esta regla no la tenía: el intake y el manifiesto no podían aparecer entre los documentos potencialmente invalidados, ni siquiera cuando esta misma regla subió major. La evidencia está en su propio control de cambios: subió de 2.1 a 3.0 renombrando identificadores y nombres de artefacto, y ningún documento de destino quedó marcado por ese salto.

La versión de formato bajo la que cada uno de los dos artefactos se estructuró la declara el destino en el bloque de procedencia de `PRODUCT-MANIFEST-template.md` §1.1, que lleva una fila por plantilla. Las dos piezas son complementarias: esta tabla dice qué artefactos hay que enumerar, y la procedencia dice bajo qué versión se estructuraron.

### §2.2 Campos bloqueantes

Son bloqueantes todos los campos del intake marcados con `(*)` en sus preguntas guía, más los siguientes, sin los cuales el orquestador no puede operar:

- Cabecera: nombre del producto, estado.
- §13.1 Unidades de entrega: la tabla con al menos una fila; por cada unidad de entrega su `Nombre-Unidad-Entrega`, su `tipo_unidad_entrega` D8, su rol, su `redistribuible` y su estado; la unidad de entrega principal señalada.
- §13.2 Proyectos de código: la tabla con al menos una fila; por cada proyecto de código su `Nombre-Proyecto-Codigo`, su solución de código, su stack, sus dependencias de compilación y las unidades de entrega que compone; el perfil de convención de nombres.
- §17 por unidad de entrega: para cada unidad de entrega de §13.1 con estado `vigente`, el bloque técnico con su identidad y, como mínimo, P.6 (cobertura numérica), P.7 (SemVer/Conventional Commits), P.8 (quality gates), P.9 (plataformas) y P.10 (NFR numéricos).

Un campo bloqueante vacío, con placeholder o con valor `desconocido` detiene la cadena y genera una entrada en la batería de preguntas de §6.

---

## §3 Patrones de placeholder que disparan pregunta

Disparan pregunta, además de los de §2 del master-prompt:

- Marcadores literales sin completar: `[…]`, `Pendiente`, `TBD`, `[Reemplazar]`, `[Nombre]`, `[YYYY-MM-DD]`, `[Nombre-Proyecto-Codigo]`, `[uno de los 8 D8]`, y cualquier corchete de la plantilla original.
- Tablas con filas de ejemplo no sustituidas (por ejemplo la fila `| [Nombre-Unidad-Entrega] (principal) | … |` de §13.1, o la fila `| [Nombre-Proyecto-Codigo] | … |` de §13.2, sin reemplazar).
- NFR o cobertura expresados de forma no numérica ("rápido", "alta", "razonable") donde la regla exige número.
- `tipo_unidad_entrega` fuera del conjunto cerrado D8.

---

## §4 Reglas de derivación del `PRODUCT-MANIFEST`

A partir de §13.1, §13.2 y §13.3 del intake (y del perfil de convención declarado), el orquestador construye el `PRODUCT-MANIFEST-<Slug-Producto>.md` en el formato de referencia de `PRODUCT-MANIFEST-template.md`. Pasos:

1. Derivar `Slug-Producto` de `Nombre-Producto` con el algoritmo de normalización de `Master-Prompt.md` §3.2. **`Raiz-Codigo` y `Artefacto-Agrupacion` no se derivan: se leen de la cabecera y del perfil de convención del intake.** Solo si el intake no los declara, el orquestador los deriva según §3.2 y lo informa como valor asumido.
2. Por cada fila de **§13.2**, derivar `Identidad-Codigo` como `<Raiz-Codigo>.<Sufijo>` y el path `src/<Identidad-Codigo>/`. **La excepción del prefijo de organización se resuelve por el puente, no por la fila**: el proyecto de código que publica una unidad de entrega con `redistribuible: true` arranca con el prefijo del perfil (`Aplicada` por defecto). `redistribuible` es atributo de la **entrega** (§13.1); qué proyecto la publica lo dice §13.3.
3. Componer el bloque de producto (nombre, Slug-Producto, Raiz-Codigo, unidad de entrega principal, perfil de convención, referencia al `PRODUCT-INTAKE` como origen), la tabla de unidades de entrega, la tabla de proyectos de código y la matriz de composición.

Mapeo de campos del intake al manifiesto. **Son dos tablas y no una, y es el punto**: pedirle a una sola fila el nombre del proyecto de código y su `tipo_unidad_entrega` es la confusión de ejes que la validación de más abajo prohíbe.

**Del eje de entrega (§13.1):**

| Campo en `PRODUCT-INTAKE` §13.1 | Campo en el manifiesto |
|---|---|
| `Nombre-Unidad-Entrega` | `Nombre-Unidad-Entrega` (directo) |
| `tipo_unidad_entrega` (D8) | `tipo_unidad_entrega` (directo) |
| Rol en el producto | Rol (directo) |
| Integra con (runtime) | Aristas del grafo de integración (directo, validadas) |
| `redistribuible` | `redistribuible` (directo) |
| Estado | Estado (`vigente` / `diferida`, directo) |

**Del eje de construcción (§13.2):**

| Campo en `PRODUCT-INTAKE` §13.2 | Campo en el manifiesto |
|---|---|
| `Nombre-Proyecto-Codigo` | `Nombre-Proyecto-Codigo` (directo) |
| Stack | Stack (directo) |
| Dependencias de compilación | Aristas del grafo de compilación (directo, validadas) |
| Compone | Filas de la matriz de composición |
| (derivado) | `Identidad-Codigo` = `<Raiz-Codigo>.<Sufijo>` o `<Prefijo-Organizacion>.<X>` |
| (derivado) | Path `src/<Identidad-Codigo>/` |

**Ningún campo D8 ni `redistribuible` sale del eje de construcción**, y ningún `Identidad-Codigo` sale del eje de entrega: son los dos sentidos de la misma confusión.

**Del producto:**

| Campo en `PRODUCT-INTAKE` | Campo en el manifiesto |
|---|---|
| Perfil de convención (cabecera/§13) | Perfil de convención del bloque de producto |
| Nombre del producto (cabecera) | `Slug-Producto`, `Raiz-Codigo`, unidad de entrega principal |

Validaciones bloqueantes de la derivación (si alguna falla, no se deriva el manifiesto y se reporta en la batería de §6):

**Del eje de entrega (§13.1):**

- Cada `tipo_unidad_entrega` pertenece al conjunto cerrado D8 (exactamente 8 valores: `library`, `web-monolith`, `web-microservices`, `desktop-app`, `mobile-app-maui`, `rest-api`, `cli-tool`, `worker-service`).
- Hay exactamente una unidad de entrega principal.
- No hay colisión de `Nombre-Unidad-Entrega`.
- Cada integración referencia una unidad de entrega existente en §13.1.
- La unidad de entrega principal no está declarada `diferida`.

**Del eje de construcción (§13.2):**

- No hay colisión de `Nombre-Proyecto-Codigo` ni de `Identidad-Codigo`.
- Cada dependencia de compilación referencia un proyecto de código existente en §13.2.
- El grafo de compilación es acíclico (DAG).
- **Ningún proyecto de código declara un valor D8.** Si lo declara, el intake está confundiendo los dos ejes: el tipo es atributo de la entrega.

**Del puente entre ejes (§13.3):**

- **Todo proyecto de código compone al menos una unidad de entrega.** Un proyecto que no compone ninguna no se construye para nada, o falta declarar la entrega que lo usa.
- **Toda unidad de entrega se compone de al menos un proyecto de código.** Una entrega sin proyectos no tiene con qué construirse.
- Cada nombre de la columna «Compone» de §13.2 existe en §13.1.
- Una unidad de entrega con `redistribuible: true` tiene al menos un proyecto de código que la compone y que es el que se publica.
- **`Nombre-Producto` está expresado en prosa de negocio.** Si coincide con `Raiz-Codigo` salvo por la puntuación, o si contiene el separador de segmentos del perfil, el campo de negocio fue completado con un nombre de artefacto de código y la derivación no procede (`Master-Prompt.md` §3.2, validación de independencia).
- `Raiz-Codigo` está declarado en la cabecera o en el perfil de convención, o su ausencia está informada como valor asumido.

Confirmación humana: el orquestador presenta el manifiesto derivado y espera confirmación explícita antes de tratarlo como artefacto canónico. El manifiesto no se completa a mano; se genera y se confirma. Toda regeneración posterior sigue el flujo de no-modificación de §13 del master-prompt.

---

## §5 Validaciones de completitud semántica

Por parte del intake, el orquestador verifica presencia y coherencia mínima:

- Negocio (Parte A): problema y consecuencia (§1); al menos un stakeholder por categoría (§2); MoSCoW con Must mínimo (§4); 3 historias y 2 roles si aplica (§5); 5 casos límite (§7); 3 métricas SMART de negocio (§8); 3 exclusiones (§9); presupuesto y fecha o "sin fecha" justificado (§10); 3 riesgos (§11); 5 términos de glosario (§12).
- Composición (Parte B): §13.1, §13.2 y §13.3 completas y derivables (ver §4); §14 declara los contratos entre proyectos de código coherentes con las dependencias de §13; §15 garantiza valor end-to-end en el primer sprint; §16 deriva el árbol de la jerarquía y la convención de nombres.
- Técnica (Parte C): §17 completo por cada unidad de entrega **vigente** de §13.1 —no por proyecto de código—, con las dos tablas de identidad que la plantilla declara y los P bloqueantes de §2.

- Anexos de datos (Parte D): es opcional, pero **si existe se valida**. Cada escenario declara procedencia, un `Estado` del enum cerrado (`medido`, `declarado`, `derivado`, `reconstruido`) y sus cuatro bloques: contexto, qué ejercita, JSON completo y **qué verificar**. Un escenario sin bloque de verificación no es utilizable por `08-Calidad-Y-Pruebas` ni por `10-Examples`, que son sus consumidores declarados.
- Navegabilidad: el intake declara su **tabla de contenido** después de la cabecera, con las secciones de primer y segundo nivel y con cada escenario de la Parte D listado por identificador.

Coherencia cross-parte que se chequea: la cantidad de bloques §17 coincide con la cantidad de unidades de entrega **vigentes** de §13.1; los contratos de integración de §14 corresponden a aristas del grafo de integración de §13.1 y los de compilación a aristas del grafo de §13.2, **sin mezclarse**; las métricas de negocio (§8) no se confunden con NFR técnicos (§17 P.10).

**Regla de coherencia intra-escenario.** Los cuatro bloques de un escenario tienen que decir lo
mismo. Toda magnitud, conteo o enumeración que la prosa de un escenario enuncie coincide con lo que
su payload contiene, **o el escenario declara explícitamente por qué difieren**, según la regla de
transcripción fiel de `PRODUCT-INTAKE-template.md` §20. La discrepancia **no declarada** es
bloqueante; la declarada es un dato más del escenario.

Hasta acá la validación verificaba que los cuatro bloques **existieran**, no que **dijeran lo mismo**,
y un escenario que afirma nueve en un bloque y enumera once en el siguiente cumplía los cuatro
requisitos. Importa porque los cuatro bloques tienen consumidores declarados distintos —`02` toma el
modelo, `08` toma «qué verificar» como criterio de aceptación, `10` lo convierte en contrato de
verificación—: si se contradicen, cada consumidor aguas abajo cree una cosa distinta y ninguno tiene
forma de saber que el otro leyó otra.

**Alcance acotado, y es lo que decide si la validación es aplicable.** La comparación alcanza a
**conteos y enumeraciones del propio payload**, y no a cualquier número que aparezca en el texto. Una
fecha, una versión o una medición mencionadas en la prosa no disparan la validación. Una comprobación
que contraste todos los números de la prosa contra todos los del payload produce ruido, y una
validación ruidosa se desactiva sola.

**Regla de resolución de la Parte D.** Todo identificador de escenario citado desde el cuerpo (`E-1`, `E-2`, …) existe como subsección de §20, y todo escenario de §20 está citado desde el cuerpo. Una cita sin anexo es una referencia colgada que el orquestador no puede resolver aguas abajo; un anexo sin cita es ruido. La plantilla declara esta regla desde su versión 1.3 y hasta ahora ninguna validación la verificaba: se verifica acá.

**Regla de choque de vocabulario.** Si el glosario del dominio del cliente (§12) usa alguno de los seis términos normativos de `Vocabulario-Rules.md` §2 —producto, unidad de entrega, módulo, solución de código, proyecto de código, proyecto— con un sentido propio del negocio, el intake debe **declarar el choque y definir los dos usos**, cada uno con un término distinguible, según el procedimiento de `Vocabulario-Rules.md` §6. Es bloqueante: un término del framework que en el dominio del cliente significa otra cosa y no está declarado se propaga a las doce categorías y contamina cada documento que lo use. La declaración se verifica leyendo §12 contra la lista de §2, no infiriéndola del resto del intake.

**Regla de autocontención.** Ninguna sección del intake puede dejar como único respaldo de un dato una referencia a un archivo o repositorio externo. El orquestador no la resuelve, y los subagentes que reciben el intake como insumo tampoco. Si la fuente aporta el dato, se transcribe completo en la Parte D; si no lo aporta, se resuelve como ambigüedad antes de emitir el intake.

---

## §6 Formato de la batería de preguntas consolidada

Cuando hay pendientes, el orquestador emite una única batería consolidada (no una pregunta por vez), agrupada por parte y sección, en este formato:

```text
BATERÍA DE VALIDACIÓN DE INTAKE — <Slug-Producto>
Total de pendientes: <N> (bloqueantes: <B>)

[<ID>] <Parte> / <Sección> — <bloqueante|recomendado>
- Qué falta: <descripción concreta>
- Por qué bloquea: <consecuencia de no resolverlo antes de generar>
- Qué se necesita: <tipo de dato esperado>
- Dónde completarlo: PRODUCT-INTAKE §<sección> [/ proyecto de código <Nombre> si es P.x]
```

Reglas de la batería:

- Se ordena por parte (A, B, C) y dentro de cada una por sección.
- Los bloqueantes se listan primero y se cuentan aparte.
- El orquestador se detiene hasta que el humano actualiza el intake y confirma; entonces re-valida. No avanza a la Fase A con bloqueantes abiertos.
- La actualización del intake la hace el humano sobre el `PRODUCT-INTAKE`; el orquestador no lo edita por su cuenta (coherente con §13 del master-prompt).

---

## §7 Niveles de bloqueo

- Bloqueante: campo de §2, falla de derivación del manifiesto de §4, o incoherencia cross-parte de §5. Detiene la cadena. Entra acá la **discrepancia de conteo no declarada** dentro de un escenario de la Parte D.
- Recomendado: completitud de §5 no bloqueante (por ejemplo menos del mínimo sugerido de un ítem no marcado `(*)`). Se reporta en la batería como recomendado; el humano decide si lo resuelve antes de continuar. Entra acá la **discrepancia de conteo declarada**, que es un dato del escenario y no un defecto, y el caso en que la fuente enuncia un total que el escenario no reproduce en ningún lado: la regla de transcripción fiel pide reproducirlo, pero su ausencia no contradice nada.

---

## §8 Articulación con el master-prompt

- La Fase de validación de intake del master-prompt invoca estas reglas una sola vez, antes de la Fase A.
- §2 del master-prompt (placeholders) corre antes y cubre lo sintáctico; estas reglas cubren lo semántico y la derivación del manifiesto.
- §9 del master-prompt (ambigüedad por subagente) sigue cubriendo lo que aparezca en runtime; estas reglas reducen su frecuencia, no la reemplazan.
- La derivación del manifiesto de §4 alimenta la lectura del manifiesto que el resto del master-prompt asume (el manifiesto derivado y confirmado se trata como el insumo canónico de la jerarquía).

---

## §9 Control de cambios

| Versión | Fecha | Cambios | Autor |
|---|---|---|---|
| 1.0 | 2026-06-10 | Reglas iniciales de validación del intake unificado: campos bloqueantes, patrones de placeholder, derivación del `SOLUTION-MANIFEST` desde §13 del intake con sus validaciones, validaciones de completitud semántica, formato de la batería de preguntas consolidada, niveles de bloqueo y articulación con §2 y §9 del master-prompt. | Reformulación SDD (unificación de intake) |
| 1.1 | 2026-07-26 | Normalización del vocabulario de actores: el campo de cabecera «Consumidor» pasa a «Lector», porque designa quién lee estas reglas y no un rol de intervención sobre el producto. |
| 2.0 | 2026-07-28 | Normalización del versionado (framework 4.0). El archivo vivo pierde el sufijo de versión del nombre y pasa a declarar su versión en el campo `Versión` de su cabecera; el sufijo `-v<X.Y>.md` queda reservado a las copias archivadas en `_legacy/`. Se actualizan los patrones de nombre, los ejemplos, las cabeceras modelo, los anti-patrones y los criterios de aceptación de la categoría. Sube major porque la documentación generada con la nomenclatura anterior deja de cumplir. Deriva de la reformulación de D4 y D5 en el `README.md` del framework. |
| 2.1 | 2026-07-28 | §5 incorpora la validación de la Parte D, hasta ahora sin verificar: presencia de los cuatro bloques por escenario, `Estado` dentro del enum cerrado, tabla de contenido con los escenarios listados por identificador, regla de resolución de identificadores en las dos direcciones y regla de autocontención. La plantilla declaraba estas reglas desde su 1.3 y ninguna validación las comprobaba. |
| 3.0 | 2026-07-29 | Renombre de vocabulario normativo (framework 5.0). El nivel superior pasa de «solución» a **producto**, la unidad de compilación de «proyecto» a **proyecto de código**, y los cuatro planos de identidad del producto se separan en campos propios (`Nombre-Producto`, `Slug-Producto`, `Raiz-Codigo`, `Artefacto-Agrupacion`). Se declara el nivel de aplicación de la regla en su cabecera, según `Vocabulario-Rules.md` §4 R3. Sube major porque los identificadores y los nombres de artefacto cambian, y la documentación generada con la nomenclatura anterior deja de cumplir. | Reformulación SDD |
| 3.1 | 2026-07-29 | Corrección de la sustitución global de cadena de la 5.0. §5 decía «Regla de **reproducto** de la Parte D», palabra inexistente producida al sustituir `soluci*` por `producto` sobre «re**soluci**ón». La clase de defecto y su prohibición quedan documentadas en `Vocabulario-Rules.md` §9.5. La restitución de las filas históricas de este control de cambios, que la migración había reescrito contra `SDD-Development-Guide.md` §VI.2, se registra una sola vez en `CHANGELOG.md` [5.1] por alcanzar a veintitrés archivos. | Revisión SDD |
| 3.2 | 2026-07-29 | Instrumentación de la enumeración de los documentos de entrada (prerrequisito F2 de la migración normativa). **§2.1 es nueva**: tabla maestra de los dos artefactos que esta regla gobierna, `PRODUCT-INTAKE-<Slug-Producto>.md` y `PRODUCT-MANIFEST-<Slug-Producto>.md`, con columnas homólogas a las de las reglas de categoría y con la declaración explícita de que no hay gating por tipo D8 porque todo producto tiene exactamente uno de cada uno. La regla no la tenía, y el paso 4 del diff normativo de `Master-Prompt.md` §2.1 enumera los documentos gobernados leyendo precisamente esa dirección: sin tabla maestra, el intake y el manifiesto nunca podían aparecer entre los documentos potencialmente invalidados, ni siquiera ante el salto major de 2.1 a 3.0 de esta misma regla. §2 pasa a titularse «Artefactos gobernados y campos bloqueantes» para alojar las dos subsecciones, y los campos bloqueantes se numeran como **§2.2** sin cambiar de contenido; la referencia externa vigente apunta a §2, que sigue conteniéndolos. Sube **minor**: incorpora una declaración que no invalida nada de lo vigente. | Framework SDD (migración normativa) |
| 3.3 | 2026-08-15 | **Regla de coherencia intra-escenario** en §5, con su nivel de bloqueo en §7. Toda magnitud que la prosa de un escenario de la Parte D enuncia coincide con lo que su payload contiene, o el escenario declara por qué difieren; la discrepancia no declarada es bloqueante y la declarada es un dato del escenario. La validación verificaba que los cuatro bloques existieran y no que dijeran lo mismo, de modo que un escenario con «nueve» en un bloque y once entradas en el siguiente cumplía los cuatro requisitos y llegaba a los tres consumidores aguas abajo, cada uno creyendo una cosa distinta. Se declara además el alcance acotado —conteos y enumeraciones del propio payload, no cualquier número del texto—, sin el cual la validación produce ruido y se desactiva sola. Sube **minor**: agrega una validación sin cambiar la estructura de los artefactos que gobierna; un intake ya emitido no deja de cumplir por su forma, aunque pueda fallar la validación nueva, que es el efecto buscado. Origen: reporte `00`, huecos A y B. | Framework SDD (intervención reportes 00-11) |
| 4.1 | 2026-08-16 | **Barrido por concepto de la 8.7** (`SDD-Development-Guide.md` §VI.3.1). §4 cometía dentro de sí mismo la confusión de ejes que sus propias validaciones prohíben treinta líneas más abajo: el paso 2 leía `redistribuible` —atributo de la **entrega**— de la fila del proyecto de código, y el mapeo era **una sola tabla** que pedía a la misma fila el `Nombre-Proyecto-Codigo` y el `tipo_unidad_entrega`, que es exactamente lo que la validación «ningún proyecto de código declara un valor D8» declara imposible. El mapeo pasa a **tres tablas** —entrega, construcción y producto— y el prefijo de organización se resuelve por el puente §13.3 y no por la fila. §5 corrige la Parte C, que decía «por cada proyecto de código» contra §2.2 y contra la coherencia cross-parte de la misma sección. §1 y §3 nombran la subsección. Sube **minor**: ningún intake que cumpliera §2.2 deja de cumplir. | Framework SDD (barrido 8.7) |
| 4.0 | 2026-08-15 | **Validación de los dos ejes** (framework 8.0). §2.2 parte los campos bloqueantes de §13 en los de unidades de entrega y los de proyectos de código, y condiciona el bloque §17 a las unidades de entrega vigentes. §4 reorganiza las validaciones de la derivación en tres grupos —eje de entrega, eje de construcción y puente entre ejes— y suma siete validaciones nuevas, de las cuales dos son las que impiden que el intake confunda los ejes: que ningún proyecto de código declare un valor D8, y que todo proyecto componga al menos una unidad de entrega y toda unidad se componga de al menos un proyecto. §5 verifica que los contratos de integración y los de compilación no se mezclen. Sube **major**: cambia la estructura de lo que valida y el nombre de un campo bloqueante. | Framework SDD (nivel de unidad de entrega) |
