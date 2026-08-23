# Catálogo de criterios de decisión

**Framework:** SDD
**Documento:** Catalogo-De-Criterios.md
**Versión:** 1.11
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
| Apareció un hallazgo y no se sabe si detener o resolverlo | Si tiene respuesta en el árbol, sostenible con cita literal | `Master-Prompt.md` §8.1, la pregunta previa |
| Hay que encargarle una verificación a un auditor | Cómo se formula para que no confirme por correlación | `Master-Prompt.md` §10, las tres partes del encargo |
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
| Una fase declara una obligación hacia otra que no corrió | Declararla pendiente o resolverla | `Root-Rules.md` **§12.1** |
| Un ítem obligatorio no se puede contestar hoy | **Diferirlo con forma o contestarlo con una promesa** | `Root-Rules.md` **§12.2** |
| Un ítem obligatorio empaqueta dos decisiones y sólo una está bloqueada | Diferir las dos o **diferir por partes** | `Root-Rules.md` §12.2 |
| Se escribe un ítem obligatorio de una §4.x con dos cosas adentro | Si son **dos decisiones que se parten** o una sola con dos caras: se parte cuando la segunda **se decide por separado**, no cuando **se deriva** de la primera | `Rules-Devops.md` §4.3, §4.4 y §4.6, y `Rules-Backlog-Tecnico.md` §4.4, los cinco casos ya partidos |
| El evento que cierra un diferimiento **ya ocurrió** | Si sigue abierto, es hallazgo y de qué nivel | `Root-Rules.md` §12.2, tabla de escalamiento |
| El intake no permite derivar el manifiesto | Qué detiene la cadena | [`Intake-Rules.md`](../Rules/Intake-Rules.md) §4 |
| Se intervino el framework y hay que versionarlo | Qué bump corresponde | [`SDD-Development-Guide.md`](../../Guides/SDD-Development-Guide.md) §VI.1 y §VI.5 |
| El barrido de una intervención deja residuo que su autor sabe legítimo | Si la exclusión se escribe a mano o **se cita** | `SDD-Development-Guide.md` §VI.3.2, **siete clases estables** |
| Se cambió un concepto en el framework | Cómo se barre y con qué residuo aceptable | `SDD-Development-Guide.md` §VI.3.1 y §VI.3.2 |
| Una intervención nace de un origen con criterios de aceptación | Si se puede declarar resuelto, y qué se le devuelve al origen | `SDD-Development-Guide.md` §VI.3 comprobación 13 |
| **Dos reglas alcanzan el mismo ítem y dicen cosas distintas** | Si **una de las dos viaja en todo despacho y la otra no** —la resuelve el agente— o no —la arbitra el humano— | `Root-Rules.md` **§13**, y `Master-Prompt.md` §7.0 para el resto |
| Se escribe una regla nueva a partir de un caso observado | Si está enunciada sobre el caso o sobre la propiedad, y cuál es su simétrico | `SDD-Development-Guide.md` Parte IV, «sobre las reglas que escribas a partir de un caso observado» |
| Hay que verificar una intervención antes de cerrarla | Las trece comprobaciones | `SDD-Development-Guide.md` §VI.3 |

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

**La marca no es decorativa: la consume la compuerta.** Desde la 9.13, `Master-Prompt.md` §10.0 toma como parte de su conjunto de reglas **los anti-patrones `[enumerable]` de la regla de la categoría en curso**, y los evalúa antes de que el audit interprete nada. Los `[interpretativo]` quedan para el audit y para el humano.

**Y dice quién puede aplicar el criterio.** Los `[enumerable]` los verifica la
compuerta mecánica de `Master-Prompt.md` §10.0 **antes** de que nadie interprete; los
`[interpretativo]` son del audit y del humano. Es la misma distinción que la intervención de los
reportes `00` a `11` introdujo en los criterios de aceptación.

**Cómo se clasificó, y su límite.** La clasificación inicial se hizo con un criterio declarado y
conservador: `[enumerable]` cuando el anti-patrón nombra una **ausencia, presencia, recuento, umbral
numérico o forma literal** buscable; `[interpretativo]` en todo otro caso, **incluida la duda**. Es una
primera pasada revisable: una marca mal puesta se corrige en la regla que la contiene, no acá.

---

## 4.1 Política de coincidencia: qué pasa cuando aplica más de un criterio

