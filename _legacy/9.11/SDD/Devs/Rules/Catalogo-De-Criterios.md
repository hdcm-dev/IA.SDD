# Catálogo de criterios de decisión

**Framework:** SDD
**Documento:** Catalogo-De-Criterios.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-17
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Framework
**Lector:** todo agente que enfrenta una situación y necesita saber qué criterio del método la resuelve

---

## 1. Qué es y qué no es

**Es un índice, no una regla.** No define ningún criterio: dice **dónde vive cada uno** y **qué
decide**. Todo criterio sigue viviendo en su archivo, con su fundamento y su historia.

**Existe porque los criterios estaban y no se podían encontrar.** El método tiene 202 situaciones
catalogadas en tablas de anti-patrones, umbrales numéricos, salidas con condición de elección y reglas
de resolución, repartidas en dieciocho archivos de reglas y tres orquestadores, **sin ningún punto de
entrada**. Un agente que enfrenta una situación tenía que haberlos leído todos para saber que existían.

**No reemplaza la lectura de la regla.** Un criterio aplicado desde el índice, sin abrir su sección, se
aplica sin su fundamento — y el fundamento es lo que permite reconocer cuándo **no** corresponde.

---

## 2. Cómo se usa

1. **Ubicar la situación** en la tabla de §3 o en el catálogo de anti-patrones de §4.
2. **Abrir la sección** que el índice señala, y leer el criterio con su fundamento.
3. **Si la situación no está**, es una de dos cosas y hay que distinguirlas: una situación nueva que el
   método no contempla —y entonces corresponde un **apartamiento declarado** (`Root-Rules.md` §11),
   que la migración va a revisar (`Migracion-Rules.md` §4.7)— o una que sí está y no se encontró, que
   es un defecto **de este índice** y se corrige acá.

---

## 3. Criterios por situación

| Situación | Qué hay que decidir | Dónde vive el criterio |
|---|---|---|
| El árbol se contradice a sí mismo: una fuente declarativa contra su contraste observable | Cuál de las dos lecturas gana | [`Master-Prompt-Reanudacion.md`](../Orchestrator/Master-Prompt-Reanudacion.md) §1, regla de resolución |
| Una fuente declarativa de estado no tiene quién la mantenga | Quién es el responsable, y si la fuente es la adecuada | `Master-Prompt-Reanudacion.md` §1.1, R1 a R3 |
| No se sabe en qué estado quedó un destino | Qué salida corresponde entre las cinco | `Master-Prompt-Reanudacion.md` §4 |
| La procedencia está desfasada y hay que decidir si migrar | Si «seguir en la versión declarada» sigue siendo barato | `Master-Prompt-Reanudacion.md` §4.0.1, umbral de continuidad |
| Hay una migración en vuelo y se quiere empezar otra cosa | Retomar o reempezar | `Master-Prompt-Reanudacion.md` §4, salida E |
| Dos categorías declaran valores incompatibles de un conjunto cerrado | Quién arbitra | [`Master-Prompt.md`](../Orchestrator/Master-Prompt.md) §7.0, detención por arbitraje |
| Hay que detener y preguntarle al humano | Qué lleva la detención para que la decisión sea informada | `Master-Prompt.md` §8.1, F1 a F4 |
| Falta un dato para completar un documento | Preguntar o inferir | `Master-Prompt.md` §9 |
| Terminó una unidad de trabajo y hay que entregarla | Quién fusiona, qué se verifica, cómo se entrega | `Master-Prompt.md` §12.1, T0 a T6 |
| Un artefacto obligatorio no aplica a este producto | Omitirlo o forzarlo | [`Root-Rules.md`](../Rules/Root-Rules.md) §11, apartamiento declarado |
| Un apartamiento sobrevivió a un salto de versión | Absorbido, contradicho o no contemplado | [`Migracion-Rules.md`](../Rules/Migracion-Rules.md) §4.7 |
| Varios documentos con el mismo nombre esperan consolidación | Cuál de las cuatro salidas S1 a S4 | `Migracion-Rules.md` §4.3.2 |
| Hay que comparar versiones de un mismo documento | Qué cuenta como diferencia y cómo se verifica | `Migracion-Rules.md` §4.3.2, C1 a C5 |
| Un documento cambia de ubicación | Qué pasa con sus enlaces y con los que lo apuntan | `Migracion-Rules.md` §4.3.1, procedimiento de mover |
| Un término tiene dos sentidos | Desambiguar o no | [`Vocabulario-Rules.md`](../Rules/Vocabulario-Rules.md) §9 |
| Un identificador necesita forma, ancho o ámbito | Cómo se numera y hasta dónde es único | `Root-Rules.md` §9 |
| Un recuento se escribe en la prosa | Cómo se ancla para que no envejezca | `Root-Rules.md` §10 |
| Una fase declara una obligación hacia otra que no corrió | Declararla pendiente o resolverla | `Root-Rules.md` §12 |
| El intake no permite derivar el manifiesto | Qué detiene la cadena | [`Intake-Rules.md`](../Rules/Intake-Rules.md) §4 |
| Se intervino el framework y hay que versionarlo | Qué bump corresponde | [`SDD-Development-Guide.md`](../../Guides/SDD-Development-Guide.md) §VI.1 y §VI.5 |
| Se cambió un concepto en el framework | Cómo se barre y con qué residuo aceptable | `SDD-Development-Guide.md` §VI.3.1 y §VI.3.2 |
| Hay que verificar una intervención antes de cerrarla | Las once comprobaciones | `SDD-Development-Guide.md` §VI.3 |

---

## 4. Catálogo de anti-patrones, por regla

Cada regla de categoría declara sus anti-patrones como **situación → problema → solución**, y desde
esta versión cada uno lleva su **marca de detección**: `[enumerable]` si un guion puede encontrarlo
—una ausencia, un recuento, un umbral, una forma literal— o `[interpretativo]` si exige criterio.

| Regla | Situaciones | `[enumerable]` | `[interpretativo]` |
|---|---|---|---|
| [`Deriva-Rules.md`](../Rules/Deriva-Rules.md) | 15 | 5 | 10 |
| [`Maqueta-Rules.md`](../Rules/Maqueta-Rules.md) | 14 | 2 | 12 |
| [`Migracion-Rules.md`](../Rules/Migracion-Rules.md) | 8 | 3 | 5 |
| [`Root-Rules.md`](../Rules/Root-Rules.md) | 7 | 3 | 4 |
| [`Rules-Arquitectura-Tecnica.md`](../Rules/Rules-Arquitectura-Tecnica.md) | 11 | 7 | 4 |
| [`Rules-Backlog-Tecnico.md`](../Rules/Rules-Backlog-Tecnico.md) | 11 | 5 | 6 |
| [`Rules-Calidad-Y-Pruebas.md`](../Rules/Rules-Calidad-Y-Pruebas.md) | 10 | 8 | 2 |
| [`Rules-Contexto.md`](../Rules/Rules-Contexto.md) | 8 | 4 | 4 |
| [`Rules-Devops.md`](../Rules/Rules-Devops.md) | 13 | 8 | 5 |
| [`Rules-Documentacion.md`](../Rules/Rules-Documentacion.md) | 19 | 5 | 14 |
| [`Rules-Especificacion-Funcional.md`](../Rules/Rules-Especificacion-Funcional.md) | 15 | 8 | 7 |
| [`Rules-Examples.md`](../Rules/Rules-Examples.md) | 17 | 9 | 8 |
| [`Rules-Necesidades-Negocio.md`](../Rules/Rules-Necesidades-Negocio.md) | 8 | 4 | 4 |
| [`Rules-Plan-Sprint.md`](../Rules/Rules-Plan-Sprint.md) | 11 | 7 | 4 |
| [`Rules-Prompts-AI.md`](../Rules/Rules-Prompts-AI.md) | 10 | 7 | 3 |
| [`Rules-UX-UI-DX.md`](../Rules/Rules-UX-UI-DX.md) | 25 | 12 | 13 |
| **Total** | **202** | **97** | **105** |

**La marca no es decorativa: dice quién puede aplicar el criterio.** Los `[enumerable]` los verifica la
compuerta mecánica de `Master-Prompt.md` §10.0 **antes** de que nadie interprete; los
`[interpretativo]` son del audit y del humano. Es la misma distinción que la intervención de los
reportes `00` a `11` introdujo en los criterios de aceptación.

**Cómo se clasificó, y su límite.** La clasificación inicial se hizo con un criterio declarado y
conservador: `[enumerable]` cuando el anti-patrón nombra una **ausencia, presencia, recuento, umbral
numérico o forma literal** buscable; `[interpretativo]` en todo otro caso, **incluida la duda**. Es una
primera pasada revisable: una marca mal puesta se corrige en la regla que la contiene, no acá.

---

## 5. Lo que este catálogo no resuelve

**No dice qué hacer cuando una situación no está en él.** Esa es la pregunta interesante, y la
respuesta del método es el **apartamiento declarado**: se documenta la decisión con sus disparadores, y
la migración la revisa contra cada versión nueva. Un apartamiento que sobrevive dos saltos es candidato
a regla, y ahí sí entra a este catálogo.

**No convierte los criterios en tablas ejecutables.** El estándar de la industria para eso es **DMN**
—tablas con condiciones de entrada y salidas, intercambiables y ejecutables—, y este catálogo adopta
sólo su forma: situación identificable, criterio localizable, salida declarada. Adoptar DMN completo
exigiría un motor de decisión y un formato de intercambio que el método no tiene.

---

## 6. Control de cambios

| Versión | Fecha | Cambios |
|---|---|---|
| 1.0 | 2026-08-17 | Emisión inicial. Índice de **202 situaciones** catalogadas y **22 criterios** de decisión repartidos en dieciocho reglas y tres orquestadores, que existían **sin punto de entrada**. Las tablas de anti-patrones suman su **marca de detección** `[enumerable]` / `[interpretativo]`, reusando la clasificación que el método ya aplicaba a los criterios de aceptación. |