**El método no lo decía, y es la pregunta que sigue naturalmente a tener un catálogo.** Una tabla de
decisión de DMN declara su **política de coincidencia** justamente porque una situación puede activar
más de una regla; sin declararla, cada lector resuelve distinto. Las dos que las fuentes consultadas
nombran son **Unique** —sólo una fila puede ser verdadera— y **Collect** —más de una puede serlo, y el
resultado es una lista—.

**Las dos tablas de este catálogo tienen políticas distintas, y es deliberado:**

| Tabla | Política | Qué significa |
| --- | --- | --- |
| **§3, criterios por situación** | **Única** | Una situación tiene **un** criterio. Que apliquen dos es un **defecto de este catálogo** y se corrige acá, aunque el agente pueda destrabar su trabajo por `Root-Rules.md` §13: **destrabarlo no cierra el defecto del catálogo** |
| **§4, anti-patrones por regla** | **Acumulativa** | Varios anti-patrones pueden alcanzar al mismo documento, y **todos sus remedios se aplican**. No compiten |

**Qué se hace cuando en §3 aplican dos.** Se distinguen dos casos, y sólo uno es del agente:

1. **Los dos criterios coinciden en la salida.** Es **redundancia del catálogo**: se declara y se
   corrige acá, unificando la entrada. El trabajo sigue.
2. **Los dos difieren.** Si la diferencia viene de que **dos reglas** alcanzan el mismo ítem, se prueba
   `Root-Rules.md` **§13**, que tiene **un solo criterio**: la que viaja en la lista de insumos de todo
   despacho desplaza a la que no viaja. Si decide, la resuelve el agente nombrando las dos reglas y cuál
   desplaza a cuál, **y la entrada del catálogo se corrige igual**. **Si no decide —las dos viajan, o
   ninguna— y en todo otro caso**, es un conflicto entre dos cosas aprobadas y el agente **no lo
   resuelve**: es la **detención por arbitraje** de `Master-Prompt.md` §7.0, con la forma de §8.1.

**Por qué la política de §4 es acumulativa y no puede ser otra.** Un mismo documento puede tener a la
vez un stack sin versión y un flujo de lectura único: son defectos independientes con remedios
independientes. Tratarlos como excluyentes obligaría a elegir cuál corregir, que es absurdo.

---

## 5. Lo que este catálogo no resuelve

**No dice qué hacer cuando una situación no está en él.** Esa es la pregunta interesante, y la
respuesta del método es el **apartamiento declarado**: se documenta la decisión con sus disparadores, y
la migración la revisa contra cada versión nueva. Un apartamiento que sobrevive dos saltos es candidato
a regla, y ahí sí entra a este catálogo.

**No convierte los criterios en tablas ejecutables por una máquina.** El estándar de la industria
para modelar decisiones es **DMN**, y conviene separar tres cosas que no se adoptan ni se descartan
juntas:

| Pieza de DMN | ¿Se adopta? | Por qué |
| --- | --- | --- |
| **Condiciones de entrada declaradas** | **Sí** | Es lo que distingue una tabla de decisión de una lista de recomendaciones. Acá es la columna `Detección` y la tabla de §3 |
| **Política de coincidencia** | **Sí** | §4.1. Es texto, y su ausencia dejaba sin resolver el caso de dos criterios simultáneos |
| **Serialización XML y motor de ejecución** | **No** | Son para intercambio entre herramientas y evaluación automática. Acá **el motor es el agente que lee**, y el intercambio es el repositorio |

**La representación nunca fue el obstáculo**, y decirlo así en la versión 1.0 estaba mal: una tabla de
decisión se expresa en Markdown sin pérdida —columnas de entrada, columnas de salida, una fila por
regla—. Lo que no corresponde adoptar es la **infraestructura** de DMN, no su notación.

---

## 6. Control de cambios

| Versión | Fecha | Cambios |
|---|---|---|
| 1.0 | 2026-08-17 | Emisión inicial. Índice de **202 situaciones** catalogadas y **22 criterios** de decisión repartidos en dieciocho reglas y tres orquestadores, que existían **sin punto de entrada**. Las tablas de anti-patrones suman su **marca de detección** `[enumerable]` / `[interpretativo]`, reusando la clasificación que el método ya aplicaba a los criterios de aceptación. |
| 1.1 | 2026-08-17 | **§4.1 nueva: la política de coincidencia**, que el método no declaraba. La tabla de §3 es **única** —dos criterios para una situación son un defecto del catálogo— y la de §4 es **acumulativa** —varios anti-patrones alcanzan al mismo documento y todos sus remedios aplican—. Cuando dos criterios difieren, es la **detención por arbitraje** de `Master-Prompt.md` §7.0, que ya existe: no se estrena mecanismo. **§5 corrige el fundamento sobre DMN**: separa sus tres piezas y declara que **la representación nunca fue el obstáculo** —una tabla de decisión se expresa en Markdown sin pérdida—; lo que no se adopta es la serialización XML y el motor, porque acá el motor es el agente que lee. |
| 1.2 | 2026-08-17 | §4 declara que la marca `[enumerable]` **la consume la compuerta mecánica** de `Master-Prompt.md` §10.0 desde la 9.13, y no sólo documenta quién decide. |
| 1.3 | 2026-08-18 | Corrección de recuento encontrada por el **barrido por concepto** (`SDD-Development-Guide.md` §VI.3.1): la fila de §3 decía «las **once** comprobaciones» y §VI.3 tiene **doce** desde la 9.10. El catálogo indexa por situación y **su valor depende de que el puntero sea exacto**: un índice que manda a once comprobaciones cuando hay doce enseña a no contarlas. |
| 1.4 | 2026-08-18 | §3 suma la situación **«se escribe una regla nueva a partir de un caso observado»**, que la Parte IV de `SDD-Development-Guide.md` incorporó en la 9.18. Es la comprobación **12** de §VI.3 funcionando: un criterio nuevo entra al índice en la misma intervención que lo crea. |
| 1.5 | 2026-08-18 | §3 suma dos situaciones que la 9.19 incorporó: **«apareció un hallazgo y no se sabe si detener o resolverlo»**, que resuelve la pregunta previa de §8.1, y **«hay que encargarle una verificación a un auditor»**, que resuelven las tres partes del encargo de §10. |
| 1.6 | 2026-08-19 | **Cuatro criterios nuevos de `Root-Rules.md` §12.2** y la fila de §12 recalificada a **§12.1**, por la partición que el reporte `14` produjo: diferir un ítem obligatorio con forma en lugar de contestarlo con una promesa, diferir por partes cuando el ítem empaqueta dos decisiones y sólo una está bloqueada, y qué nivel de hallazgo corresponde cuando **el evento de cierre ya ocurrió**. Se registra acá por la comprobación 12 de `SDD-Development-Guide.md` §VI.3 —quien toca, registra—, que existe precisamente para que el índice no dependa de que alguien se acuerde. Sube minor. |
| 1.7 | 2026-08-20 | Un criterio nuevo de `SDD-Development-Guide.md` §VI.3.2: **qué hacer con el residuo del barrido que el autor sabe legítimo** — se **cita** la tabla de siete clases estables en lugar de reescribirla, y se enumeran sólo las exclusiones propias del caso. Se registra por la comprobación 12 de §VI.3, que existe para que el índice no dependa de que alguien se acuerde. Origen: `Reportes/15`. Sube minor. |
| 1.8 | 2026-08-20 | Un criterio nuevo por la partición de cinco ítems obligatorios: **cuándo un ítem de una §4.x empaqueta dos decisiones y hay que partirlo**, con el test que las distingue —la segunda mitad **se decide por separado** o **se deriva de la primera**—. Se registra acá por la comprobación 12 de `SDD-Development-Guide.md` §VI.3. Sube minor. |
| 1.9 | 2026-08-20 | Un criterio nuevo por la comprobación 13 de `SDD-Development-Guide.md` §VI.3: **qué se le devuelve al origen que trajo la intervención**, y cuándo se lo puede declarar resuelto. Se registra acá por la comprobación 12 —quien toca, registra—. Sube minor. |
| 1.10 | 2026-08-20 | Un criterio nuevo por `Root-Rules.md` **§13**: **cuándo un conflicto entre dos reglas lo resuelve el agente y cuándo lo arbitra el humano**. Y §4.1 punto 2 se refina: antes de escalar, se prueba si la diferencia es **de forma** —jerarquía, especificidad, fecha—. **No deroga el arbitraje: le pone delante el caso que sí tiene respuesta en el árbol.** Sube minor. |
| 1.11 | 2026-08-21 | §4.1 punto 2 y el criterio de §3 se reescriben contra el **§13 reducido a un solo criterio**. La redacción anterior citaba una formulación —«cuando el árbol contiene el dato que decide»— que §13 derogó en la misma intervención, **y que el barrido no alcanzó**: lo levantó la tercera ronda de auditoría como contradicción literal entre §13 y la entrada que enruta hacia §13. Sube minor. |
