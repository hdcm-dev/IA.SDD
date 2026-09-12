# Changelog

Todos los cambios relevantes de este repositorio (`IA.SDD`) se documentan acá.
Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/).

## [13.14] - 2026-09-12

**El método sabía re-expresar documentación bajo una normativa que avanzó y no sabía qué hacer cuando lo que avanzaba era el alcance comprometido del producto.** Un destino que cerró su alcance, se desplegó, y después recibió dos decisiones de producto del Product Owner —una topología de despliegue realizada, una reestructuración del árbol de código propuesta— quedó con su documentación de especificación completa y describiendo un producto que ya no era ése. Es el reporte `25`, cuarto y último de la corrida del 2026-09-12, sobre la sexta reanudación de `Lab-Geometria` y su mesa de dos ciclos.

### Verificación previa: qué seguía vigente de la 13.10 y qué no

**Todas las citas del reporte siguen siendo literales en la 13.13.** Verificado archivo por sección contra el árbol vigente: `Master-Prompt.md` §7, §12, §13 y el glosario de §15; `Master-Prompt-Reanudacion.md` §0, §1 y §4; `Rules-Backlog-Tecnico.md` §3.4 y §3.6; `Rules-Plan-Sprint.md` §3.6; `Rules-Documentacion.md` §0.6; `Migracion-Rules.md` §0 y §3; `Vocabulario-Rules.md` §2 y §3. Ninguna de las tres intervenciones anteriores de esta corrida (`26`, `28`, `27`) tocó estas secciones: la `26` y la `27` tocaron `Root-Rules.md` §11/§12 y `Master-Prompt.md` §8.1/§8.2/§10.0; la `28` tocó `Vocabulario-Rules.md` §8/§9/§10 y `Master-Prompt.md` §10/§10.0/§15 (el glosario de términos del método, no la tabla de §7/§12/§13 que este reporte cita). §13 sigue cerrando su lista de casos de escritura en **dos**, con las mismas palabras que el reporte transcribe.

### La decisión que ordena el resto: no corresponde un tercer caso de escritura del intake (solicitud 5 del prompt de intervención)

**Los dos casos de `Master-Prompt.md` §13 regla 2 son de la misma familia: los dos ocurren durante una corrida de este orquestador.** Una decisión de alcance del Product Owner posterior al handoff ocurre sin ninguna corrida en curso. La regla 1 de §13 dice «toda invocación al manifiesto o a un intake **durante la generación** es lectura» y no «siempre»: fuera de una corrida, el intake es documento humano (`Migracion-Rules.md` §4.4) y esta regla nunca tuvo que autorizar que su autor lo edite, porque nunca se lo prohibió. Las veinte decisiones de producto que el reporte midió sobre el intake de `Lab-Geometria`, diecisiete de ellas después de «Aprobado», no violaron ninguna regla de este archivo: ocurrieron fuera de su ámbito.

**Escribir un tercer caso ahí habría sido corregir en el lugar equivocado.** Ponerle a un acto que ya es libre las tres condiciones acumulativas de la migración estructural —propuesta, diff, aprobación explícita— invierte la relación: el intake dejando de ser del Product Owner para pasar a necesitar el permiso de un orquestador ausente. Es precedente el reporte `12`, resuelto con una decisión negativa: acá también, **no** es un desenlace legítimo y con fundamento escrito, no una fórmula de cortesía.

**El eje de extensión que ya existe (`SDD-Development-Guide.md` §III.4) se aplicó antes de proponer nada nuevo, y no alcanzaba, por un motivo que conviene declarar.** §III.4 resuelve cómo agregar una **fase** al orquestador de generación, y este hueco no es de una fase: es de un evento que ocurre fuera de toda corrida, con el sistema en producción y sin cardinalidad del método que lo cubra. Sus tres preguntas —¿corre una vez, por unidad o por incremento?; ¿qué precondición?; ¿qué se regenera y qué se preserva?— no tienen respuesta útil para un hecho que no es de fase. Lo que se ensambló en su lugar fueron los instrumentos que ya existen: `Rules-Backlog-Tecnico.md` §3.4, que ya sabía versionar un cambio de alcance y no decía cuándo, y `Root-Rules.md` §12.2 (ítem diferido), para la decisión que todavía no se puede resolver.

### Cambiado — `Master-Prompt.md` 8.17 → 8.18

**§13.1 es nueva** y responde la solicitud 5: no hace falta un tercer caso. Declara que el ámbito de §13 es «durante la generación», qué es el intake en el eje origen/vigencia —la declaración vigente del alcance y no una línea base de origen, porque su propio control de cambios ya lo trata como tal (§5.1.a del reporte)—, y remite el criterio de cuándo absorber una decisión y qué evento la dispara a `Rules-Backlog-Tecnico.md` §3.6. Declara además la consecuencia sobre la salida D de `Master-Prompt-Reanudacion.md` §4. **§15 suma dos términos**: `vigencia operativa abierta` (§5.4 del reporte, sin gobierno nuevo: reutiliza roadmap, backlog y operación) y `evento de cambio de alcance` (§5.2, subproducto del acto de asentar la decisión en el intake, verificado sin colisión: `grep -rn "vigencia operativa\|evento de cambio de alcance" SDD/Devs --include='*.md'`, cero ocurrencias antes de esta intervención). **Corregido de paso**: la entrada «Fase» del glosario enumeraba A a H y omitía I y J, que el propio glosario define dos filas más abajo — hallazgo con cita literal, cerrado en la misma unidad por autocorrección (`Master-Prompt.md` §8.1).

### Cambiado — `Rules-Backlog-Tecnico.md` 5.1 → 5.2

**§3.6 suma el evento y el criterio que le faltaban al paso de versión.** Ya sabía qué hacer con un cambio de alcance significativo (pasar a `v2.0`) y no decía cuándo: en el destino que originó el reporte, seis documentos de esta categoría quedaron dieciocho días sin tocar después de dos decisiones de producto reales, con cero altas en el medio. El evento: la entrada de control de cambios que el Product Owner asienta en el intake al registrar la decisión (§5.2 del reporte, y es el mismo que reabre el roadmap, para que los dos no queden gobernados por disparadores distintos). El criterio de clasificación, adoptado de la mesa que originó el reporte y verificado contra sus dos casos medidos: modifica una fila de la matriz del roadmap —incluido el contenido de una fila ya existente— o el conjunto de proyectos de código del manifiesto (§5.3 del reporte). Exige además emitir al menos una `BT-XXXXX` con criterio de aceptación o un ítem diferido de `Root-Rules.md` §12.2 (§5.5 del reporte): reusa los instrumentos existentes y no crea un control ejecutable, por la prohibición de §6 del reporte.

**Es el cambio decisivo del paso 5 de §7 del reporte.** Antes de esta intervención, `Rules-Backlog-Tecnico.md` §3.4 sabía qué hacer y ninguna regla decía cuándo. Después, lo dice.

### Cambiado — `Rules-Contexto.md` 4.5 → 4.6

**§3.5 es nueva**: `Roadmap-Producto.md` se reabre con el mismo evento y el mismo criterio que `Rules-Backlog-Tecnico.md` §3.6, declarados una sola vez ahí y citados acá, para que el roadmap y el backlog no queden gobernados por disparadores distintos.

### Cambiado — `Master-Prompt-Reanudacion.md` 1.12 → 1.13

**Declara qué hace la salida D cuando su punto de continuación no está en el roadmap** (solicitud 7 del prompt de intervención, §3.2.e del reporte): lo trata como la divergencia que es, y la lleva a la mesa de §3.1, que convoca el evento nuevo de `Rules-Backlog-Tecnico.md` §3.6.

### Las cinco preguntas de §5 del reporte, una por una

- **§5.1 (qué es el intake, y con qué criterio se lo escribe después)**: es la declaración vigente del alcance, no una línea base de origen; el criterio de absorción es el de §5.3; el «tercer caso de facto» que el reporte observó no era un tercer caso de §13, porque §13 nunca gobernó ese momento.
- **§5.2 (el evento que reabre backlog, plan y roadmap)**: la entrada de control de cambios del intake que registra la decisión, el mismo para los tres artefactos. `Master-Prompt.md` §13.1, `Rules-Backlog-Tecnico.md` §3.6, `Rules-Contexto.md` §3.5.
- **§5.3 (el criterio de clasificación)**: sí, el de la mesa, verificado contra los dos casos medidos del reporte. `Rules-Backlog-Tecnico.md` §3.6.
- **§5.4 (el estado de vida del producto)**: sí hace falta nombrarlo, y no en `Vocabulario-Rules.md` —que gobierna seis términos de identidad, no de estado—: `vigencia operativa abierta`, en el glosario operativo de `Master-Prompt.md` §15, sin gobierno nuevo.
- **§5.5 (el salto de la decisión al control)**: sí, reusando el instrumento que el propio método ya tiene: una `BT-XXXXX` con criterio de aceptación, o un ítem diferido de `Root-Rules.md` §12.2 si todavía no se puede resolver.

### Lo que este conjunto NO toca, y se declara

**`Master-Prompt.md` §13 no gana un tercer caso.** Sus dos casos de escritura y sus tres condiciones acumulativas de migración estructural no cambian una palabra. **`Vocabulario-Rules.md` no se modifica**: sus seis términos siguen siendo seis, y el término nuevo de este conjunto vive donde ya vive el resto del vocabulario del método, con el criterio de colisión de la 13.12 verificado y sin colisión. **No se crea ningún control ejecutable**: los dos casos de §5.5 son documentales, y son instrumentos que el método ya tenía. **`Lab-Geometria` no se toca**: es el destino que originó el reporte y esta intervención no escribe en él.

### Lo que queda sin medir, y se dice

**El paso 6 de §7 del reporte —comparar la fecha de la decisión contra la última modificación de los documentos de planificación— no se volvió a correr sobre `Lab-Geometria`.** Es un destino de solo lectura para esta intervención; el mecanismo queda escrito y su próxima reanudación es quien lo ejerce. **El criterio nuevo de `Rules-Backlog-Tecnico.md` §3.6 no se ejecutó sobre un caso real que lo dispare**: se verificó por lectura contra los dos casos que el reporte ya midió, no corriendo una fase de backlog sobre un tercer caso nuevo.

### Por qué es minor

**Ningún documento ya emitido deja de cumplir.** Los cuatro archivos tocados suben minor: §13.1 acota el ámbito de una regla existente sin reescribir sus dos casos, el glosario suma dos términos y corrige una omisión, y las dos reglas de versionado suman un disparador a una mecánica que ya existía. No se toca ninguna invariante D1-D9, ningún caso de §13, ninguna plantilla de intake y ningún valor de D8.

### Impacto sobre destinos existentes

**No es «ninguno», y hay un destino que lo consume de inmediato.** `Lab-Geometria` tiene, sin recibir, la decisión del 2026-09-06 (topología de despliegue) y la del 2026-09-11 (reestructuración bajo el árbol de la solución, ya fusionada). Su próxima reanudación va a encontrar, para cada una: si modifica una fila de `Roadmap-Producto.md` §3 o el conjunto de proyectos de código de `PRODUCT-MANIFEST` §13 —y las dos lo hacen, según la medición del propio reporte—, tiene que asentar la entrada de control de cambios en el intake que dispara el evento nuevo, y desde ahí `Product-Backlog.md` y `Backlog-Tecnico.md` pasan a `v2.0` con al menos una `BT-XXXXX` por decisión, o un ítem diferido de `Root-Rules.md` §12.2 para la que no se pueda resolver todavía —el caso concreto es la decisión de mantener el canal de FTP como alternativa sin publicación automática, hoy sin ningún artefacto que la sostenga—. `Roadmap-Producto.md` fila `i` se corrige con el mismo evento. Ningún destino existente queda con un artefacto que deje de cumplir por retroactividad: el disparador rige hacia adelante, desde la próxima vez que alguien asiente una decisión de esta clase en un intake.

### Snapshot

`_legacy/13.13/` se tomó **antes** de editar, desde el estado publicado de la 13.13, con las exclusiones de `SDD-Development-Guide.md` §VI.5. Adentro, `Master-Prompt.md` está en **8.17**, `Rules-Backlog-Tecnico.md` en **5.1**, `Rules-Contexto.md` en **4.5** y `Master-Prompt-Reanudacion.md` en **1.12**.

## [13.13] - 2026-09-12

**Los tres instrumentos del método para lo que falta —referencia pendiente, ítem diferido, apartamiento declarado— declaran hacia dónde apuntan y ninguno de dónde salen.** Dos huecos con identificadores contiguos pueden ser de fases separadas por meses y el artefacto no lo dice; una migración que tiene que decidir si un hueco se completa o se declara deuda no tenía con qué, y lo que no podía reconstruir a mano lo elevaba al humano. Es el reporte `27`, tercero de la corrida del 2026-09-12, sobre un requisito del Product Owner de `Lab-Geometria`: que los huecos queden correlacionables con el ciclo que los produjo.

### Verificación previa: qué seguía vigente de la 13.10 y qué no

**Todas las citas del reporte siguen siendo literales en la 13.12.** `Root-Rules.md` §9, §10, §11, §12.1 y §12.2, `Migracion-Rules.md` §3 y §4, y el tipo de evidencia `ejecucion` de `Deriva-Rules.md` no cambiaron entre la 13.10 y la 13.12: ninguna de las dos intervenciones anteriores de esta corrida tocó estos archivos. `Rules-Documentacion.md` §0.6 —citada en el encabezado del reporte como alcance evaluado y nunca usada en su cuerpo— tampoco cambió, y se declara acá que **el reporte la nombra y no la ejerce**: no es evidencia falsa, es una cita que no llega a afirmación.

**El caso de los 118 se remidió, no se citó.** Reconstruido desde `Lab-Geometria` (solo lectura, ramas `main` y `archivo/reanudacion-6-2026-09-12`):

```bash
git show archivo/reanudacion-6-2026-09-12:SDD/Docs/Audit/Estado-Del-Destino-2026-09-12.md   # §4: 87 cerrados + 25 vigentes + 6 NO APLICA = 118
git show archivo/reanudacion-6-2026-09-12:SDD/Docs/Audit/Estado-Del-Destino-2026-08-27.md   # §4: 86 cerrados + 9 vencidos + 12 vigentes + 11 sin evento = 118
```

Los dos totales cierran en **118** y la aritmética de la transición entre uno y otro es exacta: de los 20 ítems que el 08-27 tenía como `vencido` o `sin evento`, 6 pasan a `NO APLICA`, 13 a `Vigente` y 1 a `Cerrado` (86+1=87, 12+13=25, 0+6=6). Un recuento mecánico propio sobre las tablas `Id | Punto abierto | Quién lo cierra | En qué evento se cierra | Estado` de los ocho documentos que el 08-27 nombra reprodujo **116** filas con identificador desnudo más **2** con identificador entre backticks (`` `PD-10` `` de los dos `Supply-Chain-Seguridad.md`) que el patrón desnudo no capturaba — **118**, coincidente con las dos fuentes.

**El reporte queda corregido en un punto, y se dice antes de usarlo como fundamento (§2 de la solicitud de esta intervención).** Su §2.4 describe los tres números como «tomados en momentos distintos por instrumentos distintos» y «que no se pueden cruzar sin abrir los 118 uno por uno». Verificado: los tres números —87, 25 y 6— salen de **una** tabla, en **un** documento, de **una** fecha (`Estado-Del-Destino-2026-09-12.md` §4), y ese mismo documento cruza su propio recuento contra el del 08-27 con aritmética exacta, sin abrir los 118 ítems uno por uno. **El reporte está sobredimensionado en ese detalle**, aunque no en su diagnóstico: la reconciliación fue posible porque un orquestador de reanudación la escribió a mano, leyendo decisiones del Product Owner del 08-26 y del 08-30 y `ADR-14004` — es la reconstrucción manual que el reporte describe como costo, no la ausencia de ella. Y la afirmación fuerte del reporte sigue de pie: **ningún ítem de los 118 declara contra qué versión del framework se lo declaró**; el campo `En qué evento se cierra` que ya exige §12.2 apunta hacia adelante, no hacia atrás.

### La decisión que ordena el resto: qué pasa con los 118 ya declarados (§5.4 del reporte)

**Se decide antes que las cinco preguntas de diseño, con el costo medido sobre el caso real y no estimado.** Exigir el campo retroactivo elevaría, en la primera migración que corra sobre cualquier destino con huecos declarados —que son todos—, el volumen completo a preguntas para el humano: exactamente el defecto que el mecanismo viene a evitar. Dejarlo vacío sin más pierde información que sí está: el texto literal de un hueco es, salvo reescritura por consolidación, estable desde que se escribió, y por lo tanto **buscable**.

**Se deriva donde se pueda y se marca `no derivable — anterior al mecanismo` donde no**, con `Migracion-Rules.md` §4.9. Probado sobre una fila real de `Lab-Geometria` (`Pipeline-CI-CD.md` de `GeometriaFactory-Api`, PD-04, «la vigencia exacta del acceso firmado»): `git log archivo/reanudacion-6-2026-09-12 --oneline -S"La vigencia exacta del acceso firmado"` devuelve ocho commits, el más antiguo `8520aa7 Fase B de GeometriaFactory-Api` — el ciclo de origen de esa fila se deriva sin abrirla a mano, en menos de un segundo de cómputo. El costo real no está en el comando: está en elegir, fila por fila, un fragmento de texto suficientemente literal y estable, que es trabajo de una migración concreta sobre un destino concreto. Esta intervención no ejecuta la derivación de las 118 filas: `Lab-Geometria` es un destino y esta intervención no lo toca; deja el mecanismo escrito y medido para cuando corra.

### Cambiado — `Root-Rules.md` 8.6 → 8.7

**§11, §12.1 y §12.2 suman el campo ciclo de origen**, calculado y no escrito a mano, con el mismo fundamento con que el reporte `26` decidió lo mismo para el origen del hecho: un campo que completa el agente se completa de buena fe y se lee como verificación sin serlo. El mecanismo de cómputo vive en `Master-Prompt.md` §8.2. **Nueva fila de escalamiento en §12.2**: un hueco declarado desde esta versión sin su ciclo de origen es hallazgo P1. Los huecos anteriores a esta versión no lo llevan porque el campo no existía, y no es hallazgo por eso solo. **Corregido de paso**: las filas 8.3 a 8.6 del propio control de cambios estaban en orden inverso; se reordenan sin cambiar el texto de ninguna.

### Cambiado — `Master-Prompt.md` 8.16 → 8.17

**§8.2 es nueva.** El ciclo de origen se calcula con tres datos congelados al declararse —fase, unidad de trabajo y base de la corrida— y **no se recalcula**, a diferencia del origen del hecho de §8.1: la base de la corrida es de una corrida, y un hueco declarado hoy se sigue leyendo en corridas futuras, cada una con su propia base; remitir a «la base de la corrida» en un hueco ya escrito apuntaría, leído después, a un commit equivocado. **Reutiliza la base de la corrida de la 8.15** (reporte `26`) en lugar de crear una pieza paralela; lo único que agrega es la fase y la unidad de trabajo, que el origen del hecho no necesitaba. **§10.0 suma la comprobación 8**: verifica presencia del campo en los huecos que la fase escribe y no decide clasificación, la misma reserva con que la comprobación 7 trata la colisión léxica. **§15** suma el término.

### Cambiado — `Migracion-Rules.md` 3.19 → 3.20

**§4.8 es nueva: deriva la clasificación de un hueco entre «del ciclo» (se completa) y «de norma posterior» (se declara deuda) a partir del ciclo de origen**, comparando la versión del framework que exige el contenido faltante contra la que regía en el destino en ese ciclo — leída con `git show {{base}}:{{manifiesto}}` y **no declarada como campo aparte**, porque lo que se puede derivar de un commit no se declara dos veces (`Root-Rules.md` §10). Sólo eleva al humano el hueco que ninguna de las dos reglas alcanza. **§4.9 es nueva**: el tratamiento retroactivo decidido arriba, con `git log -S` sobre el texto literal de la fila y el valor terminal `no derivable — anterior al mecanismo` para cuando no resuelve. **§6 suma dos criterios enumerables**, uno con la forma decisiva del propio reporte: el número de huecos que la clasificación eleva tiene que ser **menor** que el total con las dos clases mezcladas, no igual.

### Decisión de nombre: `ciclo de origen`, verificada y no heredada

El reporte `27` v1.1 había renombrado `procedencia` a `ciclo de origen` **sin verificar sus secciones destino**, y su v1.2 reabrió la decisión. Se reproduce la verificación en lugar de heredar el número de la mesa que originó el reporte `28` —que medía un caso distinto, el de calificar `procedencia` para un sentido nuevo— con la unidad de contexto que la 13.12 fija en `Vocabulario-Rules.md` §9.2 (el contexto de lectura es del lector, y la suma de lo que un lector recibe no es un contexto):

```bash
grep -rn "ciclo de origen" SDD/Devs --include='*.md'   # 0 ocurrencias, antes de esta intervención
```

**Cero colisiones en los tres archivos que este campo toca** —`Root-Rules.md`, `Master-Prompt.md`, `Migracion-Rules.md`— y en el resto de `SDD/Devs`. No hace falta forma calificada ni entrada de glosario: el nombre se adopta desnudo, con costo de calificación cero, verificado antes de escribirse y no supuesto. Se confirma la elección de la v1.1 del reporte, con la verificación que le faltó.

### Las seis preguntas de §5 del reporte, una por una

- **§5.1 (el campo)**: sí. `ciclo de origen`, derivado del contexto de la corrida —fase, unidad de trabajo, base de la corrida— y no escrito a mano. `Root-Rules.md` §11/§12.1/§12.2, mecanismo en `Master-Prompt.md` §8.2.
- **§5.2 (versión del producto)**: no como campo declarado. Se deriva del commit del ciclo de origen con `git show`, por la misma razón con que `Root-Rules.md` §10 prohíbe declarar un dato derivable: un segundo campo sería una segunda declaración del mismo hecho, que se desincroniza. `Migracion-Rules.md` §4.8 es quien lo deriva.
- **§5.3 (clasificación)**: sí, `Migracion-Rules.md` §4.8, hueco del ciclo contra hueco de norma posterior, y sólo eleva lo que ninguna de las dos alcanza.
- **§5.4 (tratamiento retroactivo)**: derivar donde se pueda y marcar no derivable donde no (arriba, y `Migracion-Rules.md` §4.9). Ni exigir ni vaciar sin más.
- **§5.5 (criterio enumerable)**: sí, en `Migracion-Rules.md` §6 y en la fila de escalamiento de `Root-Rules.md` §12.2, más la comprobación 8 de `Master-Prompt.md` §10.0 que verifica presencia en generación.
- **§5.6 (rol)**: no hace falta uno nuevo. El orquestador —de generación, de migración o de mesa— ya calcula el origen del hecho por el mismo mecanismo; calcular el ciclo de origen es la misma operación con dos datos más. Un rol nuevo sin el dato seguiría reconstruyendo a mano, que es la posición que el propio reporte toma en su §5.6.

### Reutilización evaluada antes de escribir (solicitud 6)

**`Deriva-Rules.md`, tipo de evidencia `ejecucion`**: ancla una afirmación a un momento verificable, y es la prueba de que el framework sabe fechar cuando decide hacerlo. No alcanza directo: es un valor del campo `evidencia` de un contrato de verificación de la categoría 10, no un campo de los tres instrumentos de huecos, y no lleva fase ni unidad de trabajo. Se reutiliza el **patrón** —anclar a un momento reproducible— no el artefacto.

**`SDD-Development-Guide.md` §III.4**, las tres preguntas para agregar un instrumento: ¿corre una vez, una vez por unidad, o una vez por incremento? Corre **una vez por hueco declarado**, cada vez que se escribe uno de los tres instrumentos, en cualquier fase. ¿Qué precondición? Que la base de la corrida esté publicada (`Master-Prompt.md` §12.1 T0), la misma que el origen del hecho ya exige. ¿Qué se regenera y qué se preserva? Nada se regenera: el campo se escribe una sola vez y no se recalcula, por la razón de la base de una corrida contra huecos de lectura futura ya declarada arriba. §III.4 es de agregar una **fase**, y esto no es una fase: se responden sus preguntas porque transfieren bien, y se declara que no alcanzaba una figura ya escrita completa, sin inventar una tercera pieza — se ensambla con lo que el origen del hecho ya resolvió.

### Relación con el reporte `25` y con el `26` (solicitud 7)

**Con el `25`**: siguen siendo separables. El `25` trata el disparador del ciclo —qué evento hace que el método reciba un cambio de alcance del producto—; el `27` trata el formato del hueco dentro de un ciclo ya disparado. Nada de lo que esta intervención tocó sugiere que sean la misma figura.

**Con el `26`**: los dos piden un dato que se calcula. **Se reutiliza la base de la corrida entera**, sin crear una pieza paralela. La diferencia que había que cuidar, y se cuidó: el origen del hecho vive y muere dentro de una corrida, y por eso se recalcula; el ciclo de origen de un hueco sobrevive a la corrida que lo escribió, y por eso se congela. Tratarlo como el origen del hecho —recalculable— habría sido correcto dentro de la corrida y falso en la siguiente.

### Lo que este conjunto NO toca, y se declara

**Los tres instrumentos no se fusionan.** `referencia pendiente`, `ítem diferido` y `apartamiento declarado` siguen siendo tres figuras. **El identificador no lleva el ciclo adentro**: el dato es un campo, no una forma de numerar. **No se crea ningún rol nuevo.** **`Lab-Geometria` no se toca**: el mecanismo de derivación retroactiva se escribe y se mide sobre una fila de muestra; correrlo sobre las 118 es trabajo de una migración real sobre ese destino. **`Vocabulario-Rules.md` no se modifica**: se usa su criterio de colisión de la 13.12 con el comando de verificación adjunto, que es lo que esa versión exige.

### Lo que queda sin medir, y se dice

**El criterio 3 del reporte —correr una migración sobre un árbol con huecos de las dos clases y contar cuántos se elevan— queda cumplido a medias**, con el precedente del reporte `18`: `Migracion-Rules.md` §4.8 declara el mecanismo y su criterio enumerable exige que el número elevado sea menor que el total, pero no se ejecutó una migración real sobre un destino para contarlo, porque los destinos son de solo lectura para esta intervención. El **criterio 4** —el caso retroactivo sobre los 118— queda igual de a medias: se probó el mecanismo de derivación sobre una fila real y no sobre las 118, por el mismo límite de alcance.

### Por qué es minor

**Ningún documento ya emitido deja de cumplir.** El campo rige hacia adelante desde SDD 8.7 de `Root-Rules.md`; un hueco declarado antes no es hallazgo por carecer de él, y su tratamiento en migración es el de `Migracion-Rules.md` §4.9, que es aditivo. `Master-Prompt.md` §16 clasifica como minor los cambios de mecánica de §8 y §10.0. No se toca ninguna invariante D1-D9 ni ninguna plantilla de intake.

### Impacto sobre destinos existentes

**Nada retroactivo, y no es «ninguno».** Todo destino con huecos declarados —que son todos— entra, en su próxima migración normativa, a la clasificación de `Migracion-Rules.md` §4.8, y como ninguno de sus huecos declarados hasta hoy tiene ciclo de origen, esa migración corre primero §4.9 sobre cada uno: lo deriva con `git log -S` donde el texto lo permite, o lo marca `no derivable — anterior al mecanismo`. Ninguna de las dos salidas eleva al humano por sí sola. Desde su próxima corrida de generación, **todo hueco nuevo lleva el campo**, verificado por la comprobación 8 de la compuerta mecánica. Medido sobre `Lab-Geometria`, sin tocarlo: sus **118** ítems diferidos son el volumen que su próxima migración va a clasificar.

### Snapshot

`_legacy/13.12/` se tomó **antes** de editar, desde el estado publicado de la 13.12, con las exclusiones de `SDD-Development-Guide.md` §VI.5: **129 archivos**. Verificado con `diff -rq` contra el árbol de trabajo: coincide byte a byte salvo los tres archivos que esta intervención tocó (la nota de coherencia es posterior al snapshot y no está adentro, correctamente). Adentro, `Root-Rules.md` está en **8.6**, `Master-Prompt.md` en **8.16** y `Migracion-Rules.md` en **3.19**.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Ciclo-De-Origen.md`, conjunto resultante **13.13**.

## [13.12] - 2026-09-12

**Una afirmación de colisión léxica sin su medición se leía igual de firme que una medida, y ninguna pieza del método lo notaba.** `Vocabulario-Rules.md` sabía decidir si un término colisiona y nombraba con exactitud el error de afirmarlo sin medir —§9.4, *«el patrón queda primado»*—, pero **era la única de las diecinueve reglas con criterios clasificados que no aportaba ni un `[enumerable]`**, recortaba la exigencia de medir a la invariante declarada, que es la forma más cara de desambiguar, declaraba el contexto de lectura para un solo lector, y **se contradecía sobre qué términos gobierna**. Es el reporte `28`, cuya evidencia central son seis afirmaciones de recuento, de sección o de colisión escritas sin medir en un mismo trabajo, todas detectadas por relectura ajena.

### La decisión que ordena el resto: qué gobierna la regla

**§8 acotaba la regla entera —su criterio de colisión incluido— a los seis términos de §2**, y contra eso estaban la cabecera, la letra de §9 —*«cualquier documentación que el framework genere»*, *«un término con más de un referente»*—, R6 y §9.6, que la aplican a «migración», y `Master-Prompt.md` §10, que audita la polisemia de «todo término». **Se resolvió con el árbol y sin detener**: el hecho es ajeno a esta corrida —el párrafo está en la base sin cambios— y tiene respuesta con cita literal, que es la pregunta previa de `Master-Prompt.md` §8.1. `Root-Rules.md` §13 no hacía falta: no hay dos reglas, hay un párrafo contra el resto de su archivo.

**§15 define y §9 decide la colisión.** El vocabulario propio del método se sigue definiendo en el glosario operativo, y si dos de sus sentidos chocan lo decide §9, como para cualquier otro término. **No se reabre el reporte `11`**: lo que la 2.2 de la regla fijó por él fue **dónde se define** ese vocabulario, y eso no cambia.

**Y el argumento con que se había resuelto no se sostenía entero.** Se decía que §8 había quedado desactualizado por la práctica posterior del archivo; medido en su control de cambios, **§9.6 es de la 2.1 y el párrafo de §8 de la 2.2**, de modo que se escribió contra una sección que ya estaba. La conclusión se sostiene por las otras citas; la cronología, no.

### Cambiado — `Vocabulario-Rules.md` 3.2 → 3.3

**§8** declara en una tabla lo que la regla gobierna y sobre qué términos: significado y precedencia, sobre los seis; criterio de colisión, sobre todos.

**§9.2 declara el contexto de lectura de cada lector, leído de sus insumos**: la sección cuando su lista la nombra, el archivo cuando lo nombra sin sección. **Ni para el subagente la unidad era entera**: su despacho nombra por sección el intake, esta regla y `Root-Rules.md`, y por ruta la regla de su categoría, los documentos upstream y los de conocimiento. Se declaran **dos consecuencias opuestas** —la co-ocurrencia se mide sobre el contexto más grande de los lectores de un archivo, y con ella el costo de calificar; la desambiguación, sobre el más chico— y que **la suma de lo que un lector recibe no es un contexto**, con el precedente de §9.6, que declaró disjuntos dos sentidos de «migración» que el orquestador de migración recibe en dos archivos íntegros.

**§9.4** extiende la prohibición de la invariante a **toda afirmación de colisión o de no colisión** —un renombre, una forma calificada, un nombre descartado— y obliga a adjuntarle **el comando reproducible y su salida**; remitir con su sección a una resolución ya escrita no es afirmar de nuevo. **§10 suma su primer `[enumerable]`**, que decide la presencia de la medición y no la colisión, con alcance desde la 3.3.

### Cambiado — `Master-Prompt.md` 8.15 → 8.16

**§10.0 suma la comprobación 7, que localiza y no decide**: por cada término que la fase acuña o renombra —calculado contra la base de la corrida desde los glosarios y los registros de sustitución, **no declarado en un registro aparte**— devuelve sus ocurrencias por sección y por archivo como insumo del auditor, con el comando publicado en el texto. Es la única de la lista que no emite hallazgo. **§10** pone el criterio de polisemia sobre el contexto de cada lector, y **§15** actualiza «Contexto de lectura», «Glosario operativo» y «Compuerta mecánica».

### Cambiado — `Mesa-Rules.md` 1.2 → 1.3

**§6.1: una afirmación de colisión o de no colisión se ancla sólo en E1.** Una cita literal muestra dónde está una palabra y no dónde no está; sin comando la afirmación es `C` y no funda parche, igual para el despacho, los especialistas y el refutador. **§8** suma el criterio enumerable.

### Cambiado — `SDD-Development-Guide.md` 1.29 → 1.30

**§VI.3 suma la comprobación 14**: toda afirmación de colisión o de no colisión que una intervención escribe **o de la que parte** —la de su origen, la de su verificación previa— está en la nota con su comando, y la recibida sin comando se reproduce antes de usarse. El punto 1 de §VI.3.1 rige al cerrar, y la afirmación ocurre antes. §II.7 pasa sus recuentos a catorce.

### Cambiado — `SDD-User-Guide.md` 1.20 → 1.21 y `Catalogo-De-Criterios.md` 1.16 → 1.17

El glosario de la guía de usuario pone al día «Contexto de lectura». El catálogo suma la situación **«se va a afirmar que un término colisiona o no colisiona»**, reapunta «un término tiene dos sentidos» y pasa a catorce comprobaciones. **El total de §4 no cambia.**

### Corregido — lo que la intervención encontró al tocar

- **Dos registros de control de cambios en orden inverso**, contra la comprobación 10: en `SDD-Development-Guide.md`, las filas 1.25 a 1.29; en `SDD-User-Guide.md`, la 1.17 a la 1.19. **Se reordenan sin cambiar el texto de ninguna fila**, verificado: las seis filas fechadas que el diff quita reaparecen idénticas.
- **El «45» del reporte suma dos archivos como si fueran un contexto.** Con §9.2 vigente, calificar un sentido nuevo en `Migracion-Rules.md` cuesta las ocurrencias de ese archivo —23 con `grep -o procedencia | wc -l`—, y las de `Master-Prompt-Migracion.md` sólo si el sentido nuevo se escribe también ahí —22, o 24 sin distinguir mayúsculas—.
- **La fila 3.1 de `Vocabulario-Rules.md` atribuye a §9.4 la cita de la línea de insumos del despacho**, que vive en §9.2. **No se reescribe**, por §VI.2: se declara.

### Lo que este conjunto NO toca, y se declara

**Ningún registro de términos acuñados**: se evaluó y se rechazó con evidencia, y la comprobación 7 calcula sus términos en vez de leerlos de una fuente declarativa. **Los otros doce criterios de §10** siguen interpretativos: se pide uno. **La compuerta no decide colisiones.** **`Root-Rules.md` §13**, que no aplica a un conflicto interno de un archivo. **`Migracion-Rules.md` y `Master-Prompt-Migracion.md`**: la cabecera de la primera ya era coherente con el contexto por lector. **Los nombres de los campos de los reportes `26` y `27`**, que decidieron o deciden sus intervenciones. **Las afirmaciones ya publicadas sin comando** —entre ellas la de la 13.11 que descartó `procedencia`—: la regla no es retroactiva, y una entrada publicada es clase estable.

### Lo que queda sin medir, y se dice

**El criterio 3 del reporte queda cumplido a medias**: la comprobación 14 marca por vía del método las dos afirmaciones sin comando de la 13.11, pero no se ejerció sobre una verificación previa en vivo. **La localización de afirmaciones es por cadena** —`colisi`, `disjunt`, `polisem`— y un sinónimo como «choca» se le escapa. **Escribir un reporte sigue sin estar bajo ningún `Archivo target`**: se lo alcanza cuando lo produce una mesa y cuando lo usa una intervención.

### Por qué es minor

**Ningún documento ya emitido deja de cumplir.** El criterio enumerable nuevo rige desde la 3.3; el de polisemia ya decía «todo término» y `Master-Prompt.md` §10 ya lo auditaba así; la comprobación 7 no emite hallazgo y entra al banco del destino con el alcance temporal de §10.0. `Master-Prompt.md` §16 clasifica como minor los cambios de mecánica; `Mesa-Rules.md` sube minor con un registro emitido que sigue conforme. No se toca ninguna invariante D1–D9 ni ninguna plantilla de intake.

### Impacto sobre destinos existentes

**Nada retroactivo, y no es «ninguno».** Desde su próxima corrida, un destino tiene que adjuntar comando a toda afirmación de colisión nueva, su compuerta suma la comprobación 7 cuando se la toque, y el costo de toda familia calificada nueva se mide con el contexto de lectura de cada lector. **Medido sobre los cuatro destinos del espacio de trabajo**, en `SDD/Docs/` fuera de carpetas archivadas: 73, 59, 1 y 89 líneas que mencionan una colisión junto a un término, un sentido o una polisemia, y **ninguna con un comando en la misma línea**. Es un proxy, y el comando está en la nota de coherencia. **Si la regla fuera retroactiva, ése sería el volumen de hallazgos**, y es el argumento con que D9 declaró no aplicarse hacia atrás.

### Snapshot

`_legacy/13.11/` se tomó **antes** de editar, desde el commit de publicación de la 13.11, con las exclusiones de `SDD-Development-Guide.md` §VI.5: **128 archivos**, los mismos del commit fuera de las exclusiones, ninguno distinto byte a byte. Adentro, `Vocabulario-Rules.md` está en **3.2**, `Master-Prompt.md` en **8.15**, `Mesa-Rules.md` en **1.2**, la guía de desarrollo en **1.29**, la de usuario en **1.20** y el catálogo en **1.16**.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Colision-Lexica.md`, conjunto resultante **13.12**.

## [13.11] - 2026-09-12

**La decisión de elevar algo al humano se tomaba preguntando si el árbol tiene la respuesta, y nunca preguntando quién produjo el estado por el que se pregunta.** Un estado que la propia corrida dejó a medias —un documento empezado y no cerrado, una decisión tomada y no asentada, una inconsistencia introducida en una unidad anterior— **no tiene respuesta en el árbol por construcción**, porque nadie la escribió. Con la pregunta previa de `Master-Prompt.md` §8.1 caía del lado de detener, y le llegaba al humano **con la forma de una consulta legítima**: contexto, opciones, propuesta, y un disparador de la lista cerrada. Es el reporte `26`, sobre un requisito que un Product Owner formuló sin vueltas: los agentes le descargan problemas que generaron ellos y que habrían resuelto mirando el conjunto.

### La decisión que ordena el resto: el origen del hecho se calcula, no se declara

**Declarado, el dato no sirve.** Un agente que no se dio cuenta de que generó el problema declara «ajeno» de buena fe, y la cuenta de detenciones propias da cero **igual con una corrección real que con una cosmética**. Y declarado por el agente sería, con otro nombre, el eje de estratos que la 9.19 rechazó: una clasificación por juicio de quién puede cerrar.

**Calculado, contra qué, y ésa era la pregunta difícil.** El reporte proponía el snapshot que §8 archiva antes de despachar. **No sirve, y se verificó en lugar de suponerse**: se toma **al construir cada despacho**, de modo que ya contiene lo que dejaron las unidades anteriores de la misma corrida, y contra él un estado a medias de otra unidad **se lee como previo**. Es el valor equivocado que había que evitar, producido esta vez por el instrumento y no por el agente distraído. Además cubre sólo el entregable, no rige en las Fases I y J, y se archiva por fecha y por versión.

**El ancla correcta ya existía y no se registraba: el commit sobre el que corre T0.** T0 corre antes de la primera escritura, T2 garantiza que todo esté commiteado, abarca el árbol entero, y un commit no se sobrescribe. **El formato de T0 no lo publicaba**, y el destino que originó el reporte lo escribió igual, por su cuenta, en su informe de estado. Es el mismo patrón que el reporte denunciaba —un dato que se toma y ninguna regla lee—, aplicado a la pieza correcta.

### Cambiado — `Master-Prompt.md` 8.14 → 8.15

**§8.1 suma el origen del hecho, antes de la pregunta previa.** Dos valores, **de la corrida** y **ajeno a la corrida**, que calcula el orquestador contra la **base de la corrida** y **nunca declara quien tropezó**. Si no se puede calcular —el hecho no vive en ningún repositorio, la base no se publicó— se trata como de la corrida, por la misma asimetría de costos con que se decide detener, y la detención dice por qué no se calculó. **Lo ajeno sigue yendo a la pregunta previa, sin cambios. Lo de la corrida no se evalúa contra el árbol** sino contra la autocorrección sobre el conjunto, y sólo sale si corregirlo cambia una decisión que el humano ya tomó, si es un arbitraje, o si exige intención de producto que ninguna fuente contiene — declarando **por qué la autocorrección no alcanzaba**.

**La tabla de la autocorrección suma su tercera fila**: el estado a medias que produjo la corrida lo resuelve el agente **sobre el conjunto de lo que la corrida produjo** y no en el punto donde tropezó, y lo declara en el cierre con su alcance ampliado. El bloque de detención suma `ORIGEN DEL HECHO`, con el renglón `Cómo` que separa lo calculado de lo tratado por duda, y `SI NO RESPONDÉS`. **Y el cierre declara que una cuenta en cero no prueba que la regla funcione.**

**§12.1 T0 publica la línea `Base`**, que es la base de la corrida: el commit sobre el que la primera T0 de la invocación devolvió EN ORDEN. No cambia durante la corrida; T5 la republica igual y la continuación de la reanudación la hereda.

**§8 declara por qué el snapshot no es la base**, y que el orquestador calcula el origen del hecho antes de elevar el contenido que el subagente devuelve como no reflejado —que dentro de una corrida puede ser un despacho paralelo sobre un proyecto compartido—.

**§7.0 suma el lote de la fase**, que generaliza al bucle de fases la forma que `Mesa-Rules.md` §7.1 ya tenía probada: lo que no bloquea espera; el lote sale al cerrar la fase o cuando ya no puede avanzar; antes de salir **se mira entero**, con el origen del hecho calculado sobre todas; y cada detención lleva `SI NO RESPONDÉS`. **Lo bloqueante son dos casos**: el arbitraje de §7.0 y la detención sin cuya respuesta ninguna otra unidad de la fase avanza. **El registro de decisiones pendientes no suma columna**: el lote es la forma de presentar, y lo no contestado entra con su default en «qué rige mientras tanto», que la fila ya tenía.

**§9** suma el campo con la leyenda de que no lo completa el subagente, y presenta en el lote. **§15** suma tres términos: base de la corrida, origen del hecho y lote de la fase.

### Cambiado — `Mesa-Rules.md` 1.1 → 1.2

**§7 suma el origen del hecho antes de la lista cerrada**, que pregunta qué clase de decisión es y nunca de dónde salió el hecho. Importa en un caso que ya ocurrió: una corrida con varios ciclos de mesa el mismo día mira, en cada ciclo, lo que aplicaron los parches de los anteriores. §7.1 suma el campo a la forma y §8 suma el criterio enumerable. **No se agrega ningún punto de invocación**, y §0.0 queda como estaba.

### Cambiado — `Master-Prompt-Reanudacion.md` 1.11 → 1.12

El bloque `REPOSITORIO` de R1, que reproduce T0, publica la base de la corrida, y §6 suma el criterio enumerable del origen del hecho junto al de la lista cerrada.

### Cambiado — `Master-Prompt-Migracion.md` 2.9 → 2.10

**M4 tenía la segunda copia de la cláusula del snapshot**, y ahora calcula el origen del hecho antes de tratar una diferencia como corrección manual: un documento que la migración estructural ya movió en esta corrida lo refleja en su snapshot.

### Cambiado — `Catalogo-De-Criterios.md` 1.15 → 1.16

Dos situaciones nuevas —una detención que nace de un estado que dejó la propia corrida, y varias detenciones en una misma fase— y una reapuntada: «apareció un hallazgo y no se sabe si detener o resolverlo» pasa a nombrar primero el origen del hecho. **El total de §4 no cambia**: no entra ningún anti-patrón.

### Corregido — lo que la intervención encontró al tocar

- **«Qué no cambia» de §8.1 afirmaba que la sección no quita ninguna detención**, y **era falso desde la 9.19**: la pregunta previa quita las que tienen respuesta en el árbol. El cambio de esta versión lo agravaba, y la comprobación 9 lo levantó.
- **Dos registros de control de cambios estaban desordenados**, contra la comprobación 10: en `Master-Prompt.md`, veintiuna filas vivían después de «Fin del master-prompt» y la 8.12 a la 8.14 estaban entre la 8.2 y la 8.3; en `Catalogo-De-Criterios.md`, la 1.13 estaba entre la 1.2 y la 1.3. **Se reordenan sin cambiar el texto de ninguna fila**, verificado sobre el conjunto de filas antes y después. Los huecos de numeración —la 7.5 del master-prompt— **no se rellenan**: una fila la escribe quien hizo el cambio.

### Lo que este conjunto NO toca, y se declara

**`Root-Rules.md` §13**: no hay conflicto entre reglas que resolver, porque la cláusula vive dentro de §8.1, que §13 declara que corre antes. **`Vocabulario-Rules.md` y `Migracion-Rules.md`**, que son alcance de otras dos intervenciones de la misma serie. **La condición de convocatoria de la mesa**: el lote lo arma el orquestador en el corte de fase que ya existía. **La pregunta previa, su cita literal y su «ante la duda, se detiene»**, que siguen rigiendo para todo hecho ajeno a la corrida.

**El nombre del campo se midió antes de elegirse.** `procedencia` colisiona en tres secciones que esta versión toca —la procedencia declarada del destino en §7.0 y en la reanudación—, y `origen` a secas tiene otros referentes en §7.0 y §8.1. `origen del hecho` tiene cero ocurrencias previas, y se escribe siempre completo.

### Lo que queda sin medir, y se dice

**La causa que el reporte describe no está medida**, y esta versión no la mide: el mecanismo se verifica recién con una corrida real en la que un agente encuentre un estado que la corrida dejó a medias. **Un criterio de aceptación queda cumplido a medias** y dos requieren esa corrida para contestarse; la nota de coherencia los enumera.

### Por qué es minor

**Ningún documento ya emitido deja de cumplir.** El registro de decisiones pendientes no cambia de forma; un registro de mesa ya emitido es un registro fechado y sigue conforme, igual que declaró la 1.1 de esa regla al sumar el prefijo de familia; y `Master-Prompt.md` §16 clasifica como minor los cambios en la mecánica de §8 y el flujo de §7. No se toca ninguna invariante ni ninguna plantilla de intake.

### Impacto sobre destinos existentes

**Nada retroactivo, y no es «ninguno».** Desde esta versión, **las salidas de T0 publican la base** y **las detenciones y escaladas llevan su origen del hecho**. Una escalada abierta que se vuelva a presentar lo lleva calculado contra la base de la corrida que la levantó, si esa base quedó escrita; cuando el hecho es el estado de un despliegue y no vive en ningún repositorio, se trata como de la corrida y tiene que decir por qué la autocorrección no alcanzaba. **Lo verificado sobre un destino real** está en la nota de coherencia.

### Snapshot

`_legacy/13.10/` se tomó **antes** de editar, desde el commit de publicación de la 13.10, con las exclusiones de `SDD-Development-Guide.md` §VI.5. Verificado: `Master-Prompt.md` adentro está en **8.14**, `Mesa-Rules.md` en **1.1**, `Master-Prompt-Reanudacion.md` en **1.11**, `Master-Prompt-Migracion.md` en **2.9** y `Catalogo-De-Criterios.md` en **1.15**.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Origen-Del-Hecho.md`, conjunto resultante **13.11**.

## [13.10] - 2026-09-01

**El framework venía produciendo maquetas con una forma constructiva estable, y esa forma no estaba escrita en ninguna parte.** Vivía repartida entre lo que las reglas exigen —`Maqueta-Rules.md` la autonomía, los cuatro estados y el sello; `Design-Rules-Web-Generico.md` los tokens y los diez patrones; `Deriva-Rules.md` los umbrales— y lo que cada corrida reconstruía de memoria: el layout de archivos, el contrato entre el HTML y el JavaScript, el conmutador de estados, la resolución de los cuatro tipos de diálogo. **Las reglas dicen qué tiene que cumplir la maqueta; ninguna dice cómo se construye.** Esta versión cataloga ese cómo, y el cómo de llevarlo a un proyecto Blazor, **sin mover una coma de la norma**.

### Agregado — `Conocimiento/Knowledge-Template-HTML-SDD-Default.md` 1.0

Alias `Template-HTML-SDD-Default`, naturaleza `propio`, consumidores `03` y `AG-00031`, 877 líneas. Caracteriza la maqueta navegable estática que el framework produce: **el layout de cuatro archivos**, el orden contractual de las tres piezas de JavaScript y su inversión de control —el motor llama a la página, no al revés—, **los dos shells** con la transición entre ellos como navegación completa y nunca como un `hidden`, el conmutador declarativo `data-mq-estado` que hace el estado **relevable del DOM**, y los cuatro tipos de diálogo —ABM clásico, asistente de varios niveles, ventana modal y presentación de datos—.

**Su condición de carga es `requiere_maqueta == true` con construcción en HTML, CSS y JavaScript planos**, de modo que llega por el camino determinista y no hace falta citarlo a mano.

**La medida del documento es una sola, y está escrita como criterio:** un agente que nunca vio una maqueta SDD tiene que poder producir una equivalente leyendo sólo esto.

### Agregado — `Conocimiento/Knowledge-Template-Blazor-Interactive-Server-SDD-Default.md` 1.0

Alias `Template-Blazor-Interactive-Server-SDD-Default`, naturaleza `propio`, consumidores `03` y `05`, 937 líneas. **Hereda del anterior y escribe sólo el delta**: qué cambia de forma cuando el que renderiza es un componente Razor sobre un circuito, y qué hay que resolver que en HTML plano no existía —el render mode por superficie con **la identidad en SSR estático**, el ingreso y el cierre de sesión por POST a un endpoint fuera del circuito, las tres capas de guard, la prevención del doble envío con la bandera **antes** del `await`, el prerrenderizado y la carga idempotente—.

**Es el primer par del catálogo que ejercita `Hereda-de`.** Las dos filas existentes lo tenían en `—`, y la herencia es lo que permite que el segundo documento no repita ni los tokens, ni las anatomías de patrón, ni el vocabulario de estados, ni los criterios de accesibilidad.

### La desviación declarada, que es la pieza a mirar

**§8.1 del documento de Blazor invierte una cláusula de `Design-Rules-Blazor-Mudblazor.md`**: ese archivo pide que los patrones se realicen con los componentes de la librería mapeada y **no con HTML propio cuando existe componente equivalente**, y el documento los realiza con **componentes Razor propios**.

**No es una sustitución, y el campo `Sustituye` queda en `—` a propósito.** `Rules-Base-Conocimiento.md` §0.4 sólo habilita sustituir un ítem **rotulado como decisión de stack**, y ese archivo no lleva el rótulo en ninguna de sus reglas: el caso es **conflicto**, ante conflicto manda la regla, y lo único que el conocimiento puede hacer es declarar la desviación con su justificación. **Es el mismo límite que la 13.9 dejó anotado para `Master-Prompt.md` §12.1, ahora desde otra categoría** — la segunda vez que el catálogo choca contra la ausencia del rótulo.

**El motivo de fondo es la deriva:** la maqueta que el humano aprueba es HTML plano, y con una librería de componentes hay un salto de tecnología entre lo validado y lo construido. **Lo que cuesta también está declarado**: se pierde la accesibilidad que la librería daba gratis —teclado y ARIA de grilla, asistente, diálogo y menú—, y perder el recorrido por teclado, el foco visible o el contraste **es deriva mayor y bloquea**. Por eso los criterios de §6 exigen la verificación explícita de teclado en esos tres componentes.

### Cambiado — `Index-Knowledge.md` 1.1 → 1.2

Las dos filas del alta, con las diez columnas de §7.1. El catálogo pasa de dos a **cuatro** documentos, y son los **dos primeros de naturaleza `propio`**.

### Lo que se mide y no se toca: el techo de `Rules-Base-Conocimiento.md` §6.2

**Los dos documentos superan el techo de 600 líneas de un documento `propio`, y los dos se acogen a la única excepción que la regla admite** —un §5 de esqueletos que no se puede partir sin volverlo inútil—, declarada en su §0 con su motivo.

**Se registra porque es la primera medición real del número.** La propia §6.2 dice que los techos «son calibrables» y que «se revisan con los primeros documentos reales en la mano»: éstos son los primeros documentos `propio` del catálogo, los dos exceden en más del cuarenta por ciento, y **el §5 explica casi la mitad de cada uno** —440 líneas de 877, y 548 de 937—. **No se toca §6.2 acá**: un alta de conocimiento no modifica la regla que la gobierna. Queda como evidencia para quien decida la calibración.

### Corregido — el snapshot de `_legacy/` que la 13.9 no tomó

`_legacy/` llegaba hasta la 13.8. Se repone **`_legacy/13.9/`** desde el estado sin editar del control de versiones, con el conjunto entero menos lo que §VI.5 excluye —el `CHANGELOG.md`, la propia `_legacy/` y los archivos de configuración del repositorio—. Se verifica lo que §VI.5 pide: **`Index-Knowledge.md` dentro del snapshot está en 1.1 y no en 1.2**, y los dos documentos de esta versión no aparecen ahí. Es el mismo defecto que la 13.8 corrigió para la 13.6 y la 13.7, y **vuelve a ocurrir en la intervención siguiente**: el snapshot lo toma la versión que publica, no la que se archiva, y esa asimetría se sigue olvidando.

### Lo que este conjunto NO toca, y se declara

**Ninguna regla, ningún orquestador y ninguna plantilla.** Los dos documentos citan y no copian: `Maqueta-Rules.md`, `Design-Rules-Web-Generico.md`, `Design-Rules-Acceso-Monousuario.md`, `Design-Rules-Primer-Arranque.md`, `Design-Rules-Identidad-De-Version.md`, `Design-Rules-Blazor-Mudblazor.md`, `Rules-UX-UI-DX.md` y `Deriva-Rules.md` quedan intactos. Y los dos declaran, en su §8, **los huecos del piso que llenan sin normar** —el patrón agnóstico de diálogo modal, la paginación y el ordenamiento, la separación `.razor` / `.razor.cs`, el ciclo de vida, el prerrenderizado y la estructura de carpetas del proyecto de interfaz—, con la cláusula de que si el framework los incorpora, manda el framework.

### Por qué es minor

Por la misma derivación que la 13.9: **no cambia ninguna regla, ningún orquestador ni ninguna plantilla**, de modo que por la tabla estricta de `SDD-Development-Guide.md` §VI.5 sería patch. Se publica como **minor** porque **el catálogo condiciona lo que el orquestador genera** —es el criterio con el que `Conocimiento/` entra en el snapshot— y un destino que declare 13.10 declara un catálogo que 13.9 no tenía.

`SDD/Devs/Guides/Coherencia-Templates-De-Maqueta.md` 1.0, §12. Conjunto resultante **13.10**.

## [13.9] - 2026-08-29

**El procedimiento con el que el trabajo sale del agente y llega al humano estaba reglado y no se podía citar.** `Master-Prompt.md` §12.1 lo declara desde la 9.2 y §8.1 fija la forma de su cierre desde la 9.16, pero **el catálogo de `Conocimiento/` no lo tenía**, y sin alias no hay forma de nombrarlo desde un intake ni de declarar una variante por diferencia. Esta versión lo cataloga, **sin mover una coma de la norma**.

### Agregado — `Conocimiento/Knowledge-Conformacion-Pull-Request-Manual.md` 1.0

Alias `Conformacion-Pull-Request-Manual`, `canonico`, consumidor `transversal`, 218 líneas. Caracteriza el ciclo completo de ocho turnos —compuerta de arranque, unidad declarada, rama y push, cierre de unidad con el enlace del pull request y «qué sigue después del merge», **merge y borrado del humano en la plataforma**, acuse, verificación por alcanzabilidad y republicación del estado— con **el archivo y la sección de donde sale cada turno**.

**«Manual» designa quién conforma el pull request**: el merge y el borrado son del agente humano, y nunca del agente que escribió el cambio. Es el punto por el que esta variante se separa de cualquier otra, y por eso está en el alias y no sólo en el cuerpo.

**Es catálogo y no norma, y el documento lo hace verificable.** No copia ninguno de los tres bloques literales —los cita— y su §8 declara la frontera: lo normativo vive en `Master-Prompt.md` §12.1 y §8.1, que los tres orquestadores citan y no redefinen. Escribirlo de otro modo habría sido el anti-patrón **conocimiento disfrazado de regla** de `Rules-Base-Conocimiento.md` §4.5 y una segunda fuente de lo mismo.

**Lo que habilita es el objetivo secundario del pedido**: una tabla de **puntos de variación** —quién fusiona, quién borra la rama, granularidad de la unidad, concurrencia, forma de la reanudación, publicación del estado— contra la cual **una variante hermana se declara por diferencia**, sin desplazar la acordada.

### Cambiado — `Index-Knowledge.md` 1.0 → 1.1

La fila del alta, con las diez columnas de §7.1. El catálogo pasa de uno a **dos** documentos, y es el primero cuyo consumidor es `transversal`.

### Lo que este alta NO habilita, y se declara

**Una variante que cambie quién fusiona todavía no puede sustituir a ésta.** `Rules-Base-Conocimiento.md` §0.4 habilita la sustitución **sólo sobre ítems rotulados como decisión de stack**, y ningún ítem de §12.1 lleva ese rótulo: hoy una variante es **desviación**, manda la regla del framework y se declara con su justificación. Rotular §12.1 sería una intervención sobre el master-prompt y una decisión del responsable, fuera del alcance de un alta de conocimiento.

### Por qué es minor

**No cambia ninguna regla, ningún orquestador ni ninguna plantilla**, de modo que por la tabla estricta de `SDD-Development-Guide.md` §VI.5 sería patch. Se publica como **minor** por lo que sí cambia: **el catálogo condiciona lo que el orquestador genera** —es el criterio con el que `Conocimiento/` entra en el snapshot— y un destino que declare 13.9 declara un catálogo que 13.8 no tenía. La numeración del conjunto, además, nunca usó un tercer nivel.

`SDD/Devs/Guides/Coherencia-Conformacion-Pull-Request-Manual.md` 1.0, §10. Conjunto resultante **13.9**.

## [13.8] - 2026-08-29

**Un mecanismo se cableó a los puntos donde nació, y no a la condición que lo hace necesario.** Es el reporte `18`, y su evidencia son **tres corridas reales de la mesa de evaluación** sobre un destino — la primera vez que el mecanismo de la 13.7 se usa fuera del papel.

**La tercera se convocó fuera de norma, porque el caso más caro no tenía punto de invocación.** Un destino con un `P0` que **ocho rondas de auditoría** no lograron cerrar: sin reanudación en curso, sin migración invocada directa, y sin ser una generación desde cero. Ninguno de los tres puntos que `Mesa-Rules.md` §0 declaraba lo alcanzaba. Cuando corrió igual, encontró en una sola corrida lo que las ocho rondas no habían visto —**el criterio de corte de §10.1 pide una propiedad que ningún informe registra**—, porque miró las ocho **como corpus** en lugar de cada una por separado.

**La causa no era que faltara un cuarto punto.** El análisis que creó la mesa había enunciado el momento **como condición**: *«después de leer el estado, antes de aprobar el plan»*. La intervención de la 13.7 cableó esa condición a los dos prompts donde ocurría en agosto de 2026, y ese día enumerar y declarar la condición producían la misma lista. La diferencia aparece con el primer caso que la cumple desde otro lugar, y apareció ocho días después. **Agregar el punto que faltó habría dejado el defecto donde estaba.**

### Cambiado — `Mesa-Rules.md` 1.0 → 1.1

**§0.0 es nueva: la condición, con sus tres cláusulas** —hay corpus previo que no se produjo en esta corrida, el estado ya está leído con la forma del contrato de entrada, y hay un plan por aprobar o una decisión de alcance por tomar—. **Los puntos de invocación de los orquestadores quedan como casos de la condición y no como su definición**, y un caso que la cumple sin orquestador que la convoque **se convoca igual**, declarando desde dónde.

**§0.3 corrige la otra cara del mismo defecto.** «No corre sobre un destino vacío» **no es** «no corre en la generación», que es la derivación que la 1.0 dejó escrita: un destino deja de estar vacío apenas la primera fase produce algo, y desde ahí la generación **tiene corpus previo que nadie mira como conjunto** — el audit de §10 corre fase por fase, sobre lo que se acaba de producir. Con su límite escrito, para no duplicar ese audit: la mesa mira lo que ya existía al abrir la corrida.

**§6.1 suma la obligación de contrastar la fuente.** Un `P0` anclado en una fila de plan, una casilla o un campo de estado exige abrir su observable antes de proceder. **La mesa lo incumplió dos veces en su primera corrida real**, las dos en la misma dirección y las dos destapadas por una pregunta del humano. La mesa sigue sin relevar el estado —§4 se lo prohíbe y el fundamento se mantiene— pero abre la fuente que va a citar.

**Y tres correcciones de forma que sólo aparecen con volumen:** §2.1 admite **sufijo de ciclo** cuando hay más de uno en la misma fecha —un destino corrió tres el mismo día—; §2.2 obliga a declarar el **prefijo de familia** del ciclo, que no reusa una familia ya presente en la carpeta de auditoría, porque un ciclo tomó la familia `M` y el identificador `M-01` quedó con **cuatro significados**; y §6.7 declara que **el contador del ciclo es propio y no acumula** con el de las rondas de audit, porque quedaron los dos vivos y un panel independiente leyó mal cuál gobernaba qué.

### Cambiado — `Master-Prompt-Reanudacion.md` 1.10 → 1.11, §3.1.1

Deja de excluir a la generación por categoría y remite a la condición de `Mesa-Rules.md` §0.0.

### Cambiado — `Catalogo-De-Criterios.md` 1.14 → 1.15

Dos criterios nuevos por la comprobación 12 de §VI.3: **el caso pide una mesa y ningún orquestador la convoca desde ahí**, y **un `P0` apoyado en una declaración y no en un observable**. El total pasa de 220 a **222**.

### Corregido — dos snapshots de `_legacy/` que faltaban

**Las intervenciones que publicaron la 13.6 y la 13.7 no tomaron el suyo**, y `_legacy/` llegaba hasta la 13.5. §VI.5 declara qué rompe eso: `Master-Prompt-Migracion.md` construye el diff normativo leyendo `_legacy/`, de modo que **un salto desde 13.6 o desde 13.7 salía vacío** y una migración sin nada que aplicar se declara completa sin haber hecho nada.

Se reponen `_legacy/13.6/` y `_legacy/13.7/` desde los commits de publicación de cada versión, y se verifica lo que §VI.5 pide: la versión de cabecera de cada archivo dentro del snapshot es la **anterior** a los cambios que publicaron la siguiente. `_legacy/13.6/` no contiene `Mesa-Rules.md`, que es correcto: la mesa entró en la 13.7.

### Lo que este conjunto NO toca, y se declara

El **refutador**, la **ceguera del panel**, la **escala de ancla**, el **jurado**, el **cuerpo de parches** y el **contrato de entrada** se midieron funcionando en tres corridas y quedan intactos. El reporte `18` §2 los delimita uno por uno. Y la corrección de la 13.6 —el banco de casos— se midió **detectando un defecto en los parches de la propia mesa**, que es la mejor constancia que puede tener una intervención anterior.

### Se cierra el ítem diferido de la 13.7, con su medición

Su evento era **«la primera corrida real»** y lo que había que medir estaba escrito. Hubo tres: **4,9 y 5,8 hallazgos procedentes por especialista**, **20 parches con texto exacto**, **cero especialidades con aporte nulo**, y las detenciones al humano pasando de «cinco, tres de ellas con respuesta en el árbol» a **seis en lote con default declarado**, ninguna contestada y siendo eso válido por diseño. **El modo de falla que el análisis mandaba vigilar —un panel que produce actas y ningún parche— no ocurrió.**

**Con una advertencia que la medición agrega y el análisis no anticipaba**, declarada en §6.7: el rendimiento por especialista **no cae entre ciclos**. Si no cae, el criterio de corte del ciclo va a cerrar por decisión y no por criterio de forma sistemática, que es exactamente lo que le pasó al audit por rondas.

### Por qué el conjunto sube 13.8

**Es un minor.** Se agregan obligaciones y una condición; **ninguna regla se deroga y ningún documento generado deja de cumplir**. Un registro de mesa emitido bajo la 1.0 sigue siendo conforme.

### Impacto sobre destinos existentes

**Ninguno forzado por la publicación, y no es una migración.** Un destino no tiene que hacer nada: la condición de §0.0 rige para las convocatorias **desde esta versión en adelante**, y un registro de mesa anterior no queda no conforme. El precedente de alcance temporal es el de §10.0 en la 13.6 y el de la mesa en la 13.7.

**Lo que sí cambia para quien lo opera**: la mesa deja de depender de que haya un orquestador que la llame. Si el caso cumple las tres cláusulas, se convoca y el registro declara desde dónde.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Condicion-De-Convocatoria.md`, conjunto resultante **13.8**.

## [13.7] - 2026-08-27

**El método lee dónde está el trabajo y audita lo que acaba de producir, y entre esas dos cosas se toma la decisión más cara que existe: qué hacer con un destino que ya tiene documentación.** `Master-Prompt-Reanudacion.md` §2 lo declara por escrito —*«no se abre ninguna categoría documental para juzgar su contenido»*— y `Master-Prompt.md` §10 corre al cerrar una fase, es decir sobre lo que se acaba de escribir. **Nadie abre el corpus antes de planificar sobre él**, y el plan que sale de ahí se compone con el diff normativo, que compara dos versiones del framework y es ciego a lo que el destino dice de sí mismo.

**El costo estaba medido dos veces, en el propio framework, y de los dos lados del mismo defecto.** Del lado del humano: de **cinco detenciones** presentadas al Product Owner en una corrida real, **tres no eran suyas** y tenían respuesta en el árbol (`Master-Prompt.md` §8.1). Del lado del árbol: **diez hallazgos abiertos repartidos en cinco informes**, y al abrirlos **tres no eran lo que declaraban ser** — cuatro «enlaces rotos» que no lo eran **viajaron tres informes** antes de que alguien los abriera (`IA.SDD.Documentacion/Informes/Memoria-De-Antecedentes-Casos-Resueltos.md` §2.2).

**Entra la mesa de evaluación**, la etapa preplanificadora: un panel armado por señal observable que refuta el corpus a ciegas, un jurado de cinco funciones objetivo que vota hallazgo por hallazgo, y un cuerpo de parches que diseña la corrección **sin aprobarla**. Su salida no es un veredicto: es **un plan de cambios**, con su deuda declarada y sus consultas **agrupadas y con default**.

### Agregado — `SDD/Devs/Rules/Mesa-Rules.md` 1.0

Once secciones. La frontera con el audit —**el audit mira lo que se acaba de producir y emite un veredicto; la mesa mira lo que ya existía y emite un plan**—, el contrato de entrada que el orquestador alimenta y la mesa no releva, la composición por **señal observable con su ubicación**, el ciclo P0 a P5, **catorce criterios de aceptación** y **doce anti-patrones**.

**Lo que la mesa reusa y no redefine, que es la mitad del diseño:** los niveles de hallazgo son **P0 a P3** de §10; la base mecánica es **la compuerta de §10.0** con el banco que la 13.6 le exigió; el criterio de corte es **§10.1**; la deuda va a los **ítems diferidos de `Root-Rules.md` §12.2**; las escaladas a **`Decisiones-Pendientes.md`** de §7.0; y las capas a revalidar son los **hallazgos aguas arriba** de §10. Cuatro mecanismos del marco de origen se rechazaron por eso mismo: severidades S1-S4, chequeos mecánicos propios, criterio de parada propio y esquemas JSON.

**Lo único que agrega como escala nueva es la clase del ancla, E1 a E4 y C.** El método exige cita literal desde la 9.19 y **no la gradúa**, y graduarla resuelve mecánicamente la pregunta previa de §8.1: con ancla, lo cierra el agente; sin ancla posible, es del humano. **Un hallazgo heredado de un informe anterior entra como `C`** y no funda ningún parche hasta que alguien lo abre — que es exactamente lo que los cuatro falsos enlaces rotos no tenían.

### Agregado — `Master-Prompt-Reanudacion.md` 1.9 → 1.10, §3.1

**R1.5, la mesa, entre la presentación del estado y las salidas.** Es la única fase del prompt **sin detención**: no pregunta, analiza.

**Va exactamente ahí, y los tres motivos se sostienen contra el árbol.** **Antes no puede**: su contrato de entrada es la salida de R0, y convocarla antes sería el playbook que `Migracion-Rules.md` §3 rechazó con cinco fundamentos. **Después es tarde**: R2 elige la salida, y elegir sin saber si el corpus se sostiene es elegir sobre la mitad de la información — el mismo argumento por el que §3 presenta las divergencias antes que las salidas. **Y es el único punto donde una corrida sirve a las cinco salidas**: su plan es la lista de trabajo de la A, entra al plan de migración de la B y la E, funda la verificación que la C exige y es el punto de continuación de la D.

§4.0 suma **cuatro renglones a la recomendación**, que vuelven cuantificable lo que antes se adjetivaba: hallazgos procedentes por nivel, parches listos, deuda declarada y escaladas.

### Cambiado — `Master-Prompt-Migracion.md` 2.8 → 2.9, M1

**M1 convoca la mesa cuando la invocación es directa, y verifica su registro cuando llega desde la reanudación.** No es una optimización: es el precedente que la 2.3 fijó para el diff normativo — reconstruirlo desde cero no lo hace más confiable, lo hace más lento y arriesga dos lecturas del mismo salto que no coinciden.

**Y consolida la batería de preguntas.** La regla de no invención de `Migracion-Rules.md` §4.1 obliga a preguntar por cada sección sin fuente; sin mesa, esas preguntas nacen dispersas a lo largo de M2 y M4, de a una y sobre un árbol ya en escritura. **Es el mecanismo que produce las rondas**, y es el que se corrige.

M6 suma un P0: un parche aplicado **aguas abajo del defecto que corrige**, contra la compuerta de capa de origen de `Mesa-Rules.md` §6.5.

### Agregado — `Root-Rules.md` 8.5 → 8.6, §9.2: `AG-00970`

El presidente de mesa, que **convoca, consolida y no vota**. Se acuñó por la regla que la 8.5 escribió —el mayor libre descendiendo desde `00990`— y se verificó el identificador antes de tomarlo.

**Se hizo además la pregunta que la 8.5 declaró instructiva por haberla omitido**: a qué ítem diferido le cumple la condición esta acuñación. **A ninguno.** El único abierto del bloque es el solapamiento con las categorías `90` a `99`, que **se agrava** —tres ocupantes en lugar de dos— y sigue diferido con su evento de cierre intacto.

### Cambiado — el barrido por concepto, y dos recuentos que ya estaban viejos

Concepto barrido: los recuentos de archivos de reglas y las enumeraciones de master-prompts. **Cinco lugares alcanzados, cuatro actualizados y uno declarado.** Los recuentos pasan de **diecinueve a veinte** archivos de reglas y de siete a **ocho** transversales, en `README.md`, `SDD-Development-Guide.md` 1.29, `SDD-User-Guide.md` 1.20 y `Catalogo-De-Criterios.md` 1.14.

**Y encontró dos que envejecieron antes de esta intervención**: `README.md` y `SDD-Development-Guide.md` §V decían que una invariante alcanza a **«los dos orquestadores»**, y el tercero existe desde el conjunto 8.10.

Las apariciones en este `CHANGELOG.md` y en notas de coherencia anteriores **se declaran y no se tocan**: son registros de lo que se verificó en su fecha.

`Catalogo-De-Criterios.md` suma la fila de la regla nueva con sus **12 situaciones** —el total pasa de **208 a 220**, `[enumerable]` de 100 a **107** e `[interpretativo]` de 108 a **113**— y **cinco criterios** a §3, entre ellos el que faltaba desde siempre: **cuándo una consulta es del humano**, por la lista cerrada de siete disparadores de `Mesa-Rules.md` §7.

### Lo que se difiere, con los cuatro campos de §12.2

**Cuánto cuesta una mesa y cuánto ahorra.** Un panel de núcleo más hasta cinco variables, con jurado de cinco y cuerpo de parches, es el despacho más caro que el método declara, y **nadie corrió una mesa sobre un destino real todavía**. Los topes de `Mesa-Rules.md` §5.5 y §6.7 lo acotan y no lo miden.

- **Qué se difiere**: la calibración de los topes de panel y de ciclos contra costo medido.
- **Por qué**: fijar un techo hoy sería inventar el caso, que es lo que `Root-Rules.md` §9.2 declara como motivo legítimo de diferimiento.
- **Qué rige mientras tanto**: los topes escritos —cinco variables, cuatro rondas por §10.1—.
- **Evento de cierre**: la primera corrida real que emita su registro de mesa. Lo que hay que medir está declarado: **hallazgos procedentes sobre convocados**, y **detenciones presentadas al humano antes y después**, que es la cifra que originó la intervención.

### Por qué el conjunto sube 13.7

**Es un minor.** Se agrega un mecanismo, una regla, un rol y una fase sin detención propia; **ninguna regla se deroga y ningún documento generado deja de cumplir**.

### Impacto sobre destinos existentes

**Ninguno forzado por la publicación, y no es una migración.** Un destino no tiene que hacer nada: la mesa se convoca la próxima vez que se lo reanude o se lo migre, y su registro nace ahí. Un destino cuya reanudación anterior corrió sin mesa **no queda no conforme**: la fase no existía. El precedente de alcance temporal es el de §10.0 en la 13.6.

**Lo que sí cambia para quien lo opera**: las consultas dejan de llegar de a una durante la ejecución y pasan a llegar **en lote, antes del plan y con default declarado**.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Mesa-De-Evaluacion.md`, conjunto resultante **13.7**.

## [13.6] - 2026-08-23

**El método concedía una exclusión de alcance a cambio de una declaración, y nada comprobaba que la declaración fuera verdadera.** Es el reporte `16`, y la asimetría que describe es la que lo hace reincidente: **una comprobación que sobredeclara produce exactamente la misma salida verde que una correcta**, y el único lector capaz de notarlo es el auditor, que es precisamente a quien la exclusión se lo prohíbe mirar. Un defecto que sólo puede ver quien tiene prohibido mirarlo no se corrige por atención.

La versión trae además el **barrido de pendientes del framework**, que encontró un ítem diferido con su evento de cierre cumplido y dos afirmaciones vencidas. Van juntas porque tocan los mismos archivos y comparten la misma clase de defecto: **algo declarado que nadie comprueba**.

### Cambiado — `Master-Prompt.md` 8.13 → 8.14, §10.0

**Tres obligaciones, y las tres son del destino que escribe su compuerta.** Toda comprobación entra **con un caso que la ejerce**: aplica el defecto sobre una copia, corre, y verifica que lo reporte. Todo **recorte declarado** entra con su caso de la clase inversa: el defecto **no** se reporta **y** la salida declara que ahí no mira. Y **un hallazgo sobre la propia compuerta no pasa a «cerrado» sin su caso**, que tiene que **fallar antes de la corrección y pasar después** — es el decisivo, porque es el que corta el ciclo de reincidencia.

**El banco es del destino y el framework no lo distribuye**, por `SDD-Development-Guide.md` §II.7: los casos dependen de las comprobaciones que cada destino escribió, y un banco central reimplementaría condiciones que el destino ya declara. **La obligación es del método; el banco es del destino.**

**Y no se pide cobertura completa.** El punto no es que la compuerta mida todo: es que **declare con precisión lo que mide**. Un recorte declarado y probado es conforme; el callado no lo es.

**La declaración de alcance pasa de prosa a lista enumerada de recortes**, para que el despacho del audit pueda distinguir *«esto quedó verificado y sale de tu alcance»* de *«esto la compuerta declara no haberlo mirado, y es tuyo»*, que era la mitad que se perdía.

### Cambiado — el recuento de anti-patrones sale de la prosa

§10.0 decía «97 de las 202 situaciones». **Medido sobre los archivos vivos: 100 de 208**, que es exactamente lo que `Catalogo-De-Criterios.md` §4 declara. El catálogo estaba bien y §10.0 era el que había quedado viejo.

**La corrección no fue actualizar el número.** Ya había envejecido dos veces sin que nada lo detectara, que es lo que `Root-Rules.md` §10 prohíbe para un dato derivado en la prosa. §10.0 **deja de transcribirlo** y cita el catálogo como única fuente. Corregir el número lo dejaba listo para envejecer una tercera vez.

### Cambiado — `Root-Rules.md` 8.4 → 8.5, §9.2: un hallazgo P1 del barrido

**Un ítem diferido cuyo evento de cierre ya había ocurrido siguió abierto tres versiones.** El ítem 4 de `Coherencia-Renumeracion-AG.md` §8 no escribía la regla de reparto del bloque `009xx` con este motivo textual: *«No hay un segundo rol de nivel producto que fuerce la decisión»*. **`AG-00980` fue ese segundo rol y se acuñó en la 13.2.**

`Root-Rules.md` §12.2 lo califica sin ambigüedad: **ítem diferido cuyo evento ya ocurrió y sigue abierto → Hallazgo P1**.

La regla entra: los roles toman `009N0` **descendiendo desde `00990`**, sus subagentes de fase `009N1` a `009N9`, con la misma gramática que las categorías. El ítem queda **cerrado**.

**Y lo que la regla no resuelve queda declarado**: el bloque **se solapa con las categorías `90` a `99`** si alguna vez existieran. Sigue diferido, y **se agrava**: ahora hay dos ocupantes en vez de uno.

**Cómo pasó, que es lo instructivo.** La intervención que acuñó `AG-00980` verificó que el identificador estuviera libre y que el bloque lo admitiera. **Lo que no hizo fue preguntarse a qué ítem diferido le cumplía la condición.**

### Cambiado — `SDD-Development-Guide.md` 1.27 → 1.28

§III.11 decía que `AG-00980` «existe pero todavía no se convoca». La 13.5 lo volvió falso. Entra en su lugar el ciclo de `Master-Prompt.md` §9.1.

### Corrección de una entrada publicada

**La entrada [13.5] de este mismo archivo afirma que `SDD-User-Guide.md` 1.19 declara que `AG-00980` «existe pero todavía no se convoca».** Es falso: **la guía de usuario no menciona `AG-00980` en ninguna línea** —`grep -c` devuelve 0— y nunca lo mencionó. La afirmación sólo era cierta de la guía de desarrollo.

**La entrada anterior no se reescribe**: el `CHANGELOG.md` es acumulativo y su historia es su contenido. La corrección se declara acá, que es donde corresponde.

### Lo que se difiere, con los cuatro campos de §12.2

**§8.2 del reporte** —qué hacer cuando un archivado a `_legacy/` salió mal— **se difiere**, y la decisión se declara porque el prompt del fix pedía elegir explícitamente. Converge con un hallazgo medido en un destino **cuyo reporte todavía no existe**, y resolverlo ahora importaría esa evidencia por la puerta de atrás. Se cierra cuando ese reporte se emita, o cuando un segundo destino mida el mismo defecto.

### Por qué el conjunto sube 13.6

**Es un minor.** Se agregan obligaciones y una regla de acuñación; **ninguna regla se deroga y ningún documento generado deja de cumplir**.

### Impacto sobre destinos existentes

**Ninguno forzado por la publicación, y no es una migración.** §10.0 declara que la obligación del banco rige para las compuertas escritas **desde esta versión en adelante**; una compuerta ya escrita trae su banco en la próxima intervención que la toque y hasta entonces declara la ausencia como recorte. El precedente del alcance temporal es la conformidad D9 de la propia §10.0.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Compuerta-Con-Banco.md`, conjunto resultante **13.6**.

## [13.5] - 2026-08-23

**Se activa `AG-00980`, y con eso la capa de conocimiento queda completa.** El rol tenía contrato desde la 12.2 e identificador desde la 13.2, y **no se convocaba nunca**: faltaba la vía por la que un subagente pide. Las dos guías lo declaraban como pendiente.

**El subagente no lleva el índice encima: lleva la necesidad.** Es la decisión que ordena el resto. El aviso que viaja en el despacho es **una sola línea**, y el bloque de pedido describe **la necesidad en prosa, no el alias** — el subagente no conoce el catálogo y no tiene por qué. Con eso el costo deja de crecer con el tamaño del catálogo y pasa a crecer con la **frecuencia de faltantes**, que es lo que se quiere que tienda a cero a medida que las condiciones del índice se afinan.

### Agregado — `Master-Prompt.md` 8.12 → 8.13

**§8 suma `{{AVISO_BIBLIOTECA}}`** al esqueleto de despacho: una línea que habilita al subagente a pedir lo que sus insumos no cubran, en lugar de inventarlo o buscarlo.

**§9.1 es nueva: el pedido de conocimiento**, y es una detención **de otra clase**: no va al humano, **la resuelve el orquestador**. Recibe el bloque `PEDIDO DE CONOCIMIENTO`, despacha a AG-00980 con el índice filtrado por consumidor, resuelve a rutas los alias que devuelva, registra el pedido y la respuesta, y **reanuda con los documentos enteros y verbatim**.

**Si la respuesta viene vacía, escala por §9**, y es correcto: significa que la base no tiene lo pedido, **y eso es información** — dice qué habría que capturar.

**Tres salvaguardas.** **El orquestador entrega y AG-00980 nunca**: si el bibliotecario devolviera extractos crearía la segunda fuente que §6 punto 1 prohíbe por nombre, y una síntesis no se repite igual. **Un pedido por despacho**: el segundo es un bucle, se registra y no se atiende. Y **todo pedido es evidencia de una condición mal calibrada**, de modo que el log permite afinar el catálogo con su propio uso en lugar de con opinión.

### Cambiado — `Rules-Base-Conocimiento.md` 2.1 → 2.2

§9.3 **cita** la mecánica de `Master-Prompt.md` §9.1 en lugar de duplicarla, precisa que el pedido describe la necesidad y no el alias, y suma la salvaguarda del pedido único.

### Por qué el conjunto sube 13.5

**Es un minor.** Se agrega una capacidad y no cambia ninguna regla existente. **Con `Conocimiento/` vacía el aviso viaja vacío y §9.1 no existe para el subagente**: el despacho se arma exactamente como antes.

### Impacto sobre destinos existentes

**Ninguno.**

### Pendiente declarado

`SDD-User-Guide.md` 1.19 y `SDD-Development-Guide.md` 1.27 declaran que `AG-00980` «existe pero todavía no se convoca». **Desde esta versión sí se convoca.** Se corrige en la próxima intervención sobre guías.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Cita-De-Conocimiento.md` 1.2, §12. Conjunto resultante **13.5**.

## [13.4] - 2026-08-23

**La sustitución deja de ser una previsión y pasa a tener contra qué validarse.** `Rules-Base-Conocimiento.md` §0.4 declara desde la 12.2 que un documento puede **sustituir** una decisión de stack del framework, y hasta ahora **no había nada del otro lado**: ninguna regla rotulaba sus ítems, de modo que la sustitución no se podía comprobar.

`Maqueta-Rules.md` §4 es la primera en rotularlos, y es la que bloqueaba el caso que originó toda esta serie: el framework construye **toda** maqueta con una tecnología fija —vanilla, Bootstrap por CDN, sin build— y una casa que trabaja distinto no tenía dónde declararlo sin editar el framework.

### Cambiado — `Maqueta-Rules.md` 4.4 → 4.5

**§4 declara sus dos capas.** **§4.1, ahora «Tecnología de construcción», es decisión de stack y es sustituible**; **§4.2 a §4.7 son método y no lo son**. Cada subsección declara su capa en su primera línea, para que se lea sola.

**Ninguna regla cambia de contenido y dos cambian de subsección**, porque §4.1 llevaba dos ítems que no eran tecnología: la **autonomía sin backend** pasa a §4.2, donde define qué **es** una maqueta; la **iconografía vectorial** pasa a la nueva §4.7, porque es una regla de calidad. La equivalencia se verificó contrastando el conjunto de ítems normativos en las dos direcciones: **ninguno perdido, ninguno agregado**.

**Y se declara qué no alcanza la sustitución aunque cambie el stack**: los tokens del catálogo de diseño siguen rigiendo y todo §4.2 a §4.7 se cumple con la tecnología que sea. **Sustituir cambia el cómo, no el qué tiene que ser verdad.** Sin esa cláusula, «sustituyo §4.1» se podía leer como permiso para bajar la vara.

**§7.2 distingue el caso puntual del caso de escala.** Ya admitía apartarse del no-build por **ADR de proyecto de código**, y eso es correcto para lo que imagina —una librería que sólo se demuestra compilada, una vez— y **equivocado para una casa que construye siempre así**: produce el mismo ADR en cada proyecto, con la misma justificación, para siempre. Eso no es una excepción, es una convención disfrazada de excepción, y es el anti-patrón que `Root-Rules.md` §11 nombra. El caso de organización se declara **una sola vez** como sustitución.

**§1 suma la base de conocimiento a los insumos de `AG-00031`**, que era una lista cerrada. Sin eso, el conocimiento sobre cómo construir una página web **no llegaba al agente que la construye**.

### Cambiado — `Rules-Base-Conocimiento.md` 2.0 → 2.1

§0.3 ajusta el rango citado a §4.2 a §4.7 y nombra que el rótulo ya existe del otro lado.

### Un hallazgo de la propia verificación

La primera redacción de §4.7 puso la regla de iconografía como **prosa** en lugar de ítem de lista, y **la comprobación de equivalencia la marcó como perdida**. El contenido estaba, la forma no. Se restituyó como ítem: es la clase de defecto que una lectura no levanta y un contraste mecánico sí, y el rótulo `[enumerable]` del método depende de que las reglas sigan siendo enumerables.

### Por qué el conjunto sube 13.4

**Es un minor.** `Maqueta-Rules.md` sube minor y **ninguna maqueta que cumplía deja de cumplir**: el conjunto de exigencias sobre una maqueta generada sin base declarada es idéntico al de la 13.3.

### Impacto sobre destinos existentes

**Ninguno.**

### Pendiente declarado

**`Maqueta-Rules.md` es la única regla rotulada.** Las de 02, 05, 08 y 09 cargan la misma mezcla y siguen sin separar. No bloquea: un documento que intente sustituir un ítem de ellas no encuentra rótulo, de modo que el caso vuelve a ser conflicto y **manda la regla**, que es el comportamiento seguro por defecto.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Capas-Del-Piso.md`, conjunto resultante **13.4**.

## [13.3] - 2026-08-23

**Una intervención que agrega capacidad deja mintiendo a la documentación que describía su ausencia.** La 13.2 cerró el circuito de la cita de conocimiento y con eso volvió falsas dos afirmaciones que las guías traían de la 13.1. El barrido encontró **dos defectos más de la misma clase que nadie había declarado**.

### Cambiado — `SDD-User-Guide.md` 1.18 → 1.19

**F-23.1 decía que citar el catálogo desde el intake «todavía no está cableado».** Ya lo está. En su lugar entra el procedimiento real, en cuatro pasos: se cita el alias en `§17.P.13`, el orquestador lo resuelve al validar el intake —**y un alias que no existe es bloqueante**—, lo suma **sólo** al despacho del consumidor que el índice declara, y el subagente lo lee como un insumo más.

Se declara además lo que evita citar de más: **cada documento tiene condición de carga y lo que dispara se carga solo**, sin que el usuario tenga que saber que el catálogo existe. Y que el conocimiento es **insumo consultivo**: ante conflicto manda la regla de categoría.

**Siete ocurrencias de «bloque técnico P.1 a P.12» pasan a P.1 a P.13**, por la subsección nueva de la plantilla 3.5. **Nadie las había declarado como pendientes**: salieron del barrido.

### Cambiado — `SDD-Development-Guide.md` 1.26 → 1.27

**§III.11 decía que el orquestador «todavía no lo consume en una corrida».** En su lugar, cómo llega el documento a un despacho: por la **unión** de la condición de carga de su fila y la cita explícita del alias, con el consumidor declarado decidiendo a qué despacho va.

Y cuál de las dos vías conviene, que es lo que importa para quien extiende: **la condición es la buena**, porque se carga sola. **Si un documento se cita siempre a mano, su condición está mal calibrada.**

### Cambiado — `Marco-Teorico-SDD.md` 3.7 → 3.8

**§4.1 nombraba a `AG-00031` como el único rol que no es titular de categoría.** El razonamiento de la sección ya cubría a `AG-00980` —no altera el número de especialidades porque no es titular de ninguna—, pero **el rol no estaba nombrado**, de modo que el catálogo describía una nómina incompleta.

### Pendiente que se conserva

**`AG-00980` existe pero todavía no se convoca.** Tiene identificador y contrato; falta el aviso en el despacho que le dice al subagente que la biblioteca existe y cómo pedir. Está declarado en las dos guías, no escondido. Mientras tanto el conocimiento llega por condición y por cita, que es el camino determinista.

### Por qué el conjunto sube 13.3

**Es un minor.** Se ponen al día tres documentos de guía y no cambia ninguna regla, ninguna plantilla ni el comportamiento de ningún orquestador.

### Impacto sobre destinos existentes

**Ninguno.**

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Cita-De-Conocimiento.md` 1.1, §10. Conjunto resultante **13.3**.

## [13.2] - 2026-08-23

**El circuito de la capa de conocimiento queda cerrado.** Hasta la 13.1 el catálogo se podía **poblar** pero el orquestador **no lo consumía en una corrida**. Ahora se cita en el intake, se valida antes de la Fase A, se resuelve contra el índice y se inyecta en el despacho del consumidor que la fila declara.

**Los dos pasos se hacen juntos y es deliberado.** Agregar la subsección de intake sin la mecánica de despacho dejaría un campo que el usuario llena y que no hace nada — peor que no tenerlo, porque la plantilla prometería una capacidad inexistente.

**Todo lo agregado es aditivo y está condicionado.** Con `Conocimiento/` vacía o sin índice, los cuatro archivos se comportan exactamente como antes.

### Agregado — `PRODUCT-INTAKE-template.md` 3.4 → 3.5, `§17.P.13`

La puerta de entrada del catálogo a una corrida: una tabla de **alias**, con su motivo y su alcance, por proyecto de código. **Opcional, con `Ninguno` como valor válido.**

Declara sus cuatro reglas, y dos importan más que las otras. **Un alias que no resuelve es bloqueante.** Y **citar un conocimiento cuya condición no dispara no es un apartamiento y no lleva ADR**: la condición del índice es un disparador por defecto, no una obligación, así que citar de más amplía el conjunto sin incumplir nada — `Root-Rules.md` §11 no aplica, y su propia cláusula lo respalda.

Se agrega **al final del bloque repetible, sin renumerar** ninguna subsección existente.

### Agregado — `Master-Prompt.md` 8.11 → 8.12, dos notas en §6 y una línea en §8

La primera nota arma `{{LISTA_DOCUMENTOS_DE_CONOCIMIENTO}}` con la **unión de dos conjuntos**: las filas cuya condición de carga dispara, y las que el intake cita por alias. Cada documento se suma **únicamente** al despacho del **consumidor** que su fila declara —una categoría o un subagente de fase—, que es lo que evita que un alias citado termine inyectado en los doce despachos. El conjunto cargado y el motivo de cada documento van al log.

La segunda fija la **precedencia**: el conocimiento es insumo **consultivo**, y ante conflicto manda la regla de categoría salvo sustitución declarada sobre un ítem rotulado como decisión de stack.

**Ninguna nota operativa existente se tocó.** El catálogo de diseño de `References/Design/` se sigue resolviendo por las suyas y **no se funde** con este: uno está siempre y es normativo, el otro puede no existir y es consultivo.

### Agregado — `Root-Rules.md` 8.3 → 8.4, `AG-00980`

El bibliotecario de conocimiento, en el bloque `009xx` que la 12.0 reservó a los roles que no son de categoría. **No se acuña familia nueva**: `AG` ya existe. El identificador se verificó libre antes de acuñarlo. Su contrato vive en `Rules-Base-Conocimiento.md` §9 y esta regla lo **cita**, no lo duplica.

### Cambiado — `Intake-Rules.md` 4.1 → 4.2

§5 valida que **todo alias resuelva** contra el índice y contra una fila `Vigente`; §7 lo declara **bloqueante**. Corre en la validación previa a la Fase A y no en runtime, por el mismo criterio de costo que las demás: detectado ahí cuesta una corrección del intake, detectado en la Fase B cuesta la Fase A entera.

### Por qué el conjunto sube 13.2 y no 14.0

**Es un minor, y la plantilla de intake es la que lo decide** por `README.md`. Sube minor porque `§17.P.13` se agregó al final del bloque repetible **sin renumerar** nada: **ningún intake escrito contra la 3.4 deja de cumplir**, porque la subsección nueva es opcional y admite `Ninguno`.

### Impacto sobre destinos existentes

**Ninguno.** Un destino generado con la 13.1 no tiene trabajo: la subsección es opcional y su ausencia no bloquea. Un intake existente puede sumarla cuando quiera aplicar conocimiento.

### Pendiente declarado

`SDD-User-Guide.md` 1.18 dice, en F-23.1, que citar el catálogo desde el intake «todavía no está cableado». **Desde esta versión sí lo está**, y esa frase queda mintiendo. Se corrige en la próxima intervención sobre guías.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Cita-De-Conocimiento.md`, conjunto resultante **13.2**.

## [13.1] - 2026-08-23

**Tres versiones seguidas incorporaron la capa de conocimiento y ninguna guía la mencionaba.** El hueco estaba medido, no supuesto: antes de esta intervención, `grep -c "Rules-Base-Conocimiento\|Conocimiento/"` devolvía **0 en los cuatro documentos**. Las guías describían un framework que ya no era el publicado.

**El reparto se hizo por audiencia, y es la decisión de fondo.** Un hecho contado cuatro veces con palabras distintas es el modo de falla propio de una actualización que toca cuatro documentos a la vez. El marco teórico da el **porqué**, la guía de desarrollo el **cómo se extiende**, la de usuario el **qué es y qué se puede hacer**, y la de arranque **que existe y se puede ignorar**.

### Agregado — `SDD-Development-Guide.md` 1.25 → 1.26, §III.11

**El eje de extensión de un documento de conocimiento, y es el único de los once que no toca una sola regla.** Se agrega el documento y su fila en el índice, y con eso alcanza: ninguna regla nombra un documento de conocimiento.

Declara **la propiedad que no se puede romper** —el framework tiene que seguir funcionando con `Conocimiento/` vacía—, la ofuscación bloqueante por el mismo motivo que §III.6, las obligaciones de intervención que dispara, y que **`Conocimiento/` entra en el snapshot**. Escribe la **frontera con §III.6**: el criterio es **el origen**, no el parecido del resultado.

### Agregado — `Marco-Teorico-SDD.md` 3.6 → 3.7, §8.7.1

**El encuadre: método contra oficio.** SDD está fundado en metodologías ágiles y gestión, y su identidad es el proceso. Lo que casi no tiene, por diseño, es oficio —cómo se codea esto o aquello según la casa— y **no puede tenerlo dentro del conjunto normativo** sin dejar de servirle a la organización de al lado, que es lo que D7 protege.

### Agregado — `SDD-User-Guide.md` 1.17 → 1.18, F-23.1

Qué es `Conocimiento/` y en qué se diferencia de un modelo UX-UI, con la tabla que fija el criterio. Y **declara el estado real de cableado**: el catálogo se puede poblar, pero **citarlo desde el intake todavía no está cableado**. Se documenta lo que hay, no lo previsto: es lo que evita que alguien intente algo que no va a funcionar.

### Cambiado — tres defectos previos que los chequeos mecánicos encontraron

No tienen relación con la capa nueva y estaban desde antes:

**Dos recuentos viejos.** `SDD-Development-Guide.md` §I.2 y `SDD-User-Guide.md` §4.4 declaraban dieciocho archivos normativos y seis transversales. Son **diecinueve y siete**.

**Y uno peor: «los tres master-prompts», describiendo sólo dos.** `Master-Prompt-Reanudacion.md` existe y no figuraba en ninguna de las dos guías. Un lector que corría la verificación del árbol veía tres archivos donde la guía le describía dos — el mismo defecto que la 1.9 de la guía de usuario ya había corregido una vez al pasar de uno a dos master-prompts.

**Dos falsos positivos declarados** para que no se vuelvan a levantar: `Rules-Observabilidad.md` es un ejemplo hipotético de un recorrido de extensión, y `devs/Rules/decisiones-D1-D8.md` es una fila histórica de control de cambios.

### Por qué el conjunto sube 13.1

**Es un minor.** Se ponen al día cuatro documentos de guía y no cambia ninguna regla, ninguna plantilla ni el comportamiento de ningún orquestador. Ningún documento generado deja de cumplir.

### Impacto sobre destinos existentes

**Ninguno.** Ningún destino tiene trabajo.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Guias-Capa-Conocimiento.md`, conjunto resultante **13.1**.

## [13.0] - 2026-08-23

**La base de conocimiento se anexa al repositorio como `Conocimiento/`, y el modelo queda declarado.** El motivo es operativo y decide: `IA.SDD` es el repositorio **desde el que se lanza** el orquestador, de modo que la base tiene que viajar con lo que se clona en vez de tener que ser alcanzada. La versión anterior la ubicaba en un repositorio externo declarado en el intake.

**El desacoplamiento no se pierde: se declara mejor.** No era privacidad ni ubicación. Es que **el framework corre con la carpeta vacía y su comportamiento base no cambia cuando se llena**, porque ninguna regla nombra un documento de conocimiento y lo único que el framework fija es el contrato del índice. **El mecanismo de extensión es el fork**: quien quiera su base forkea, agrega sus documentos y se lleva el método intacto.

**Es la propiedad a preservar en todo cambio posterior.** Si algún día el framework deja de funcionar con `Conocimiento/` vacía, la capacidad dejó de ser una extensión y pasó a ser parte del método.

### Agregado — `Conocimiento/`

La carpeta, su `README.md` 1.0, su `Index-Knowledge.md` 1.0 y el primer documento del catálogo, `Clean-Architecture-DataManager`: una variante de Clean Architecture con capa de datos por DataManager sobre ADO.NET, sin ORM. Es `canonico`, de modo que **escribe el delta y no reexplica el canon**, y declara su desviación —los puertos del dominio llevan nombre de tabla— en lugar de disimularla, que es por lo que su alias no es `Clean-Architecture` a secas.

### Cambiado — `Rules-Base-Conocimiento.md` 1.1 → 2.0

**Tres inversiones**, las tres derivadas de que la carpeta ahora vive acá.

**Una captura es una intervención sobre el framework.** Escribe en su repositorio, así que lleva entrada en el `CHANGELOG.md`, copia del conjunto superado a `_legacy/` y nota de coherencia si alcanza a varios archivos. La 1.1 decía lo contrario.

**`Conocimiento/` entra en el snapshot.** Por el criterio de `SDD-Development-Guide.md` §VI.5 —sólo se excluye lo que **no condiciona lo que el orquestador genera**— y con el precedente exacto de `Templates/`. `Examples/` no servía de analogía. La consecuencia es la que importa: un destino que declara con qué versión del framework se generó **ya declara con qué conocimiento se generó**.

**La compuerta de ofuscación corre y es bloqueante**, porque el repositorio es público. Es la misma condición de `Index-Modelos-UX-UI.md` §4. §6.1 suma su ítem y la lista pasa de trece a **catorce**; §3.2 vuelve **obligación** el nombre agnóstico del dominio, que era recomendación.

**Y una simplificación grande**: el intake **no declara ninguna raíz ni ninguna versión de base**. Cita alias, y nada más.

### Cambiado — `README.md` y `Coherencia-Base-Conocimiento.md` 1.1 → 1.2

La anatomía del repositorio suma la fila de `Conocimiento/`, declarada como carpeta anexa que **no es parte del conjunto normativo**. La nota de coherencia suma §9 con las tres inversiones y la verificación de ofuscación del primer documento, **que encontró dos nombres de entidad del proyecto de origen y los corrigió**. La compuerta no es ceremonia: encontró material real en su primera corrida.

### Por qué el conjunto sube 13.0 y no 12.4

**Es un major.** `Rules-Base-Conocimiento.md` sube major porque **un documento escrito contra la 1.1 deja de cumplir**: vivía fuera del repositorio, no pasaba por ofuscación y dependía de una raíz declarada en el intake que ya no existe. Es el criterio sustantivo de §VI.1, y no importa que el corpus alcanzado sea de un solo documento.

### Impacto sobre destinos existentes

**Ninguno.** Sigue sin haber orquestador que lea la regla: el andamiaje de intake y la mecánica de despacho son pasos posteriores del plan. Ningún destino tiene trabajo.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Base-Conocimiento.md` 1.2, §9. Conjunto resultante **13.0**.

## [12.3] - 2026-08-23

**El primer documento escrito contra `Rules-Base-Conocimiento.md` encontró cuatro defectos en la regla, y ese era el trabajo del piloto.** El plan lo pone como **compuerta entre bloques**: si el archivo de reglas no alcanza para caracterizar un artefacto externo, se corrige **antes** de tocar el intake, que es la parte cara.

**Los cuatro son del mismo tipo, y conviene nombrarlo**: la regla se escribió mirando el documento y el índice **por separado**, y los defectos viven en la costura entre los dos. Ninguno se habría visto releyendo el archivo.

### Cambiado — `Rules-Base-Conocimiento.md` 1.0 → 1.1

**§4.1 suma el campo `Tema`.** El índice lo exigía como columna y la cabecera no lo tenía: un documento podía cumplir §4.1 entero y **aun así no poder completar su fila**. Pasa de diez campos a **once**.

**§4.1 adopta literalmente los nombres de columna del índice** —`Condicion-de-carga`, `Hereda-de`, `Sustituye`, `Compatible-con`—. Estaban escritos de dos formas distintas en los dos lugares, y una comprobación campo por campo sobre nombres que no coinciden **se resuelve por interpretación**, que es lo que un criterio `[enumerable]` existe para evitar.

**§6.1 reformula el ítem de coincidencia con el índice, que era inverificable.** Decía «sus campos coinciden con la cabecera»; no todos los campos de la cabecera viajan al índice ni todas las columnas tienen campo. Ahora nombra los **ocho comunes**, y §7.1 declara la correspondencia del otro lado.

**§6.1 suma el ítem de numeración interna contigua.** El piloto escribió una `§4.3` sin `§4.1` ni `§4.2`, y **los doce ítems de la lista la dieron por buena**. Una sección con una sola subsección la lleva sin numerar. La lista pasa de doce ítems a **trece**.

### Por qué el conjunto sube 12.3

**Es un minor** por la tabla de §VI.5: `Rules-Base-Conocimiento.md` sube minor y ninguna otra regla se toca. **Ningún documento generado deja de cumplir**, porque la regla sigue sin alcanzar a nada que el framework genere hoy.

### Impacto sobre destinos existentes

**Ninguno.** Sigue sin haber orquestador que lea la regla. El único documento escrito contra la 1.0 vive en una base de conocimiento fuera de este repositorio y se alineó a la 1.1 en la misma jornada.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Base-Conocimiento.md` 1.1, §8. Conjunto resultante **12.3**.

## [12.2] - 2026-08-23

**El framework tiene método y casi no tiene oficio, y eso es una decisión de diseño, no una carencia.** Su identidad son las metodologías ágiles y la gestión: cómo se especifica, cómo se descompone, cómo se audita, cómo se planifica. **No puede opinar sobre cómo estructurar la capa de datos de una casa sin dejar de servirle a la de al lado.** Lo que faltaba no era el oficio: era **dónde lo pone quien lo tiene**.

**Esta versión incorpora el continente y ni un solo documento de conocimiento.** `Rules-Base-Conocimiento.md` regula el formato de un documento de conocimiento y el contrato del índice que lo cataloga. Los documentos viven en una **base de la organización**, fuera de este repositorio, que el intake declara. El catálogo del framework **arranca y se queda vacío**: es una interfaz, no una biblioteca.

**Nadie la consume todavía, y es intencional.** Ningún orquestador la lee y ninguna otra regla la cita. El andamiaje de intake, la mecánica del orquestador, el alta de `AG-00980` en `Root-Rules.md` §9.2 y la separación de capas de `Maqueta-Rules.md` §4 son pasos posteriores del plan. **Emitir la norma antes que sus consumidores es lo que permite corregirla mientras corregirla todavía es barato.**

### Agregado — `Rules-Base-Conocimiento.md` 1.0

**El decimonoveno archivo de reglas, y el primero transversal que gobierna un artefacto que no vive acá.**

**§0 fija la frontera**, que es lo que decide si la capacidad sirve o degenera. Un documento de conocimiento **describe un artefacto externo, no el método**: cómo está construido un template y cómo declara sus variables, qué nomenclatura sigue un esquema de datos, qué forma tiene una arquitectura concreta. Qué produce una categoría y con qué criterios se acepta **sigue viviendo en las reglas y no se toca desde afuera**.

**El piso mínimo del framework se conserva entero y se declara en dos capas.** El **método** —los cuatro estados por superficie, WCAG 2.2 AA, la fuente única de datos de `Maqueta-Rules.md` §4.2 a §4.6— **no se desplaza**. La **decisión de stack** —vanilla, Bootstrap por CDN, sin build, de §4.1 y §7.2— es una elección legítima entre alternativas legítimas y **sí se sustituye**, declarándolo. De ahí los **tres modos de aportar**: sumar, especializar y **sustituir**.

**La sustitución la habilita el framework por adelantado, no el que escribe el conocimiento.** Un ítem sólo es sustituible si la regla que lo contiene lo rotuló como decisión de stack. Sin rótulo, el caso vuelve a ser conflicto y **manda la regla de categoría**. Esa subordinación existe además por un motivo mecánico: ni el documento de conocimiento ni la regla de categoría viajan en los insumos obligatorios de todo despacho, de modo que `Root-Rules.md` §13 **no decidiría y el conflicto se detendría**.

El resto: el **alias citable** con sus tres reglas —nombre establecido cuando existe, unicidad en el índice de su base, honestidad del nombre frente al canon— y su regla de colisión con el catálogo del framework (§3); la plantilla del documento §0 a §10 y las **siete propiedades de forma** (§4); las **veinte preguntas guía** del relevamiento, con las cuatro de orientación como bloqueantes (§5); los criterios de aceptación con **techo de tamaño diferenciado**, 250 líneas para `canonico` y 600 para `propio` (§6); las **diez columnas del índice**, ocho obligatorias, incluido `sustituye` y un consumidor que **admite subagentes de fase** y no sólo categorías (§7); el prompt-snippet citable (§8); y el contrato de **`AG-00980`**, el bibliotecario que **entrega identificadores y nunca texto** (§9).

**Por qué el conocimiento canónico escribe el delta.** `README.md` ya manda que «los estándares de industria **se nombran, no se enlazan**». Acá aplica igual: se nombran, no se reexplican. Un documento que reexplica el patrón DAO es exactamente el desperdicio que la capacidad existe para evitar.

### Cambiado — `Catalogo-De-Criterios.md` 1.12 → 1.13

Entra la regla nueva por la comprobación 12 de `SDD-Development-Guide.md` §VI.3 —**quien toca, registra**—. §3 suma **cuatro criterios**; §4 suma su fila de **6 situaciones** y los totales pasan de **202 a 208**, `[enumerable]` de 97 a 100 e `[interpretativo]` de 105 a 108. Es la primera intervención que mueve ese recuento desde que el catálogo se emitió.

### Cambiado — recuentos en prosa

`README.md` en dos lugares y `SDD-Development-Guide.md` §VI: los archivos de reglas pasan de **dieciocho a diecinueve**, y los transversales de seis a siete.

### Por qué el conjunto sube 12.2

**Es un minor** por la tabla de §VI.5: se incorpora una regla nueva y **ninguna sube major**. Ningún documento generado con la 12.1 deja de cumplir, porque la regla nueva **no alcanza a nada que el framework genere hoy**.

### Impacto sobre destinos existentes

**Ninguno.** No hay renombres, no hay secciones movidas, no hay campos bloqueantes nuevos y no hay ningún orquestador que lea la regla nueva. Ningún destino tiene trabajo.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Base-Conocimiento.md`, conjunto resultante **12.2**.

## [12.1] - 2026-08-23

**El framework no lleva código ejecutable desde su origen, y ninguna sección lo declaraba.** `find SDD -type f -not -name '*.md'` devuelve vacío en las **cuarenta y siete** versiones publicadas: es un hecho del árbol, sostenido por cada decisión de diseño que el método tomó. Lo que faltaba era la regla. **Un agente que propusiera un verificador, un resolvedor de referencias o un barrido que corriera solo no tenía con qué cita detenerse**, y quien lo rechazara no tenía con qué sostener el rechazo — que es la misma figura que esta serie viene corrigiendo: una decisión que gobierna el corpus y no tiene dónde citarse.

**El fundamento ya estaba escrito en dos lugares y en ninguno como norma.** `Migracion-Rules.md` §3 rechazó los playbooks por salto de versión —*«una duplicación que hay que mantener en paralelo se desincroniza»*— y un verificador que reimplementa las condiciones de las reglas **es** esa duplicación, con el agravante de que decide con autoridad de máquina. Y el reporte `12` de `IA.SDD.Documentacion`, que planteó la pregunta, **arma el caso en contra citando al propio framework**.

### Agregado — `SDD-Development-Guide.md` 1.24 → 1.25, §II.7

**El séptimo contrato interno: el conjunto normativo es Markdown y nada más.** Se versiona por intervención, se archiva en `_legacy/` y **se audita leyendo**.

**Declara la frontera, que es lo que hacía falta y no existía.** Una intervención **publica comandos dentro de su texto** —el barrido de §VI.3.2 es el caso— y **eso no es código distribuido**: no se versiona aparte, no se instala, y **no puede desincronizarse de la regla porque vive en el mismo documento que la regla**. Un artefacto ejecutable con versión propia, no.

**Y declara qué la reabriría**, que no es una preferencia sino **cuatro mediciones** que el reporte `12` enumera y que nadie contestó: cuántos anti-patrones `[enumerable]` son evaluables sin leer prosa, si un verificador puede **derivar** sus reglas del texto en vez de codificarlas, cuánto cuesta mantenerlo, y dónde viviría.

La **Parte V** suma el anti-patrón correspondiente con su detección: `find SDD -type f -not -name '*.md'` devuelve vacío.

### Cambiado — `Catalogo-De-Criterios.md` 1.11 → 1.12

Entra la fila que indexa el criterio nuevo, por la comprobación 12 de §VI.3 —**quien toca, registra**—: un agente que se choque con la necesidad de un mecanismo ejecutable llega a §II.7 sin haber leído las diecinueve reglas.

### Por qué el conjunto sube 12.1 y no 13.0

**Es un patch de conjunto** por la tabla de §VI.5 —*«no cambia ninguna regla ni plantilla, ni el comportamiento de ningún orquestador»*—: §II.7 declara lo que el corpus ya cumplía y **ningún documento generado deja de cumplir**. Se publica como **12.1** porque el formato `X.Y` no puede expresar patch, y se declara acá para que el número no se lea como un minor que incorpora algo nuevo.

### Impacto sobre destinos existentes

**Ninguno.** No hay renombres, no hay secciones movidas y no hay campos bloqueantes nuevos: la sección gobierna **de qué está hecho el framework**, no lo que el framework genera. Ningún destino tiene trabajo.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Sin-Codigo-Ejecutable.md`, conjunto resultante **12.1**.

## [12.0] - 2026-08-23

**La familia `AG` nunca cumplió el ancho de cinco dígitos que `Root-Rules.md` §9.2 exige, y estaba excluida con motivo escrito**: *«no cataloga un elemento de una colección de un producto»*. El motivo era correcto y dejaba una consecuencia sin nombrar — **el framework no tenía forma de nombrarse a sí mismo**, y sus roles se citaban con una forma que su propia regla prohíbe.

**Esta versión la hace cumplir y recién entonces la declara alcanzada.** Ese orden es el objeto de la intervención: **dos intentos anteriores sobre el mismo objeto se retiraron tras cinco rondas de auditoría** por hacerlo al revés — declarar la regla aplicable sin producir el mapeo que la hace cumplible, con lo cual el corpus pasaba a incumplirse a sí mismo en cientos de lugares el mismo día.

**Rige hacia adelante** (`SDD-Development-Guide.md` §III.7 paso 3): **ningún documento emitido se reaudita** por esta versión. Eso responde al paso 3 —hacia adelante o retroactivamente— y **no es la opción 3 de §VI.4**: no se congela nada.

**La opción de §VI.4 es la 1, regeneración parcial**, reducida a su mínimo: **una cita, en un archivo**. `Migracion-Rules.md` §4.3.1 declara que **una migración de destino no renumera la familia** —la renumera el framework— y que el destino **sólo reemplaza la cita en su mapa de documentación**. El destino actúa **cuando corre la migración normativa del salto**, que es el momento que ese árbol ya fija; no hay un momento nuevo que aprender.

**Modifica la invariante `D3`**, con los cinco pasos de §III.7 cumplidos y el **paso 1 —decisión explícita del responsable del framework— tomada el 2026-08-23**. D3 pasa de *«son únicos en el producto»* a *«son **únicos en su ámbito declarado**»*, con los dos ámbitos de §9.1 que **no colisionan en numeración** y **sí se citan a través de la frontera**. Es lo que habilita que el framework se nombre a sí mismo sin invadir el espacio del producto. El impacto sobre lo ya emitido es el del bloque de más abajo: **ningún nombre de archivo cambia** —D3 gobierna también los nombres, y ese tramo de D3 queda intacto—, y lo único alcanzado es la **cita del rol** en el mapa de documentación.

### Cambiado — `Root-Rules.md` 7.1 → 8.3, §9.1, §9.2, §9.5 y §10

**§9.1 declara dos ámbitos** —el **producto** y el **conjunto normativo vigente**— y **cómo se relacionan**: **no colisionan en numeración**, y **sí se citan a través de la frontera**. Un artefacto del destino nombra roles del framework en su mapa de documentación, y **esa cita sólo resuelve si el identificador está bien formado**, que es lo que §10 **R5** exige. **Que se lo cite desde afuera es el motivo del ámbito propio, no un argumento en contra.** `_legacy/` queda fuera del espacio de candidatos de los dos.

**§9.2 enumera `AG` entre las familias alcanzadas** —cuando ya cumple el ancho, no antes— y **declara su titularidad y sus bloques** en tabla propia, para que no vivan sólo en la nota de la intervención que los creó. **§10 R5** pasa de «único en el producto» a «único en su ámbito».

**Su tabla de exclusiones suma tres familias vivas que estaban sin clasificar**, y §9.5 exige que toda familia lo esté: `FA-NN`, el flujo alternativo; **`CA-NN`**, el criterio de aceptación, **gemelo de `FA-NN`** —misma regla, tablas contiguas, y el motivo escrito para una le aplica a la otra sin cambiar una palabra—; y **`PASO-N`**, un ordinal de secuencia. Las tres son **posiciones dentro de un documento** y no catalogan elementos de una colección.

**§9.5 pasa a contener la obligación que §9.2 le atribuía.** §9.2 fundaba su tabla de exclusiones diciendo *«§9.5 exige que toda familia viva quede clasificada»*, y §9.5 sólo exigía —a **toda categoría que acuñe un identificador**— declarar prefijo, forma y ámbito. **La obligación no estaba escrita en ninguna parte**, y por ese hueco pasaron `FA-NN`, `CA-NN` y `PASO-N` durante versiones. Se escribe donde se la invoca, en lugar de corregir la cita: sin ella, ninguna regla obliga a clasificar la próxima familia viva.

**`SDD-Development-Guide.md` 1.23 → 1.24** en el mismo salto: §VI.3.2 sube **tres piezas de método** que vivían sólo en la nota —la octava clase estable «entradas publicadas del `CHANGELOG.md`», la corrida que detecta que el reemplazo alteró una línea de clase estable, y el orden de reemplazo específico→general—. Las tres nacieron del peor daño medido de esta intervención: **52 filas fechadas reescritas** que los comandos declarados no podían ver porque descartaban esas líneas antes de clasificarlas.

**Y el enunciado de §9.1 queda acotado a lo que §9.2 cubre.** Decía «los roles del framework» mientras la familia alcanza a los del **catálogo de especialidades** y a los **subagentes de fase**: **el orquestador y el auditor quedaban prometidos y no cubiertos**. Que tomen identificador propio es un ítem diferido, no una omisión de esta versión.

**§9.2 declara además el marcador de plantilla `<PREFIJO>-XXXXX`** —`US-XXXXX`, `NB-XXXXX`, `AG-XXXXX`—, que el corpus ya usaba **sin que ninguna regla lo escribiera**. **No es un identificador y no se le exige la forma.** La `8.1` lo agrega junto con quitarle a `FA-NN` la atribución de ámbito, que contradecía a §9.1: **una familia excluida no toma ninguno de los dos**.

**`Migracion-Rules.md` 3.15 → 3.19** en el mismo salto: su §4.3.1 declara que la renumeración de una familia del conjunto normativo **la hace el framework y no el destino**, y acota el trabajo del destino a reemplazar la cita.

### Cambiado — la familia `AG`

**El mapeo se escribió y se evaluó con cinco pruebas antes de tocar un archivo**: total, inyectivo, sin colisión, conforme al ancho, y preserva significado.

**Las cuatro clases, con el mapeo completo en el bloque de impacto de más abajo:** titulares de categoría a `AG-00NN0`; el titular de nivel producto a **`AG-00990`**, en bloque reservado; el subagente de fase a **`AG-00031`**, con **la hermandad con el `03` escrita en el número** en lugar de en un sufijo compuesto que §9.2 prohíbe; y el marcador de plantilla a `AG-XXXXX`, que **se reescribe, no se renumera**.

El orden de reemplazo va de más específico a más general: al revés, `AG-03` habría convertido `AG-03M` en `AG-00030M`, **la forma compuesta que este tramo elimina**.

### Impacto sobre destinos existentes

**Renombres de artefacto**

| Nombre anterior | Nombre vigente | Naturaleza |
| --- | --- | --- |
| `AG-00` | `AG-00000` | identificador |
| `AG-01` | `AG-00010` | identificador |
| `AG-02` | `AG-00020` | identificador |
| `AG-03` | `AG-00030` | identificador |
| `AG-03M` | `AG-00031` | identificador |
| `AG-04` | `AG-00040` | identificador |
| `AG-05` | `AG-00050` | identificador |
| `AG-06` | `AG-00060` | identificador |
| `AG-07` | `AG-00070` | identificador |
| `AG-08` | `AG-00080` | identificador |
| `AG-09` | `AG-00090` | identificador |
| `AG-10` | `AG-00100` | identificador |
| `AG-11` | `AG-00110` | identificador |
| `AG-ROOT` | `AG-00990` | identificador |

**Ningún archivo ni carpeta cambió de nombre.** Los **catorce** renombres son de **identificador** —una de las cuatro naturalezas que §VI.4 declara— y **son el mapeo completo de la familia**: se lee al derecho para migrar y al revés para reconocer un destino con la forma vieja.

**Dos reescrituras de marcador, que no van en esta tabla y por eso se declaran acá.** `AG-XX → AG-XXXXX` y `RB-XX → RB-XXXXX` **no son renombres de identificador**: §9.2 dice del marcador de plantilla que **«no es un identificador y no se le exige la forma»**, y §VI.4 admite cuatro naturalezas —archivo, carpeta, identificador, campo— entre las que no hay ninguna que le corresponda. Meterlas en la tabla las declararía identidad, que es exactamente lo que esta versión niega. **Un destino no tiene trabajo por ellas**: un marcador es el hueco que un documento deja para el identificador que sí lo es, y no viaja a ningún artefacto emitido. `RB` queda alcanzado por el «y equivalentes» de §9.2 —un runbook cataloga elementos de una colección del producto—, así que **la forma nueva es la aplicación de la regla del marcador a una segunda familia**, y se registra por eso.

**Secciones movidas o partidas**

| Documento | Sección anterior | Destino vigente |
| --- | --- | --- |
| — | — | **Vacía.** Ninguna sección se movió ni se partió |

**Campos bloqueantes nuevos**

| Documento | Campo | Regla que lo exige |
| --- | --- | --- |
| `SDD/Docs/README.md` del destino | El identificador del rol en la columna **Responsable** de su mapa de documentación, **con la forma nueva** | `Root-Rules.md` **§4.4**, que obliga la Tabla A y su columna, y **§4.5**, que la exige con un anti-patrón `[enumerable]`. La **forma** del identificador la fija §9.2 |

**Por qué la regla que lo exige es §4.4 y no §9.2.** §9 declara de sí misma, en `Root-Rules.md`, que *«esta sección y las que siguen hasta §13 **no gobiernan el README raíz**: gobiernan a todas las categorías»*. Fundar en §9.2 una obligación **sobre ese archivo** dejaba al destino con dos textos del mismo documento contradiciéndose sobre si tenía trabajo, y sin criterio para desempatar. **§4.4 sí lo gobierna**, y §9.2 aporta lo que le corresponde: la forma.

**Qué verifica la compuerta, y qué no.** La comprobación 4 de `Master-Prompt.md` §10.0 verifica **forma y ancho** —que es lo que este campo declara—, y **no verifica existencia**: un identificador bien formado que no corresponda a ningún rol del catálogo la pasa. Resolver la cita contra el padrón de roles exigiría que el padrón viaje al despacho, y **eso no entra en esta versión**: queda declarado acá para que nadie lea en la compuerta una garantía que no da.

**Qué migración obliga, y a quién.** **Alcanza a todo destino conforme, y no a un subconjunto.** `Root-Rules.md` **§4.4** dice que *«el documento **debe** usar las siguientes tablas estandarizadas»*, y la **Tabla A** —el mapa de documentación— declara el encabezado `| Sección | Propósito | Responsable | Enlace |`. **§4.5** lo refuerza con un anti-patrón marcado `[enumerable]`: *«README sin tabla de unidades de entrega ni enlaces… Incluir la tabla de unidades de entrega **y la Tabla A**»*. **La columna «Responsable» es obligatoria**: un destino que no la tenga no está conforme por un motivo anterior a esta versión, y no por eso queda exento.

**El trabajo correctivo es el mismo para todos y es mínimo:** reemplazar la cita del rol por su forma nueva, con el mapeo de arriba, que **se lee al revés sin ambigüedad**. **Una sustitución mecánica, en un solo archivo** — y el archivo es uno **por producto**, no por unidad de entrega: `Root-Rules.md` §1.2 declara que **el README raíz se genera una vez a nivel producto**.

**Y lo que el plan de migración va a calcular es otra cosa, así que se declara acá.** `Migracion-Rules.md` §4.3 dice que *«la severidad se lee de la propia numeración de las versiones, no se infiere del contenido»*. Esta versión mueve **treinta y un archivos a minor y uno a major** —`Root-Rules.md`, 7.1 → 8.2—, de modo que el plan clasificará el `README.md` raíz como **Regenerar contenido** y los documentos de las categorías alcanzadas como **Revisar**. **Eso no contradice el párrafo anterior: son dos cosas distintas.** «Revisar» es *«se verifica el documento contra la normativa vigente y **se corrige solo lo que no cumple**»*, y lo único que no cumple es la cita del rol. **El costo de planificación es el del salto; el costo correctivo es una celda.** Se declara para que el destino no lea un número en la entrada y encuentre otro en su plan.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Renumeracion-AG.md`, conjunto resultante **12.0**. **Su §8 enumera seis ítems diferidos con los cuatro campos que `Root-Rules.md` §12.2 obliga** —qué falta, por qué no hoy, quién lo cierra, y en qué evento nombrando artefacto y sección—, entre ellos **`F-NN` sin clasificar** y **el padrón de `AG` sin las columnas que §9.3 presupone**. Y su §7 registra el hallazgo que cerró el ciclo: **el paso 1 de `SDD-Development-Guide.md` §III.7 —la decisión explícita del responsable— estuvo abierto durante nueve rondas** sin que ninguna lo mirara, porque la intervención citaba de esa lista los pasos 3 y 5 y nunca el 1. **Su barrido publica cinco corridas con su residuo declarado caja por caja** —no «cero»: §VI.3.2 pide que toda ocurrencia caiga en una exclusión enumerada, no que el comando salga vacío—, con el mismo alcance en las **cinco**, **incluido este archivo**, porque el único lugar donde nadie mira es lo que la intervención acaba de escribir, y declara una corrección del propio alcance: la primera pasada **dejó afuera dos carpetas normativas** que el orquestador inyecta, y **lo detectó el barrido, no una auditoría posterior**.

## [11.2] - 2026-08-20

**El corpus no declaraba ningún criterio para resolver un conflicto entre dos reglas, y eso hacía que todos cayeran del lado de la detención sin que nadie lo hubiera decidido.** `Master-Prompt.md` §8.1 declara que algo es **trabajo propio** cuando *«se contesta **abriendo los documentos** y contrastando, y la respuesta se puede sostener con una **cita literal**»*. Un conflicto entre dos reglas **no tenía con qué citarse**: no había criterio. El agente no podía sostener ninguna resolución y escalaba — **no por decisión, por falta de cita**.

**Medido:** en la 11.0, `Rules-Prompts-AI.md` §4.2 punto 9 contra `Root-Rules.md` §12.2 se resolvió a favor de §12.2 **sin nombrar el criterio**: §12.2 viaja en la lista de insumos de todo despacho y `Rules-Prompts-AI.md` no viaja. La resolución fue correcta y **no era sostenible con cita**.

### Agregado — `Root-Rules.md` 7.0 → 7.1, §13

**Precedencia entre reglas, con alcance transversal y un solo criterio:**

> **Una regla que viaja en la lista de insumos obligatorios de todo despacho (§8) desplaza a una que no viaja, cuando las dos alcanzan al mismo ítem.**

**El test se contesta abriendo §8 y mirando la lista.** No dice «transversal» ni «nivel» ni «rango»: las tres son palabras que el corpus ya usa con otro referente. Dice **viaja o no viaja**, que es un hecho del árbol. **Si no decide —las dos viajan, o ninguna— el conflicto se detiene** por §7.0.

**§8.1 corre antes y no se repite en §13.** Lo que requiere intención de producto ya lo detuvo la pregunta previa; §13 sólo alcanza a lo que esa pregunta dejó del lado del trabajo propio.

**Se evaluaron dos criterios más y se descartaron con motivo declarado.** La **especificidad** favorece sistemáticamente a la regla más angosta, incluso cuando la angosta es la desactualizada —verificado sobre un conflicto real, hacía ganar al texto que §13 derogaba—. La **fecha** no se puede contestar: un control de cambios tiene una fecha por **versión del archivo**, no por sección. Ninguno de los dos tenía caso medido, y el único que el corpus registra lo cierra el criterio de despacho solo.

Quien la aplica **escribe las dos reglas con su sección y cuál desplaza a cuál**, y `Master-Prompt.md` §10 suma el criterio que lo verifica. **Lo que §13 no declara y dice en lugar de callarse:** no fija un artefacto donde la resolución quede escrita, de modo que el criterio alcanza a las resoluciones **que se escriben**. Queda como ítem diferido.

**No deroga nada.** Le da al agente **la cita que §8.1 ya le exigía**, para la clase de conflicto que §8.1 ya había declarado suya. El control de cambios pasa a §14; verificado que **ninguna cita a §13 existía** en el árbol vivo.

### Cambiado — `Catalogo-De-Criterios.md` 1.9 → 1.10, §4.1

El punto 2 se refina: **antes de escalar, se prueba si la diferencia es de forma**. Si lo es, la resuelve el agente con §13; si no, sigue siendo arbitraje. Y entra el criterio nuevo en §3.

### Cambiado — `Master-Prompt.md` 8.9 → 8.10

**§13 entra en la lista de insumos obligatorios de todo despacho, en los cuatro lugares que la construyen**: §8 —la enumeración de insumos y la regla que declara cuántas secciones transversales viajan, que pasa de **cuatro a cinco**— y §10 —el despacho del auditor y su glosa—. §8 declara el motivo: *«una regla que las reglas de categoría citan y que no llega al despacho no la lee nadie»*, y **la precedencia la aplica el subagente que se choca con las dos reglas**.

### Corregido — `SDD-Development-Guide.md` 1.21 → 1.22

El frontmatter declaraba `version: 1.10` contra `**Versión:** 1.21`: **la comprobación 10 incumplida en el archivo que la define**. Se elimina el campo duplicado en lugar de actualizarlo, por **R1** —preferir la forma que no cuenta—.

### Cómo se cerró esta entrada

**Tres rondas de auditoría independiente, tres `RECHAZADO`.** La primera levantó dos **P0**: §13 se había agregado sólo al despacho **del auditor** mientras §8 —que construye el despacho del subagente que genera— seguía cerrando en §12, y `_legacy/11.1/` archivaba un estado que nunca fue 11.1. Los dos cerrados y verificados mecánicamente por la segunda ronda.

**La segunda y la tercera midieron lo mismo: la sección no se sostenía con tres criterios.** La frontera entre «forma» e «intención» pasó de mandar **todo** al arbitraje a no detener **nada**; la especificidad hacía que §13 perdiera contra su propia versión derogada; la fecha no se podía contestar. **Se redujo a un criterio**, que es el que tiene el caso medido, y los otros dos quedan descartados con su motivo escrito en la propia sección.

**El defecto que las tres rondas comparten está registrado acá porque vuelve a ser el mismo:** cada reemisión **barrió los patrones heredados y no barrió los que ella misma derogaba**, dejando su propio texto contradiciendo al vigente. Es la figura que §VI.3.2 documenta desde la 1.15 y la regla 4 de esa sección —*barrer también sobre el texto propio*— la que no se aplicó.


## [11.1] - 2026-08-20

**Las doce comprobaciones miran el árbol que quedó, y el trabajo que falta no está en ningún archivo tocado.** Una intervención que nace de un encargo puede **contestar menos de lo que el encargo pedía y declararlo resuelto igual**, con la lista de verificación entera en verde: lo que quedó escrito es coherente, está registrado y no se contradice — sólo que **es menos de lo que se pidió**, y eso no vive adentro del repositorio.

**Medido, y sobre el propio framework.** La intervención que publicó la **10.0** declaró resuelto un origen de **cinco criterios de aceptación** con **uno sin auditar**: el que pedía barrer la clase entera y no el caso que la originó. Las doce pasaron, la nota dio CONFORME, y el registro quedó diciendo «resuelto». Lo levantó una verificación posterior, dos versiones después, y para entonces el criterio incumplido había obligado a un **major**.

### Agregado — `SDD-Development-Guide.md` 1.20 → 1.21, §VI.3

**Comprobación 13, devolución al origen.** Cuando la intervención declara un origen, la nota **enumera los criterios de aceptación que ese origen fija** y declara **uno por uno cuál quedó cumplido y cuál no**. Ningún origen se declara resuelto con un criterio sin contestar.

**Está enunciada sobre la propiedad y no sobre el caso**, como la Parte IV exige desde la 1.19: no dice «el reporte», dice **el origen** —un reporte, un incidente, un pedido—, porque lo que produce el defecto no es de qué tipo es el encargo sino que **su criterio de aceptación viva afuera del árbol que la intervención verifica**.

**Y no nombra ese afuera, a propósito.** La comprobación **2** exige autosuficiencia —cero referencias fuera de este repositorio— y una comprobación que citara dónde vive el origen la rompería. Lo que se exige es que la nota **traiga los criterios adentro**, transcritos y con veredicto: **un criterio que nadie transcribió no se puede contestar**, y ésa es exactamente la forma en que el defecto se produce.

**Lo que no compra, declarado en la nota.** Obliga a declarar el veredicto; **no obliga a que sea verdadero**. Es la limitación que la comprobación 12 ya declara de sí misma, y se acepta por el mismo motivo: un criterio contestado con un «no» es visible, y uno que nadie enumeró no lo es.

### Cambiado — `Catalogo-De-Criterios.md` 1.8 → 1.9

El criterio nuevo —qué se le devuelve al origen y cuándo se lo puede declarar resuelto— y la fila de verificación de una intervención, que pasa de **doce** a **trece** comprobaciones.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Devolucion-Al-Origen.md`, conjunto resultante **11.1**. **Aplica la comprobación 13 a sí misma**, que es la primera prueba de que se puede correr: transcribe los cinco criterios del origen y los contesta, incluido el que la 10.0 dejó abierto y la 11.0 cerró.

## [11.0] - 2026-08-20

**La 10.0 corrigió el ítem empaquetado que su incidente medía y no corrió la auditoría que el reporte pedía sobre la clase.** `Reportes/14` §7 lo pide literal —«ningún ítem obligatorio de una §4.x empaqueta dos decisiones cuando una sola puede estar bloqueada: **se audita una vez sobre las quince reglas**»— y ni la entrada 10.0 ni su nota de coherencia la mencionan. Corrida ahora: **cinco ítems**, cuatro de ellos en la misma regla, todos con la mecánica que produjo el incidente —**una decisión que puede estar bloqueada arrastrando a otra que no lo está**—. Origen: `Reportes/14` §7 criterio 4.

### Cambiado — `Rules-Devops.md` 5.0 → 6.0

**Cuatro ítems se parten, y los cuatro repiten la forma del punto 3 que la 10.0 corrigió.**

| Ítem | Qué estaba bloqueado | Qué no lo estaba y viajaba pegado |
| --- | --- | --- |
| §4.3 punto 5 · Canales | Qué canales tiene el producto | La **semántica de sufijos** `-alpha`, `-beta`, `-rc`, escrita literal en la propia regla |
| §4.4 punto 2 · Provisión (IaC) | La herramienta, y con ella el layout y la política de state | La **aprobación de `plan` antes de `apply`**, política de proceso que la regla enuncia en términos neutros y que vale para las cuatro herramientas que nombra |
| §4.6 punto 1 · SBOM | El **generador**, único de los cuatro campos que puede depender del runtime | El formato, el formato de salida, la publicación adjunta al release y la firma |
| §4.6 punto 5 · SAST y DAST | **DAST**, que necesita un ambiente desplegado y §4.4 declara aparte | **SAST**, que corre sobre el código y no espera a nada |

Cada ítem nuevo declara que, si no se puede fijar hoy, **se difiere con la forma de `Root-Rules.md` §12.2** y no con una promesa.

### Cambiado — `Rules-Backlog-Tecnico.md` 4.4 → 5.0, §4.4

**El punto 5 se parte en prioridad y estimación**, y acá lo que las separa no es un evento sino un dueño: la **prioridad MoSCoW es del Product Owner** y la **estimación es del equipo**, y sale del refinamiento. Que el refinamiento no haya ocurrido no impide priorizar; que la prioridad esté abierta no impide estimar. El ejemplo de `US-XXXXX` de §7 sigue la estructura nueva, que es donde la intervención anterior había dejado el suyo sin mover.

### Cambiado — `Rules-Prompts-AI.md` 4.4 → 4.5, §4.2

**Una regla que dejó de tener razón el día que se publicó §12.2, y el barrido de la 10.0 pasó al lado.** El punto 9 declaraba que el costo sin moneda «no se resuelve con la forma de `Root-Rules.md` §12.1 sino declarando de dónde sale el dato», y **su diagnóstico era correcto**: es un dato que falta, no una referencia colgada. Ésa es exactamente la figura que §12.2 incorporó. El barrido le corrigió el número de sección y no vio que la frase quedaba mandando lo contrario de la figura nueva — y la salida que autorizaba, «la magnitud declarada como pendiente», es una promesa en prosa: **P1** por la tabla de escalamiento de §12.2, levantada por la comprobación 6 de §10.0 **en todo destino con `usa_llm` en true**. Sube **minor**: §12.2 rige sobre ese ítem desde la 10.0, de modo que lo que se quita es una excepción sin efecto.

### Corregido — `Master-Prompt.md` 8.8 → 8.9

**Dos citas que el barrido de la 10.0 declaró migradas y no lo estaban**, las dos en el archivo que esa misma intervención estaba editando: §6, donde el orquestador manda declarar la obligación hacia adelante con la forma de *referencia pendiente*, y el glosario operativo de §15. Las dos pasan a **§12.1**, que es lo que la entrada 10.0 manda. El recuento de aquel barrido —«14 ocurrencias, residuo 1»— no se reconcilia con el snapshot: `_legacy/9.19/` tiene **24**.

### Cambiado — `Catalogo-De-Criterios.md` 1.7 → 1.8

El criterio que la auditoría produjo: **cuándo un ítem de una §4.x se parte y cuándo no.** Se parte cuando la segunda mitad **se decide por separado**; no se parte cuando **se deriva** de la primera —el identificador de una migración no existe hasta que hay tooling—. Un ítem con muchos atributos no es un ítem empaquetado.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Items-Empaquetados.md`, conjunto resultante **11.0**.

### Lo que se auditó y no se aplica

La auditoría construyó además la **lista de ítems donde diferir es ilegítimo**, que `Reportes/14` §8 declara no saber y que la solicitud de intervención encargaba mirando las quince reglas. Se enuncia como **propiedad y no como catálogo**: *diferir es ilegítimo cuando el ítem fija la forma de un registro que el producto empieza a producir antes del evento de cierre*, porque cada acto ocurrido mientras tanto **nace sin la forma y no se la puede poner después** —medido: tres de ocho etapas ya no se podían etiquetar—. Cinco ítems la cumplen hoy, todos de `Rules-Devops.md` §4.3 y `Rules-Calidad-Y-Pruebas.md` §4.8. **No se incorpora**: sin un segundo caso medido, agregar un concepto es lo que la 9.19 desaconsejó al rechazar el eje de estratos de `Reportes/13`.

### Impacto sobre destinos existentes

**Renombres de artefacto**

| Artefacto | Nombre anterior | Nombre vigente |
| --- | --- | --- |
| — | — | **Vacía.** Ningún artefacto cambió de nombre |

**Secciones movidas o partidas**

| Regla | Antes | Ahora | Qué hacer en el destino |
| --- | --- | --- | --- |
| `Rules-Devops.md` | §4.3 punto 5, canales **y** sufijos | Punto 5 (canales) y punto 5.b (sufijos) | `Estrategia-Versionado.md` declara la semántica de sufijos en su propio ítem |
| `Rules-Devops.md` | §4.4 punto 2, herramienta IaC **y** aprobación de `plan` | Punto 2 (herramienta) y punto 2.b (aprobación) | `Entornos-Deploy.md` declara la aprobación en su propio ítem |
| `Rules-Devops.md` | §4.6 punto 1, formato **y** generador | Punto 1 (formato y publicación) y punto 1.b (generador) | `Supply-Chain-Seguridad.md` declara el generador en su propio ítem |
| `Rules-Devops.md` | §4.6 punto 5, SAST **y** DAST | Punto 5 (SAST) y punto 5.b (DAST) | `Supply-Chain-Seguridad.md` declara cada análisis en su propio ítem, con su stage y su criterio de bloqueo |
| `Rules-Backlog-Tecnico.md` | §4.4 punto 5, prioridad **y** estimación | Punto 5 (prioridad) y punto 5.b (estimación) | Cada `US-XXXXX-<Nombre>.md` parte su sección 5 en 5 y 5.b |

**Campos bloqueantes nuevos**

| Dónde | Campo | Qué pasa si falta |
| --- | --- | --- |
| `Estrategia-Versionado.md`, `Entornos-Deploy.md` y `Supply-Chain-Seguridad.md` de todo destino | Los cuatro ítems `.b` de `Rules-Devops.md` | **Hallazgo P1** si quedan diferidos sin la forma de `Root-Rules.md` §12.2 |
| Toda `US-XXXXX-<Nombre>.md` | La **estimación** como ítem propio, §4.4 punto 5.b | **Hallazgo P1** si queda diferida sin la forma de §12.2 |

**Qué migración obliga, y cuál no.** Un destino que ya declaraba las dos mitades de cada ítem **no tiene trabajo de contenido**: parte la sección en dos y no escribe nada nuevo. Un destino que difirió el ítem entero **descubre cuál de las dos mitades no estaba bloqueada**, que es el resultado buscado. El costo real está en el volumen: la partición de `Rules-Backlog-Tecnico.md` toca **una sección por historia de usuario**, y un destino con backlog grande las toca todas.

## [10.1] - 2026-08-20

**La tabla de exclusiones del barrido existía desde la 1.15 «para que no se redescubran cada vez», y tres intervenciones seguidas la reconstruyeron a mano.** Acertaron en lo que su residuo les mostró y omitieron el resto — en una, la omisión hizo que la corrida afirmara «cero» con **dos ocurrencias vivas**, y una auditoría posterior lo levantó como **P2**: sustantivamente correcta y **literalmente falsa**. Origen: `Reportes/15` de `IA.SDD.Documentacion`.

### Agregado — `SDD-Development-Guide.md` 1.19 → 1.20, §VI.3.2

**La séptima clase de exclusión: la declaración de la propia intervención.** Escribe la forma anterior **como patrón literal** porque §VI.3.2 se lo exige, de modo que **nombrarla es su función**. Un barrido que no pudiera nombrar lo que corrige sería inútil.

**Y el cambio que la fila sola no arregla:** la sección de barrido de la nota de coherencia **cita la tabla en lugar de reescribirla**, y enumera sólo las exclusiones propias del caso.

**El motivo es de ubicación y no de contenido.** La lista vive en la guía y **la nota se escribe mirando el residuo**: nada pone la lista delante de quien enumera. **Enumerar una vez no alcanza si nadie la lee en el momento de usarla.**

La comprobación 8 de §VI.3 se reformula sobre las **siete** clases citadas.

### Cambiado — `Catalogo-De-Criterios.md` 1.6 → 1.7

Un criterio nuevo: qué hacer con el residuo del barrido que el autor sabe legítimo.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Exclusiones-Del-Barrido.md`, conjunto resultante **10.1**.

## [10.0] - 2026-08-19

**El método sabía atar una decisión a un evento futuro y no sabía cerrar el lazo cuando ese evento llegaba.** Un ítem que una regla declara obligatorio se podía contestar con la promesa de contestarlo —«el que se fije al anclarla, registrado en el punto de control de la etapa `a`»—, y esa promesa **se lee igual que el dato** en toda verificación de presencia: hay sección, hay fila, hay texto. No es una declaración falsa: es verdadera, sobre el futuro, y por eso ni siquiera incomoda a quien la lee.

**Medido en un destino real:** el punto de control cerró el 2026-08-13 sin registrar la decisión, la promesa sobrevivió **ocho etapas**, y el repositorio llegó a su primer despliegue con **cero etiquetas** contra una estrategia de versionado que las declara su instrumento de reversión. **No lo detectó ningún audit**: lo encontró una reanudación, por el síntoma y no por el diferimiento. Y para entonces **tres de las ocho etapas ya no se podían etiquetar sin inventar el punto**: el daño se volvió irreversible mientras nadie miraba. Origen: `Reportes/14` de `IA.SDD.Documentacion`.

### Cambiado — `Root-Rules.md` 6.2 → 7.0, §12

**§12 pasa de una figura a dos**, y la cabecera declara por qué van juntas: **son el mismo mecanismo con el evento de cierre en distinto lugar**. La **referencia pendiente** (§12.1, sin cambios) lo tiene **adentro** del método —el orquestador ve emitirse la categoría porque él mismo la produce—. El **ítem diferido** (§12.2, nuevo) lo tiene **afuera**, en el ciclo de construcción que el método declara que no gobierna, y ahí nadie lo ve pasar.

**La forma es de cuatro campos, y el cuarto es el que la distingue de la promesa que reemplaza:** el evento de cierre **se nombra por un artefacto y su sección, no por un momento**. «El punto de control de la etapa `a`» no deja rastro que alguien pueda abrir; «la tabla de decisiones de `Plan-Etapa-A.md` §7» sí. **Un evento que no se puede abrir no se puede comprobar, y un cierre que nadie comprueba no ocurre.**

Declara además que **un ítem que empaqueta dos decisiones se difiere por partes** —que una mitad esté bloqueada no autoriza a diferir la otra— y una tabla de escalamiento: **P1** para el ítem cuyo evento ya ocurrió y para la promesa sin forma, **P0** para el que sigue abierto al cierre del producto.

**No se creó una figura paralela, y es deliberado.** La 9.19 rechazó el eje de estratos de `Reportes/13` con el argumento de que «un concepto más que mantener, en un método que declara que un procedimiento que crece deja de leerse, sólo se justifica si hace falta». Acá tampoco hacía falta: alcanzaba con que §12 llegara a los ítems de contenido.

### Cambiado — `Rules-Devops.md` 4.6 → 5.0, §4.3

**El punto 3 se parte en dos**: la herramienta de versionado con su configuración base, y el **prefijo de tag** como ítem propio. Venían en una sola línea, y **sólo una de las dos estaba genuinamente bloqueada**: el destino difirió el prefijo por arrastre cuando lo que dependía de una decisión futura era la herramienta. **Elegir `v` no exige haber elegido MinVer** — y de hecho la tabla de canales de esta misma regla ya escribía la forma literal «Sólo en tag `v<X.Y.Z>` sin sufijo».

### Agregado — `Master-Prompt.md` 8.7 → 8.8, §10.0

**Sexta comprobación transversal de la compuerta mecánica: ítems diferidos.** Se cuentan los que el árbol de la fase declara y **es hallazgo el que nombre un evento de cierre ya ocurrido**; también lo es el ítem contestado con una promesa sin la forma de §12.2, **porque sin marca no es contable** y ninguna otra comprobación lo alcanza.

**Es enumerable por construcción**, y lo es gracias a §12.2: si el evento se declara como artefacto y sección, comprobarlo es abrir un archivo y mirar si la decisión está escrita.

### Agregado — `Master-Prompt-Reanudacion.md` 1.7 → 1.8, R0 y R1

R0 paso 4 suma los ítems diferidos a los pendientes declarados, **con su evento contrastado**, y R1 los publica en un bloque de tres renglones: declarados, vencidos y sin forma. **Va acá porque es la comprobación más barata del método**: la reanudación ya lee el árbol entero sin memoria.

### Cambiado — `Catalogo-De-Criterios.md` 1.5 → 1.6

Cuatro criterios nuevos de §12.2 y la fila de §12 recalificada a §12.1, por la comprobación 12 de `SDD-Development-Guide.md` §VI.3.

### Impacto sobre destinos existentes

**Renombres de artefacto**

| Artefacto | Nombre anterior | Nombre vigente |
| --- | --- | --- |
| — | — | **Vacía.** Ningún artefacto cambió de nombre |

**Secciones movidas o partidas**

| Regla | Antes | Ahora | Qué hacer en el destino |
| --- | --- | --- | --- |
| `Root-Rules.md` | §12 «Referencia pendiente», sin subsecciones | §12.1 «Referencia pendiente» y §12.2 «Ítem diferido» | **Toda cita a `Root-Rules.md` §12 que hable de referencias pasa a §12.1.** Una cita a §12 a secas sigue resolviendo al título, pero deja de ser precisa |
| `Rules-Devops.md` | §4.3 punto 3, herramienta **y** prefijo de tag | §4.3 punto 3 (herramienta) y punto 3.b (prefijo) | **`Estrategia-Versionado.md` declara el prefijo en su propio ítem.** Si el destino no lo tiene fijado, se difiere con la forma de §12.2 en lugar de dejarlo en prosa |

**Campos bloqueantes nuevos**

| Dónde | Campo | Qué pasa si falta |
| --- | --- | --- |
| Todo ítem obligatorio de una §4.x que el destino no contestó | Los **cuatro campos** de `Root-Rules.md` §12.2 — qué falta, por qué no hoy, quién lo cierra, y el evento **como artefacto y sección** | **Hallazgo P1** en la compuerta de `Master-Prompt.md` §10.0 y en la reanudación: la promesa sin forma no es contable |
| `Estrategia-Versionado.md` de todo destino | **Prefijo de tag**, como ítem propio de §4.3 punto 3.b | **Hallazgo P1** si queda diferido sin la forma de §12.2 |

**Qué migración obliga, y cuál no.** Un destino sin ningún ítem diferido en prosa **no tiene trabajo documental**: le cambian dos citas de sección y nada más. Un destino con promesas en prosa **las reescribe con la forma de §12.2**, y ese acto **destapa cuáles ya vencieron** — que es el resultado buscado y no un efecto colateral.

## [9.19] - 2026-08-18

**La 9.16 declaró de qué lado va cada cosa y no cómo reconocer de qué lado cae.** `Master-Prompt.md` §8.1 separa desde entonces el **defecto propio** —que corrige el agente— de la **decisión de diseño** —que toma el humano—. Sin un paso que establezca cuál es cuál, decide **la asimetría de costos**: detener cuesta al agente una sección del informe y al humano reconstruir contexto que no tiene. **Medido en una corrida real: de cinco detenciones presentadas al humano, tres no eran del humano.**

### Agregado — `Master-Prompt.md` 8.6 → 8.7, §8.1

**La pregunta previa, y es una sola:**

> **¿Esto tiene respuesta en el árbol?** Si se contesta abriendo los documentos y contrastando, y la respuesta se sostiene con una **cita literal**, **no es una detención: es trabajo propio**. Se detiene lo que no tiene cita posible: lo que requiere intención de producto, autoridad, o una preferencia que el árbol no contiene.

**La cita es el criterio, no la intuición.** Verificado: de **seis hallazgos de un audit independiente, cinco se sostenían con cita y los cerró el agente**; el sexto —un recuento cuyo criterio nadie había fijado— no, y quedó abierto.

**Ante la duda, se detiene**, por la misma asimetría con que §6 resuelve enumerable contra interpretativo: **el error barato y el error caro no son simétricos**.

### Agregado — `Master-Prompt.md` §10

**Qué compra la independencia del auditor y qué no**, porque de eso depende cómo encargarle el trabajo:

| | |
| --- | --- |
| **Sí compra: ausencia de compromiso** | Quien decidió tiene interés en que la respuesta sea que estuvo bien. **No se corrige con más contexto ni con mejor prompt** |
| **No compra: independencia de criterio** | Dos agentes del mismo modelo correlacionan ante una pregunta abierta, y **una confirmación correlacionada cierra el hallazgo peor que no haberlo mirado** |

**Las tres partes obligatorias del encargo:** se le pide **refutar y no verificar**; **cita literal o el veredicto no vale**; **«no concluyente» admitido explícitamente**.

**Y la propiedad que la exigencia de cita produce sola:** un hallazgo sostenido con cita **es, por eso mismo, resoluble contra el árbol**. Es la pregunta previa contestada sin que nadie clasifique nada — por eso **se incorpora el criterio y no el eje de estratos** que `Reportes/13` proponía. Un concepto más que mantener, en un método que declara que un procedimiento que crece deja de leerse, sólo se justifica si hace falta, y no hizo falta.

### Agregado — `Migracion-Rules.md` 3.13 → 3.14, §4.3.2

**Cinco reglas de emisión, las cinco con daño medido y ninguna detectada por las verificaciones existentes.** Es lo que las distingue de E1 a E4, que nacieron de defectos que la verificación de preservación **sí** encontraba:

| Regla | Qué destapó | Por qué no se veía |
| --- | --- | --- |
| **E5** · el índice de un documento absorbido no transpone | **93 entradas** con ancla rota | El verificador comprobaba **archivos, no anclas internas** |
| **E6** · dos secciones que sólo difieren en su número son la misma | 4 secciones duplicadas | Y el daño mayor: **lo que se agrega después se registra en la equivocada** |
| **E7** · un documento que sale por S4 también sube su versión | **28 documentos** | El registro se contradecía y nadie lo comparaba |
| **E8** · ninguna unificación de encabezados por sustitución de cadena | «a **este cada** proyecto de código» | **El resultado seguía siendo un encabezado válido** |
| **C0** · la medición decide **si** fusionar, no **con quién** ligar | Un par mal apareado | La medición era correcta; se la usó para una pregunta que no contesta |

**E8 es el primer anti-patrón que §7 de esa misma regla nombra**, cometido por la consolidación que la regla gobierna: estaba escrita para **términos** y no para **encabezados**, que es el simétrico de su alcance — el sexto caso del patrón que la Parte IV de la guía describe desde la 9.18.

**§6 suma tres criterios enumerables**, incluida la verificación de **anclas internas**, que el verificador de enlaces no miraba y que encontró un ancla rota **en el propio framework** en su primera corrida.

**Y uno de los tres se corrigió en la misma unidad**, con la regla que esta intervención incorpora. El criterio de secciones duplicadas devolvió **24 falsos positivos** al correrlo acá: contaba los encabezados **dentro de los bloques de ejemplo**, que un documento que muestra el esqueleto de otro repite a propósito. Tenía respuesta en el árbol, así que se cerró sin ofrecerlo como opción (`Migracion-Rules.md` 3.15).

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-La-Pregunta-Previa.md` 1.0. Deja anotado que **tres de cinco es una corrida y no una tasa** —si la proporción no se sostiene, la corrección barata es **quitar la regla, no refinarla**— y un límite del criterio: «sostenible con cita» **sigue siendo un juicio del agente sobre su propio trabajo**, y la corrida que lo originó tuvo un auditor externo estableciendo las citas. **Una corrida sin auditor deja al agente citando para sí mismo, y eso no se midió.**

---

## [9.18] - 2026-08-18

**La 9.17 escribió la lección adentro de la regla que la originó, que es el lugar donde no le sirve a nadie más.** `Migracion-Rules.md` §4.3.2 **E4** cerraba diciendo que **cuando una regla nace de un caso corresponde preguntar cuál es su simétrico** — una lección sobre cómo se escribe cualquier regla, guardada en una regla de migración.

### Agregado — `SDD-Development-Guide.md` 1.18 → 1.19, Parte IV

**«Sobre las reglas que escribas a partir de un caso observado».** Casi toda regla del framework nace de una falla concreta, y ése es su mérito. El riesgo es de forma: **una regla escrita contra el caso tiende a quedar enunciada sobre el caso** y no sobre la propiedad que el caso ilustra, y entonces **su simétrico queda afuera sin que nadie lo note, porque la regla se lee completa**.

**Tres familias observadas, y no comparten origen:**

| Regla | Se enunció sobre | Lo que quedó afuera |
| --- | --- | --- |
| Comprobación 4, «sin contradicción con lo que ya estaba» | los **archivos tocados** | el concepto fuera del alcance declarado — **tres intervenciones seguidas** |
| La regla 4 del barrido | **el árbol** | **el texto propio de la intervención** — cinco veces |
| `Migracion-Rules.md` §4.3.2 **E4** | **el cierre** del cuerpo | **la apertura**: el cuerpo pegado a su propio encabezado |

**Lo que las tres tienen en común no es el descuido: es que el enunciado quedó pegado al síntoma**, y un enunciado pegado al síntoma **no falla ruidosamente**. Cubre su caso, se verifica bien, y el simétrico produce el mismo daño en una rama que casi no se ejecuta — así que el silencio se lee como conformidad.

Suma cuatro preguntas, la regla de que **dos reglas hermanas van juntas y no separadas** —separadas vuelven a permitir que se aplique una y no la otra, que es el defecto que se corrige— y su límite: **hay reglas cuyo caso es la propiedad**, y lo que se pide es **hacerse la pregunta**.

### Cambiado — `Migracion-Rules.md` 3.12 → 3.13, §4.3.2

**E4 apunta a la Parte IV en lugar de repetirla**, y conserva el caso como evidencia. Dos declaraciones de la misma regla hay que mantenerlas sincronizadas, y el framework lo declara anti-patrón.

### Cambiado — `Catalogo-De-Criterios.md` 1.3 → 1.4

§3 suma la situación «se escribe una regla nueva a partir de un caso observado». Es la **comprobación 12** de §VI.3 funcionando: un criterio nuevo entra al índice en la misma intervención que lo crea.

### Nota de coherencia

`Coherencia-Simetrico-De-La-Regla.md` 1.0 → 1.1. Registra que **la recomendación de no subir la lección se apoyaba en una premisa falsa** —que la evidencia era de un solo emisor en una sola migración— y que verificarla era un `grep`: el patrón ya estaba documentado dos veces más, con origen distinto, en §VI.3.1 de la propia guía. **Es la misma forma que el defecto que la intervención corrige.**

---

## [9.17] - 2026-08-18

**Una regla escrita contra el caso que la originó dejó afuera su simétrico, y el simétrico produce el mismo daño por el otro lado.** `Migracion-Rules.md` §4.3.2 **E4** decía «todo cuerpo se cierra con salto de línea», porque sin él el encabezado **siguiente** queda pegado. El caso contrario —el cuerpo pegado a **su propio** encabezado— no estaba, y **la regla se leía completa**.

### Cambiado — `Migracion-Rules.md` 3.11 → 3.12, §4.3.2

**E4 pasa a enunciar el par**, en una tabla de dos filas con el síntoma de cada lado:

| Lado | Qué pasa si falta |
| --- | --- |
| **Cierre** · todo cuerpo termina con salto de línea | El encabezado **siguiente** queda pegado a la última línea del anterior |
| **Apertura** · todo encabezado va seguido de una línea en blanco | El cuerpo queda pegado a **su propio** encabezado |

**Se enuncia como par y no como dos reglas**, porque dos reglas hermanas escritas por separado vuelven a permitir que se aplique una y no la otra, que es exactamente lo que pasó.

**Por qué tardó cinco categorías en aparecer.** El emisor pone un bloque de atribución entre el encabezado y el cuerpo **sólo cuando la sección difiere entre las versiones**, y ese bloque aporta la línea en blanco por accidente. La rama que destapa el defecto es la contraria —**la sección idéntica en todas las capas**—, y con un solapamiento medio del **16,3 %** casi no se ejecuta. La corrida que la ejecutó fue **la categoría más chica de la migración**: un grupo, un documento.

**Medido al corregirlo:** **23 encabezados en 12 documentos** de un destino real, cada uno contrastado contra su origen antes de tocarlo.

**Y la lección de forma, que es lo que la regla suma además del salto de línea:** cuando una regla nace de un caso, tiende a quedar enunciada **sobre ese caso** y no sobre la propiedad que el caso ilustra. Corresponde preguntar **cuál es su simétrico** antes de darla por escrita. Es el quinto defecto del emisor y los cinco tienen esta forma.

### Agregado — `Migracion-Rules.md` §6

Un criterio de aceptación **enumerable**: en todo documento consolidado, cada encabezado está separado de su cuerpo a los dos lados. **Se verifica sin leer el documento**, que es lo que distingue un criterio que se corre de uno que se declara.

### Corregido — `Catalogo-De-Criterios.md` 1.2 → 1.3

El **barrido por concepto** encontró que §3 mandaba a «las **once** comprobaciones» de `SDD-Development-Guide.md` §VI.3, y son **doce** desde la 9.10. Un índice cuyo valor es la exactitud del puntero **enseña a no contarlas** cuando el puntero miente.

### Nota de coherencia

`SDD/Devs/Guides/Coherencia-Simetrico-De-La-Regla.md` 1.0. Deja anotado que la lección de forma quedó escrita **adentro de una regla de migración**, cuando su lugar propio sería la Parte IV de la guía de desarrollo; **no se generaliza todavía** porque la evidencia es de un solo emisor en una sola migración.

---

## [9.16] - 2026-08-18

**Una entrega cerró con un informe completo y sin pedir nada, y el humano tuvo que preguntar qué hacer.** `Master-Prompt.md` §12.1 **T4** declara desde la 9.2 que el bloque de entrega termina con «qué sigue después del merge», y **§8.1 F4** declara desde la 9.8 que lo que se pide es **una decisión, no una opinión**. **Las dos reglas existían y no se aplicaron, por quien las escribió.**

### Agregado — `Master-Prompt.md` 8.5 → 8.6, §8.1

**La autocorrección.** Detectar un defecto propio y ofrecerlo como opción **es entregar trabajo a medias**:

| Qué se detecta | Quién lo resuelve |
| --- | --- |
| Un **defecto del propio trabajo** | **El agente, en la misma unidad.** Se corrige y se declara en el cierre |
| Una **decisión de diseño** | **El humano** |

**Con su contraparte**, que es la mitad que impide el uso inverso: si corregir el defecto propio **cambia una decisión que el humano ya tomó**, **se detiene** — dejó de ser un defecto del agente. El criterio de corte: **el agente termina su trabajo, no rehace el del humano**.

**El cierre de unidad.** La entrega y las decisiones pendientes van en **un solo bloque**, porque separarlas **obliga a reconstruir el contexto dos veces**. Cada decisión lleva **su contexto de dos o tres líneas**, sus opciones **con impacto**, el fundamento que aplica y **una recomendación**. Ese contexto no es cortesía: quien decide no estuvo en la corrida, y sin él **elige sobre el nombre de las opciones y no sobre lo que implican**.

### Y por qué ese bloque ya es un plan

**Para escribir «qué pasaría si» hay que proyectar.** Enumerar opciones, estimar impacto y recomendar **exige haber recorrido los caminos que no se tomaron**, que es lo que hace una planificación.

De ahí la consecuencia: **el plan no tiene por qué ser un artefacto aparte.** Es lo que queda escrito en el cierre de cada unidad, **hecho en el momento en que se tiene la información** y no antes, cuando había que suponerla. Es la misma lógica con la que `Migracion-Rules.md` §3 rechazó los playbooks por salto de versión: **un plan escrito antes de tener el estado a la vista planifica sobre lo que se supone**.

- **`Master-Prompt-Migracion.md` 2.7 → 2.8** y **`Master-Prompt-Reanudacion.md` 1.6 → 1.7** lo adoptan.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.15/`.

**Queda anotado:** la regla nueva **no impide** el defecto que la originó — T4 y F4 ya existían. Lo que cambia es que el cierre es un **bloque único**, y omitir «qué necesito de vos» lo deja **visiblemente incompleto**. Es el mismo argumento de la comprobación 12: una obligación cuya omisión **se nota** vale más que una que depende de la memoria, y no es una garantía.

---

## [9.15] - 2026-08-18

**Un criterio que se venía aplicando por olfato queda escrito: qué merece ser paso y qué queda como prosa.**

Lo destapó un caso concreto: una advertencia **específica, con su caso medido, escrita en la sección que gobierna la operación**, no se aplicó — porque estaba como bullet en una lista temática. **A una sección larga no se entra a leerla: se entra a buscar una cosa.**

### Agregado — `SDD-Development-Guide.md` 1.17 → 1.18, Parte IV

**Las salidas son tres, no dos**, y la tercera es la que más se olvida:

| Salida | Cuándo |
| --- | --- |
| **Prosa** | Se lee para **entender o decidir**, no ejecutando |
| **Paso** | Se lee **ejecutando**, su omisión hace daño **y** es olvidable |
| **Paso con su fundamento pegado** | Lo anterior, y además hace falta saber **cuándo no aplica** |

**Las tres condiciones del paso son necesarias juntas.** Algo dañino pero imposible de olvidar no gana un paso; algo olvidable pero inocuo, tampoco. Sin ese filtro el procedimiento crece hasta dejar de leerse, **que es la forma en que un procedimiento muere**.

**Cuatro reglas más, y una es propia:**

- **Un paso previene; una comprobación detecta, y no son sustitutos.** Si el costo de rehacer lo detectado es alto, va como paso **aunque la comprobación exista**. Medido en esta misma corrida: una verificación atrapó **tres defectos seguidos** y cada detección costó **rehacer una categoría entera**.
- **El paso lleva su fundamento junto.** Sin él se obedece o se ignora, **nunca se adapta** — no hay con qué reconocer que este caso es la excepción.
- **Presupuesto de nueve pasos.** Al llenarse, o **se parte en dos puntos de parada**, o **el ítem de menor daño vuelve a prosa**. Agrandarlo no es opción.
- **El disparador de revisión es la falla, no la previsión.**

### Cambiado — `Migracion-Rules.md` 3.10 → 3.11

Los dos procedimientos de §4.3.2 declaran **cuándo se corren**, que era el único ítem obligatorio que les faltaba: la **emisión**, una vez por grupo y antes de la verificación; la **comparación**, antes de emitir; la **verificación**, **después de emitir y antes de archivar** — el único momento en que todavía se puede corregir sin rehacer.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.14/`.

---

## [9.14] - 2026-08-17

**La consolidación tenía procedimiento para comparar, para verificar y para mover, y no para emitir.** C1 a C5 dicen cómo comparar versiones y cómo verificar que no se perdió nada; §4.3.1 tiene cinco pasos numerados para mover un documento. **Emitir el documento consolidado vivía como bullets sueltos en prosa**, entre otra docena — y por eso se leía salteado.

**Los cuatro pasos que se agregan salen de defectos medidos, no de previsión.** Los cuatro se produjeron en consolidaciones reales, los cuatro los detectó la verificación de preservación antes de archivar nada, y **ninguno era evidente de antemano**: en un corpus generado por plantilla las versiones se parecen tanto que el emisor más simple funciona durante varias categorías y falla en la que trae una variante.

### Agregado — `Migracion-Rules.md` 3.9 → 3.10, §4.3.2

- **E1 · Recorrer la unión de secciones, no la del documento vivo.** El conjunto de secciones **no es el mismo en todas las versiones**. Medido: **722 líneas en doce secciones** descartadas en silencio en una sola categoría.
- **E2 · Transponer la prosa que no cuelga de ningún encabezado**, en sus dos lugares: el **preámbulo** entre la cabecera y la primera sección, y el **texto dentro de una sección estructural** —el párrafo que sigue a la lista del índice—. **Absorbe el bullet que ya lo advertía** desde una migración anterior, que estaba suelto en prosa y por eso se leía salteado.
- **E3 · El índice se regenera aumentando, no reemplazando.** Heredarlo lo deja falso —el consolidado tiene más secciones—, pero reemplazar el cuerpo entero **descarta lo que no era la lista**. Es el caso donde **una corrección produjo el defecto siguiente de la misma familia**.
- **E4 · Todo cuerpo se cierra con salto de línea.** Sin él el encabezado siguiente queda pegado al anterior. No es pérdida: es Markdown roto, y **se presenta como veinte líneas sin correspondencia**, que es la forma más probable de que alguien lo descarte como ruido.

### El error de fondo, nombrado

**Clasificar las secciones por su función** —título, índice, control de cambios, contenido— **y asumir que la función determina si el cuerpo vale la pena conservar.** Una sección estructural también lleva contenido, y la premisa falla justo en los documentos que se apartan de la plantilla.

**Y una constatación que corresponde registrar:** §4.3.2 **ya advertía** que «la transposición lee el documento entero, no sólo sus secciones numeradas», con su caso medido. Estaba escrito, en la sección que gobierna la operación, y **no se aplicó**. La diferencia entre un bullet en prosa y un paso numerado no es de contenido: es que **el primero se lee cuando se lee la sección entera, y a una sección de doscientas líneas se entra a buscar una cosa**.

**§6 suma su criterio enumerable.** Ninguna invariante modificada. El conjunto superado se archiva en `_legacy/9.13/`.

---

## [9.13] - 2026-08-17

**La compuerta mecánica tenía su conjunto de reglas cableado, y el catálogo acababa de marcar 97 comprobaciones que nadie consumía.**

`Master-Prompt.md` §10.0 evalúa propiedades enumerables **antes de que el audit interprete nada** — es, en los hechos, un motor de decisión: recibe el árbol de una fase como contexto, evalúa reglas y devuelve un veredicto. Pero sus reglas eran **cinco, escritas a mano en esa sección**. La 9.11 marcó **97 de las 202** situaciones catalogadas como `[enumerable]`, y **la compuerta no las conocía**.

### Cambiado

- **`Master-Prompt.md` 8.4 → 8.5.** §10.0 declara que su conjunto de reglas son **dos**: las comprobaciones transversales que ya enumeraba, y **los anti-patrones `[enumerable]` de la regla de la categoría en curso**. Un anti-patrón que se verifica es hallazgo, y el remedio es el que su propia fila declara. Los `[interpretativo]` **siguen siendo del audit**, que es donde el criterio corresponde.
- **`Catalogo-De-Criterios.md` 1.1 → 1.2.** §4 declara que la marca **la consume la compuerta**, y no sólo documenta quién decide.

**Por qué el segundo conjunto no se copia en §10.0.** Duplicarlo lo pondría en dos lugares, y **una duplicación que hay que mantener en paralelo se desincroniza** — es el mismo fundamento con el que `Migracion-Rules.md` §3 rechazó escribir playbooks por salto de versión. La compuerta **lee la regla de la categoría**; no guarda su propia copia.

**Ninguna comprobación nueva se agregó: las 97 ya estaban escritas.** Lo que cambió es que ahora alguien las corre. El conjunto superado se archiva en `_legacy/9.12/`.

---

## [9.12] - 2026-08-17

**Dos correcciones sobre la 9.11, las dos señaladas por el Product Owner.**

### La limitación que era una obligación

El catálogo declaraba que «se desactualiza si un criterio nuevo no se agrega». **Eso no es una limitación: es una obligación que faltaba escribir.** Un índice cuyo mantenimiento depende de que alguien se acuerde **reproduce el problema que vino a resolver**.

- **`SDD-Development-Guide.md` 1.16 → 1.17.** §VI.3 suma la **comprobación 12**: todo criterio que una intervención agregue, mueva o retire está reflejado en el catálogo. Es enumerable, y su forma es la que **D5** ya usa para el control de cambios — **quien toca, registra**.

**Es el cuarto caso del mismo patrón en dos días:** la 9.1 con el barrido, la 9.6 con el procedimiento de mover, la 9.10 con la comparación, y ésta con la cobertura del índice. **Una limitación declarada suele estar un paso antes de la regla que la elimina.**

### El fundamento de DMN, corregido

La 9.11 decía que adoptar DMN «exigiría un motor de decisión y un formato de intercambio que el método no tiene». **El argumento mezclaba tres piezas que no se adoptan ni se descartan juntas**, y la observación que lo señaló fue directa: si todo se trabaja en Markdown, la representación no puede ser el obstáculo.

| Pieza de DMN | Decisión | Fundamento |
| --- | --- | --- |
| Condiciones de entrada declaradas | **Se adopta** | Distingue una tabla de decisión de una lista de recomendaciones |
| **Política de coincidencia** | **Se adopta** | Es texto, y su ausencia dejaba sin resolver el caso de dos criterios simultáneos |
| Serialización XML y motor de ejecución | **No** | Son para intercambio entre herramientas. Acá **el motor es el agente que lee** |

**Una tabla de decisión se expresa en Markdown sin pérdida.** Lo que no corresponde adoptar es la infraestructura, no la notación.

### Agregado — la política de coincidencia

Se verificó que el método **no declaraba qué pasa cuando aplica más de un criterio**: las únicas apariciones de «precedencia» gobiernan términos y orden de fases.

- **`Catalogo-De-Criterios.md` 1.0 → 1.1, §4.1 nueva.** La tabla de criterios por situación es **única** —dos criterios para una situación son un **defecto del catálogo**—; la de anti-patrones es **acumulativa**, porque un documento puede tener varios defectos independientes con remedios independientes.
- **El conflicto no estrena mecanismo.** Dos criterios que difieren son dos cosas aprobadas que se contradicen: la **detención por arbitraje** de `Master-Prompt.md` §7.0, vigente desde la 4.1. **Es la tercera vez que esa detención absorbe un caso nuevo sin modificarse.**

**Trazabilidad:** las políticas **Unique** y **Collect** se verificaron contra [Camunda](https://camunda.com/dmn/). **La enumeración completa que define el estándar no se verificó** y por eso no se cita.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.11/`.

**Queda anotado:** la comprobación 12 exige **cobertura, no corrección**. Que un criterio esté en el índice no dice que su entrada lo describa bien, y volverlo enumerable exigiría duplicar el criterio — que es lo que el catálogo evita al enlazar en vez de copiar.

---

## [9.11] - 2026-08-17

**El método tenía 202 situaciones catalogadas y ningún punto de entrada para encontrarlas.** Se midió: **18 archivos de reglas** con tablas de anti-patrones, **71 umbrales numéricos**, salidas con condición de elección y reglas de resolución, en **cuatro formas distintas de escribir lo mismo**, y **ningún archivo llamado Criterios, Decisiones ni Situaciones**.

La consecuencia es concreta: un agente que enfrenta una situación **tenía que haber leído los dieciocho archivos** para saber que el criterio existía. En esta misma corrida se aplicó la salida **S4** a una consolidación **por recuerdo de otra migración, no por búsqueda** — el criterio estaba escrito y nadie lo habría encontrado.

### Agregado — `Catalogo-De-Criterios.md`

**Un índice, no una regla.** No define ningún criterio: dice **dónde vive cada uno y qué decide**. Enumera **22 criterios de decisión** por situación —qué hacer cuando el árbol se contradice, cuando falta un dato, cuando dos categorías declaran valores incompatibles, cuando un apartamiento sobrevive un salto, cuando un documento cambia de ubicación— y remite a la sección que lo fundamenta.

Y declara **lo que no resuelve**: qué hacer cuando la situación **no está en él**. La respuesta del método es el **apartamiento declarado**, que la migración revisa contra cada versión nueva; uno que sobrevive dos saltos es candidato a regla y entonces sí entra al catálogo.

### Cambiado — las tablas de anti-patrones suman su marca de detección

Las **16 reglas** con tabla de anti-patrones suman la columna **Detección**, con la marca `[enumerable]` o `[interpretativo]` que el método **ya usaba** en los criterios de aceptación desde la intervención de los reportes `00` a `11`. **La marca dice quién puede aplicar el criterio:** los enumerables los verifica la compuerta mecánica de `Master-Prompt.md` §10.0 antes de que nadie interprete; los interpretativos son del audit y del humano.

**Reparto: 202 situaciones, 97 `[enumerable]`, 105 `[interpretativo]`.**

**Cómo se clasificó, y su límite declarado.** Con un criterio conservador y escrito en el propio catálogo: `[enumerable]` cuando el anti-patrón nombra una **ausencia, presencia, recuento, umbral numérico o forma literal** buscable; `[interpretativo]` en todo otro caso, **incluida la duda**. Es una primera pasada revisable, y una marca mal puesta se corrige en la regla que la contiene.

### Por qué esta forma y no DMN

**El estándar de la industria para esta mecánica es DMN** —tablas con condiciones de entrada y salidas, intercambiables y ejecutables, publicado por la OMG en 2015—. El catálogo adopta **su forma** —situación identificable, criterio localizable, salida declarada— y **no el estándar completo**, que exigiría un motor de decisión y un formato de intercambio que el método no tiene. Queda declarado en §5 del catálogo para que la decisión sea revisable.

**Ninguna invariante modificada.** Ningún criterio cambió de contenido. El conjunto superado se archiva en `_legacy/9.10/`.

---

## [9.10] - 2026-08-17

**La consolidación tenía un paso débil y uno fuerte, y ninguno de los dos estaba declarado.** Decidir **qué secciones difieren** entre las versiones de un grupo determina qué se transpone; verificar **línea por línea** que nada se perdió es lo que lo corrige si se decidió mal. En una corrida real el primero falló y **el segundo lo atrapó** — pero por costumbre, no por regla.

### Agregado — `Migracion-Rules.md` 3.7 → 3.8, §4.3.2

- **C1 · La comparación no normaliza el nombre del proyecto de código.** En la cabecera es ruido; **en el cuerpo es contenido**. Medido: cinco documentos de velocidad de equipo parecían **idénticos** al normalizar, y cada uno declaraba *«mide la porción de la velocidad del equipo que se gastó en»* **su** proyecto. El propio texto advertía que las cinco tablas no son comparables y que **sumarlas da la velocidad del equipo**: fundirlas habría destruido la única cifra con interpretación estable.
- **C2 · La verificación es literal y línea por línea**, de cada absorbido contra el consolidado. No es lectura ni muestreo.
- **C3 · Se corre antes de re-derivar enlaces.** Si no, **toda línea con enlace aparece como perdida** porque su ruta cambió de profundidad — medido: **48 marcas, 0 pérdidas reales**. Si el orden obliga a correrla después, se compara colapsando la ruta y conservando el texto.
- **C4 · Cada marca se verifica contra el texto.** Es la regla que el audit adoptó cuando un verificador sobre-reportó cuatro de cinco veces, y acá el error frecuente es el inverso: **descartar por volumen un conjunto donde una marca era real**.
- **C5 · Cuatro clases no transponen y se declaran**: el título, el campo de identidad, un encabezado renombrado, y la **fila de control de cambios del absorbido**, que es historia suya y vive en `_legacy/`. Lo que queda después de descontarlas **es contenido, y su recuento aceptable es cero**.

**§6 suma el criterio enumerable** correspondiente.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.9/`.

---

## [9.9] - 2026-08-17

**§VI.3 exige nota de coherencia a toda intervención que toque más de un archivo, y nadie verificaba que se emitiera.** Al revisar la cobertura de la serie 9.x apareció que **dos de las que la necesitaban no la tenían**: la **9.3** —que tocó tres archivos— y la **9.8** —que tocó cuatro—. La 9.4 y la 9.6 tocaron uno solo y están conformes.

### Agregado

- **`SDD-Development-Guide.md` 1.15 → 1.16.** §VI.3 suma la **comprobación 11, cobertura de la nota de coherencia**: toda entrada del `CHANGELOG.md` cuya intervención tocó más de un archivo tiene su nota. Es **enumerable** —se contrastan las entradas contra el campo «versión del conjunto resultante» de las notas— y es un caso más del patrón que la 9.1 nombró: **una obligación a la que le faltaba ser una corrida en lugar de una lección**.

### Emitido con retraso

- **`Coherencia-Compuerta-De-Arranque.md`** (SDD 9.3) y **`Coherencia-Detencion-Con-Propuesta.md`** (SDD 9.8). Las dos declaran su retraso en una sección propia, en lugar de fecharse como si se hubieran emitido a tiempo.

**La nota de la 9.8 lleva material que no estaba en su entrada**, y es lo más sustantivo de esta publicación:

- **La distinción autoridad / capacidad.** §7.0 declara con razón que el agente no tiene **autoridad** para arbitrar, y de ahí sacaba una conclusión que no se sigue: que tampoco aportara su **análisis**. No tener autoridad es sobre **quién firma**; no tener capacidad sería sobre **quién puede analizar**. Confundirlas produce el peor de los dos mundos: **el agente no decide, y el humano decide con menos información de la que el agente tenía.**
- **La propuesta es auditable; la pregunta no.** Si el agente propone con fundamento y el humano decide distinto, **el desacuerdo queda registrado**. Si sólo pregunta, no hay contra qué disentir.
- **El modo de falla: la propuesta que arrastra.** Si el agente siempre propone y el humano siempre acepta, **la autoridad migra de hecho**. Las defensas son **F3** —la alternativa obligatoria— y que el fundamento sea **falsable**: una propuesta que no se puede refutar es una decisión disfrazada.
- **El reencuadre del pendiente de las detenciones.** Estaba mal planteado como problema de cantidad. **El costo de una detención no está en que exista: está en cuánto trabajo le transfiere al humano.** La revisión pendiente no es reducir el número, es **auditar cuáles transfieren trabajo**.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.8/`.

---

## [9.8] - 2026-08-17

**Se midió si las cuatro familias de detención llevan lo que hace falta para decidir, y dos no.**

| Familia | ¿Llevaba contexto? |
| --- | --- |
| **1 · Confirmación de un plan** | **Sí**, por construcción: presenta el plan entero |
| **2 · Detención por falta de dato** (§9) | **No.** Ocho campos, y el central es «pregunta concreta». Ninguna propuesta, ninguna opción |
| **3 · Detención por arbitraje** (§7.0) | **No, y era la peor: no declaraba formato alguno.** Decía que el humano decide y no decía con qué |
| **4 · Detención por traspaso** (§12.1 T4) | **Sí**: su bloque de entrega lo declara |

**Una detención sin propuesta le traslada al humano el análisis que el agente ya tiene hecho.** El agente sabe qué encontró, qué opciones hay, qué se pierde con cada una y cuál le parece mejor: **preguntar sin decirlo obliga a reconstruirlo desde cero a quien no estuvo**. Es el mismo argumento que `Master-Prompt-Reanudacion.md` §4.0 aplicó a las salidas de R2, generalizado a toda detención del método.

### Agregado — `Master-Prompt.md` §8.1, la forma de toda detención

Un bloque obligatorio: **qué pasó**, **estado de avance** cuantificado cuando lo que se decide está a medias, **opciones** con qué se conserva de lo hecho, **propuesta** con su alternativa, y **qué se espera de vuelta**. Y cuatro reglas, cada una de un caso real:

- **F1 · El estado de avance se cuantifica, no se adjetiva.** «Parcialmente hecho» no permite decidir: **no se puede aprobar el cierre de algo sin saber si lo que falta es el 5 % accesorio o el 40 % que lo sostiene**.
- **F2 · Cada opción declara qué se conserva de lo hecho.** Es lo que decide entre **modificar** y **volver a empezar**, y no lo sabe quien aprueba: **lo sabe el agente que abrió los documentos**.
- **F3 · La propuesta lleva su alternativa**, o se lee como un único camino y deja de leerse.
- **F4 · Lo que se pide es una decisión, no una opinión**: responder tiene que ser elegir, no redactar.

### Cambiado — las cuatro familias adoptan la forma

- **`Master-Prompt.md` 8.3 → 8.4.** §8.1 nueva. **§9** suma tres campos al bloque de ambigüedad: **propuesta**, **alternativa** y **qué queda bloqueado si no se responde ahora**. **§7.0** declara con qué se presenta un arbitraje: los dos valores en conflicto, qué categoría declaró cada uno, qué se rompe con cada salida y cuál propone el agente que se los encontró.
- **`Master-Prompt-Migracion.md` 2.6 → 2.7.** Las detenciones de M1 a M6 llevan estado de avance cuantificado. Es lo que faltaba para **poder aprobar el cierre de una fase parcial**.
- **`Master-Prompt-Reanudacion.md` 1.5 → 1.6.** §4.0 se declara **caso particular** de §8.1: su recomendación **es** la propuesta que §8.1 exige.
- **`Maqueta-Rules.md` 4.1 → 4.2.** El paso 5 suma el caso que motivó todo esto: cuando **el intake cambió y la maqueta dejó de reflejarlo**, el agente no pregunta qué hacer — presenta **modificar** o **replantear** con **qué de lo hecho se conserva en cada una**, y propone. Si lo que vale se conserva, se modifica; si no, se replantea.

**No agrega ni quita ninguna detención: cambia la forma de las que ya existen.** Y no autoriza a decidir — la propuesta es un insumo, y las prohibiciones de §13 siguen intactas.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.7/`.

---

## [9.7] - 2026-08-17

**Un destino acumula reglas locales que el método no contempla, y la migración no las miraba.** Cada apartamiento de `Root-Rules.md` §11 declara «la obligación X no aplica acá, por Y». Un salto de versión puede volverla obsoleta, contradecirla o dejarla igual de válida — y **las tres cosas se veían iguales**, porque nadie las resolvía. Se midió: **cero menciones** a apartamientos en `Migracion-Rules.md` y en el orquestador de migración.

**La pieza difícil ya estaba construida.** §11 exige que todo apartamiento declare **«los disparadores concretos que superarían la decisión»**. Eso hace evaluable el ciclo entero **sin inventar criterio**: al migrar no hay que juzgar si la lección sigue valiendo — hay que leer su disparador y preguntar si la vigente lo cumple. **El apartamiento ya declaró cómo se lo juzga.**

### Agregado — la revisión de apartamientos

- **`Migracion-Rules.md` 3.6 → 3.7, §4.7 nueva.** Tres resultados, ninguno silencioso:

| Resultado | Cuándo | Qué se hace |
| --- | --- | --- |
| **Absorbido** | La vigente ya dice lo que pedía, o su disparador se cumplió | El ADR pasa a `absorbido en SDD <X.Y>` y el artefacto omitido **vuelve a ser obligatorio** |
| **Contradicho** | La vigente decidió **lo contrario** | **Arbitraje**: se lleva a la detención de M1 con las dos lecturas |
| **No contemplado** | La vigente sigue sin decir nada | El ADR **se preserva** y su contador **se incrementa** |

- **`Root-Rules.md` 6.0 → 6.1.** §11 suma dos campos: el **estado** —conjunto cerrado de cuatro— y los **saltos de versión que sobrevivió**.
- **`Master-Prompt-Migracion.md` 2.5 → 2.6.** M1 suma la revisión al plan.

### Las tres decisiones de diseño

**El contradicho no estrena detención.** Es la **detención por arbitraje** de `Master-Prompt.md` §7.0, que existe desde la 4.1 y cuya forma es idéntica: dos cosas aprobadas que se contradicen y ninguna autoridad en el agente para elegir. Lo único que cambia es qué se contradice — allá dos categorías del mismo producto, acá **el destino y el método a través de un salto**. Agregar una detención propia habría **sumado carga sin sumar criterio**.

**El contador es el disparador.** Un apartamiento que sobrevive **dos o más saltos** sin ser contemplado **ya demostró que no es de un producto**: si fuera circunstancial, alguna versión lo habría alcanzado. Se declara candidato a regla del framework, y **lo declara un número**. Es la primera respuesta del método al problema del disparador, que falló dos veces registradas: el criterio del barrido retroactivo, que **no se disparó ninguna de las tres veces**, y los doce reportes de evidencia, que quedaron marcados como pendientes **cuatro días después** de haberse resuelto.

**Los preservados no se re-fundamentan.** Se conservan con su **texto literal**. Reescribir su fundamento contra la normativa nueva produciría un ADR que dice haber decidido algo que **en su fecha nadie decidió**, y §4.1 lo prohíbe por la misma razón por la que no se rellena una sección sin fuente.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.6/`.

**Queda anotado:** **el inventario de detenciones nunca se miró completo.** Hay **más de quince** puntos obligatorios donde el proceso se detiene y pregunta; cada uno está justificado por separado y **nadie midió la suma**. El modo de falla está identificado desde la 8.11: **un proceso que pregunta demasiado enseña a contestar sin leer**. Esta entrada lo tuvo presente —por eso el contradicho reusa §7.0— pero no lo resuelve.

---

## [9.6] - 2026-08-17

**`Migracion-Rules.md` §4.3.1 sabía todo sobre los enlaces y no lo decía como paso.** Tenía la disciplina de dos pasadas, la resolución de destino, la prohibición de sustituir patrones y la constancia de que un documento que cambia de profundidad recalcula todos sus enlaces. **Todo eso estaba escrito como lección**, repartido en la prosa de la subsección, y por eso **se redescubría en cada corrida**: alguien archivaba, aparecían enlaces rotos, los arreglaba a mano y lo contaba.

**Mover un documento tiene una consecuencia mecánica sobre sus enlaces. No es criterio: es aritmética**, y por lo tanto se ejecuta y se verifica en lugar de recordarse.

### Agregado — el procedimiento de mover un documento

Se corre completo cada vez que un documento cambia de ubicación:

1. **Antes de mover, resolver y registrar.** Cada enlace relativo se anota por su **destino absoluto desde la raíz del árbol**. Los que **ya no resolvían** se registran aparte como **rotos previos**: se declaran y **no se arreglan de paso**, porque arreglarlos ahí los borra del registro de lo que estaba mal antes.
2. **Mover.**
3. **Re-derivar** cada enlace desde la ubicación nueva hacia el mismo destino absoluto. **La profundidad cambió; el destino no.**
4. **Reconectar los entrantes** por resolución de destino, **sólo sobre los que dejaron de resolver**. Nunca por sustitución de patrón: en una corrida real rompió **181 enlaces donde había 96**.
5. **Verificar comparando conjuntos, no cantidades.** Los que resolvían antes resuelven después, uno por uno, y el conjunto de rotos previos es **idéntico**. Un recuento igual puede esconder que se rompió uno y se arregló otro — la misma lección que el audit incorporó en la 8.9.

**Por qué el paso 1 va antes de mover.** Después del movimiento, un enlace roto **no dice adónde quería ir**: la ruta relativa vieja no se puede resolver desde la ubicación nueva, y reconstruir la intención es adivinar. Medido: un archivado sin ese paso dejó **658 enlaces colgados**.

- **`Migracion-Rules.md` 3.5 → 3.6.** El procedimiento en §4.3.1 y su **criterio de aceptación enumerable** en §6.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.5/`.

---

## [9.5] - 2026-08-17

**R2 enumeraba cinco salidas y no decía cuál convenía.** El prompt declaraba «el humano elige; este prompt no», y lo aplicaba a dos cosas distintas: **no decidir**, que es correcto, y **no opinar**, que no lo es. R0 mide seis dimensiones, el diff normativo artefacto por artefacto y el estado del repositorio — **presentar todo eso y callarse la conclusión le devuelve al humano el trabajo que el orquestador acaba de hacer**.

### Agregado — la recomendación

- **`Master-Prompt-Reanudacion.md` 1.4 → 1.5, §4.0.** R2 publica una **recomendación con su fundamento** antes de la tabla: continuidad del origen, alcance real del salto, volumen alcanzado, estado del repositorio, divergencias abiertas, **costo de no hacerlo hoy** y **alternativa razonable**. Esta última es obligatoria y no por cortesía: **una recomendación sin segunda opción se lee como un único camino y el humano deja de mirar**.

### Agregado — el umbral de continuidad

**La salida C parecía siempre disponible, y no lo es.** El criterio que la hace viable **ya vivía en el framework** desde la 4.0 y nadie lo consumía para esto: el bloque «Impacto sobre destinos existentes» que §VI.4 exige en toda entrada major. **Un major cuyo bloque no está vacío alcanza artefactos del destino, por definición.**

| Major con impacto que atraviesa el salto | Qué le pasa a C |
| --- | --- |
| Ninguno | El desfase es de proceso: correcta y barata |
| Uno | Deuda acotada y conocida: viable |
| **Dos o más** | **Ninguna regla vigente puede auditar ni extender ese corpus** |

**Por qué dos es cualitativamente distinto de uno.** Uno deja un destino que las reglas vigentes leen mal **en un punto**. Dos dejan un destino cuyas **estructuras** —dónde vive cada categoría, cómo se numeran los identificadores, de qué nivel cuelga cada artefacto— ya no son las que describe ninguna regla actual. Seguir construyendo ahí **produce documentación nueva con la forma vieja**, y cada documento agregado **agranda la migración futura en lugar de acercarla**.

**Sobre procedencias tempranas, C no se recomienda nunca**, y se dice por qué: sus identificadores no son direcciones válidas —el ámbito de unicidad en el producto no existía— y su layout no existe.

### Agregado — el encadenamiento después de reparar

La salida A vuelve a R0 y **la pregunta reaparece**. Estaba en la mecánica y no en lo que el humano ve, con lo cual quien eligió A **llegaba a la segunda vuelta sin saber que era la segunda vuelta**. Ahora la recomendación **se recalcula** y R2 nombra la pregunta pendiente: migrar o seguir.

**El informe de R3 suma la recomendación y su fundamento**, porque sin el fundamento escrito **una decisión correcta y una arbitraria se ven igual** seis meses después.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.4/`.

**Queda anotado:** el umbral **es tan bueno como el bloque de impacto de cada major**. Si una entrada major lo declaró vacío por descuido, el umbral la cuenta como sin impacto y **recomienda C donde correspondía B**. Lo que cambia es que ese bloque tiene ahora un segundo consumidor, que lo vuelve verificable por sus consecuencias.

---

## [9.4] - 2026-08-17

**T3 prohibía algo que T0 no puede detectar. Pasa a admitirlo y pedir que se declare.**

Una rama puede terminar con **dos unidades adentro** por motivos legítimos —una reparación que aparece a mitad de una fase y que dejar afuera rompería la rama, dos pasos que resultaron inseparables— y también por descuido. **Los dos casos se tratan igual**: la entrega de T4 nombra las **dos**, en su orden, y dice **cuál se puede revertir sin la otra**.

Con eso el humano recupera lo que T3 protege —**decidir con la información completa**— aunque ya no pueda decidir por separado. **Lo inaceptable pasa a ser la rama que lleva dos y declara una**, que es el único punto de §12.1 que descansa entero en quien la escribe.

**El fundamento, que vale más allá de este caso:** una prohibición sin control **se incumple en silencio**; una obligación de declarar **deja rastro**. Cuando la comprobación mecánica no existe y no puede existir, la regla útil no es la que prohíbe: es la que obliga a decirlo.

### Cambiado

- **`Master-Prompt.md` 8.2 → 8.3.** T3 suma el tratamiento del caso y su condición de inaceptabilidad; el bloque de entrega de T4 suma la fila `Unidades`; T0 deja de declararlo como «lo que no puede comprobar» a secas y remite a T3.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.3/`.

---

## [9.3] - 2026-08-17

**La 9.2 dejó anotado que T3 no tenía comprobación mecánica. Se cierra la mitad que producía daño.**

**`Master-Prompt.md` §12.1 suma T0, la compuerta de arranque.** Antes de la primera escritura de cualquier unidad de trabajo, el orquestador contrasta el repositorio local contra el remoto y resuelve cinco preguntas: árbol limpio, parado en la principal, principal al día, **ninguna rama empujada sin fusionar**, y ninguna rama local ya fusionada por borrar.

**La cuarta es la que vuelve verificable a T3.** T3 pedía una unidad de trabajo por pull request; lo que nadie comprobaba era **que no hubiera dos unidades vivas a la vez**. Empezar una segunda mientras la primera espera merge produce dos ramas que se pisan sobre los mismos documentos, y el humano **no puede aceptar una y rechazar la otra** — que es exactamente lo que T3 existe para preservar.

**La salida se publica siempre, también cuando está todo en orden**, y eso no es ceremonia: es lo que permite saber **contra qué estado** se hizo lo que sigue, y la única forma de distinguir «no había nada que arreglar» de «no se miró».

### Cambiado

- **`Master-Prompt.md` 8.1 → 8.2.** **T0** nueva, con su tabla de cinco comprobaciones y su bloque de salida. **T5 pasa de verificar a verificar y preparar**: poda las referencias remotas, y **comprueba si la principal trajo algo más** —trabajo de otra sesión o de otra persona, que vuelve viejo lo que se midió antes del merge— antes de seguir apoyándose en ello. Deja el repositorio en el estado que la unidad siguiente necesita y lo publica con el formato de T0, porque **arrancar lo próximo sobre un local a medio actualizar produce la unidad siguiente sobre un estado que ya no existe**.
- **`Master-Prompt-Reanudacion.md` 1.3 → 1.4.** El paso 0 de R0 **corre T0** en vez de describir sus comprobaciones por su cuenta, y declara los **dos resultados que la detienen**: árbol sucio y **entrega viva** —diagnosticar mientras una unidad anterior no cerró produce un informe sobre un estado que está por cambiar—. El bloque `REPOSITORIO` de R1 adopta el formato de T0.
- **`Master-Prompt-Migracion.md` 2.4 → 2.5.** El prerrequisito de M0 pasa de T2 a **T0**, y suma el caso de la entrega viva: con una fase anterior esperando merge no se arranca la siguiente.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.2/`.

**Queda anotado, y ahora vive en §12.1 y no en una nota:** que una rama lleve **dos unidades adentro** no lo detecta nada. La única señal es el tamaño del pull request.

---

## [9.2] - 2026-08-17

**El protocolo de traspaso por pull request se usaba en corridas reales y no estaba escrito en ningún lado.** Se verificó buscando «rama», «commit» y «pull request» en los tres orquestadores: **cero apariciones normativas**. Y sin embargo el ciclo —rama, commit, push, aviso al humano, merge del humano, aviso de vuelta— gobernó migraciones enteras.

**Que funcionara sin estar declarado es lo que hizo que nadie lo verificara**, que es la misma forma que `Master-Prompt-Reanudacion.md` §1 describe para el estado de un destino. **Y falló apenas se salió del carril:** un destino quedó con **452 cambios sin commitear en la rama principal, 428 de ellos borrados**, con una migración estructural a mitad de camino. Nada estaba mal hecho — nadie había declarado cuándo se pone a salvo.

### Agregado — `Master-Prompt.md` §12.1, el traspaso por pull request

La leen los tres orquestadores; los otros dos la citan y no la redefinen.

- **T1 · El agente no fusiona.** Crea la rama, commitea, empuja y entrega. **El merge es el único control que no es del agente**: uno que fusiona su propio trabajo no se ahorra un paso, elimina la revisión.
- **T2 · Nada se escribe sobre un árbol sucio.** No es higiene: el historial del repositorio es el **contraste observable** de dos de las seis dimensiones del estado, y **no incluye lo que no está commiteado**. Sobre un árbol sucio, el informe declara «coincide» o «diverge» sin base.
- **T3 · Una unidad de trabajo, un pull request**, declarada antes de empezar: una fase, una consolidación, una reparación. Dos en la misma rama impiden aceptar una y rechazar la otra, que es para lo que el humano mira.
- **T4 · La forma de la entrega y la detención**, con **«qué sigue después del merge» obligatorio**.
- **T5 · El aviso del humano se verifica, no se cree.** Se comprueba que el commit entregado es alcanzable desde la principal. No es desconfianza: son dos sesiones distintas, y seguir sobre una principal que no tiene el trabajo produce la unidad siguiente **encima de un estado que no existe**.
- **T6 · Qué no cubre**: gobierna el traspaso, no el contenido.

### Agregado — la reanudación normaliza antes de medir

- **`Master-Prompt-Reanudacion.md` 1.2 → 1.3.** **R0 paso 0**: contrastar el árbol contra el remoto y, si hay algo sin poner a salvo, **ése es el primer trabajo y no se hace ningún otro**. **R1** suma el bloque `REPOSITORIO`. **R0 paso 5** detecta una **migración en curso** por tres señales —plan emitido, `_fusion/` con contenido, sin informe con veredicto—.
- **`Master-Prompt-Migracion.md` 2.3 → 2.4.** Cita §12.1 y declara **T2 como prerrequisito de M0**: sobre un árbol sin commitear no se empieza a migrar, porque la clasificación de M2 y el censo de M3 se medirían sobre un estado que el historial no registra.

### Agregado — la salida que faltaba, y las tres columnas

**Las salidas eran cuatro y una migración en vuelo no encaja en ninguna.** La dimensión 3 la detecta, pero **elegir B la reempieza**: el migrador arranca en M0 y reconstruye un plan ya escrito sobre un árbol que ya pasó las fases estructurales. Se observó en un destino con **170 documentos en diez carpetas `_fusion/`**, donde **la única salida correcta no estaba en la lista y la más parecida era la que la destruía**. Entra **E · Retomar la migración en curso**.

Y R2 suma **tres columnas** —**en qué estado te deja**, **¿vuelve a preguntar?**, **qué no resuelve**—, porque las salidas describían **qué invocan** y quien elige necesita saber **qué le pasa a él**. El caso que lo prueba es **A**, que repara y **vuelve a R0**, repitiendo la misma pregunta: correcto por diseño, y no se deducía de su texto.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.1/`.

**Queda anotado:** **T3 no tiene comprobación mecánica.** Un orquestador puede acumular dos fases en una rama y la única señal es el tamaño del pull request.

---

## [9.1] - 2026-08-16

**Cinco intervenciones seguidas cometieron el defecto que corregían** —la 8.7, la 8.12, la 8.13, la 8.15 y la 8.17—, y la quinta lo cometió **una intervención después** de escribir la regla que lo evita. La 9.0 dejó anotado que la regla 4 «no funciona como control, porque se cumple cuando alguien se acuerda de correrla», y declaró que volverla mecánica exigía decidir contra qué se corre.

**Ese diagnóstico era falso, y comprobarlo llevó cinco búsquedas.** Los cinco conceptos tenían una **forma anterior literal**:

| Concepto | Forma anterior | Vivas hoy |
| --- | --- | --- |
| Layout de la 8.0 | `Proyectos/` | **1**, declarada |
| Vocabulario de la 6.0 | `README §5` | 0 |
| Nivel del despacho | `{{NOMBRE_PROYECTO_CODIGO}}` | 0 |
| Eje del principal | `proyecto de código principal` | 0 |
| Cabecera del documento generado | `**Proyecto de código:**` | 0 |

**Ninguna era difícil de encontrar. Ninguna estaba escrita en ninguna parte.** Lo que faltaba no era que el concepto fuera expresable: era que **nadie lo expresaba**. El barrido dependía de que quien interviene recordara qué buscar, y cinco veces seguidas la memoria falló donde un `grep` no habría fallado.

### Agregado

- **`SDD-Development-Guide.md` 1.14 → 1.15. §VI.3.2 es nueva: el barrido se declara como patrón y se corre.** Toda intervención que cambia un concepto declara el par **forma anterior / forma vigente**, con la anterior expresada como **patrón de búsqueda y no como descripción** —«el nivel del bloque técnico» no sirve; `**Proyecto de código:**` sí—.
- **El residuo aceptable es cero fuera de las exclusiones enumeradas una por una con su motivo**, y las **seis clases de exclusión se declaran de una vez** —filas de control de cambios, `_legacy/`, `Bootstrap/`, notas de coherencia anteriores, rutas ilustrativas y renombres declarados— para que no se redescubran en cada intervención.
- **La regla 4 se corre con los mismos patrones sobre el texto propio.** Es la parte que faltó las cinco veces: el barrido se corrió sobre el árbol y **no sobre lo que la intervención acababa de escribir**, que es el único lugar donde nadie mira.
- **La comprobación 8 de §VI.3** se reformula como corrida con residuo cero, y la forma de la nota de coherencia suma la **sección de barrido declarado**: sin ella, la comprobación 8 no es verificable por nadie que no sea quien la corrió.

### El límite, declarado

**Cubre los conceptos con huella textual** —renombres, cambios de nivel, nombres de variable y de campo— y **no cubre un cambio semántico sin forma anterior distinta**. Cuando la 8.14 pasó a exigir que toda fuente declarativa nombre a su responsable, no había ninguna cadena vieja que buscar: el defecto era una **ausencia**, y una ausencia no se encuentra con un patrón. Para ésos la regla 4 sigue siendo una lectura, y la nota lo declara en lugar de simular una corrida.

**Un control que dice qué no cubre es un control; uno que pretende cubrir todo es lo que nos trajo hasta acá** — la comprobación 4 decía «sin contradicción entre lo escrito y lo que ya estaba», y tres intervenciones la pasaron con una contradicción adentro.

**Queda anotado:** el control nuevo **no impide el sexto caso**, lo vuelve detectable **en la misma intervención en lugar de en la siguiente**. Una intervención que no declara su patrón puede cerrarse igual; lo que cambia es que su nota queda visiblemente incompleta y la comprobación 8 no se puede marcar.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.0/`.

---

## [9.0] - 2026-08-16

**El intake valida un eje y el manifiesto que se deriva de él validaba el otro.** `Intake-Rules.md` §4 declara como bloqueante que haya *exactamente una **unidad de entrega** principal*. El `PRODUCT-MANIFEST` —la fuente única de verdad del producto— pedía en su bloque §1, en sus validaciones §4 y en su checklist §7 un ***proyecto de código* principal**. Dieciocho lugares vivos seguían nombrando el eje anterior, y el glosario de la guía de usuario ya lo delataba: definía «Proyecto de código principal» como **«la unidad de entrega cabeza del producto»**. La definición se había migrado en la 8.0 y el término no.

**Y el bloque que gobierna toda la generación era de un solo eje.** `Master-Prompt.md` §3.4 —lo primero que el orquestador imprime y lo primero que un subagente ve— enumeraba proyectos de código llevando `tipo_unidad_entrega`, `redistribuible` y `path-docs`: exactamente la mezcla que `Intake-Rules.md` §4 valida como imposible, y que la **8.12** corrigió en la regla sin llegar hasta acá.

**Cómo aparecieron.** Aplicando a la 8.17 la regla que la 8.17 acababa de escribir —**entrar en los bloques de ejemplo**— y su regla 4: *«¿mi intervención cometió el defecto que corrige?»*. La respuesta era sí. **Quinto caso seguido del mismo patrón, esta vez con un intervalo de una intervención.**

### Impacto sobre destinos existentes

**Renombres de artefacto**

| Nombre anterior | Nombre vigente | Naturaleza |
| --- | --- | --- |
| `Proyecto de código principal` | `Unidad de entrega principal` | campo, en `PRODUCT-MANIFEST` §1 y en el README raíz |
| `proyecto-de-codigo-principal` | `unidad-de-entrega-principal` | campo, en el bloque informativo de `Master-Prompt.md` §3.4 |
| `orden-topologico` | `orden-topologico-de-compilacion` **+** `orden-de-integracion` | campo, partido en dos: no son el mismo grafo |

**Secciones movidas o partidas**

| Documento | Sección anterior | Destino vigente |
| --- | --- | --- |
| Bloque informativo de `Master-Prompt.md` §3.4 | «Proyectos de código», un bloque con D8 y `redistribuible` | Tres bloques: **unidades de entrega** (§2.A), **proyectos de código** (§2.B) y **matriz de composición** (§2.C) |

**Campos bloqueantes nuevos**

| Documento | Campo | Regla que lo exige |
| --- | --- | --- |
| — | — | Ninguno. El conjunto de campos no cambia; cambia **a qué eje se le piden** |

### Cambiado

- **`PRODUCT-MANIFEST-template.md` 5.0 → 6.0** y **`Root-Rules.md` 5.4 → 6.0.** El campo pasa a `Unidad de entrega principal`, con el valor tomado de la fila señalada `(principal)` en §13.1 del intake. Los **dos ejemplos de README raíz** de `Root-Rules.md` §7 encabezaban su tabla con `| Proyecto de código | Tipo D8 | … | Redistribuible |`: una tabla del eje de construcción llevando dos atributos del eje de entrega.
- **`Master-Prompt.md` 7.11 → 8.0.** §3.4 pasa a los tres bloques, con la constancia de que ningún D8 sale del eje de construcción y ninguna `Identidad-Codigo` del de entrega. **El bloque mezclado era la forma más directa de que un subagente confundiera los ejes, porque es lo primero que recibe.**
- **Once reglas de categoría, `Deriva-Rules.md` y `Maqueta-Rules.md`**, patch cada una: su prompt de despacho decía «de la **unidad de entrega** `{{NOMBRE_PROYECTO_CODIGO}}`». **La prosa se migró en la 8.0 y el marcador no**, con lo cual la primera línea que el subagente lee nombra el nivel correcto con una variable que el contexto ya no define.
- **`Rules-Plan-Sprint.md`, `Rules-Documentacion.md`**: la cabecera de sus ejemplos **rellenos**, que la 8.17 no alcanzó por haber reemplazado sólo la forma con marcador. **`Rules-Necesidades-Negocio.md`**: la tabla de cabecera de sus dos ejemplos.
- **`PRODUCT-INTAKE-template.md` 3.3 → 3.4.** El árbol de §16 se contradecía en la misma línea —«categorías 00-11 (**por proyecto de código** bajo `Unidades-Entrega/`)»— y condicionaba las maquetas a que «algún proyecto de código» ejecutara la Fase B2, cuando `requiere_maqueta` se evalúa por unidad de entrega.
- **`Migracion-Rules.md` 3.4 → 3.5.** La señal de clasificación «es el proyecto de código principal» habría quedado circular con el renombre: pasa a **«el intake lo señalaba como principal»**, que es lo que el agente lee del origen.
- **`SDD-User-Guide.md` 1.14 → 1.15.**

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.17/`.

---

## [8.17] - 2026-08-16

**Cuatro hallazgos que aparecieron al verificar que no quedaba nada pendiente, en lugar de contestarlo de memoria.**

### Corregido — la cabecera que todo documento generado copia

Las diez reglas de categoría definen, en su §4.1, la cabecera que lleva **cada documento que el framework genera**. Las **veintiséis** empezaban con `**Proyecto de código:** {{Nombre-Proyecto-Codigo}}`, cuando desde la 8.0 esos documentos pertenecen a una **unidad de entrega**. **Ninguna de las diez usaba `Unidad de entrega:`: cero de veintiséis.**

**Es la tercera capa del mismo cambio de la 8.0, y explica por qué tres barridos la pasaron de largo.** La 8.12 buscó en reglas y plantillas, la 8.13 en rutas y tablas, la 8.15 en citas y flags: **ninguna abrió los bloques de ejemplo cercados**, y la cabecera vive ahí. Y es el peor lugar donde dejarlo, porque **un ejemplo no se lee, se copia**.

- Las **diez** reglas de categoría, patch cada una.
- **`SDD-Development-Guide.md` 1.13 → 1.14.** §VI.3.1 suma la **quinta regla del barrido**: entrar en los bloques de ejemplo, porque **un cerco de código no es un límite del barrido**.

### Corregido — un renombre que no se propagó ni dentro de su propio archivo

**`Rules-Arquitectura-Tecnica.md` §2.1 había renombrado el artefacto a `Arquitectura-Unidad-Entrega.md`**, y el nombre viejo seguía vivo en **siete** lugares: cuatro en el mismo archivo —§4.2, el criterio de aceptación de §6, el ejemplo de §7 y los insumos de §5— y tres afuera —la tabla del plan maestro, la plantilla de intake y el árbol de la guía de usuario—.

**El criterio de aceptación es lo grave:** el audit verificaba la existencia del **nombre viejo**, de modo que un documento generado con el nombre correcto **lo habría reprobado**. `Migracion-Rules.md` §111 ya declara que un renombre de artefacto es el único cambio que **ningún diff de versiones puede inferir**; hay que propagarlo a mano, y no se propagó.

- **`Master-Prompt.md` 7.10 → 7.11**, **`PRODUCT-INTAKE-template.md` 3.2 → 3.3**, **`SDD-User-Guide.md` 1.13 → 1.14** y la regla de la categoría 05.

### Corregido — dos notas declaraban pendiente lo que la 8.15 cerró

`Coherencia-Barrido-Layout-8.0.md` §6 decía «quedan dos conceptos grandes sin barrer» y `Coherencia-Barrido-8.7-Dos-Ejes.md` §6 decía que barrer retroactivamente era de otra escala. **Las dos habían quedado afirmando lo último que alguien escribió**, que es literalmente el defecto que la 8.14 vino a regular. Las dos pasan a «y cómo se cerró». **`Root-Rules.md` 5.3 → 5.4**: §4.2 titulaba «Proyectos de código del producto» una sección cuyo contenido es la tabla de unidades de entrega.

### Declarado — la falsa alarma de la comprobación de enlaces

Los catorce «enlaces rotos» del árbol son **rutas ilustrativas dentro de los ejemplos de las reglas**, que describen el árbol de un destino y no tienen por qué resolver desde la ubicación de la regla. §VI.3 comprobación 3 las excluye: sin la exclusión son catorce avisos permanentes, y **una comprobación que avisa siempre es una comprobación apagada** —el mismo argumento con el que la 8.3 excluyó `_legacy/`—.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.16/`.

**Queda anotado:** los cuatro hallazgos aparecieron porque el Product Owner preguntó si quedaba algo, no porque una comprobación los levantara. Es el cuarto caso seguido. Lo que sí mejoró es que las cuatro veces la respuesta se obtuvo **verificando y no recordando**.

---

## [8.16] - 2026-08-16

**Se midió lo que la 8.4 había dejado como condición, y el resultado descarta la variante que llevaba cuatro versiones anotada.** `Coherencia-Referencias-Derivadas.md` §5 proponía que los documentos citaran **sólo por identificador** y la ruta se derivara de un índice de nivel producto, con una condición explícita para evaluarla: medir antes qué proporción del corpus referencia por ruta y cuál por identificador.

**Corpus medido: 759 documentos de tres destinos reales.**

| | Cantidad | Proporción |
| --- | --- | --- |
| Citas por identificador | 34 489 | **90,1 %** |
| Enlaces por ruta | 3795 | **9,9 %** |
| De las rutas: apuntan a un documento **con** identificador | 2099 | 55,3 % |
| De las rutas: apuntan a un documento **sin** identificador | 1696 | **44,7 %** |
| Enlaces rotos hoy | 3 | **0,08 %** |

**Tres razones, y la tercera es la que cierra:**

1. **El corpus ya cita por identificador nueve de cada diez veces**, y no porque una regla lo exija. La variante impondría estructuralmente lo que la práctica ya hace.
2. **Casi la mitad del 10 % restante no es sustituible.** Apunta a `README.md`, a la especificación de una categoría, a un índice: documentos **sin identificador**, que ningún índice de nivel producto puede direccionar. El techo de la variante es el **55 % del 10 %**.
3. **El índice sería una fuente declarativa nueva que hay que mantener, y no es subproducto de ningún acto.** Agregar un documento obligaría a acordarse de indexarlo. Es la clase de fuente que la **8.14** acaba de mandar evitar en `Master-Prompt-Reanudacion.md` §1.1 R3. **Cambiaríamos 3 enlaces rotos por un índice que se degrada en silencio**, que es el defecto más caro de los dos.

### Cambiado

- **`Coherencia-Referencias-Derivadas.md` 1.1 → 1.2.** §5 pasa de «lo que queda anotado» a **cómo se cerró**, y **§5.1** es nueva con la medición completa, su desglose por destino y la salvedad de que los tres corpus están generados contra el conjunto 6.0 —anterior a la condición que hace posible la variante—, con el argumento de por qué la medición sigue valiendo: captura **cómo se escribe**, y nadie escribió esas 34 489 citas porque una regla se lo pidiera.

**Ninguna regla, plantilla ni orquestador cambia**, y por eso el conjunto sube **patch**. El conjunto superado se archiva en `_legacy/8.15/`.

---

## [8.15] - 2026-08-16

**Tercer barrido retroactivo**, sobre los dos conceptos grandes que quedaban de intervenciones anteriores a la 8.9: el vocabulario de la **6.0** —la unificación del intake, que eliminó `PROJECT-BRIEF` y `PROJECT-README`— y los dos ejes de la **8.0** más allá de lo que la 8.12 y la 8.13 cubrieron.

**El vocabulario de la 6.0 estaba limpio, y conviene decirlo.** Las apariciones vivas de los nombres viejos son registros históricos, evidencia no editable de `Bootstrap/`, o renombres declarados —«reemplaza a las antiguas…»— que son lo que permite reconocer un destino generado con la versión vieja. **Que la 6.0 haya quedado limpia y la 8.0 no es informativo:** la 6.0 renombró **artefactos**, y un nombre de artefacto que sobrevive se ve; la 8.0 cambió **niveles**, y un nivel equivocado se lee bien.

### Corregido — ocho citas a una sección de un documento que no existe

**`Master-Prompt.md` citaba ocho veces `README §5 del proyecto de código`:** una sección del `PROJECT-README` que la **6.0 eliminó**, en el nivel que la **8.0 cambió**. Los dos conceptos en la misma línea.

**Cinco de las ocho son el origen de flags de gating** —`multi_tenant`, `tiene_auth`, `tiene_portal_developers`, `tiene_extensibilidad` y `tiene_observabilidad_critica`—. Las cinco filas **se contradicen dentro de sí mismas**: declaran el nivel «unidad de entrega» en su segunda columna y leen el valor del proyecto de código en la tercera, de un documento inexistente. Sus dos filas vecinas sí se habían migrado, lo que muestra que la 8.0 corrigió esa tabla **fila por fila y no terminó**.

**Por qué no lo detectó nada:** un subagente al que se le pide leer una sección inexistente no falla, **infiere el valor**. Y un flag de gating inferido decide qué categorías se generan y cuáles se omiten, produciendo documentación que parece correcta.

- **`Master-Prompt.md` 7.9 → 7.10.** Las ocho citas pasan a `PRODUCT-INTAKE` §17 de la unidad de entrega, con la misma numeración de P. Se corrigen además el origen y el impacto de los cinco flags, que nombraban categorías «del proyecto de código» cuando viven bajo `Unidades-Entrega/`.
- **`Rules-Devops.md` 4.2 → 4.3.** §0.2 declaraba **dos** matrices de artefactos publicables —«por unidad de entrega, la matriz de artefactos publicables por proyecto de código»—: la actualización de la 8.0 agregó la nueva **sin retirar la vieja**. Hay una sola: se construye por proyecto de código y **se publica por unidad de entrega**.
- **`SDD-User-Guide.md` 1.12 → 1.13** y **`Marco-Teorico-SDD.md` 3.2 → 3.3.** Las Fases B a G se recorren por unidad de entrega en el orden topológico del **grafo de integración**, y la consolidación de producto tiene los **dos** grafos con su matriz.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.14/`.

**Queda anotado:** los tres barridos retroactivos encontraron algo, y los tres se corrieron **por decisión explícita del Product Owner**. El criterio que la 8.12 fijó —«cuando una intervención vieja se toca por cualquier motivo, su concepto se barre entonces»— **no se disparó ninguna de las tres veces**. Y los tres dan la misma respuesta sobre qué clase de defecto sobrevive: **la tabla, no la prosa**.

---

## [8.14] - 2026-08-16

**Se cierra el único pendiente que una nota de coherencia declaraba sin resolver:** una dimensión del estado cuya fuente **nadie tenía obligación de mantener**. Lo destrabó una instrucción del Product Owner —«cuando no tengas dueño, colocá un dueño genérico, y con eso lo resolvés y no dejás algo boyando»— sobre una solución que yo había descartado.

**La había descartado mal.** Mi argumento era que declarar el dueño no alcanzaba, porque el registro que se degradó ya declaraba su regla de mantenimiento. Al ir a leerla, decía: *«se actualiza en la rama de la etapa, no después de la fusión»*. **Declara el cuándo y no declara el quién** — es una oración sin sujeto, y una obligación sin sujeto no la incumple nadie en particular. Faltaba un dueño, literalmente.

**La otra mitad se sostiene, y la evidencia es fuerte.** Esa dimensión tenía **dos** fuentes declarativas y **las dos se degradaron**: el registro quedó en la etapa `b` con el código en la `e`, y las etiquetas por etapa cerrada que el pipeline declaraba como **el** instrumento de versionado nunca se crearon —**cero en todo el repositorio**—. Lo único intacto fue el **nombre de la rama en cada confirmación de fusión**, que nadie tuvo que acordarse de escribir porque fusionar lo escribe.

### Agregado — las tres reglas

- **`Master-Prompt-Reanudacion.md` 1.1 → 1.2.** §1 suma la columna **«quién la mantiene»** a las seis dimensiones, y **§1.1** es nueva:
  - **R1** · Toda fuente declarativa nombra a su responsable **en el propio documento**, no en un plan ni en una regla del framework.
  - **R2** · Cuando ningún rol del producto corresponde, el responsable es **genérico y sigue siendo obligatorio**: el rol que el producto asigne, si no el perfil de convención del intake, si no **la organización dueña del repositorio**. Un campo vacío se lee como que la pregunta no se hizo.
  - **R3** · Entre dos fuentes posibles, **gana la que es subproducto del acto**. Y su consecuencia: cuando la fuente no es un subproducto, el contraste observable **deja de ser opcional**.
- **`Rules-Devops.md` 4.1 → 4.2.** §4.3 suma los ítems **7 y 8** a `Estrategia-Versionado.md` —el registro del avance con responsable nombrado, y el instrumento preferido— y §4.8 el anti-patrón, con el caso observado.
- **`SDD-Development-Guide.md` 1.12 → 1.13.** La Parte IV suma el bloque «sobre las fuentes declarativas que declares», para quien escribe una regla que crea un documento donde alguien va a declarar un estado.

**No extiende el alcance del framework, que era el temor de la nota anterior.** No le da un prompt al ciclo de construcción ni lo gobierna: exige que el documento **diga quién lo mantiene**, que es una propiedad del documento.

**El framework ya sabía la respuesta y la aplicaba en un solo lugar.** `Rules-Devops.md` §4.8 tenía el anti-patrón «CHANGELOG ausente o no mantenido» resuelto por generación automática desde los mensajes de confirmación: es **R3**, escrito para el registro del **integrador** y nunca aplicado al del **avance del producto**.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.13/`.

---

## [8.13] - 2026-08-16

**El cambio de layout de la 8.0 nunca llegó a la tabla que el orquestador ejecuta.** `Master-Prompt.md` §3.5 declara desde la 7.0 que la documentación de las categorías 02 a 11 se genera **por unidad de entrega**, bajo `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/`. La tabla del plan maestro de §7 seguía declarando el ámbito «proyecto de código» en once categorías y emitiendo a **`SDD/Docs/Proyectos/<Nombre>/`**, en sus **quince filas**.

**El intro de esa misma §7 está treinta líneas más arriba de la tabla que lo contradice**, y dice lo correcto. Es la forma de defecto que la 8.12 encontró en `Intake-Rules.md` §4 —prosa y tabla operativa en desacuerdo dentro del mismo archivo—, pero acá la tabla gobierna toda la generación: **una corrida nueva producía el layout anterior a la 8.0**. Y el criterio de ubicación del audit de §10 verificaba contra la ruta vieja, de modo que **habría aprobado el resultado equivocado**.

**Qué acota el daño:** la migración no lee esta tabla. Un destino migrado quedó correctamente bajo `Unidades-Entrega/`. Lo que rompía era generar un producto nuevo.

### Cambiado — el layout

- **`Master-Prompt.md` 7.8 → 7.9.** Las quince filas de §7 en sus columnas de **ámbito** y **path de salida**; el gating por flag y la variante D8, que se leían del proyecto de código; el `path-docs` del bloque de manifiesto de §3.4; y el criterio de ubicación del audit de §10.
- **Once reglas de categoría y `Deriva-Rules.md`**, patch cada una: la ruta de salida de su prompt de despacho de referencia, que emitía a `SDD/Docs/Proyectos/{{NOMBRE_PROYECTO_CODIGO}}/` y citaba un marcador que el contexto de despacho ya no define.
- **`Root-Rules.md` 5.2 → 5.3.** El Ejemplo A de §7.1 publicaba su mapa de documentación sobre la ruta vieja: el ejemplo canónico de un README raíz contradecía a §2.1 del mismo archivo.
- **`SDD-User-Guide.md` 1.11 → 1.12.** El árbol del caso multi-unidad y el mapa del resumen ejecutivo le enseñaban al usuario una estructura que el framework ya no genera.

### Corregido — 39 concordancias de la sustitución de la 8.0

«Proyecto» es masculino y «unidad de entrega» es femenina. La sustitución léxica de la 8.0 dejó **«algún unidad de entrega»**, **«ese unidad de entrega»**, **«unidades de entrega tipados»**: 39 casos en 13 archivos. Es la clase de defecto que `Vocabulario-Rules.md` §9.5 documenta desde la 5.1, producida por la operación que esa misma sección regula.

### Agregado — la comprobación 10, integridad del registro

Al verificar los controles de cambios aparecieron **seis archivos inconsistentes**, repartidos entre cuatro intervenciones: tres con la fila nueva insertada **antes** de la última en lugar de después, dos con la **cabecera subida sin agregar la fila**, y `SDD-Development-Guide.md` con las dos cosas —cabecera en **1.7** mientras su tabla llegaba a **1.10**—. **Cuatro de los seis son de las tres intervenciones anteriores.**

- **`SDD-Development-Guide.md` 1.10 → 1.12.** §VI.3 suma la **comprobación 10**: la versión de cabecera **es** la mayor fila del control de cambios, las filas están **en orden** y ninguna se repite. La comprobación 5 pedía «una fila por archivo» y se cumplía escribiéndola en cualquier lado. La 1.12 absorbe además la 1.11, que la 8.12 había numerado sobre una cabecera desactualizada.
- Los seis registros quedaron restituidos, incluidas las dos filas que faltaban en `Vocabulario-Rules.md` y `Master-Prompt-Reanudacion.md`.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.12/`.

**Queda anotado:** quedan **dos conceptos grandes sin barrer** —el vocabulario de la 6.0 y el resto de los dos ejes de la 8.0—. Esta intervención confirma por segunda vez el criterio de la anterior: **el concepto sobrevive en la tabla que se ejecuta, no en la prosa que se lee**.

---

## [8.12] - 2026-08-16

**El barrido por concepto se corrió sobre lo que la 8.7 corrigió, y encontró el concepto vivo en cinco archivos más.** La 8.7 es anterior al barrido —que entró en la 8.9—: arregló el lugar donde el defecto se había manifestado, §17 de la plantilla de intake, y declaró ese archivo como su alcance.

**Tres de los cinco hallazgos valen por sí solos:**

- **`Intake-Rules.md` §4 se contradecía consigo mismo a treinta líneas de distancia.** Su mapeo era **una sola tabla** que le pedía a la misma fila el `Nombre-Proyecto-Codigo` y el `tipo_unidad_entrega`, y su paso 2 leía `redistribuible` —atributo de la entrega— de la fila del proyecto de código. Más abajo, el mismo §4 valida: *«Ningún proyecto de código declara un valor D8»*. Un defecto que entra y sale del mismo archivo **no lo cruza ninguna verificación entre artefactos**: es el primer caso cobrado de la coherencia interna que la 8.9 incorporó.
- **`Master-Prompt.md` tenía un marcador roto en el despacho.** Desde la 7.0 el despacho se parametriza por unidad de entrega, pero tres plantillas —el insumo del intake de §8, el bloque de ambigüedad de §9 y el despacho del auditor de §10— seguían citando **`{{NOMBRE_PROYECTO_CODIGO}}`**, que el contexto ya no define. Un marcador sin valor no falla: **se completa con lo que el agente suponga**.
- **El checklist que verifica §17 estaba dentro del archivo que la 8.7 tocó, y no se abrió.** §19 de la plantilla seguía pidiendo «§17 completo para cada proyecto de código». Es exactamente lo que `SDD-Development-Guide.md` §VI.3.1 manda barrer —**el interior de lo ya tocado**— y la primera vez que se cobra.

### Cambiado

- **`Intake-Rules.md` 4.0 → 4.1.** El mapeo de derivación pasa de **una** tabla a **tres** —eje de entrega, eje de construcción y producto—, con la constancia de que ningún campo D8 ni `redistribuible` sale del eje de construcción y ningún `Identidad-Codigo` sale del de entrega. El prefijo de organización de un redistribuible **se resuelve por el puente §13.3** —qué proyecto publica la entrega— y no por la fila. §5 corrige la Parte C, que decía «por cada proyecto de código» contra §2.2 del mismo archivo.
- **`Master-Prompt.md` 7.7 → 7.8.** Los tres marcadores rotos pasan a `{{NOMBRE_UNIDAD_ENTREGA}}`; §2 y §4 nombran el nivel correcto.
- **`PRODUCT-INTAKE-template.md` 3.1 → 3.2.** El checklist de la Parte C pasa a la unidad de entrega vigente y nombra las **dos** tablas de identidad que la 8.7 creó; §16 deja de tratar `redistribuible` como atributo del proyecto.
- **`Vocabulario-Rules.md` 3.0 → 3.1** y **`Marco-Teorico-SDD.md` 3.0 → 3.1.** La cita literal del despacho sigue al original; el glosario del manifiesto declara los dos ejes y la matriz.

### Corregido — el archivo de versiones estaba corrido un lugar

**Al tomar el snapshot de `_legacy/8.11/` se descubrió que cuatro de los cinco anteriores estaban mal.** `_legacy/8.10/` contenía el conjunto **8.11**, `_legacy/8.9/` el **8.10**, y así: todos se habían copiado **después** de aplicar la intervención en lugar de antes, con lo cual cada carpeta llevaba el nombre de una versión y el contenido de la siguiente.

**No es un problema del archivo histórico: es un problema de la migración.** `Master-Prompt-Migracion.md` construye el diff normativo de un salto leyendo `_legacy/`. Con el archivo corrido, **el diff de ese salto sale vacío** y una migración que no tiene nada que aplicar se declara completa sin haber hecho nada. Un snapshot corrido es más dañino que uno ausente, porque el ausente se nota.

- **`_legacy/8.6/`, `8.7/`, `8.9/` y `8.10/` reconstruidos** desde el estado que a cada uno le corresponde, verificados archivo por archivo contra la versión de cabecera que tenían al publicarse. `_legacy/8.8/` estaba bien.
- **`SDD-Development-Guide.md` 1.7 → 1.8.** §VI.5 declara **cuándo** se toma el snapshot —antes de aplicar la intervención—, la consecuencia de tomarlo tarde, la verificación mecánica por versión de cabecera, y que la regla de intocabilidad **no cubre** una carpeta que archivó el conjunto equivocado: reconstruirla no reescribe historia, la restituye.

**§VI.5 decía qué copiar y no decía cuándo**, y ese hueco produjo cuatro errores seguidos sin que ninguna verificación los viera.

**Ninguna invariante modificada, y D8 conforme en el sentido que importa:** los ocho valores no cambian; cambia **a qué eje se le piden**, que es lo que la 8.0 decidió y estos cinco lugares no habían acatado. El conjunto superado se archiva en `_legacy/8.11/`.

**Queda anotado:** las intervenciones anteriores a la 8.9 son todas anteriores al barrido y **ninguna lo corrió**. El criterio que esta entrada fija es que **cuando una intervención vieja se toca por cualquier motivo, su concepto se barre entonces**.

---

## [8.11] - 2026-08-16

**El orquestador de reanudación de la 8.10 diagnosticaba y se detenía.** Lo señaló el Product Owner el mismo día, con una pregunta directa: *«y si no se migra —porque no hay que migrar o porque se eligió no hacerlo—, ¿retomaría, recuperaría el contexto y seguiría?»*.

**La respuesta era no.** Sus cuatro fases terminaban en un informe y sus salidas decían a qué prompt ir, con lo cual **el siguiente volvía a deducir lo que éste acababa de deducir** —el trabajo que el prompt vino a evitar—. Y en la salida más frecuente, continuar la construcción, **no hay «tal otro»**: no tiene prompt, de modo que quedaba un diagnóstico sin punto de continuación.

### Cambiado

- **`Master-Prompt-Reanudacion.md` 1.0 → 1.1.** El informe **deja de ser un diagnóstico y pasa a ser el instrumento de entrega**: suma el **diff normativo** que el orquestador siguiente consume, la **decisión** con su autor y su fecha, y el **punto de continuación** —la etapa que sigue, su puerta de entrada y los documentos que la gobiernan—, que existe **para la salida que no tiene prompt**. Entra **R4, la continuación**: escrito el informe, se sigue en la misma sesión. Cortar ahí sigue siendo válido; lo que no lo es, es continuar **sin** escribir el informe, porque entonces el contexto vuelve a vivir sólo en la sesión.
- **`Master-Prompt.md` 7.6 → 7.7.** §2.1 **no vuelve a preguntar** cuando la reanudación ya resolvió el desfase: lee la decisión del informe, la informa como decidida y continúa. Caduca al cambiar la procedencia o la versión vigente.
- **`Master-Prompt-Migracion.md` 2.2 → 2.3.** **M1 verifica** el diff normativo que el informe trae, en lugar de reconstruirlo: rehacerlo no lo vuelve más confiable, lo vuelve más lento y arriesga dos diffs del mismo salto que no coinciden.

**La 8.10 cometió el defecto que la 8.9 había escrito para evitar.** Su regla dice que la pregunta final de toda intervención es «¿mi intervención cometió el defecto que corrige?», y acá la respuesta era sí: **un prompt contra la pérdida de contexto que no entregaba contexto**. Es el cuarto caso del mismo patrón, y los tres anteriores están registrados en esa misma regla.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.10/`.

---

## [8.10] - 2026-08-16

**«Si corto a mitad de camino, ¿cómo se continúa desde una sesión limpia?»** La pregunta la hizo el Product Owner al terminar una migración real, y **no había respuesta escrita**: los dos orquestadores declaran detenciones, confirmaciones humanas y auditores invocados desde cero, y ninguno declara cómo se retoma.

**Lo que había en su lugar era una propiedad cierta y no escrita**: el estado vive en el árbol y no en la conversación. Es la razón de ser del framework, y **que fuera cierta sin estar declarada es lo que hizo que nadie la verificara**.

La corrida que produjo la pregunta tenía la prueba del daño: el destino declaraba en su registro de cambios la etapa `b` y su código estaba en la `e` —**tres etapas fusionadas que nunca actualizaron el único documento que declara el avance**, con la regla de actualizarlo escrita en la segunda línea de ese mismo documento—. Una sesión limpia habría concluido que faltaba arrancar la `c`. En la misma corrida divergieron otras dos fuentes, y las tres tienen la misma forma: **un documento que quedó atrás y sigue afirmando lo último que alguien escribió**.

### Agregado

- **`Master-Prompt-Reanudacion.md` 1.0**, tercer orquestador del método, con la cardinalidad de **una vez por reanudación**. Declara las **seis dimensiones del estado**, cada una con su fuente declarativa y —en las tres que divergieron— su **contraste observable**, con la regla de que **gana el observable y la divergencia se declara**. Cuatro fases, dos detenciones, y **no escribe nada del destino salvo su informe de estado**.
- **`PROMPT-Agente-Reanudacion-SDD.md` 1.0**, tercer prompt de entrada, con la tabla de los tres y su cardinalidad.
- **La cuarta salida no tiene prompt, y es deliberado.** Tres invocan un orquestador —reparar, migrar, seguir en la versión declarada— y la cuarta, **continuar la construcción**, no invoca ninguno. Es la más frecuente y la que más se pasa por alto: un método que sólo ofrece lo que sabe ejecutar **sesga la decisión hacia lo ejecutable**.

### Cambiado

- **`Master-Prompt.md` 7.5 → 7.6.** §2.1 apunta al orquestador de reanudación cuando quien invoca no sabe el estado, y declara que la reconciliación normativa resuelve **una** de sus seis dimensiones.
- **`Migracion-Rules.md` 3.3 → 3.4** y **`Master-Prompt-Migracion.md` 2.1 → 2.2.** «El contrato entre los dos orquestadores» pasa a **nombrarlos**: con tres, la frase seguía siendo cierta y pasaba a ser ambigua.
- **Cinco documentos más** actualizan sus recuentos y sus tablas de ruteo.

**Esta intervención estrena el barrido por concepto de la 8.9**, y lo justificó en su primera corrida: encontró **siete lugares** que decían «dos», y **cuatro no estaban en el alcance que se habría declarado** —dos guías de usuario, la de arranque y un prompt de entrada—. Dos se **desambiguaron en lugar de recontarse** y tres se **dejaron declaradas** por ser registros de lo verificado en su fecha.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.9/`.

---

## [8.9] - 2026-08-16

**La lista de comprobación de coherencia tenía «sin contradicción entre lo escrito y lo que ya estaba», y tres intervenciones seguidas la pasaron dejando una contradicción adentro.** No porque nadie la corriera: porque **está enunciada sobre los archivos tocados**, y los tres defectos vivían en lugares que la intervención había tocado sin mirar, o que ni figuraban en su alcance.

Los tres son el mismo caso. La **8.0** movió el bloque técnico del intake de colgar del proyecto de código a colgar de la unidad de entrega, y **la tabla de identidad dentro de ese mismo bloque** siguió pidiendo el valor D8 al proyecto de código —descubierto **tres versiones después**, completando un intake real—. La misma 8.0 dejó **el orquestador de migración** describiendo el modelo anterior —descubierto **dos versiones después**, al ir a ejecutarlo—. Y su propia nota de coherencia registró que **la intervención cometió el defecto que corregía** en su propio alcance, y aun así volvió a pasar.

**Lo que falló no fue el cuidado: el alcance se declaró por archivo y el cambio era por concepto.**

### Cambiado

- **`SDD-Development-Guide.md` 1.6 → 1.7.** La lista de comprobación de §VI.3 pasa de **siete a nueve**: entra el **barrido por concepto** —enumerar el término en todo el árbol, sin filtrar por el alcance declarado, **incluido el interior de los archivos ya tocados**— y la **coherencia interna de cada artefacto**, que ninguna comprobación entre archivos detecta. Entra **§VI.3.1** con el procedimiento de cuatro pasos, los tres casos que lo produjeron y por qué una plantilla es el peor lugar para dejar una contradicción: no rompe nada hasta que alguien la completa, y es el artefacto con más superficie de contacto del framework.
- **La cuarta regla del procedimiento es la que faltaba y la que más cuesta.** La pregunta final de toda intervención no es «¿toqué todo lo que había que tocar?» sino **«¿mi intervención cometió el defecto que corrige?»**. En los tres casos la respuesta era sí, y en los tres se podía haber contestado antes de publicar.
- **`README.md`** suma la fila de «cambiar un concepto» a su tabla de reglas de intervención.
- **`Coherencia-Plantilla-Intake-Identidad.md` 1.0 → 1.1.** Su §6 pasa de «lo que no resuelve» a **cómo se cerró**: pedía tratar los tres casos juntos y no agregar una comprobación por caso, y así se hizo.

**Esta intervención se verificó con la regla que incorpora.** El barrido por concepto encontró **una** aparición alcanzada fuera de su alcance declarado —una nota de coherencia que citaba «las siete comprobaciones»— y **se declaró en lugar de reescribirse**, porque es un registro de lo que se verificó en su fecha. Es la regla 3 del propio procedimiento.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.8/`.

---

## [8.8] - 2026-08-16

**Lecciones de la primera migración real completa.** Un destino de siete proyectos de código migró de 6.0 a 8.6 y **se llevó la migración hasta el final**: las siete fases, la consolidación de casos de uso, la de la fusión —67 grupos, 143 documentos absorbidos, 9726 líneas— y seis rondas de auditoría. Lo que sigue son las reglas que esa corrida necesitó y que no estaban escritas, cada una con el error que la produjo.

### Cambiado

- **`Migracion-Rules.md` 3.2 → 3.3.** §4.3.1 suma **dos errores de la pasada de aplicación** a los tres que ya tenía: la reconexión se hace **resolviendo destinos y no sustituyendo patrones** —un patrón no sabe desde dónde se lo cita, y en la corrida rompió **181 enlaces donde había 96**—, y **una cita se declara ambigua después de agotar los resolutores**, no antes: cuatro resolutores en cascada llevaron **305 citas «ambiguas» a 16**. Y declara **qué alcanza el árbol de renumeración**, que dejó afuera dos conjuntos que volvieron como hallazgos: las familias que el propio intake acuña —con dos numeraciones de la misma regla conviviendo— y los documentos de referencia cruzada de nivel producto, que caen en el hueco entre dos recorridos.
- **§4.3.2 suma cinco reglas de consolidación.** La **categoría** es la unidad de trabajo y no el documento, porque los documentos de una capa se citan entre sí como vecinos y consolidar de a uno deja a los hermanos apuntando al vacío. **El solapamiento se mide antes de elegir la salida**: en la corrida fue del **5,9 %**, de modo que consolidar no era deduplicar sino **unir con atribución**. Se declaran **cuatro salidas**, con la advertencia sobre la única que **no reduce documentos** —cuatro samples con contratos distintos no se funden en uno con un contrato, se funden en uno que no verifica ninguno—. **Ninguna cifra se promedia**: un promedio de umbrales no es un umbral. Y **la transposición lee el documento entero**, no sólo sus secciones numeradas.
- **§6 suma cuatro criterios de aceptación**, incluida la distinción entre «ninguno se sobrescribió» y «la fusión terminó», que la auditoría de la corrida confundió durante tres rondas.
- **`Master-Prompt-Migracion.md` 2.0 → 2.1.** El formato del diff de estructura suma el renglón de **secciones colapsadas** —el inverso del de partidas, y **el movimiento más grande de la fase** en esa corrida: siete bloques a dos— y dos renglones para **campos que cambian de dueño o desaparecen**. Y declara **cómo se transpone un bloque colapsado sin reescribirlo**, que es lo que vuelve verificable la regla de no invención.
- **`Master-Prompt.md` 7.4 → 7.5.** §10 suma dos criterios de audit: **un recuento que confirma una propiedad no confirma las demás**, y usarlo para afirmar lo que no decide es **P1**; y **toda marca de una comprobación se abre antes de reportarla**, porque un verificador que sobre-reporta entrena a ignorarlo y el día que acierta ya nadie lo mira.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.7/`.

---

## [8.7] - 2026-08-16

**La plantilla de intake se contradecía a sí misma, y el defecto se descubrió usándola.** La 8.0 partió §13 en dos ejes y movió el bloque técnico de §17 de «por proyecto de código» a «por unidad de entrega». **La tabla de identidad de §17 se conservó del bloque anterior** y siguió pidiéndole `tipo_unidad_entrega` (D8) y `redistribuible` **al proyecto de código**, contra lo que §13.2 del mismo documento declara —«los proyectos de código no llevan valor D8»— y contra §13.1, que hace de `redistribuible` una columna de la unidad de entrega.

**El daño no es formal.** Quien completara §17 siguiendo la plantilla **declaraba D8 tantas veces como proyectos tuviera el producto**, y tenía que elegir una forma de entrega para algo que no se entrega. Es el defecto que el modelo de dos ejes existe para hacer imposible, escrito en el documento que lo enseña.

**Cómo apareció.** Migrando un destino real de 6.0 a 8.6, en la fase M2. El agente que completaba el intake tuvo que decidir qué hacer con esa tabla y emitió la contradicción como hallazgo aguas arriba en lugar de copiarla. **Ninguna verificación del framework la había detectado en tres versiones**: la coherencia interna de una plantilla entre dos de sus secciones no la mira nadie.

### Cambiado

- **`PRODUCT-INTAKE-template.md` 3.0 → 3.1.** §17 pasa a **dos tablas de identidad**: la de la unidad de entrega, con su D8, su `redistribuible` y los proyectos que la componen; y la de esos proyectos, con nombre, identidad de código y rol, **sin D8 y sin `redistribuible`**, con la constancia de por qué no los llevan y de que un proyecto compartido aparece en el bloque de cada entrega que compone.
- **Ocho instrucciones de P.1 a P.12** decían «del proyecto de código» bajo un encabezado que dice «por unidad de entrega». Pasan a decirlo de la entrega, con la regla de **nombrar el proyecto cuando el dato es de uno en particular**: P.1 enumera los stacks, P.3 distingue el contrato de integración de §13.1 del de compilación de §13.2, P.6 declara los umbrales **por proyecto y sin promediar**, y P.10 admite los NFR de una capa interna nombrando su proyecto.

Ninguna sección se agrega ni se retira, ningún campo bloqueante cambia y ninguna invariante se modifica. El conjunto superado se archiva en `_legacy/8.6/`.

---

## [8.6] - 2026-08-15

**R5 estaba declarada y nada la verificaba.** La 8.4 incorporó la regla —toda referencia a un artefacto identificado nombra su identificador en el texto visible— y no agregó ninguna comprobación que la exija. La compuerta usaba R5 **solo para reparar** un enlace ya roto.

La consecuencia es la que hace al defecto grave: una referencia **sin ancla pasa todos los controles**, y se descubre en el momento en que su destino cambia, que es exactamente cuando ya no se puede reparar —no hay de dónde deducir a qué apuntaba—.

Es el patrón del reporte `10` cometido por la intervención que lo tenía presente: la regla quedó escrita del lado que no bloquea.

### Cambiado

- **`Master-Prompt.md` §10.0** suma la quinta comprobación de la compuerta: anclaje de las referencias. Es la que hace posibles a las demás, y se verifica **antes** de que se rompa nada.
- **§10** suma el criterio de audit correspondiente, nivel **P2**. No es cosmético: el costo de una referencia sin ancla no se paga al escribirla sino cuando alguien mueve el archivo.

Ninguna invariante modificada. El conjunto superado se archiva en `_legacy/8.5/`.

---

## [8.5] - 2026-08-15

**El orquestador de migración había quedado dos versiones atrás, y la verificación no lo vio.** Detectado al ir a ejecutar la migración real de un destino: el prompt que la conduce seguía hablando del modelo de dos niveles.

### Qué pasó

`Master-Prompt-Migracion.md` estaba en 1.1. Su §2 tomaba «el orden topológico de los **proyectos de código**», su §7 validaba «dos **proyectos de código** principales» y su §8 M4 —la fase larga, la que recorre `SDD/Docs/`— recorría «cada **proyecto de código**». Con la 8.0 el nivel intermedio pasó a la unidad de entrega, y este archivo no se enteró.

**Por qué la verificación de la 8.0 lo dio por conforme.** Porque midió la **ausencia de lo viejo**: contó residuos de `tipo_proyecto_codigo` y de la ruta anterior, y este archivo tenía **cero** de las dos cosas. No porque estuviera migrado, sino porque **nunca las había usado**: ordenaba el recorrido nombrando el nivel en prosa, sin citar la variable. Un archivo que nunca usó el término viejo pasa la comprobación sin haber sido migrado, y ése es el falso negativo.

### Cambiado

- **`Master-Prompt-Migracion.md` 2.0.** M4 recorre **unidades de entrega** en el orden del grafo de **integración**, suma el inventario del eje de construcción en la vista de producto, y declara que los proyectos de código no tienen árbol propio y no se recorren como nivel. §2 y §7 se alinean.
- **La precondición que faltaba**: cuando el salto cambia el nivel de aplicación, M4 ejecuta **primero** la migración estructural de `Migracion-Rules.md` §4.3.2, con su detención de clasificación. No puede recorrer un nivel que el destino todavía no tiene, y hacerlo al revés migra documentos contra un nivel que va a cambiar y obliga a tocarlos dos veces.
- **`SDD-Development-Guide.md` Parte IV** suma cómo se verifica una intervención estructural: comprobar la **presencia de lo nuevo** y no solo la ausencia de lo viejo; explicar cada archivo del alcance que **no cambió**, porque «no le correspondía» y «se olvidó» se ven igual; y, cuando cambia un nivel, revisar que **cada archivo que ordena un recorrido** nombre el nivel nuevo, que es lo que más se olvida porque el orden no suele nombrar la variable renombrada.

### Sobre el origen

Es la cuarta corrección que sale de ejecutar y no de leer, y la primera que sale de **ir a ejecutar**: apareció al abrir el orquestador para lanzar la migración, antes de tocar un solo archivo del destino. Si la corrida hubiera arrancado, habría migrado hacia el modelo que la 8.0 dejó atrás.

El conjunto superado se archiva en `_legacy/8.4/`.

---

## [8.4] - 2026-08-15

**Los seis huecos eran dos causas.** Las versiones 8.1 a 8.3 resolvieron uno por uno los huecos que la migración de un destino real destapó. Con los seis a la vista, el análisis muestra que no eran independientes.

| Causa | Huecos que explica |
| --- | --- |
| **Una referencia es un dato derivado, y el framework la trataba como texto** | El chequeo que incluía snapshots como origen, el archivado que no reescribía rutas, la etiqueta separada de su destino y la profundidad que cambia al fundir |
| **Una operación produce situaciones que su regla no declara** | El puntero del snapshot al renombrar y la colisión de nombres al fundir |

### Cambiado — las referencias

- **`Root-Rules.md` §10 suma R5.** Una ruta relativa codifica dos cosas: la **identidad** del destino, que es un dato declarado, y la **posición relativa** entre dos archivos, que es una relación y se rompe cuando el destino se renombra, el documento se mueve o cambia de profundidad. Es el mismo defecto que R1 a R4 describen para los números. De ahí las dos obligaciones: toda referencia a un artefacto identificado **lo nombra** —`[CU-00014](ruta)`, nunca solo la ruta—, y la ruta se trata como derivada.
- **`Master-Prompt.md` §10.0 pasa de avisar a reparar.** Una ruta que no resuelve pero cuyo identificador existe en el árbol **se recalcula y se informa como reparación**; el hallazgo queda reservado para lo que no se resuelve de forma unívoca. La compuerta deja de acumular avisos de algo que sabe arreglar.

**La evidencia de que esto es recalculable y no interpretable**: de 703 enlaces rotos en el destino migrado, **los 703** se reconectaron resolviendo por identificador, sin una sola decisión humana. Un dato que un guion recalcula al cien por ciento no debería estar escrito a mano.

### Cambiado — las operaciones

**`SDD-Development-Guide.md` Parte IV** suma cuatro preguntas sobre lo que una operación **produce**, no sobre lo que hace. Renombrar deja punteros al nombre viejo, archivar acorta rutas relativas, fundir produce colisiones, propagar hacia una categoría aprobada produce contradicciones: son consecuencias necesarias, no casos exóticos, y sin declararlas cada agente improvisa. Es la misma pregunta que la guía ya hacía sobre los criterios de aceptación, aplicada a los verbos en lugar de a los artefactos.

### Lo que queda anotado y no se hace

La variante estructural: que los documentos citen **solo** por identificador y la ruta se derive de un índice de nivel producto. Resolvería el problema de raíz en lugar de repararlo, y es posible desde la 7.0 porque recién con el ámbito de unicidad en el producto un identificador es una dirección suficiente. La condición para evaluarla queda escrita en `Coherencia-Referencias-Derivadas.md` §5: **antes hay que medir** qué proporción del corpus referencia por ruta y cuál por identificador.

Ninguna invariante modificada. Ninguna documentación emitida deja de cumplir. El conjunto superado se archiva en `_legacy/8.3/`.

---

## [8.3] - 2026-08-15

**Lo que una migración real necesitó y la regla no decía.** Tercera y última corrección salida de ejecutar la migración normativa de un destino de siete proyectos de código. Los seis huecos aparecieron uno tras otro durante la corrida, y **ninguno era detectable leyendo el framework**: el texto era coherente consigo mismo en los seis casos.

### Cambiado — la comprobación de enlaces

- **`Master-Prompt.md` §10.0 excluye los snapshots de `_legacy/` como origen.** Sus referencias no son navegación vigente: dejan de resolver por hechos posteriores —un renombre, un archivado— que no son defectos del árbol vivo. Incluirlos produce el volumen de avisos que desactiva la comprobación, que es lo que ella misma viene a evitar. Los enlaces **hacia** `_legacy/` sí se verifican.
- **§8 suma la reescritura de enlaces al archivar.** Un documento archivado baja uno o dos niveles y todas sus rutas relativas quedan cortas, de modo que cada archivado dejaba colgados tantos enlaces como referencias tuviera el documento. En el destino medido la acumulación llegó a **658 enlaces rotos, todos anteriores** a la migración que los encontró.

### Cambiado — la pasada de aplicación de la migración

`Migracion-Rules.md` §4.3.1 declara que **los punteros de un snapshot sí se reconectan** cuando el documento vivo se renombra. No es modificar su cuerpo: lo que el snapshot dice queda igual y solo se actualiza el destino de un puntero que identifica al mismo documento con su nombre vigente. Un puntero que sigue a su objeto no falsea el registro; uno que queda colgado no preserva nada.

Y suma los **tres errores concretos** que la corrida cometió, con su regla:

1. **La etiqueta y el destino de un enlace son el mismo identificador** y se mapean juntos. Tratarlos por separado deja la etiqueta apuntando a un identificador inexistente, y **la comprobación de enlaces no lo detecta** porque el destino sí resuelve: lo roto es lo que el lector ve.
2. **Un documento que cambia de profundidad recalcula todos sus enlaces**, no solo los que apuntan a algo movido. Al fundir árboles, un documento que baja un nivel deja cortas todas sus rutas aunque sus destinos no se hayan movido.
3. **Los enlaces se reconectan desde un registro confirmado**, con la misma disciplina de dos pasadas que los identificadores. La columna «ya estaba roto antes de migrar» es la que distingue lo que la migración rompió de lo que reparó: en la corrida, de 703 enlaces reconectados **664 ya estaban rotos** y 39 los rompió el renombre.

### Añadido — la fusión de árboles

`Migracion-Rules.md` §4.3.2 declara:

- La convención **`<categoria>/_fusion/<Proyecto-De-Origen>/`** para los documentos que chocan de nombre al fundir —los índices de categoría—. No se sobrescriben ni se fusionan automáticamente: el árbol base conserva el nombre y los demás se preservan con su procedencia en la ruta. La presencia de esa carpeta declara que la fusión no terminó.
- La **propuesta de consolidación de casos de uso** como artefacto obligatorio y **no aplicado**. Al fundir capas, la categoría 02 resultante contiene varias vistas de la misma capacidad; la migración emite los pares candidatos con su semejanza, sus capas de origen y las tres salidas posibles, y no elige. Los cuatro casos de uso de una capacidad no dicen lo mismo, y la unión no es la suma de sus partes.
- Las **citas desnudas ambiguas** como sección del árbol: identificadores citados en prosa cuyo número no existe en el proyecto que los escribe. Se resuelven **leyendo y no contando**, porque el referente está en la oración o en el párrafo. En la corrida fueron 57, de las cuales 44 nombraban su proyecto en la misma oración y 13 no apuntaban a ningún proyecto.

### Sobre el origen de las tres últimas versiones

La 8.1, la 8.2 y la 8.3 salieron todas de **ejecutar una migración**, no de leer el framework ni de un reporte de evidencia. La 8.0 pasó sus comprobaciones estáticas y su nota de coherencia, y llevaba seis huecos que solo aparecen al calcular sobre un producto real. Es el argumento para validar cada versión mayor contra una migración antes de darla por buena, y queda escrito en `Coherencia-Rangos-Por-Familia.md` §5.

Ninguna documentación emitida deja de cumplir. El conjunto superado se archiva en `_legacy/8.2/`.

---

## [8.2] - 2026-08-15

**El árbol de migración declara las familias de identificador que el destino acuñó.** Segunda corrección encontrada al ejecutar la migración de un destino real, y de la misma clase que la 8.1: ninguna comprobación estática podía detectarla.

**Qué faltaba.** `Migracion-Rules.md` §4.3.1 construía el árbol sobre las familias del catálogo del framework y no decía nada sobre las que el destino inventa. Un destino que se choca con un hueco normativo **acuña un identificador para poder seguir**, y esa invención es justamente la evidencia de qué le faltaba al método. Si la migración las ignora, quedan identificadores huérfanos que ninguna regla gobierna y que ninguna comprobación de referencias detecta, porque resuelven entre sí.

**El caso que lo originó.** Un destino de siete proyectos de código había acuñado `P·CU-XX`, con **166 ocurrencias**, para nombrar una numeración de casos de uso de nivel producto que su documento de necesidades preveía. La inventó porque con ámbito de unicidad por proyecto la previsión no podía coincidir con lo emitido: es el incidente que el reporte `01` documenta, resuelto por el destino con un identificador propio. **La 7.0 volvió innecesaria esa invención** al fijar el ámbito en el producto, y sin la pasada nueva la migración la habría arrastrado.

### Añadido

- **`Migracion-Rules.md` §4.3.1, pasada 1.b**: buscar prefijos con forma de identificador que ninguna regla declare y formas calificadas inventadas por el destino; declarar cada una con su forma, sus ocurrencias, el hueco que vino a llenar y su resolución. Las tres resoluciones se evalúan en orden: **retirarla** porque la versión vigente ya cubrió el hueco —la preferible, y la más frecuente—, **adoptarla** como familia del destino con prefijo y ámbito declarados, o **escalarla** como hueco del framework sin resolverla, porque no es una decisión de destino.
- Un criterio de aceptación en §6.

Ninguna documentación emitida deja de cumplir. El conjunto superado se archiva en `_legacy/8.1/`.

---

## [8.1] - 2026-08-15

**El reparto de rangos de identificadores es por familia.** Corrección encontrada al **migrar un destino real** con la versión 8.0, antes de aplicar la migración: es el primer defecto que la validación en corrida destapa, y por eso su origen se declara.

**Qué estaba mal.** `Master-Prompt.md` §3.4 repartía bloques de numeración por unidad de entrega sobre **todas** las familias, y reservaba además un rango para las de nivel producto. Aplicado a la letra sobre un destino de dos unidades de entrega, eso obligaba a renumerar **2.309 citas de `NB`** —de `NB-01` a `NB-90001`— sin que existiera una sola colisión que lo justificara: las necesidades de negocio son de nivel producto, hay un único conjunto y ninguna otra unidad las produce.

**Por qué es un defecto y no una molestia.** La unicidad es **dentro de la familia**: que exista un `NB-00014` no vuelve ambiguo a un `CU-00014`, porque el prefijo los distingue. Repartir bloques donde no hay colisión posible no evita nada y obliga a renumerar, que es la operación más cara y más riesgosa del método —el reporte `01` midió que renumerar treinta y nueve archivos produjo por sí solo dos hallazgos bloqueantes—.

### Cambiado

- **`Master-Prompt.md` §3.4**: el reparto alcanza **solo a las familias que más de una unidad de entrega produce**. Una familia producida en un solo nivel conserva su numeración natural desde `00001` y solo respeta el ancho. El mapa declara **las dos listas** —familias repartidas y familias sin reparto, con su motivo— para que una familia sin bloque se lea como decisión y no como olvido.
- **`Root-Rules.md` §9.1**: la consecuencia operativa se precisa en el mismo sentido.

### Sobre el origen

Es la primera corrección del framework que no sale de un reporte de evidencia ni de un análisis, sino de **ejecutar la migración sobre un destino**. La 8.0 se publicó sin ella porque ninguna comprobación estática podía detectarla: el texto era coherente consigo mismo, y solo al calcular el árbol de migración de un producto concreto apareció el costo de aplicarlo.

Ninguna documentación emitida deja de cumplir. El conjunto superado se archiva en `_legacy/8.0/`.

---

## [8.0] - 2026-08-15

**El nivel de unidad de entrega.** Cierra el pendiente que `Vocabulario-Rules.md` §8 declaraba desde la versión 5.0: la unidad de entrega estaba definida y no era un nivel del layout de salida. Sube major por todo: cambia el layout, el nivel de aplicación de once categorías y el nombre de una variable bloqueante.

**Nota sobre el archivado.** Las versiones 7.0 y 8.0 se publican en la misma intervención, de modo que la 7.0 nunca fue un conjunto vigente que un destino pudiera consumir. `_legacy/` conserva la **6.0**, que es el último conjunto efectivamente superado; no hay `_legacy/7.0/` y no debe haberlo.

La nota de coherencia es [`Coherencia-Unidad-De-Entrega.md`](SDD/Devs/Guides/Coherencia-Unidad-De-Entrega.md).

### El problema, medido

El framework tenía dos niveles —producto y proyecto de código— y los productos reales tienen tres. El nivel intermedio se poblaba con proyectos de código, y las once categorías que colgaban de él producían artefactos que no eran de ese nivel. Medido sobre tres destinos reales antes de corregir:

| Destino | Proyectos de código | De ellos, se despliegan | Casos de uso emitidos | Necesidades de negocio |
| --- | --- | --- | --- | --- |
| Lab-Geometria | 7 | 2 | 71 | 9 |
| RPI.VidelControl | 5 | 1 | 58 | 8 |

Un proyecto de código de DTOs tenía guía de onboarding para developers y documento de entornos de despliegue; ese documento tuvo que abrir con una sección de apartamiento declarando que el proyecto «no tiene ambientes ni canales propios». Y la misma capacidad del producto aparecía fragmentada por capa: `CU-05-Crear-Y-Reeditar-Un-Trabajo` en el dominio y `CU-03-Contrato-De-Carga-Y-Edicion-Del-Trabajo` en los contratos.

### Cambiado — el modelo

- **Dos ejes, no tres niveles.** El de **entrega** —producto → unidades de entrega— y el de **construcción** —producto → soluciones de código → proyectos de código—. Su relación es de **muchos a muchos**: una unidad de entrega se compone de varios proyectos de código y un proyecto de código puede componer varias unidades. Los dos grafos son distintos y no coinciden: el de integración une unidades en runtime, el de compilación une proyectos al construir.
- **El proyecto de código deja de tener árbol documental propio.** Se inventaría una sola vez, a nivel producto, en `Vista-Producto.md`, con su stack, su rol y sus dependencias de compilación. Anidarlo obligaría a documentar un proyecto compartido una vez por cada entrega que lo usa, o a asignarlo arbitrariamente a una dejando en las otras una referencia colgada.
- **La matriz de composición** es el puente entre los ejes: una columna con más de una marca es un proyecto compartido, y su modificación alcanza a todas las entregas marcadas.
- **`tipo_proyecto_codigo` pasa a `tipo_unidad_entrega`.** El conjunto D8 no cambia: siguen siendo ocho valores. Cambia de qué es atributo, porque `SDD-Development-Guide.md` declara que los ocho «cubren el espacio de **formas de entrega** de software», y una forma de entrega es propiedad de lo que se entrega.

### Cambiado — el layout

`SDD/Docs/Proyectos/<Nombre-Proyecto-Codigo>/` pasa a `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/`. Y los casos de aplanado pasan de uno a cuatro, en cascada:

| Composición | Resultado |
| --- | --- |
| Una unidad de entrega y un proyecto de código | Idéntico al template de tipo único |
| Una unidad de entrega y varios proyectos de código | Categorías directo bajo `SDD/Docs/`, **con** vista de producto: hay eje de construcción que inventariar |
| Varias unidades de entrega | Layout completo |

La segunda fila es la que la versión anterior no podía expresar, y es exactamente `RPI.VidelControl`: un monolito de cinco proyectos de código que producía cinco árboles de once categorías, cuatro de ellos sobre unidades de compilación que no se despliegan.

### Cambiado — gating por nivel

Cada flag declara su nivel. `equipo_n` y `requiere_compliance` son del producto; `tipo_unidad_entrega`, `tiene_ui_final`, `usa_llm`, `requiere_maqueta`, `redistribuible` y `tiene_persistencia` son de la unidad de entrega; el proyecto de código **no tiene flags de gating**, porque no emite categorías.

Dos consecuencias:

- **`entrega_diferida`** es un flag nuevo: una unidad de entrega puede estar en el roadmap y no en la etapa en curso. Se enumera y no se le genera documentación, y su ausencia no requiere ADR de apartamiento.
- **El caso del reporte `06` se disuelve.** Con `tiene_persistencia` evaluado en la unidad de entrega, un monolito cuya persistencia vive en una de sus capas compiladas **sí persiste**, y su modelo lógico es uno solo. El conflicto que obligó a inventar un ADR desaparece sin necesidad del ADR.

### Cambiado — intake, manifiesto y validación

- `PRODUCT-INTAKE-template.md` §13 se parte en **§13.1 unidades de entrega**, **§13.2 proyectos de código** y **§13.3 matriz de composición**, con el criterio que decide qué es cada cosa y la aclaración de que las dos condiciones no se excluyen: una librería que se publica es proyecto de código **y** unidad de entrega. §14 distingue contratos de **integración** de contratos de **compilación**. §17 se repite por unidad de entrega.
- `PRODUCT-MANIFEST-template.md` deriva las dos tablas, la matriz y **los dos grafos por separado**.
- `Intake-Rules.md` suma siete validaciones, de las cuales dos impiden confundir los ejes: que ningún proyecto de código declare un valor D8, y que todo proyecto componga al menos una unidad de entrega y toda unidad se componga de al menos un proyecto.

### Cambiado — DevOps y arquitectura, donde los dos ejes se cruzan

- **`Rules-Devops.md`**: se **construye por proyecto de código** y se **publica por unidad de entrega**. La regla declaraba que «el orden de construcción y de publicación lo fija el grafo de dependencias del manifiesto», que con dos ejes es falso. La matriz única se parte en matriz de build y matriz de publicación.
- **`Rules-Arquitectura-Tecnica.md`**: `Arquitectura-Proyecto-Codigo.md` pasa a `Arquitectura-Unidad-Entrega.md` y declara de qué proyectos se compone; `Vista-Producto.md` pasa a ser el artefacto de los dos ejes; y los ADR de nivel producto incorporan **toda decisión sobre un proyecto de código compartido**, que es el caso que la versión anterior no podía ubicar y que terminaba en la carpeta de la primera entrega que lo escribiera.

### Añadido — migración estructural

`Migracion-Rules.md` §4.3.2 declara los cuatro pasos del salto 7.0 → 8.0. El primero es una **detención obligatoria**: el manifiesto de un destino anterior no declara cuál de sus proyectos de código se despliega, así que el agente **propone** una clasificación con cuatro señales declaradas y el humano la confirma. El árbol de un proyecto **compartido** no se funde en ninguna unidad; los casos de uso duplicados por capa no se fusionan por coincidencia de título; y el contenido sin destino se declara en el informe en lugar de borrarse.

### Añadido — el inventario de vocabulario propio

Se corrió el pendiente y encontró **nueve términos** usados en dos o más artefactos del framework sin definición en ningún glosario suyo: `compuerta mecánica`, `glosario operativo`, `referencia pendiente`, `apartamiento declarado`, `despacho`, `matriz de sensado de deriva`, `conjunto cerrado`, `mapa de rangos de identificadores` y `salida prometida`. **Cinco de los nueve los acuñaron las versiones 7.0 y 8.0**, que es el patrón del reporte `11` cometido por la propia intervención que lo corregía. Los nueve entran al glosario operativo.

### Cerrado — los pendientes que quedaban

Los tres pendientes que la 7.0 dejó abiertos se cierran en esta misma versión, para que el conjunto no se publique con deuda declarada:

- **La condición de terminado en dos capas.** El reporte `07` proponía adelantarla a la Fase A y la 7.0 la administraba con una referencia pendiente. Con el nivel por artefacto disponible, la solución es mejor que cualquiera de las dos: la **capa de acuerdo del equipo** —revisión, cobertura acordada, documentación— es de nivel producto y se emite en la Fase A, dentro de `Acuerdo-Equipo.md` §5, porque es donde el equipo la acuerda; la **capa de verificación** —pirámide de testing, quality gates, matriz de cobertura— es de la unidad de entrega y vive en la 08, que **refina** la primera. La obligación de la Fase A hacia la Fase E desaparece porque no era una dependencia real: un equipo puede acordar cómo cierra su trabajo sin saber todavía qué pirámide de testing va a usar cada entrega.
- **La cardinalidad de soluciones de código.** `PRODUCT-MANIFEST-template.md` §2.B agrupa los proyectos de código **por solución de código** cuando hay más de una, y §3 declara que hay **un grafo de compilación por solución**, porque la solución es lo que delimita un comando de construcción. Una dependencia entre proyectos de soluciones distintas no es una arista de ese grafo: es un consumo de artefacto publicado, y confundirlas produce un orden de build que ningún comando puede ejecutar.
- **D9 y los recuentos en prosa.** Se decide **no** ampliarla, y la decisión queda escrita en `Root-Rules.md` §10 con su motivo, para que no vuelva a plantearse como pendiente: D9 está acotada a afirmaciones sobre el estado del sistema, y un recuento sobre una tabla del propio documento no lo es. Las cuatro reglas de §10 consiguen el mismo efecto sin tocar la invariante más cara de verificar del framework.

Con eso, `Vocabulario-Rules.md` §8 pasa de «Pendiente declarado» a «Pendientes declarados y su cierre», y **el conjunto 8.0 se publica sin pendientes normativos abiertos**.

### Impacto sobre destinos existentes

| Qué deja de cumplir | Cómo se repara |
| --- | --- |
| El árbol entero de `SDD/Docs/Proyectos/` | Migración estructural de `Migracion-Rules.md` §4.3.2, con su detención de clasificación |
| El `PRODUCT-INTAKE` en su Parte B y su Parte C | Migración del intake por §4.4, que es documento humano: el agente propone y el Product Owner aprueba |
| El `PRODUCT-MANIFEST` completo | Se rederiva del intake migrado |
| Todo documento que declare `tipo_proyecto_codigo` | Renombre a `tipo_unidad_entrega`, y retiro del valor en los proyectos de código que no son unidades de entrega |
| La numeración, cuando dos árboles se funden en una unidad | Árbol de migración de §4.3.1, cuya comprobación de colisión de destino es la que lo detecta |

Lo que **no** cambia: el contenido de los documentos. El salto cambia de qué nivel son y dónde viven, no lo que dicen. Un caso de uso migrado sigue diciendo lo mismo.

---

## [7.0] - 2026-08-15

Intervención sobre los **doce reportes de evidencia** `00` a `11` emitidos durante corridas reales del orquestador. Sube major por tres motivos independientes: se modifica la invariante **D3** (ancho y ámbito de los identificadores), sube major `Rules-Plan-Sprint.md` (artefactos del equipo al nivel producto) y sube major `Migracion-Rules.md` (renumeración de identificadores). El conjunto D8 queda intacto, el orden de fases no cambia y la mecánica plan-then-confirm tampoco.

**Qué tenían en común los doce reportes.** Ninguno era un error de un agente: en los doce, el agente cumplió la regla que tenía, o la única que había no se podía cumplir sin empeorar el resultado. El framework declaraba **qué** producir y con **qué forma**, y con menos frecuencia **qué propiedad tiene que conservarse** cuando eso que produjo cambia, se copia, se cuenta o entra en conflicto con otra cosa que también produjo.

La nota de coherencia es [`Coherencia-Reportes-00-11.md`](SDD/Devs/Guides/Coherencia-Reportes-00-11.md).

### Añadido — cuatro reglas transversales

- **`Root-Rules.md` §9 Sistema de identificadores.** Declara lo que hasta acá no estaba: el **ámbito de unicidad** —el producto—, el **ancho** —cinco dígitos uniformes— con sus familias alcanzadas y sus dos exclusiones declaradas (`AG-XX` y el ordinal de iteración), la interacción entre estabilidad y capacidad —el rango se dimensiona por el total histórico, porque un identificador retirado no libera su número—, las **colecciones derivadas** que dimensionan sobre la suma de sus fuentes, y la **titularidad**: toda categoría declara el prefijo, la forma y el ámbito de lo que acuña, y ninguna acuña identificadores para artefactos de otra.
- **`Root-Rules.md` §10 Datos derivados en la prosa.** Cuatro reglas, de la que más lejos llega a la que más verifica: preferir la forma que no cuenta, nombrar la fuente del recuento, anclar de modo que el número no admita otro referente —y si no se puede anclar, reescribir en lugar de verificar—, y registrar el recuento en el control de cambios cuando cambia. La métrica de éxito declarada no es cuántos recuentos se verifican: es cuántos dejaron de existir.
- **`Root-Rules.md` §11 Apartamiento declarado.** Un artefacto obligatorio puede no emitirse con un ADR que lo declare, con sus alternativas descartadas y sus disparadores de revisión. Generaliza la figura que solo admitía `Rules-Documentacion.md` §2.5 y que **tres destinos distintos tuvieron que inventar por su cuenta**.
- **`Root-Rules.md` §12 Referencia pendiente.** Forma para citar lo que todavía no existe, con su cierre obligatorio. Reemplaza a las dos salidas que rompían otra regla del framework: copiar el contenido, que crea una segunda fuente, y dejar la referencia colgada, que sella el hueco con el mecanismo que debería detectarlo.

Las cuatro entran en los insumos de **todo** despacho de subagente (`Master-Prompt.md` §8), por la misma razón por la que la 5.1 sumó ahí `Vocabulario-Rules.md`: una regla que las reglas de categoría citan y que no llega al despacho no la lee nadie.

### Añadido — verificación

- **Compuerta mecánica previa al audit** (`Master-Prompt.md` §10.0), con cuatro comprobaciones enumerables —enlaces y anclas, recuentos anclados, idempotencia de generadores, forma y unicidad de identificadores—, su resultado como insumo del despacho del auditor, y la obligación de **declarar qué no mira**: una compuerta que se lee como aprobación es peor que ninguna. La medición que la origina: tres rondas de audit independiente sobre la misma fase produjeron 33 hallazgos, **22 de ellos detectables por un guion**, con rendimiento decreciente y no nulo.
- **Criterio de corte de las rondas** (§10.1): una fase cierra cuando dos rondas seguidas no encuentran hallazgos interpretativos, con los enumerables en cero por la compuerta. Hasta acá una fase cerraba cuando el audit aprobaba, y si nunca aprobaba no había regla.
- **Dos marcas ortogonales al nivel de hallazgo**: la de **origen**, que distingue el hallazgo *aguas arriba* —un defecto que la fase reprodujo fielmente de un artefacto anterior, que sin la marca no podía ser P0 ni P1 y terminaba en P3 por descarte—, y la de **detectabilidad**, que produce la métrica que gobierna la compuerta.
- **Clasificación de los criterios de aceptación** de las diecisiete reglas como `[enumerable]` o `[interpretativo]`, con política conservadora declarada: ante la duda se marca interpretativo, porque declarar mecanizable lo que no lo es produce falsa confianza.
- **Cuatro criterios de audit nuevos**: conjuntos cerrados cruzando categorías como **P0** —el único que obliga a mirar fuera de la fase auditada—, recuentos anclados, referencias pendientes y apartamientos.

### Añadido — arbitraje entre categorías

- **Detención por extensión de un conjunto cerrado** y **registro único de decisiones pendientes del producto** (`Master-Prompt.md` §7.0), exhibido al cerrar **cada** fase y no solo en el handoff. El framework tenía titularidad por categoría y trazabilidad entre ellas, y no tenía arbitraje: la única salida disponible era una nota en prosa dentro de un artefacto, que no interrumpe a nadie y sobrevive a todos los audits.
- **Comprobación del grafo de obligaciones contra el orden de fases**, con **reapertura obligatoria que trae el insumo y no solo el turno** (`Master-Prompt.md` §6), y la prohibición de que una categoría emita un artefacto de otra.
- **Propagación por iteración** en la Fase B2, **regla de escape** de la matriz de propagación, fila para el caso en que la validación crea un proyecto de código, y el `PRODUCT-MANIFEST` incorporado a la regla de corte (`Maqueta-Rules.md` §3.5 y §3.6).

### Cambiado — invariante D3

- **El ancho pasa de dos a cinco dígitos uniformes y se declara el ámbito de unicidad: el producto.** La medición que lo obliga: una corrida real emitió **191 estados** de superficie y **374 sondas**, sobre una convención que llegaba hasta noventa y nueve, y el agente tuvo que elegir entre tres salidas —romper la uniformidad, fragmentar el identificador o comprimir el inventario— sin ningún criterio del método para preferir una. La tabla que el framework define como derivada de todas las otras era la que con más seguridad desbordaba.
- El ámbito de unicidad no estaba declarado en ninguna regla ni en los dos orquestadores, y dos partes del framework exigían lecturas incompatibles. Se elige **producto**, que es la que hace resolver sin tocarla la tabla de trazabilidad de `Rules-Necesidades-Negocio.md` §4.4, que cita el caso de uso por identificador desnudo desde un artefacto de nivel producto.
- El orquestador **deriva y publica el mapa de rangos** por proyecto de código antes de despachar la primera categoría (`Master-Prompt.md` §3.4), y lo incluye en cada despacho. En la corrida que lo originó, el orquestador tuvo que inventar la convención de rangos y declararla él mismo, y cinco prefijos de código de error colisionaron entre proyectos.

### Cambiado — obligatoriedad y nivel

- **La obligatoriedad se condiciona sobre el proyecto de código, no sobre el tipo.** `Rules-Arquitectura-Tecnica.md` alineó sus cuatro menciones del modelo lógico —que decían tres cosas distintas— sobre el flag `tiene_persistencia`, que el orquestador ya derivaba y cuyo impacto declarado ya era ése. `Rules-Examples.md` condiciona la categoría sobre `redistribuible` del manifiesto y da válvula al piso de tres samples.
- **El nivel de aplicación se declara por artefacto** (`Vocabulario-Rules.md` §4 R3). `Rules-Plan-Sprint.md` mueve al nivel producto los cuatro artefactos que describen al equipo —velocidad, capacidad y las dos plantillas de ceremonia—, declara que la numeración de iteraciones es la del roadmap de la categoría 00, y reemplaza el criterio «mínimo Sprint 0 y Sprint 1», que era insatisfacible en un proyecto de código cuyo trabajo empieza en la cuarta iteración del producto.

### Cambiado — el dato que se copia y el que se deriva

- **Regla de transcripción fiel** en `PRODUCT-INTAKE-template.md` §20: si la fuente enuncia un número y la transcripción arroja otro, se declaran los dos y la razón de la diferencia. Y **coherencia intra-escenario** en `Intake-Rules.md` §5, bloqueante cuando la discrepancia no está declarada, acotada a conteos y enumeraciones del propio payload para que la validación no produzca ruido.

### Cambiado — vocabulario del método

- **El vocabulario del método vive en el glosario operativo** de `Master-Prompt.md` §15 y se cita sin redefinir. Generaliza la política que `Rules-Plan-Sprint.md` §6 ya enunciaba una sola vez, y sobre términos que **ya estaban resueltos**. Entran al glosario `sonda`, `pasada de diseño`, `pasada de ejecución` y `arnés`: `sonda` es la unidad del sensado de deriva, nombra las 376 filas de una matriz de un solo proyecto de código, y no estaba definida en ningún glosario del framework.
- El criterio de gobierno de glosario, replicado en once reglas que mandaban a **nueve destinos distintos**, unifica su primera cláusula, y las dos reglas que no lo tenían —`Rules-Especificacion-Funcional.md` y `Rules-UX-UI-DX.md`— lo incorporan. `Rules-Calidad-Y-Pruebas.md` retira el noveno destino, que mandaba a definir `sonda` en línea en el cuerpo de un documento del producto.

### Cambiado — migración

- **`Migracion-Rules.md` §4.3.1**: la renumeración de identificadores y el renombre de archivos se hacen en **dos pasadas**. La primera construye el árbol de migración completo —cada identificador de origen con su destino, los archivos a renombrar y **todas** las referencias que los apuntan— y se confirma con el humano; la segunda aplica el árbol confirmado y cierra comprobando que ninguna referencia quedó colgada, que ningún destino colisiona y que no hay residuos de la forma vieja fuera de `_legacy/`. La evidencia de por qué no alcanza una pasada: renumerar treinta y nueve archivos en una corrida real produjo por sí solo dos hallazgos bloqueantes.

### Añadido — el grafo de obligaciones, corrido

La comprobación que el reporte `07` propone se **corrió** sobre las doce reglas de categoría, y no solo se incorporó como mecanismo. De 48 coincidencias brutas y 22 pares distintos, el triaje separó tres clases: obligación hacia adelante, que es el defecto; declaración de downstream, que D6 exige; y declaración de frontera, que evita el solapamiento entre categorías.

Encontró **tres obligaciones que ninguna corrida había detectado**: `Acuerdo-Equipo.md` §6 referencia la condición de listo de la categoría 06 desde la Fase A, tres fases antes —el mismo documento y la sección contigua al incidente que el reporte `07` sí encontró—; la tabla de trazabilidad de un contrato de prompt referencia la categoría 08 desde la Fase B; y un contrato de prompt tiene que expresar un costo en una moneda que la categoría 09 declara cuatro fases después, que no es una referencia colgada sino un dato faltante y se trata distinto. Las tres quedan declaradas con la forma de `Root-Rules.md` §12, y la familia del glosario técnico —cinco categorías que apuntan a `Glosario-Tecnico.md` de la 11 desde fases anteriores, que el reporte `11` §4.3 ya había señalado— también.

Es la evidencia de que la lista **no estaba cerrada**, tal como el reporte `07` advertía: cinco obligaciones conocidas por las corridas, ocho reales más la familia del glosario.

### Impacto sobre destinos existentes

| Qué deja de cumplir | Por qué | Cómo se repara |
| --- | --- | --- |
| Todo identificador emitido con dos dígitos, y todo archivo que lo lleva en el nombre | D3 fija cinco dígitos uniformes y ámbito de unicidad producto | Migración normativa con el árbol de `Migracion-Rules.md` §4.3.1 |
| Identificadores repetidos entre proyectos de código del mismo producto | El ámbito de unicidad pasa a ser el producto | Ídem. La comprobación de colisión de destino del árbol es bloqueante |
| La categoría 07 completa | `Velocidad-Equipo.md`, la capacidad y las plantillas de ceremonia pasan a nivel producto | Migración normativa, clasificación «regenerar contenido» |
| La categoría 10 de proyectos de código no redistribuibles | El gating pasa de tipo D8 a `redistribuible` | Migración normativa. La condición nueva es más permisiva: puede haber artefactos que dejen de ser obligatorios, no al revés |
| Los contratos de verificación de la categoría 10 | §4.6 suma campos obligatorios: qué pasos del flujo recorre la salida prometida, y el bloque `discrimina` | Migración normativa, clasificación «regenerar contenido» |
| La línea de base visual y la matriz de sensado | El ancho de los identificadores y la declaración de colección derivada | Migración normativa |

Lo que **no** deja de cumplir: las categorías 00, 01, 02, 03, 04, 05, 06, 08, 09 y 11 en su estructura y su contenido. Los cambios que las alcanzan son de criterio de aceptación y de vocabulario, y sus artefactos siguen siendo los mismos.

### Alcance de la evidencia

Los doce reportes salen de corridas reales sobre `Repos-RPIs/RPI.VidelControl`, un producto de cinco proyectos de código, entre el 2026-08-09 y el 2026-08-12. El análisis que ordenó la intervención en cinco familias, las correcciones propuestas por familia y el plan de aplicación viven en el repositorio de documentación, fuera de este repositorio.

**Lo que esta intervención decidió no hacer**, con su motivo declarado: correr la comprobación del grafo de obligaciones sobre las diecisiete reglas y tratar cada caso; el inventario completo del vocabulario propio del framework; adelantar la condición de terminado a la Fase A; decidir si el «glosario de categoría» es un artefacto real; y declarar que un recuento en prosa es una afirmación bajo D9, que `Root-Rules.md` §10 consigue sin ampliar el alcance de la invariante.

---

## [6.0] - 2026-07-29

Capacidad de **migración normativa**: llevar un destino generado con una versión anterior del framework a la versión vigente, preservando su contenido. Sube major porque `PRODUCT-MANIFEST-template.md` sube major y un manifiesto ya emitido deja de cumplir. Ninguna invariante D1-D9 modificada, el conjunto D8 intacto, el orden de fases y la mecánica plan-then-confirm sin cambios.

**Qué faltaba.** El framework sabía diagnosticar el desfasaje de un destino y no sabía repararlo. La reconciliación normativa de `Master-Prompt.md` §2.1 leía la procedencia, la comparaba contra las versiones vigentes, clasificaba los saltos y enumeraba los documentos potencialmente invalidados; sus tres salidas eran emitir un plan sin tocar nada, regenerar desde cero archivando lo anterior, o seguir con las reglas viejas. Ninguna llevaba el destino a la versión vigente conservando lo que ya decía: regenerar lo conseguía tirando lo que había, y seguir con las reglas viejas lo conseguía no avanzando. Además la reconciliación no alcanzaba a los dos documentos de entrada, y sobre un destino generado con la 4.1 **ni llegaba a correr**, porque §2 resolvía el producto buscando `PRODUCT-INTAKE-*.md` y en la 4.1 el intake se llamaba `SOLUTION-INTAKE`.

La nota de coherencia es [`Coherencia-Migracion.md`](SDD/Devs/Guides/Coherencia-Migracion.md).

### Añadido — la capacidad de migración

- **`Migracion-Rules.md` 1.0**, decimoctava regla del framework y sexta transversal. Fija el **principio de estado objetivo**: la normativa vigente es la especificación del estado al que hay que llegar, el documento existente es la fuente del contenido, y la migración re-expresa el segundo bajo la primera. No hay recetas por salto de versión; el salto sirve para priorizar, no para transformar. Se descartaron explícitamente los playbooks por par de versiones, con cinco fundamentos, el primero de ellos siendo que `Vocabulario-Rules.md` §9.5 ya prohíbe la transformación mecánica de texto con el daño de la 5.0 como prueba. Declara además la **regla de no invención** (§4.1): todo contenido de un documento migrado proviene del documento de origen, de un documento hermano o de una respuesta del humano, y no hay cuarta fuente; la sección exigida sin fuente se emite como pendiente y **no se rellena**. Catorce criterios de aceptación, seis hallazgos P0 y ocho anti-patrones.
- **`Master-Prompt-Migracion.md` 1.1**, orquestador contiguo con siete fases M0 a M6: reconocimiento del destino con tolerancia de nombres legados, diff normativo, migración del intake, re-derivación del manifiesto, migración de `SDD/Docs/` en orden de la cadena D6, cierre condicional de la procedencia y auditoría. **No redefine despacho ni auditoría**: cita §8 y §10 del master-prompt de generación, junto con su archivado de §5, su manejo de ambigüedad de §9 y su orden topológico de §3.3. La duplicación que no existe no se desincroniza.
- **`PROMPT-Agente-Migracion-SDD.md` 1.0**, prompt de entrada par del de bootstrap, con la tabla que decide cuál de los dos corresponde según el estado del destino.
- **Destinos sin procedencia declarada**: pasan de tener solo regenerar o abortar a ser migrables, con la clasificación degradada a «revisar todo». Es posible porque la migración opera contra el estado objetivo y no contra el conjunto de origen. La degradación se declara y **no se supone ninguna versión de origen**.
- **Migración parcial** como estado final legítimo, con dos condiciones bloqueantes: la procedencia no se reescribe y el estado parcial se declara documento por documento en el informe.

### Añadido — la instrumentación que la migración necesitaba

- **`PRODUCT-MANIFEST-template.md` (3.1 → 4.0 → 4.1).** El bloque de procedencia de §1.1 suma **dos filas obligatorias**: la versión de `PRODUCT-INTAKE-template` y la de `PRODUCT-MANIFEST-template`. Las plantillas se versionan aparte de las reglas, así que un cambio de su estructura no movía ninguna versión declarada y era invisible para el diff normativo: los dos documentos de entrada del destino no podían resultar candidatos de nada. Sube **major** por el criterio de `SDD-Development-Guide.md` §VI.1. En la 4.1 se completa además la fila de reglas transversales, que omitía `Vocabulario-Rules` pese a que `Master-Prompt.md` §8 la inyecta en todo despacho, y suma `Migracion-Rules`.
- **`Intake-Rules.md` (3.1 → 3.2).** **§2.1 nueva**, tabla maestra de sus dos artefactos. El paso 4 del diff normativo enumera los documentos que una regla gobierna leyendo «su tabla maestra de documentos (§2.1 de la regla)», y esta regla no la tenía: el intake y el manifiesto nunca podían aparecer entre los documentos potencialmente invalidados, ni siquiera ante el salto major de 2.1 a 3.0 de esta misma regla.
- **`Master-Prompt.md` (5.1 → 5.2).** §2 paso 1 **tolera nombres de artefacto legados**, buscándolos en `_legacy/` y en los bloques de impacto del `CHANGELOG.md` antes de concluir que no hay intake; un intake bajo nombre legado deja de detener la cadena y pasa a declararse como destino a migrar. §2.1 nombra el instrumento de su salida A y renombra su plan; sus tres prohibiciones y su detención quedan intactas y **no se agrega una cuarta salida**, porque ejecutar el plan sigue siendo una decisión aparte. §13 regla 2 pasa de un caso de escritura del intake a **dos**, con el segundo siendo la migración estructural bajo tres condiciones acumulativas.
- **`SDD-Development-Guide.md` (1.4 → 1.5 → 1.6).** §VI.4 especifica el bloque **«Impacto sobre destinos existentes»** con sus tres tablas, obligatorio en toda entrada major: hay una clase de cambio que ningún diff de versiones puede inferir, porque un renombre de artefacto no se deduce de que su regla haya subido de 2.1 a 3.0. §VI.5 declara la obligación correlativa. En la 1.6, tres conteos y el mapa de dependencias al día, y la **tabla de derivación del conjunto corregida**: hacía subir major solo por reglas e invariantes y no contemplaba las plantillas de intake.

### Cambiado — el término

- **`Vocabulario-Rules.md` (2.0 → 2.1).** **§9.6 nueva**: declara la familia calificada **«migración normativa»** con sus tres referentes verificados por barrido, porque la palabra ya tenía dos sentidos vigentes en el framework. Se adopta la forma calificada obligatoria —segundo escalón de la escalera de §9.3—, con el primero declarado insuficiente y su evidencia: los dos sentidos coexisten dentro de §9.5 de ese mismo archivo, y por §9.2 el criterio de colisión es la sección. Frente al tercer referente, las migraciones de datos del producto documentado, **no se desambigua nada** por contextos disjuntos, y la constancia queda escrita para que una auditoría posterior no lo levante como hallazgo. **§4 suma R6.** «Reconciliación normativa» conserva su nombre porque compara y no transforma.
- **Renombre léxico de «plan de adecuación» a «plan de migración normativa»**, por el procedimiento por ocurrencia de `Vocabulario-Rules.md` §9.5 y **no** por sustitución global de cadena: **diecinueve ocurrencias de «adecua\*» revisadas, siete sustituidas**, cero filas históricas de control de cambios reescritas y cero ocurrencias no normativas tocadas. Barrido negativo sin hallazgos. Alcanzó a `Master-Prompt.md`, `PROMPT-Agente-Bootstrap-SDD.md` (2.3 → 2.4), `SDD-User-Guide.md` (1.7 → 1.9) y `SDD-Getting-Started-Guide.md` (1.3 → 1.5).

### Impacto sobre destinos existentes

**Renombres de artefacto**

| Nombre anterior | Nombre vigente | Naturaleza |
| --- | --- | --- |
| `SDD/Docs/Audit/Reconciliacion-<origen>-a-<vigente>.md` | `SDD/Docs/Audit/Plan-Migracion-<origen>-a-<vigente>.md` | archivo |
| «plan de adecuación» | «plan de migración normativa» | término de la salida A de `Master-Prompt.md` §2.1 |

Los renombres de la 5.0 —`SOLUTION-INTAKE` a `PRODUCT-INTAKE`, `SOLUTION-MANIFEST` a `PRODUCT-MANIFEST`, `SDD/Docs/Solucion/` a `SDD/Docs/Producto/`, y los cinco identificadores— siguen vigentes y son los que la tolerancia de nombres legados de §2 paso 1 resuelve. No se repiten acá: su declaración vive en la entrada `[5.0]`.

**Secciones movidas o partidas**

| Documento | Sección anterior | Destino vigente |
| --- | --- | --- |
| `Intake-Rules.md` | §2 Campos bloqueantes | §2.2 Campos bloqueantes, dentro de §2 «Artefactos gobernados y campos bloqueantes». Las referencias externas apuntan a §2, que sigue conteniéndolos |
| `Master-Prompt.md` | §13 regla 2, caso único de escritura | §13 regla 2 caso (a). El caso (b) es nuevo |

**Campos bloqueantes nuevos**

| Documento | Campo | Regla que lo exige |
| --- | --- | --- |
| `PRODUCT-MANIFEST-<Slug-Producto>.md` | Fila de procedencia con la versión de `PRODUCT-INTAKE-template` | `PRODUCT-MANIFEST-template.md` §1.1 y su checklist de §7 |
| `PRODUCT-MANIFEST-<Slug-Producto>.md` | Fila de procedencia con la versión de `PRODUCT-MANIFEST-template` | `PRODUCT-MANIFEST-template.md` §1.1 y su checklist de §7 |

**Qué le pasa a un destino ya emitido.** Su manifiesto no declara las dos filas de plantilla y por lo tanto deja de cumplir. La vía de reparación es la que esta misma versión introduce: la migración normativa, que las completa en la fase M3 al re-derivar el manifiesto. Un destino que no se migre sigue siendo legible y utilizable; lo que pierde es la capacidad de que un diff normativo futuro detecte cambios de estructura de plantilla. No hay pérdida de contenido y no se requiere ninguna acción inmediata.

## [5.1] - 2026-07-29

Gobierno del glosario de la documentación generada, y reparación del método con que se aplicó la 5.0. Sube minor: agrega criterios de aceptación y un artefacto obligatorio a una categoría, sin modificar ninguna invariante D1-D9, el conjunto D8, el orden de fases ni la mecánica plan-then-confirm. Dos reglas suben major por su propio artefacto —`Rules-Especificacion-Funcional.md` y `Rules-UX-UI-DX.md`— y su documentación ya emitida sin glosario deja de cumplir.

**Origen.** Dos hechos que se explican uno al otro. El primero es una orden de trabajo emitida desde la corrida de un producto real, que verificó dos defectos: el framework no tenía ninguna regla que dijera **cuándo un término polisémico necesita desambiguarse**, y el glosario de la categoría 02 era sección de un documento condicional que ningún criterio de aceptación verificaba. El segundo es que **la intervención de la 5.0 se ejecutó sustituyendo cadenas de manera global**, y produjo cuatro clases de daño. Los dos son el mismo defecto: el framework no tenía criterio para intervenir vocabulario, y por eso su propia intervención de vocabulario salió mal. La nota de coherencia es [`Coherencia-Sustitucion-Lexica-Y-Gobierno-Glosario.md`](SDD/Devs/Guides/Coherencia-Sustitucion-Lexica-Y-Gobierno-Glosario.md).

### Añadido — el criterio de desambiguación léxica

- **`Vocabulario-Rules.md` §9** (1.0 → 2.0), en cinco subsecciones. **§9.1** fija la regla de decisión: un término polisémico se desambigua **solo cuando sus sentidos pueden aparecer en el mismo contexto de lectura**; cuando los contextos son disjuntos no se califica, porque hacerlo carga el texto sin resolver un problema que no existe. **§9.2** declara la pieza que es propia de cómo trabaja el framework y no se deduce de la lingüística: **el contexto de lectura de un subagente es la sección, no el documento**, porque el despacho de `Master-Prompt.md` §8 nombra secciones y no archivos completos; de ahí se sigue que las formas calificadas de una familia de términos están bien y **la forma desnuda es el defecto**. **§9.3** ordena las tres formas de desambiguar por costo creciente —entrada de glosario, forma calificada obligatoria, invariante de producto con prohibición de fusión— y obliga a usar la más barata que resuelva, declarando por qué las anteriores no alcanzaban. **§9.4** prohíbe declarar una invariante de desambiguación sin haber verificado la colisión, y remite esa verificación a D9. **§9.5** prohíbe la sustitución global de cadena al renombrar un término en un corpus ya escrito, con el procedimiento por ocurrencia que la reemplaza.
- **El criterio existía y vivía en el lugar equivocado.** Estaba enunciado dentro del `SOLUTION-INTAKE` §12 de un producto real, como hallazgo local de esa solución: «no se califica cuando los contextos son disjuntos, porque cargaría el texto sin resolver un problema que no existe». Un orquestador que adoptara la forma del patrón heredaba la forma sin el criterio.
- **`Vocabulario-Rules.md` §10** suma seis criterios de aceptación, incluido el **criterio negativo**: una polisemia con contextos disjuntos **no es hallazgo**, y reportarla es un defecto del informe de auditoría, no del documento auditado.
- **Cuatro términos nuevos en el glosario operativo del orquestador** (`Master-Prompt.md` §15): contexto de lectura, colisión de sentidos, falso positivo de ambigüedad léxica y glosario de categoría.

### Añadido — el glosario de la categoría 02 como artefacto

- **`Glosario-Funcional.md`** (`Rules-Especificacion-Funcional.md` 3.0 → **4.0**), obligatorio para los **ocho** tipos D8. Hasta ahora el glosario de 02 era el punto 6 de `Modelo-Conceptual.md`, documento condicional a la persistencia: **un `library` o un `cli-tool` no tenía glosario en absoluto**, aunque acuñara igual sus cinco casos de uso mínimos, sus reglas de negocio y su vocabulario. El glosario de la categoría que más términos introduce dependía de un flag que no tiene nada que ver con el vocabulario.
- **§4.2.4 nueva** con las cinco secciones obligatorias del glosario, entre ellas la de términos con más de un referente, que no se omite: si ninguno lo requiere, declara «ninguno verificado». Un glosario con tabla de términos vacía no cumple.
- **§3.3** suma la regla de inclusión —todo término que aparezca en más de un artefacto de 02—, la de no duplicación frente al glosario del dominio de 00 y la de polisemia. **§4.5** suma cuatro anti-patrones y **§5.4** tres preguntas guía. **§6** suma cinco criterios verificables. Las menciones de «glosario» en ese archivo pasan de **1 a 20**.
- **`Rules-UX-UI-DX.md`** (3.0 → **4.0**): `Glosario-UX.md` pasa de «Recomendado para todos los tipos con UI final» a **obligatorio para los ocho tipos**, incluidos los DX, que acuñan el vocabulario de su superficie pública. Su §6 pasa de verificar solo la no duplicación a verificar además existencia y completitud. La orden de trabajo de origen lo declaraba «sin cambios porque ya cumple»: era la única de las trece reglas que gobernaba su glosario, pero su artefacto era recomendado y su criterio no verificaba que existiera.
- **Criterio uniforme de gobierno del glosario en §6 de las quince reglas restantes**, con el **destino** de sus términos declarado en cada una: 01 los deja en el glosario del dominio de 00; 05 y 09 en el `Glosario-Tecnico.md` de 11; 06, 07, 08 y 10 no acuñan vocabulario y un término nuevo ahí es señal de que falta aguas arriba. **Archivos de reglas sin ninguna mención de «glosario»: de 9 sobre 17 a 0 sobre 17.**
- **`Deriva-Rules.md`** exige que los nombres canónicos `SUP`, `CMP`, `EST` y `NAV` de la línea de base coincidan término por término con los de 03 y estén declarados en `Glosario-UX.md`: un nombre de superficie que la línea de base inventa vuelve inservible el sensado, porque lo que se compara deja de ser lo que se aprobó.

### Cambiado — el audit del glosario deja de ser un criterio único

- **`Master-Prompt.md` §10** (5.0 → 5.1) reemplaza «glosario sin contradicciones» por **cuatro** criterios: sin contradicciones, **completitud** (todo término que la fase acuña y aparece en más de un artefacto está en el glosario de su categoría), **polisemia gobernada** (todo término con más de un referente tiene entrada que los declara o forma calificada en las ocurrencias que colisionan) y el **criterio negativo**. Un glosario incompleto cumplía «sin contradicciones» trivialmente, que es por qué ese criterio solo no alcanzaba. El punto 5 de la estructura del informe pasa a enumerar las polisemias evaluadas y descartadas, para que la ronda siguiente no las vuelva a levantar.
- **`Master-Prompt.md` §15** redefine *Producto* y *Proyecto de código* **por frontera**, remitiendo a `Vocabulario-Rules.md` §2. Definía el producto como «contenedor raíz del entregable que agrupa una jerarquía de proyectos de código», que es exactamente la definición-por-papel-en-la-herramienta que la 5.0 identificó como el origen del problema y corrigió en el marco teórico sin propagarlo al glosario del orquestador ni al de la guía de usuario.

### Corregido — `Vocabulario-Rules.md` no estaba cableada

La 5.0 incorporó la regla declarando como lector «el orquestador, todo subagente AG-XX, el auditor de cada fase», y los diecisiete archivos de reglas la citan desde la línea «Nivel de aplicación» de su cabecera. Pero **no estaba en los insumos obligatorios del despacho de `Master-Prompt.md` §8**, ni en los del auditor de §10: ningún subagente la recibía y la cita de su cabecera no resolvía. Ahora se inyecta en **todo** despacho, con la regla de construcción que declara por qué no admite excepción de categoría, y en el del auditor. `SDD-Development-Guide.md` §III.8 registra el caso como segundo ejemplo trabajado de agregar una regla transversal, con la lección explícita: **declarar el lector no es cablearlo.**

### Corregido — las cuatro clases de daño de la sustitución global de cadena

El renombre de la 5.0 era correcto y no se revierte. Lo que se repara es el método.

- **30 ocurrencias de la palabra inexistente «reproducto» en 12 archivos**, porque «re**soluci**ón» contiene la cadena `soluci`. La palabra «resolución» había desaparecido por completo del framework vivo. Entre las ocurrencias: el **título de §6 de `SDD-User-Guide.md`** con su ancla en la tabla de contenido, el **nombre del campo `resolucion`** de la bitácora de eventualidades de `Rules-Documentacion.md` en su tabla de campos y en su bloque de ejemplo, el **título del patrón** «Redirección con estado de resolución» de `Design-Rules-Primer-Arranque.md` con tres referencias internas, la variante `mobile-app-maui` de `Rules-Arquitectura-Tecnica.md` que el orquestador copia literal al despacho, y el nombre de la validación bloqueante «Regla de resolución de la Parte D» en `Intake-Rules.md` y en la plantilla de intake.
- **23 cabeceras de tabla de anti-patrones en 17 archivos**: `| Anti-patrón | Problema | Solución |` había quedado como `| … | Producto |`, y esa columna contiene el remedio. Alcanzaba a 15 de los 17 archivos de reglas y a siete tablas del marco teórico. No es cosmético: §8 manda a cada subagente respetar la sección de anti-patrones y §10 hace de un anti-patrón un hallazgo P1. R2 de `Vocabulario-Rules.md` conserva explícitamente ese uso de la palabra.
- **Concordancias de género y remedios pisados**: «no debe leerse como **producto técnica**», «saltando a **productos técnicas**», «separar en **productos** SDD **distintas**», «tabla síntoma/causa/**producto**», «antes de aplicar **el producto**» (dos lugares) y «sugerencia de **producto**».
- **14 etiquetas de cabecera en 13 archivos**: el campo `**Proyecto:**` se había convertido en `**Proyecto de código:**` sobre valores que no son unidades de compilación. Los siete con valor `Template SDD` pasan a `**Framework:** SDD`, patrón que la propia nota de la 5.0 ya usaba; los siete con valor `{{Nombre-Producto}}` pasan a `**Producto:**`, porque una etiqueta de un plano sobre el valor de otro es lo que `Vocabulario-Rules.md` §3 prohíbe. Se corrigieron además **27 marcadores `{{nombre-proyecto}}`** que la 5.0 dejó sin renombrar pese a haber declarado el identificador nuevo, y que violaban D3 por ser todo-minúsculas; las tres cabeceras modelo de `Rules-Contexto.md`, categoría de **nivel producto**, dejan de declarar un proyecto de código, según R3.
- **60 filas históricas de control de cambios reescritas en 23 archivos**, contra `SDD-Development-Guide.md` §VI.2, que lo prohíbe textualmente: «las filas ya escritas no se reescriben, aunque un cambio posterior invalide lo que describen; corregirlas hace que el changelog mienta». Todas restituidas a su texto original, verificado contra el control de versiones. El `CHANGELOG.md` sí había respetado la regla. **Límite declarado**: las filas que la 4.1 escribió el mismo día y la 5.0 reescribió a continuación no son recuperables, porque no hubo commit intermedio y no existe fuente de verdad de su texto; quedan con el vocabulario nuevo y se declara en lugar de reconstruirse, porque un registro reconstruido es un registro falso.

### Corregido — el registro de versiones de la 5.0

- **Cuatro archivos declaraban en cabecera una versión que su control de cambios no registraba**: `Master-Prompt.md` (5.0 sin fila, siendo que su propia §16 dice «cualquier cambio en su contenido sube versión y queda registrado»), `Marco-Teorico-SDD.md` (2.0 sin fila), `SDD-Development-Guide.md` (1.3 sin fila) y `SDD-Getting-Started-Guide.md`, que declaraba **dos versiones contradictorias en el mismo archivo**, `1.2` en el front-matter y `1.0` en el bloque de cabecera. Las filas faltantes se registran retroactivamente, declarando que se registran retroactivamente.
- **Unos veinte archivos habían sido modificados sin dejar fila**: los nueve del catálogo `References/Design/`, las notas de coherencia, el prompt de entrada, las dos guías de usuario y `Templates/`. Todos suben versión con su fila.
- **Filas de cuatro celdas insertadas en tablas de tres columnas**, que rompían el renderizado de la tabla. Normalizadas.
- **`Rules-Design-Modelo-Template.md` no tenía control de cambios propio**: declaraba versión en cabecera y su §15 es el control de cambios del documento que la plantilla produce, no de la plantilla. Se agrega §16, aplicación incompleta de D5 que §15 hacía difícil de ver.
- **`SDD-Development-Guide.md` no tenía salto de línea final.** Restituido.

### Corregido — desfase de los tres documentos de `SDD/Guides`

- **`SDD-User-Guide.md` (1.6 → 1.7) contradecía al orquestador en el punto que la 5.0 vino a corregir.** §4.5 paso 6 decía «Derivar `Slug-Producto`, `Raiz-Codigo` (PascalCase)» y F-18 que `Raiz-Codigo` «es la forma PascalCase del nombre del producto», cuando `Master-Prompt.md` §3.2 y `Vocabulario-Rules.md` §3 declaran que **se declara en el perfil de convención del intake y admite separadores de segmento**. Un usuario que siguiera la guía disparaba la validación bloqueante de independencia entre planos. Su glosario §10.1 pasa de dos entradas de vocabulario a nueve —los seis términos normativos por frontera, los cuatro planos de identidad, el contexto de lectura y el glosario de categoría—; §4.4 dejaba de listar tres de las cinco reglas transversales y §10.2 no incluía `Vocabulario-Rules.md` en el árbol; el resumen ejecutivo declaraba 23 entradas de FAQ y hay 29, defecto arrastrado desde la 1.5.
- **`SDD-Development-Guide.md` (1.2 → 1.4) contradecía al `README.md` raíz en tres conteos**: §I.2 declaraba «los dieciséis archivos normativos … más `Root-Rules`, `Intake-Rules`, `Maqueta-Rules` y `Deriva-Rules`», §II.1 «las cuatro reglas transversales» y §III.7 que una invariante «vive en los dieciséis archivos de reglas», cuando la propia 5.0 había agregado el decimoséptimo y el README ya decía diecisiete y cinco. Su mapa de dependencias §I.1 no tenía el nodo `Vocabulario-Rules` y su tabla §I.3 de quién lee cada pieza no la incluía, además de afirmar que el subagente «recibe un solo archivo de reglas».
- **`SDD-Getting-Started-Guide.md` (1.2 → 1.3)** suma al glosario mínimo los términos que un primer arranque necesita —producto, proyecto de código, proyecto como emprendimiento, solución de código, los cuatro nombres del producto con la aclaración de que `Raiz-Codigo` la declara el usuario, y la regla de vocabulario— y corrige el rango de la FAQ, que citaba `F-01 a F-23` cuando hay 29 desde la 3.0.

### Corregido — defectos preexistentes encontrados en el camino

- **`Rules-Especificacion-Funcional.md` §0 citaba «11 (ejemplos)»**, número nuevo con el significado viejo: residuo del intercambio 10 ↔ 11 de la 3.0 del framework.
- **Cuatro nombres de artefacto en todo-minúsculas** que la propia regla que los contenía prohíbe en el párrafo siguiente: `especificacion-funcional.md`, `modelo-conceptual.md` y `definicion-<concepto>.md` en §3.1, §3.5 y §5.1 de la regla de 02, contra su propia §2.1; y `glosario-ux` en §3.1 y §3.2 de la regla de 03, contra su §2.1 y contra D3.
- **`Rules-Arquitectura-Tecnica.md` declaraba dos veces la línea «Nivel de aplicación»** en su cabecera.
- **Tres valores de ejemplo que no cumplían Título-Con-Guiones**: `servicio-pagos`, `Turnos Médicos` y `Librería CSV` en cabeceras modelo de nivel proyecto de código.

### Corregido — dos celdas de verificación de la nota de coherencia de la 5.0

`Coherencia-Vocabulario-Producto-Y-Proyecto-De-Codigo.md` (1.0 → 1.1) reexpresa sus celdas **D1** y **D2**, que afirmaban verificaciones no realizadas: la D1 declaraba un «barrido de determinantes, adjetivos y participios adyacentes» que no se había hecho —lo demuestran «producto técnica» y las 30 «reproducto»—, y la D2 declaraba haber restituido el salto de línea final «en los archivos que no lo tenían» mientras `SDD-Development-Guide.md` seguía sin él. Eran afirmaciones sobre el estado del sistema sin evidencia válida, que es lo que D9 prohíbe. **El alcance verificado por la nota no se modifica**, según el criterio de reexpresión del `README.md`: el alcance no se toca nunca y solo se reexpresa la verificación concreta que quedaría falsa. Se agrega su observación 6 con la clase de defecto que la intervención introdujo y que su propio veredicto APROBADO no detectó, porque no había criterio contra el cual detectarlo.

### Preservado deliberadamente

- **`SDD/Devs/Bootstrap/` y `_legacy/` no se tocaron.** Las dos «reproducto» y los `project_type` que `Bootstrap/` conserva citan el estado vigente en su momento.
- **El renombre de la 5.0 no se revierte.** «Producto» y «proyecto de código» quedan como el vocabulario normativo. Lo que se repara es cómo se aplicó.
- **No se creó snapshot en `_legacy/`.** El archivado por versión rige por conjunto normativo publicado y esta entrada no publica una versión mayor: la 5.0 sigue siendo el conjunto de referencia y su subcarpeta se crea cuando sea superada.
- **No se propone una invariante D10.** El criterio de desambiguación es una regla operativa transversal, no una invariante del template.
- **No se unifican los glosarios en uno por producto**, y no todas las categorías reciben glosario propio. Solo 02, 03 y 11 emiten uno; las demás declaran dónde van sus términos. Multiplicar glosarios crearía el problema que la regla de no duplicación existe para evitar.
- **El nivel de unidad de entrega sigue definido y sin materializar**, pendiente declarado de `Vocabulario-Rules.md` §8.

### Verificación pendiente, declarada

La comprobación empírica del defecto del glosario de 02 es **generar la categoría 02 de un producto de tipo `library` o `cli-tool`** —sin persistencia— y verificar que emite glosario. Requiere una corrida del orquestador sobre un destino y queda fuera del alcance de una intervención sobre el repositorio fuente. Se declara como pendiente y no como cumplida, porque afirmarla sin haberla corrido sería el mismo defecto que la celda D1 de la nota anterior cometió.

## [5.0] - 2026-07-29

Vocabulario normativo: el nivel superior pasa de «solución» a **producto** y la unidad de compilación pasa de «proyecto» a **proyecto de código**. Sube major: cambian identificadores, nombres de artefacto y nombres de archivo, y toda la documentación generada bajo la nomenclatura anterior deja de cumplir. Alcanza a los diecisiete archivos de reglas, al orquestador, a las dos plantillas de intake y a las guías.

**Origen.** La constatación de que el framework no tenía glosario propio y de que sus dos términos centrales estaban definidos por su papel en la herramienta y no por su frontera: `Marco-Teorico-SDD.md` §9 definía *Proyecto* como «unidad de especialización del template» y *Solución* como «agrupación de una jerarquía de N proyectos». Un término definido así absorbe cualquier significado, y eso fue lo que ocurrió: «proyecto» llegó a designar cuatro cosas distintas dentro del mismo árbol generado —la unidad de compilación, la unidad que recibe las categorías 02 a 11, el emprendimiento de `Alcance-Proyecto.md` y, en un destino real, una entidad del dominio del cliente—.

### Añadido
- **`Vocabulario-Rules.md`**, decimoséptimo archivo de reglas y quinta regla transversal. Fija los **seis términos** con definición por frontera —producto, unidad de entrega, módulo, solución de código, proyecto de código, proyecto—, los **cuatro planos de identidad** de un producto, cinco reglas de uso, la tabla de confusiones que cierra, la precedencia frente al glosario del dominio del cliente y la correspondencia con el vocabulario de industria.
- **Los cuatro planos de identidad como campos propios**: `Nombre-Producto` (prosa de negocio), `Slug-Producto` (Título-Con-Guiones, deriva del anterior), `Raiz-Codigo` (identidad de código, **se declara**) y `Artefacto-Agrupacion` (el agrupador de construcción, que el framework no modelaba). Ninguno se distingue de otro solo por capitalización o puntuación.
- **Validación bloqueante de independencia** en `Master-Prompt.md` §3.2 e `Intake-Rules.md` §4: si `Slug-Producto` y `Raiz-Codigo` son la misma cadena salvo por la puntuación, el campo de negocio fue completado con un nombre de artefacto de código y la derivación no procede.
- **Regla de choque de vocabulario** en `Intake-Rules.md` §5: si el glosario del dominio del cliente usa uno de los seis términos con otro sentido, el intake debe declarar el choque y definir los dos usos. Es bloqueante. Convierte en procedimiento lo que cada destino venía resolviendo por reacción y de manera distinta.
- **Declaración de nivel en la cabecera de cada regla** (`Vocabulario-Rules.md` §4 R3): producto, proyecto de código, o ambos. El nivel fija qué nombre usa el documento en su prosa.
- **Ejemplo de raíz de código multi-segmento** en `PRODUCT-MANIFEST-template.md` §5 (`Contoso.Turnos`). Los dos ejemplos anteriores eran de un solo segmento y ocultaban el caso que el framework no podía expresar.

### Cambiado
- **`Raiz-Codigo` se declara, ya no se deriva.** `Master-Prompt.md` §3.2 obligaba a obtenerla del nombre legible «concatenando sin separadores», cláusula que hacía inexpresable cualquier raíz de espacio de nombres de más de un segmento —la forma normal en .NET, Java y Python— y que forzaba a escribir la identidad de código en el campo de negocio.
- **`SOLUTION-INTAKE` → `PRODUCT-INTAKE` y `SOLUTION-MANIFEST` → `PRODUCT-MANIFEST`**, con sus dos plantillas renombradas.
- **Identificadores**: `Nombre-Solucion` → `Slug-Producto`; `NombreSolucionCodigo` → `Raiz-Codigo`; `Nombre-Proyecto` → `Nombre-Proyecto-Codigo`; `nombre-proyecto-codigo` → `Identidad-Codigo`; `project_type` → `tipo_proyecto_codigo`.
- **Artefactos generados**: `Alcance-Proyecto.md` → `Alcance-Producto.md` (elimina el sentido «emprendimiento» del árbol), `Arquitectura-Solucion.md` → `Arquitectura-Proyecto-Codigo.md`, `Vista-Solucion.md` → `Vista-Producto.md`, `Pipeline-Solucion.md` → `Pipeline-Producto.md`, y la carpeta `SDD/Docs/Solucion/` → `SDD/Docs/Producto/`.
- **Esqueleto de despacho de `Master-Prompt.md` §8**: la línea de contexto repetía `{{NOMBRE_SOLUCION}}` dos veces en dos posiciones que debían llevar nombres distintos. Pasa a declarar los cuatro planos, cada uno con su marcador.
- **Bloque informativo de `Master-Prompt.md` §3.4**: imprimía tres líneas que declaraban formatos y parecían el mismo nombre escrito distinto. Pasa a declarar cuatro conceptos con su plano.
- **Redacción de D8**, que decía «conjunto cerrado de tipos de proyecto». El conjunto de ocho valores no cambia.

### Preservado deliberadamente
- **«Módulo» conserva su sentido funcional.** Se verificó que ya designaba un área funcional del producto en 37 lugares del framework y en los destinos reales —barra de navegación de módulos, acento por módulo, módulos incluidos en el plan de pruebas—. Usarlo para la unidad de compilación habría creado una colisión nueva en el plano de UX y de pruebas.
- **«Proyecto» a secas queda para el emprendimiento**, con una excepción declarada y única: los compuestos `multi-proyecto`, `inter-proyecto` y `cross-proyecto`, donde el calificador no entra sin deformar la palabra.
- **`SDD/Devs/Bootstrap/` y `_legacy/` no se tocaron**, por la regla de que un registro que se corrige después deja de ser un registro. El vocabulario que conservan era el vigente en su momento.
- **«Solución» sobrevive en un solo compuesto, «solución de código»**, donde significa exactamente lo que significa en el ecosistema. Es lo que elimina la homonimia con el archivo de solución de .NET.
- **El nivel de unidad de entrega queda definido pero sin materializar.** `Vocabulario-Rules.md` §8 lo declara como pendiente: hoy las once categorías de nivel producto cuelgan de un nivel poblado con proyectos de código, y reubicarlas es una intervención estructural aparte. `tipo_proyecto_codigo` conserva D8 por la misma razón.

### Impacto sobre destinos existentes
Los árboles generados bajo 4.x declaran su procedencia y la reconciliación normativa de `Master-Prompt.md` §2.1 los clasifica como desfasados. Ninguno se renombra retroactivamente: el usuario elige entre plan de adecuación, regeneración o continuar bajo la versión de origen, y el conjunto 4.1 queda archivado en `_legacy/4.1/` para poder aplicarlo.

## [4.1] - 2026-07-29

Vocabulario de roles, autoridad de decisión de AG-00 y defectos verificados. Sube minor: precisa el alcance de una especialidad y corrige defectos, sin modificar ninguna invariante D1-D9 ni el conjunto de artefactos de ninguna categoría. Ninguna documentación ya emitida deja de cumplir.

**Origen.** Un análisis externo del framework centrado en cómo quedaron definidos los conceptos de solución, producto, solución de código y proyecto. De sus hallazgos, esta entrada aplica los que **no requerían decidir nada**: los defectos contrastables contra el árbol y la acotación de AG-00, que el propio framework ya había vuelto innecesaria sin actualizar el texto.

### Corregido
- **Los ejemplos de `Nombre-Solucion` y `Nombre-Proyecto` usaban minúsculas**, variante que D3, el algoritmo de `Master-Prompt.md` §3.2 y **tres archivos de reglas** prohíben textualmente («quedan prohibidas las variantes todo-minúsculas»). El defecto se propagaba al nombre de archivo: `SOLUTION-MANIFEST-template.md` §5 declaraba `Nombre-Solucion` = `gestion-de-turnos` y en la fila siguiente citaba `SOLUTION-INTAKE-Gestion-De-Turnos.md`, siendo el patrón `SOLUTION-INTAKE-<Nombre-Solucion>.md`. 66 ocurrencias normalizadas en cuatro archivos. `SDD-User-Guide.md` §4.1 definía Título-Con-Guiones como «(minúsculas, …)», definición que se contradice a sí misma.
- **`SOLUTION-MANIFEST-template.md` no declaraba su versión en cabecera.** Era el único artefacto de `Intake/` sin campo `Versión` legible. La plantilla de intake había corregido el mismo defecto en su 1.3, declarándolo «una aplicación incompleta de D6 sobre las plantillas»; la corrección no se había propagado a la otra plantilla.
- **Las fichas de AG-10 y AG-11 del catálogo de especialidades estaban intercambiadas.** `Marco-Teorico-SDD.md` §4.2 declaraba AG-10 como Technical Writer y AG-11 como Developer Advocate, al revés de lo que declaran `Rules-Examples.md`, `Rules-Documentacion.md` y la tabla resumen §4.3 del propio marco. **La entrada 1.7 de su control de cambios afirma haber actualizado §4.2** en el intercambio 10 ↔ 11 del 2026-07-28: el registro declaraba una corrección que no se había aplicado a las fichas. Arrastraban la misma inversión el diagrama de trazabilidad de §4.4 y las interacciones cross-rol de AG-03.
- **Cuatro rutas `rules/` obsoletas** en el manifiesto, el master-prompt y el marco teórico. La del master-prompt caía en el primer paso de la fase de validación de intake.
- **El árbol de ejemplo del intake §16 contradecía el layout del orquestador**: mostraba `docs/` y `devs/Intake/` donde `Master-Prompt.md` §3.5 fija `SDD/Docs/` y `SDD/Intake/`. Es el ejemplo que el usuario copia, así que el defecto se propagaba a cada intake real.
- **El flag `equipo_n` declaraba un origen inexistente.** `Master-Prompt.md` §4 decía leerlo de «SOLUTION-INTAKE §2 (stakeholders) o §10 (restricciones)», y ninguna de las dos secciones pedía la cantidad de personas del equipo: §2 pide una tabla de roles y §10 pide presupuesto, fecha, normativa e integraciones. El flag gatea la emisión de `Acuerdo-Equipo.md` y la forma de la categoría 07.
- **Cuatro referencias al `BRIEF`**, plantilla deprecada desde la unificación de intake del 2026-06-10, y **residuos del intercambio 10 ↔ 11** en `Rules-Contexto.md`, cuya §1.1 decía «11 (examples)»: el número nuevo con el significado viejo. La ruta `03-UX-UI/` de la tabla §4.3 pasa a `03-UX-UI-DX/`.

### Cambiado — la autoridad de decisión de AG-00
- **`Rules-Contexto.md` (2.0 → 2.1) parte la responsabilidad de la especialidad.** Su §1.1 declaraba que la responsabilidad principal de AG-00 era «completar lo que el cliente todavía no dijo: **forzar la priorización MoSCoW, declarar exclusiones explícitas**, traducir aspiraciones en objetivos SMART». La frase mezcla dos comportamientos incompatibles: **formalizar lo implícito**, que es trabajo de Product Manager y se conserva, y **decidir lo no decidido**, que es arbitraje de Product Owner y se retira.
- **Por qué.** AG-00 corre aguas abajo del punto en que el humano ya confirmó el intake y el manifiesto. Una prioridad decidida ahí entra a la cadena D6 habiendo pasado el audit y ninguna aprobación, y es indistinguible de una decidida por el Product Owner: el audit verifica completitud, forma y coherencia interna, no fidelidad a una intención que nunca se expresó, y D9 declara explícitamente que no aplica a afirmaciones de contexto, que es lo que produce esta categoría. El riesgo no es que el agente invente mal, es que invente bien.
- **La arbitración ya era innecesaria y el texto quedó sin actualizar.** `Intake-Rules.md` §5 valida, antes de despachar cualquier subagente, que §4 tenga MoSCoW con Must mínimo y §9 al menos tres exclusiones. La frase proviene de `Rules-Contexto.md` **1.0, del 2026-05-17**, generada en el bootstrap; `Intake-Rules.md` no existió hasta el **2026-06-10**. Ninguna versión intermedia revisó ese párrafo.
- **`Rules-Plan-Sprint.md` (2.0 → 2.1)** deja de llamar «Product Owner / Backlog» a AG-06, que su propio archivo de reglas y el catálogo definen como Scrum Master, y explicita que no reprioriza.
- **`Marco-Teorico-SDD.md` §5.5** corrige el mapeo del rol Scrum Product Owner, que apuntaba a AG-00. La ficha de AG-00 siempre declaró el alias como «Product Owner senior **en contextos donde el rol no existe formalmente**»; la tabla de correspondencias había dejado caer la condición. Se restituye.

### Añadido
- **Product Owner y stakeholder como términos declarados**, con entradas de glosario en `Master-Prompt.md` §15 y `SDD-User-Guide.md` §10.1. El Product Owner es un rol humano aguas arriba del intake, **fuera de la cadena AG-XX**, dueño de la priorización y de las exclusiones. El stakeholder es una categoría de relación, parcial y plural, que aporta el material que el Product Owner arbitra. El framework ya usaba «Product Owner» sin traducir en cinco archivos de reglas; faltaba en el único documento que el rol escribe.
- **Campo `Product Owner` en la cabecera del intake** y nota que declara quién es responsable del documento: el PO es el autor del contenido y quien aprueba, y la redacción puede estar asistida por un agente sin que eso delegue la autoría. La pregunta bloqueante de §2 se desdobla: fusionaba al Product Owner con la categoría de stakeholder «propietario», que no son lo mismo —quien financia también es propietario y no por eso es el PO—.
- **`Rules-Contexto.md` §6.1, catálogo de ambigüedades de la categoría**: dieciocho ítems que AG-00 verifica **antes de redactar**, con el criterio que distingue formalización de decisión. Complementa el mecanismo reactivo de `Master-Prompt.md` §9 poniéndole un piso: enumera qué buscar en lugar de esperar a tropezarse con ello. Es el piloto de un patrón replicable a las once categorías restantes.
- **`Coherencia-Roles-Y-Defectos-Verificados.md`**, nota de coherencia con el inventario, la evidencia de cada defecto, la verificación D1-D9, la trazabilidad en seis eslabones y cinco observaciones.

### Preservado deliberadamente
- **`SDD/Devs/Bootstrap/` no se tocó**, por la regla de que un registro que se corrige después deja de ser un registro. Las referencias al `BRIEF` que ese directorio conserva son correctas: citan el estado vigente en su momento.
- **La triple asignación de la priorización queda cerrada solo en AG-00.** `Rules-Necesidades-Negocio.md` y `Rules-Backlog-Tecnico.md` conservan su mandato sobre la prioridad; corregirlos requiere que el Product Owner esté declarado, cosa que esta entrada recién habilita.
- **No se creó snapshot en `_legacy/`.** El archivado por versión rige por conjunto normativo publicado, y esta entrada no publica una versión mayor: la 4.0 sigue siendo el conjunto de referencia y su primera subcarpeta se crea cuando sea superada.

## [4.0] - 2026-07-28

Normalización del versionado y del archivado. **Sube major: se modifican las invariantes D4 y D5**, y la documentación generada con la nomenclatura anterior deja de cumplir.

**Origen.** El framework tenía **dos lógicas de versionado conviviendo dentro de cada plano**. En el propio repositorio, 34 archivos usaban nombre estable con la versión en la cabecera y 11 la llevaban en el nombre, de los cuales 4 mentían: el marco teórico iba por la versión 1.8 dentro de un archivo llamado `-v1.0.md`. En la documentación generada, la mayoría de los artefactos llevaba la versión en el nombre y nueve clases no la llevaban. **En los dos planos los defectos aparecieron en la frontera entre ambas lógicas**: la pérdida silenciosa de dos README de sección durante una corrida real, y los cuatro nombres desactualizados del framework, son el mismo choque visto de los dos lados.

### La regla única

En la carpeta de trabajo hay **un solo archivo por nombre lógico, sin sufijo de versión**. La versión vive en el campo `Versión` de la cabecera. Al ser superado, el archivo se copia completo a `_legacy/`, y **la copia archivada sí recibe el sufijo**. Aplica a los dos planos, sin excepciones de nombre.

Tres propiedades se siguen de la regla: cuál es la versión vigente deja de ser algo que hay que verificar y pasa a ser una propiedad estructural del árbol; subir de versión no propaga ninguna actualización de referencias, porque los enlaces apuntan a un nombre que no cambia; y un agente que lee una carpeta ingiere un solo ejemplar de cada documento.

### Cambiado
- **`README.md`**: D4 pasa a declarar que el archivo vivo lleva nombre lógico estable y que el sufijo `-v<X.Y>.md` identifica a las copias archivadas. D5 pasa a declarar que una sola versión vigente **es** un solo archivo por nombre lógico en la carpeta de trabajo. Se agrega la nota que explica la duplicidad anterior y por qué se elimina en lugar de parchearse, la fila de `_legacy/` en el mapa del repositorio y una fila de intervención para publicar una versión nueva del framework. Se agrega además el **criterio de qué se conserva y qué se reexpresa en una nota de coherencia**: el alcance verificado no se toca nunca, y una verificación concreta se reexpresa solo si quedaría falsa contra el árbol vigente o citaría un archivo que ya no existe.
- **Las cuatro notas de coherencia reexpresan su celda de D4** —la del marco teórico y las tres del catálogo de diseño— porque afirmaban que ciertos archivos llevaban sufijo de versión en el nombre y eso dejó de ser cierto. Cada celda declara bajo qué versión de la invariante se hizo la verificación original. **Las celdas de D5 quedan intactas**: afirmaban un único archivo por nombre lógico sin copias paralelas, que sigue siendo cierto bajo la formulación nueva.
- **Once archivos renombrados** a su nombre lógico estable: el marco teórico, la nota de coherencia del marco, los tres documentos de coherencia del catálogo de diseño y los seis `Design-Rules-*`. **163 referencias actualizadas** en 23 archivos, con cero enlaces rotos. Los `Design-Rules` previstos del roadmap del índice también pierden el sufijo, porque ese listado fija la convención de nombre.
- **`Master-Prompt.md` (3.7 → 4.0)**: §3 completa el bloque de procedencia del framework al derivar el manifiesto. §5 reescribe las celdas de versionado, deprecación y sufijo. §5.1 reescribe el detalle operativo alrededor de la regla única, con su ejemplo de árbol y las tres propiedades que se siguen.
- **Los dieciséis archivos de reglas suben major**: patrones de nombre, ejemplos, cabeceras modelo, anti-patrones y criterios de aceptación pasan a la nomenclatura sin sufijo. **751 nombres de artefacto normalizados** en 24 archivos, incluidas las dos guías de usuario, el prompt de entrada, las plantillas de intake y el marco teórico.
- **`SOLUTION-MANIFEST-template.md`**: §1.1 nueva con el bloque de procedencia del framework, que declara la versión del conjunto y la de cada regla aplicada. El perfil de convención de nombres pasa a §1.2.
- **`SDD-Development-Guide.md` (1.1 → 1.2)**: §I.2 suma `_legacy/` a la anatomía; §VI.4 declara que congelar la versión anterior depende de la procedencia y del snapshot; **§VI.5 nueva** con el versionado del framework como conjunto.

### Añadido
- **`_legacy/`** en la raíz del framework, con su README. Una subcarpeta por versión publicada, con el **conjunto normativo completo** —no los archivos que cambiaron— porque las reglas son interdependientes y lo que hay que poder reconstruir es el estado coherente. Un snapshot son unos 50 archivos y 1,5 MB, y se toma una vez por entrada de este changelog. **Rige desde la 4.0 hacia adelante**; las versiones anteriores solo son recuperables desde el historial del control de versiones, con el mismo criterio con que se incorporó D9.
- **Criterio de reexpresión de las notas de coherencia**, en el `README.md`. El **alcance** de lo que una nota verificó no se toca nunca: una nota que verificó D1 a D8 sigue diciendo D1 a D8. Una **verificación concreta** se reexpresa solo cuando quedaría falsa contra el árbol vigente o citaría un archivo inexistente; no alcanza con que la invariante haya cambiado de forma. La versión 4.0 es el ejemplo: D4 y D5 se reformularon las dos, pero solo las celdas de D4 se reexpresaron, porque las de D5 siguen siendo ciertas bajo la formulación nueva. Sin esta distinción el framework quedaba con dos prácticas opuestas para el mismo artefacto.
- **El `CHANGELOG.md` queda declarado como el mecanismo de versionado del framework.** El control de versiones vuelve a ser control de código fuente y nada más: reconstruir una versión no requiere tags ni ramas, porque el árbol se autocontiene.

### Corregido
- **Los checklists de D4 eran tautológicos.** Al menos seis reglas verificaban «Ningún archivo usa el patrón `-v<X.Y>.md`; todos usan `-v<X.Y>.md`», con los dos patrones idénticos, y `Rules-Contexto.md` daba un ejemplo inválido idéntico a los válidos. Una normalización anterior había convertido el patrón prohibido `.v<X.Y>.md` en el permitido y había vaciado de sentido toda línea que los contrastaba. Un auditor que los corriera pasaba siempre. Reescritos contra la regla nueva.
- **Campos `Documento` que no coincidían con su archivo**: cuatro notas de coherencia se declaraban con un prefijo de guion bajo que ningún archivo tenía.
- **Las cuatro notas de coherencia quedaban contradiciéndose a sí mismas** tras el cambio de D4: sus filas de inventario nombraban los archivos sin sufijo mientras sus celdas de verificación seguían afirmando que lo llevaban. Se readecuaron a las reglas vigentes, **declarando la reexpresión en la propia celda** e indicando bajo qué versión se hizo la verificación original. De paso citaban `Guia-Usuario-SDD-v1.0.md`, un archivo que nunca existió con ese nombre.
- **`§6.5` de `Maqueta-Rules.md` no existe**, y tres archivos lo citaban. §6 es una lista numerada sin subsecciones y la verificación de ofuscación es su punto 5. Defecto preexistente, verificado contra el estado anterior del repositorio.
- **`Master-Prompt.md` §0 titulaba «Modelo de dos repositorios»** mientras el `README.md` y la guía de arranque declaran tres. Reescrito: el framework opera sobre tres, el orquestador sobre dos de ellos y el tercero no lo toca nunca.
- **Cita ambigua a `§3.1`** en la derivación del manifiesto, que se leía como si la sección fuera del formato del manifiesto y no del propio master-prompt.

### Añadido — fase de reconciliación normativa

Hasta ahora, ante un `SDD/Docs/` con contenido previo el orquestador solo ofrecía **archivar todo y empezar de cero, o abortar**. No miraba con qué versión se había generado ese árbol ni proponía nada. Con la procedencia declarada y el archivado por versión, esa limitación deja de tener sentido.

- **`Master-Prompt.md` §2.1, nueva.** Se dispara solo si `SDD/Docs/` tiene contenido. Distingue tres casos: sin procedencia declarada (árbol anterior a que la procedencia existiera, se ofrece solo regenerar o abortar y se explica por qué), al día (lo informa y sigue) y desfasado (ejecuta la comparación). El diff normativo se arma sin despachar subagentes: lee la procedencia del manifiesto, lee las versiones vigentes de cabecera, clasifica cada salto por severidad leyéndola de la propia numeración, y para cada salto major enumera los artefactos que esa regla gobierna según su tabla maestra de documentos.
- **Tres salidas, con detención obligatoria.** **A** emite un plan de adecuación en `SDD/Docs/Audit/Reconciliacion-<origen>-a-<vigente>.md`, documento por documento y sin modificar nada. **B** regenera desde cero, que es el comportamiento histórico. **C** continúa bajo la versión de origen, leyendo sus reglas desde `_legacy/<version>/`; no se ofrece si ese conjunto no es reconstruible, porque el orquestador no puede aplicar reglas que no puede leer.
- **La decisión C se registra** en el manifiesto (`SOLUTION-MANIFEST-template.md` §1.1, tabla de decisiones de reconciliación). Sin registro, el arranque siguiente vuelve a preguntar lo mismo y el usuario vuelve a contestarlo sin memoria de haberlo hecho.
- **Prohibiciones de la fase**: no modificar ningún documento, no elegir salida por cuenta propia ni siquiera cuando no hay impacto, y no declarar reconstruible un conjunto de origen sin verificar que existe, porque es una afirmación sobre el estado del sistema y D9 exige evidencia.
- Propagado a `PROMPT-Agente-Bootstrap-SDD.md` (prerrequisito 4), `SDD-Getting-Started-Guide.md` (troubleshooting), `SDD-User-Guide.md` (lista de fases y glosario) y `Master-Prompt.md` §0, §3.5 y §7.

### Añadido — navegabilidad y anexos de datos del intake

Sintetizado del patrón que **dos intakes reales desarrollaron por su cuenta** sobre la plantilla 1.3, en dos soluciones sin relación entre sí. La convergencia entre ambos es la evidencia de que faltaba en la plantilla.

- **Tabla de contenido obligatoria** en el `SOLUTION-INTAKE`, después de la cabecera, con las secciones de primer y segundo nivel y con cada escenario de la Parte D listado por identificador. El framework ya la exigía a los documentos que genera; el intake, que es el que más agentes leen y que en la práctica supera las dos mil líneas, era la excepción injustificada.
- **Formato por escenario de §20, de tres piezas a cinco.** Suma **contexto** (qué situación real representa), **qué ejercita** (del modelo, las reglas y los invariantes) y **qué verificar** (traducción directa a casos de prueba). El último es el que convierte un JSON en fixture: es lo que `08-Calidad-Y-Pruebas` toma como criterio de aceptación y lo que `10-Examples` convierte en contrato de verificación.
- **`Estado` del dato como enum cerrado**: `medido`, `declarado`, `derivado`, `reconstruido`. Es la regla de evidencia D9 aplicada a los datos de ejemplo, con la consecuencia declarada de que un valor `reconstruido` no es una medición y no se presenta como tal.
- **Recomendación de encadenar los escenarios** como una única línea de tiempo coherente en lugar de emitirlos sueltos: un conjunto encadenado sirve de juego de datos para un *end-to-end* completo.
- **`Intake-Rules.md` (2.0 → 2.1) valida ahora la Parte D**, que hasta acá no verificaba nadie: presencia de los cuatro bloques por escenario, `Estado` dentro del enum, tabla de contenido con los escenarios listados, **regla de resolución de identificadores en las dos direcciones** (toda cita tiene anexo y todo anexo está citado) y **regla de autocontención**. Las dos reglas existían declaradas en la plantilla desde su 1.3 y ninguna validación las comprobaba.

### Preservado deliberadamente
- Las entradas anteriores de este changelog y los archivos de `SDD/Devs/Bootstrap/` **conservan los nombres que citaban en su momento**, según `SDD-Development-Guide.md` §VI.2 y la regla de que `Bootstrap/` nunca se edita. Un registro que se corrige después deja de ser un registro.

**Sobre el primer snapshot de `_legacy/`.** No se creó ninguno en esta versión. Las entradas `[3.2]` y `[4.0]` se produjeron en una misma sesión de trabajo sobre el estado `[3.1]`, así que no existe un árbol publicado intermedio que preservar. El archivado por versión rige desde la 4.0 hacia adelante: su primera subcarpeta se crea cuando la 4.0 sea superada. Fabricar un snapshot reconstruido sería un registro falso, que es justamente lo que la regla de intocabilidad de `_legacy/` prohíbe.

## [3.2] - 2026-07-28

Reparación de la política de deprecación y del archivado en `_legacy/`. Sube minor: precisa políticas existentes y agrega una sección al esqueleto de despacho, sin modificar ninguna invariante D1-D9 ni el conjunto de artefactos de ninguna categoría. Ninguna documentación ya emitida deja de cumplir.

**Origen.** Ocho hallazgos verificados sobre la política de archivado, cinco reportados por la evaluación de una corrida real del orquestador sobre una solución de cuatro proyectos y tres detectados al contrastarlos contra el framework. Cuatro de ellos comparten el mismo mecanismo: un artefacto se sobrescribe sin que ningún actor reciba error y sin que el directorio se vea incorrecto.

### Cambiado
- `Master-Prompt.md` (3.6 → 3.7). **§3.5**: el layout declara `SDD/Docs/Audit/`, que §10 escribía sin que ninguna fuente de estructura la declarara, y explica dónde aparece `_legacy/` y por qué no ocupa una posición fija. **§5**: la política de deprecación unifica la ruta en `<carpeta-del-artefacto>/_legacy/<YYYY-MM-DD>/` e incorpora los requisitos de estado `Superado` y nota a la versión vigente, que hasta ahora vivían solo en las reglas de categoría y por eso no llegaban al bloque de invariantes que §8 inyecta a los subagentes; la política de versionado incorpora el criterio de estado de cabecera para las correcciones derivadas del audit de la propia fase de emisión. **§7.2**: declara el versionado por corte de cadencia en el tramo de documentación viva y exceptúa a las Fases I y J de la regla de snapshot previo. **§8**: el esqueleto de despacho suma la sección «Estado previo del entregable», y el snapshot queda asignado al orquestador y no al subagente. **§10**: el path del informe de auditoría suma el eje de ronda.
- `Root-Rules.md` (1.4 → 1.5), `Rules-Contexto.md` (1.5 → 1.6), `Rules-Necesidades-Negocio.md` (1.4 → 1.5), `Rules-Examples.md` (2.0 → 2.1), `Rules-Documentacion.md` (2.0 → 2.1): cada una declara que su artefacto emitido sin sufijo de versión sí lo recibe al archivarse, con puntero a la regla general.

### Añadido
- `Master-Prompt.md` **§5.1**, sección nueva con el detalle operativo de la política de deprecación: la ruta única con su lectura de las abreviaturas de las reglas de categoría y el caso distinto de `SDD/Docs/_legacy/` del prerrequisito 4; el sufijo de versión que reciben al archivarse los artefactos emitidos sin sufijo; la tabla de cinco exenciones declaradas (`AGENTS.md`, `CHANGELOG.md`, maqueta, ADR y el campo `evidencia` de los contratos `VER-XX`); y la prohibición de renombrar retroactivamente lo ya archivado, porque etiquetar con una versión un archivo cuyo contenido no se verificó viola D9.

### Corregido
- **Ruta de archivado sin eje de proyecto.** `_legacy/<categoria>/<fecha>/` no tenía forma de distinguir dos proyectos que archivaran la misma categoría el mismo día. La ruta local a la carpeta del artefacto lo resuelve por construcción.
- **Artefactos sin sufijo de versión imposibles de archivar.** Seis clases de artefacto se emitían sin sufijo y se archivaban identificándose por nombre de archivo: el segundo archivado del mismo día sobrescribía al primero. Produjo pérdida real en dos README de sección durante la corrida que originó la evaluación.
- **Re-audit que sobrescribía su informe.** El path del informe de auditoría estaba fijo en `-v1.0` y §10 obliga a re-audit tras un veredicto RECHAZADO. El eje de ronda lo corrige, y con él la trazabilidad de las correcciones, que citan el hallazgo del informe que las origina.
- **Dos erratas de formato preexistentes**: la fila D9 de `Master-Prompt.md` §5 y la fila 3.4 de su §16 estaban separadas de sus tablas por una línea en blanco que las rompía como markdown.
- **Referencia colgada** en `SDD-Development-Guide.md` §2 a `SDD/Devs/Intake/_legacy/`, carpeta eliminada en la entrada 3.1 de este changelog.

## [3.1] - 2026-07-26

Eliminación de material histórico absorbido. No cambia ninguna regla ni el comportamiento del orquestador.

### Eliminado
- `SDD/Devs/Reformulacion/` (4 archivos, 80 KB): `Matriz-Coherencia-Template-v1.0.md` (línea base ST-01), `Propuesta-Modelo-Solucion-Jerarquia-v1.0.md` (ST-02, APROBADA e implementada), `Audit-Reformulacion-Final-v1.0.md` (ST-09, APROBADO sin P0) y `Audit-Unificacion-Intake-v1.0.md` (APROBADO sin P0). Documentaban la reformulación a modelo de solución con jerarquía de proyectos y la unificación del intake, ambas consumadas: el modelo que proponen **es** el framework vigente y los audits cerraron aprobados.
- `SDD/Devs/Intake/_legacy/2026-06-10/` (2 archivos, 56 KB): `PROJECT-BRIEF-template.md` y `PROJECT-README-template.md`, las dos plantillas que el `SOLUTION-INTAKE` unificado reemplazó.

**Criterio aplicado.** Un registro histórico se conserva mientras alguien lo cite o mientras explique algo que las reglas vigentes no expliquen por sí solas. Estos seis archivos no cumplían ninguna de las dos condiciones: cero referencias entrantes desde archivos vivos, y su contenido íntegramente absorbido en las reglas y en las entradas 2.0 a 2.5 de este changelog. El historial de git los preserva y son recuperables.

**No se tocó `SDD/Devs/Bootstrap/`.** Su `Audit-SDD1.md` es la evidencia empírica de las invariantes: siete archivos de reglas lo citan para justificar qué déficit del fuente corrigen. Eliminarlo dejaría a esas reglas diciendo «hacé X» sin poder decir por qué.

### Cambiado
- `README.md` y `SDD/Guides/SDD-Development-Guide.md`: la anatomía del repositorio pierde la fila de `Reformulacion/`, y la descripción de `Bootstrap/` deja de decir «registro histórico congelado» para declarar lo que realmente es, una fuente citada. La guía de desarrollo suma el criterio general para decidir cuándo un registro histórico se conserva y cuándo se elimina.

## [3.0] - 2026-07-26

Intercambio de las categorías 10 y 11, redefinición del cuerpo documental de entrega e incorporación del ciclo de documentación viva posterior al handoff. Sube major porque cambia el alcance y el gating de dos categorías, y porque la documentación generada con la numeración anterior deja de cumplir.

### Añadido
- `SDD/Guides/SDD-Development-Guide.md` (nuevo, 1.0): guía de desarrollo y extensibilidad del framework, para el mantenedor del framework y no el de una solución. Anatomía, seis contratos internos hasta ahora no escritos, **nueve** ejes de extensión con ejemplo trabajado, criterios, once anti-patrones y procedimiento de cambio. El archivo existía vacío desde su creación.
- `README.md` raíz: reescrito como superficie de entrada. Matriz de ruteo por intención, anatomía del repositorio, mapa de las doce categorías, invariantes D1 a D9 enunciadas y reglas de intervención.
- `Rules-Documentacion.md` (2.0): cuerpo documental de entrega organizado por rol de intervención, con artefactos de nivel solución (`Vision-General-Sistema`, `Guia-Inicio-Rapido`, `Guia-Despliegue`, `Bitacora-Eventualidades`, `Contrato-Agentes`, `AGENTS.md`) y tres cuerpos de proyecto: integrador, mantenedor y operador. Modelo de documentación viva en tres momentos, cadencia anclada al cierre de sprint, ensayo de entrega con gate humano y bitácora de eventualidades con triaje obligatorio. Identificadores `OPS-XX`, `EXT-XX` y `EVE-XX`.
- `Rules-Examples.md` (2.0): doble arista del sample. Contrato de verificación `VER-XX` con `verifica`, `comando`, `precondiciones`, `criterio_aceptacion` y `evidencia`, y dos pasadas de generación, de diseño pre-código y de ejecución durante la codificación.
- `Master-Prompt.md` (3.6): Fases I y J, con la precondición dura de la Fase I, su criterio de re-ejecución y diez hallazgos P0 propios. `AGENTS.md` como única salida fuera de `SDD/`.
- `Deriva-Rules.md` (1.1): sondas `VER-XX` en la matriz de sensado. Los proyectos sin interfaz visual dejan de quedar sin instrumento de sensado.
- `SDD-User-Guide.md` (1.5): §4.8 con el paso 7 del usuario y seis entradas de FAQ nuevas, F-24 a F-29.

### Cambiado
- **Intercambio 10 ↔ 11.** `Rules-Developer-Guide.md` pasa a `Rules-Documentacion.md`; la categoría de ejemplos pasa de 11 a 10 y la de documentación de 10 a 11. Carpetas target `10-Examples/` y `11-Documentacion/`. Subagentes reasignados: AG-10 Developer Advocate y AG-11 Technical Writer / Documentation Lead. La dependencia se invierte: 10 demuestra con código ejecutable y verificable, 11 explica, referencia y enlaza.
- **Gating de la categoría 11.** Deja de ser opcional para cuatro tipos D8 y pasa a existir siempre, con granularidad por cuerpo. El cuerpo mantenedor es obligatorio para los ocho tipos.
- **Orden de fases.** La Fase F queda solo con 09-Devops; la Fase G produce la pasada de diseño de 10-Examples; la Fase H suma el plan documental de 11. El handoff cierra el tramo de especificación y no el alcance del framework.
- **Definition of Done del sprint** (`Rules-Plan-Sprint.md` 1.4): incorpora la actualización de la categoría 11 como condición de cierre.
- **Fronteras declaradas en las dos direcciones**: `Rules-Arquitectura-Tecnica.md` (1.4), `Rules-Calidad-Y-Pruebas.md` (1.6) y `Rules-Devops.md` (1.6) declaran su frontera con la categoría 11. Sin esto, el subagente de esas categorías no la conoce, porque cada uno lee un solo archivo de reglas.
- **Tabla de contenido** exigida en los documentos generados por las diez categorías de 00 a 09, cuando superan las tres secciones de primer nivel.
- **Vocabulario de actores normalizado**: «consumidor» pasa a «integrador» y «constructor» a «mantenedor» donde designan un rol de intervención; «audiencia» pasa a «rol de intervención» donde designa a quien lee documentación. Se conservan los usos técnicos y la categoría de stakeholder del intake.
- **Referencias a la sección de anti-patrones**: el orquestador las citaba como «§4.5», numeración que solo coincidía en siete de los trece archivos de reglas. Ahora se las ubica por título.
- `SDD-Getting-Started-Guide.md` (1.1) y `Marco-Teorico-SDD-v1.0.md` (1.7): puestos al día con la numeración nueva.

### Corregido
- **Contradicción entre `Rules-Calidad-Y-Pruebas.md` y `Deriva-Rules.md`** (1.6 → 1.7). La categoría 08 seguía condicionando `Matriz-Sensado-Deriva` a `requiere_maqueta == true` y a haber ejecutado la Fase B2, contradiciendo la extensión del sensado a contratos y comportamiento. Ahora §0 declara las dos clases de sonda y su origen, §2.1 hace la matriz obligatoria también para proyectos con categoría 10, y §6 separa el criterio por clase de sonda y prohíbe la matriz vacía. Sin esta corrección, un proyecto sin interfaz visual seguía quedando sin instrumento de sensado.
- **Nomenclatura de invariantes.** El framework se refería al conjunto como «D1-D8» pese a que son nueve desde la incorporación de D9. Dieciocho ocurrencias normativas pasan a «D1-D9» en el master-prompt, las dos guías de usuario, `Root-Rules.md`, `Rules-Necesidades-Negocio.md`, el marco teórico y el catálogo de diseño, con las enumeraciones completadas. Las notas de coherencia ya emitidas conservan «D1-D8»: verificaron contra el conjunto vigente en su momento.
- **Neutralidad de dominio en la guía de arranque** (1.1 → 1.2). El ejemplo aplicado de §6 nombraba una solución concreta en dieciocho lugares. Pasan al placeholder `<Nombre-Solucion>`, con la descripción del dominio y los flujos de usuario enunciados en términos genéricos.
- **Referencia muerta en el marco teórico** (1.7 → 1.8). El bloque de ejemplo de §11.2 citaba `devs/Rules/decisiones-D1-D8.md`, archivo inexistente, con rutas del layout previo al modelo de tres niveles.
- **Versionado de la plantilla de intake** (1.2 → 1.3). `SOLUTION-INTAKE-template.md` no declaraba su propia versión en cabecera, solo en su control de cambios. Aplicación incompleta de D6 sobre las plantillas.
- **Autosuficiencia del repositorio.** Doce ocurrencias de rutas que apuntaban fuera del árbol quedaron eliminadas. Ningún archivo de `IA.SDD` referencia otro repositorio.

### Impacto sobre documentación ya emitida
La documentación generada con la numeración anterior no se regenera automáticamente. Una solución existente conserva sus carpetas `10-Developer-Guide/` y `11-Examples/` hasta que se ejecute una regeneración parcial de esas categorías. El resto de las categorías no se ve afectado.

## [2.5] - 2026-07-25

Normalización de la nomenclatura de los archivos de reglas: se elimina el prefijo numérico de las doce reglas por categoría.

### Cambiado
- `SDD/Devs/Rules/`: las doce reglas por categoría pierden el prefijo numérico y pasan a `Rules-<Categoria>.md` (`00-Rules-Contexto.md` → `Rules-Contexto.md`, …, `11-Rules-Examples.md` → `Rules-Examples.md`). Las cuatro reglas meta (`Root-Rules.md`, `Intake-Rules.md`, `Maqueta-Rules.md`, `Deriva-Rules.md`) ya cumplían la convención y no cambian. Sin cambios de contenido normativo: no se sube versión de ninguna regla. La numeración de las categorías se mantiene donde sí es semántica: títulos de las reglas (`# Reglas constructivas — 05 Arquitectura técnica`), carpetas destino (`SDD/Docs/05-Arquitectura-Tecnica/`) y fases del orquestador.
- Referencias actualizadas en los 20 markdown del repositorio que citaban los nombres anteriores: `SDD/Devs/Orchestrator/Master-Prompt.md`, `SDD/Guides/SDD-User-Guide.md`, `SDD/Devs/Guides/Coherencia-Auditoria-Marco-v1.0.md`, los nueve documentos de `SDD/Devs/References/Design/`, los cuatro de `SDD/Devs/Bootstrap/`, los tres de `SDD/Devs/Reformulacion/`, las propias reglas y las entradas históricas de este changelog.
- El patrón placeholder `XX-Rules-<Categoria>.md` pasa a `Rules-<Categoria>.md` en `Master-Prompt.md` (§1 y §6), `SDD-User-Guide.md` (§6 y §10 glosario), `Audit-Fase-3.md` y `Matriz-Coherencia-Template-v1.0.md` §2.1.
- `SDD-User-Guide.md` §4.4: la verificación del listado de `Rules/` deja de expresarse como rango `00-Rules-*.md` a `11-Rules-*.md` y pasa a "los doce archivos de reglas por categoría `Rules-*.md` (de `Rules-Contexto.md` a `Rules-Examples.md`)".

## [2.4] - 2026-07-24

Reorganización de las guías de usuario: convención de nombres en inglés y nueva guía de arranque rápido.

### Añadido
- `SDD/Guides/SDD-Getting-Started-Guide.md` (1.0): guía de arranque rápido para primeros pasos con el template, con front-matter estructurado (`doc_id`, `traces` a `SDD-User-Guide.md` y `PROMPT-Agente-Bootstrap-SDD.md`) y orientada a desarrolladores primerizos, analistas, líderes técnicos y agentes de IA.
- `PROMPTS/README.md`: descripción del agente orquestador (borrador inicial).

### Cambiado
- `SDD/Guides/Guia-Usuario-SDD-v1.0.md` → `SDD/Guides/SDD-User-Guide.md`: renombrado a la convención de nombres en inglés, sin cambios de contenido (se mantiene la v1.3).
- `README.md` raíz: se corrige el enlace de la guía de usuario al nombre nuevo (`SDD/Guides/SDD-User-Guide.md`), que había quedado roto tras el rename.

## [2.3] - 2026-07-20

Desacople de la ubicación del repositorio fuente respecto del destino y autocontención de los ejemplos de instancia en el intake.

### Cambiado
- `PROMPTS/PROMPT-Agente-Bootstrap-SDD.md` (2.0 → 2.1): la ubicación del repositorio fuente deja de asumirse hermana del destino. Se introducen los placeholders `<RUTA-FUENTE>` (derivada del path de la invocación, quitando el sufijo `/PROMPTS/PROMPT-Agente-Bootstrap-SDD.md`) y `<RUTA-DESTINO>` (la ruta indicada tras «en el repositorio:»), y se declara `../IA.SDD/` como alias de `<RUTA-FUENTE>/`, lo que cubre las ocurrencias del master-prompt y de las reglas sin editarlas. §1 introduce ambos placeholders y el bloque de invocación; §2 prerrequisito 1 pasa de «clonado como hermano» a «accesible en `<RUTA-FUENTE>`», verificable; §3 invoca al orquestador con las rutas derivadas. Habilita workspaces donde fuente y destino no son hermanas (p. ej. `IA/IA.SDD` y `DEV/<solución>`).
- `SDD/Devs/Intake/SOLUTION-INTAKE-template.md` (1.0 → 1.1): se agrega la **Parte D — Anexos de datos** (§20 escenarios con JSON completo y su procedencia y estado, §21 matriz de cobertura y trazabilidad), la **regla de autocontención** en la guía de uso (paso 5), los ítems de checklist de la Parte D y la fila de trazabilidad downstream. Objetivo: que el intake transcriba los ejemplos de instancia en lugar de referenciar archivos externos que el orquestador aguas abajo no puede resolver. La Parte D es opcional y condicional (existe solo si las fuentes aportan ejemplos), pero cuando existen es su hogar canónico: el cuerpo cita por identificador (`E-1`, `E-2`, …) y el anexo reproduce el dato completo, sin referencias colgantes ni anexos huérfanos.

## [2.2] - 2026-07-19

Incorporación de la Fase B2 de validación visual de maqueta y del mecanismo de sensado de deriva.

### Añadido
- **Fase B2 — Validación visual de maqueta**, opcional y por proyecto, entre la Fase B y la Fase C. Se activa con el flag nuevo `requiere_maqueta`, propuesto por el orquestador y confirmado por el humano. Materializa la especificación de la categoría 03 en una maqueta navegable (HTML, CSS, Bootstrap 5.0 y JavaScript estáticos, sin proceso de build), la valida con el humano en el navegador, retroalimenta la documentación y capitaliza el diseño.
  - `SDD/Devs/Rules/Maqueta-Rules.md`: subagente AG-03M con sus variantes por D8, artefactos, secuencia de siete pasos con tres detenciones, las dos vías de corrección (por prompt y manual, esta última con relectura, interpretación y confirmación antes de propagar), matriz de propagación de la retroalimentación, reglas constructivas de la maqueta, captura del modelo UX-UI, generación del template ofuscado con verificación bloqueante, y el método de lanzado y relanzado con sus tres formas soportadas.
  - `SDD/Devs/Rules/Deriva-Rules.md`: invariante **D9 — evidencia verificable**, con alcance acotado a las afirmaciones sobre el estado del sistema, cuatro condiciones de validez y formato de cita `EV-XX`; los tres artefactos de línea de base (`Linea-Base-Visual`, `Contrato-Datos-Maqueta`, `Matriz-Sensado-Deriva`) con sus identificadores `SUP`, `CMP`, `EST`, `NAV`, `DM` y `SD`; umbrales de deriva menor y mayor por dimensión; los cuatro puntos de sensado.
- **Catálogo de modelos UX-UI** en `SDD/Devs/Modelos-UX-UI/`: `Index-Modelos-UX-UI.md` (arranca vacío) y `Rules-Design-Modelo-Template.md`, la plantilla de captura. Es el tercer eje del sistema de diseño del template, ortogonal al documento base, a las especializaciones por stack y a las extensiones por capacidad; se aplica por encima del base y nunca lo reemplaza.
- **Carpeta `Templates/`** en la raíz del repositorio, con su `README.md` (estructura obligatoria de un template y regla de ofuscación) y `Modelo-Generico/`, el ejemplo de referencia ejecutable que fija la estructura: tres superficies, tokens del catálogo base como variables CSS, fuente única de datos, los cuatro estados conmutables y la superficie de configuración dirigida por esquema.

### Cambiado
- `Master-Prompt.md` (3.3 → 3.4): flag `requiere_maqueta` en §4, invariante D9 en §5, fila de la Fase B2 y dos notas operativas en §6, los nueve pasos de la fase en §7, criterios de audit propios de B2 y de D9 en §10, línea de base y matriz de sensado en el resumen ejecutivo del handoff en §12, seis términos nuevos en §15. Se declara la única excepción de escritura fuera del repositorio destino (captura del modelo UX-UI en `IA.SDD`, con aceptación explícita y ofuscación bloqueante).
- `Rules-UX-UI-DX.md` (1.5 → 1.6): nueva §1.5 con lo que le toca a AG-03 antes y después de la fase, tres artefactos nuevos en la tabla maestra, tres filas de trazabilidad, dos anti-patrones y dos criterios de aceptación condicionados a `requiere_maqueta`.
- `Rules-Calidad-Y-Pruebas.md` (1.2 → 1.3): `Matriz-Sensado-Deriva-v<X.Y>.md` en la tabla maestra y su criterio de aceptación. AG-08 resuelve el método de verificación de cada fila al generar la Fase E.
- `Index-Design-Rules.md` (1.2 → 1.3): nueva §4.1 con el registro del catálogo de modelos UX-UI como tercer eje, el orden de apilado de las cuatro capas y la regla de conflicto.
- `Guia-Usuario-SDD-v1.0.md` (1.2 → 1.3): se agrega la tabla de contenido del documento. Nuevo §4.6 (Paso 5b) con el recorrido completo de la fase; el §4.6 anterior pasa a §4.7. Nuevo §7.4 (agregar un modelo UX-UI). Cuatro entradas de FAQ nuevas (F-20 a F-23). Seis términos nuevos en el glosario. Árbol de carpetas con `SDD/Maquetas/`, las dos reglas nuevas y el catálogo de modelos.
- `Marco-Teorico-SDD-v1.0.md` (1.4 → 1.6): §8.8 (la maqueta como instrumento de diseño y de control) y §9.7 (la deriva como separación acumulativa, la línea de base como referente externo falsable y la fundamentación de D9 y de sus umbrales). Además, puesta al día con el framework vigente: §3.6 y §3.8 corrigen la referencia al master-prompt (v3.0 → 3.4) y el rastro del modelo anterior a los dos repositorios, e incorporan la Fase B2 al diagrama del flujo; §4.1 y §4.3 registran a AG-03M como subagente de fase que no altera el catálogo de 13 especialidades; §13 suma ocho términos. Se agrega la fila 1.5 que el cambio de 2.1 había omitido, en incumplimiento de la política de versionado D5.

### Decisiones registradas
- **El orquestador lanza la maqueta y degrada sin fallar.** Al terminar de construirla levanta un servidor estático local e intenta abrir el navegador con el abridor del sistema. Si no alcanza un entorno gráfico desde donde corre, informa la URL y el comando en lugar de tratarlo como error: el auto-lanzado es una comodidad, la URL informada es el contrato. Para la corrección manual se recomienda el servidor liviano del editor, que recarga solo al guardar y que el orquestador no puede disparar por su cuenta; para el resto de los casos la maqueta trae su propia recarga automática en la barra de validación, apagada por defecto.
- **La maqueta se sirve estática, sin paso de build.** Lo que se edita es lo que se sirve, y es lo mismo que después relee el orquestador; esa equivalencia es la que hace posible la corrección manual del humano. Un paso de build la rompería: obligaría a rebuild para ver cada cambio, dejaría al orquestador sin saber si la verdad es la fuente o el artefacto servido, y metería dependencias en el repositorio destino para un artefacto de vida corta. Tres métodos de lanzado soportados, en orden de preferencia: servidor liviano del editor (en Visual Studio Code, Live Server o equivalente, que recarga solo en cada guardado y es el mejor ajuste para la corrección manual), archivo directo en el navegador, y servidor estático de línea de comandos. La excepción, admitida vía ADR, está en `Maqueta-Rules.md` §7.2.
- **`SDD/Maquetas/` es hermana de `SDD/Docs/`, no está dentro.** `SDD/Docs/` es exclusivamente prosa generada por el orquestador; la maqueta es material ejecutable que el humano edita durante la validación.
- **D9 no se aplica retroactivamente.** Reauditar la documentación previa contra una invariante nueva produciría un volumen de hallazgos que ahoga a los reales.

## [2.1] - 2026-07-18

Incorporación del arquetipo de panel de control monolítico al catálogo de reglas de diseño, a partir de la extracción de características de un servicio en producción.

### Añadido
- **Tres extensiones por capacidad** en `SDD/Devs/References/Design/`, agnósticas de framework y sin literales del dominio de la fuente:
  - `Design-Rules-Primer-Arranque-v1.0.md`: predicado único de aprovisionamiento, corte en tres capas (ruteo, superficie y acción), superficie sin chrome, acto explícito e indivisible, orientación posterior.
  - `Design-Rules-Acceso-Monousuario-v1.0.md`: perfil de operador único definido por sus omisiones, shell partido acceso/trabajo, catálogo de códigos de resultado con rechazo indiferenciado, frontera de sesión.
  - `Design-Rules-Identidad-De-Version-v1.0.md`: versión derivada de la construcción y nunca transcrita, contrato de identidad, ubicaciones obligatorias del sello, detalle de diagnóstico.
- `SDD/Devs/References/Design/Coherencia-Panel-Monolitico-v1.0.md`: nota de coherencia del pase de QA (invariantes D1–D8 y trazabilidad).
- `Design-Rules-Blazor-Mudblazor-v1.0.md` §4.2: mapeo de los patrones de las tres extensiones a componentes MudBlazor.

### Cambiado
- `Design-Rules-Config-Esquema-v1.0.md` (1.0 → 1.1): frontera entre configuración de aplicación y configuración de entorno, y derivación de los presets a partir de los `ejemplos` y el `default` de los descriptores.
- `Design-Rules-Web-Generico-v1.0.md` (1.1 → 1.2), `Index-Design-Rules.md` (1.1 → 1.2), `Rules-UX-UI-DX.md` (1.4 → 1.5) y `Master-Prompt.md` (3.2 → 3.3): registro, criterio de carga, requisitos de artefacto, trazabilidad, anti-patrones e inyección de las extensiones nuevas en el despacho de AG-03.
- `Marco-Teorico-SDD-v1.0.md` §8.7 y `Guia-Usuario-SDD-v1.0.md` §10.2: descripción del arquetipo y árbol del plano `devs/` actualizados.

## [2.0] - 2026-07-17

Refactorización del template SDD: nueva nomenclatura y modelo de dos repositorios.

### Cambiado
- **Marca y nomenclatura:** todo lo que se llamaba `SDD2.2D` / `SDD 2.2` / `sdd2.2` pasa a llamarse `SDD`. La carpeta raíz `SDD2.2D/` es ahora `SDD/`.
- **Convención de nombres Título-Con-Guiones:** carpetas, archivos de metodología y artefactos generados usan Título-Con-Guiones (cada palabra capitalizada, separadas por guion medio), con sufijo de versión `-v<X.Y>.md`. Los identificadores (`NB`, `CU`, `RN`, `ADR`, `US`, `BT`, `RC`, `TC`) van en mayúscula; los valores del conjunto D8 (`library`, `rest-api`, etc.) se mantienen en minúscula por ser enums.
- **Doctrina D3/D4 reescrita:** de "kebab minúscula + sufijo `_v` con guion bajo" a "Título-Con-Guiones + sufijo `-v` con guion medio", incluido el algoritmo de normalización de nombres del `Master-Prompt.md` §3.2 y la tabla de invariantes §5.
- **Referencias internas:** actualizadas en toda la documentación (reglas, orquestador, plantillas, guías, marco teórico e históricos) a los nombres y rutas nuevos.

### Añadido
- **Modelo de dos repositorios:** la metodología pasa de copiar el template dentro del repositorio destino a trabajar con dos repositorios hermanos en un workspace común:
  - Repositorio fuente `IA.SDD` (solo lectura): reglas, plantillas, prompts, guías. Se referencia como `../IA.SDD/SDD/…`.
  - Repositorio destino de la solución: intake y manifiesto derivado en `SDD/Intake/`, documentación generada en `SDD/Docs/`.
  - Esto permite propagar mejoras del template a nuevas soluciones sin re-copiarlo.
- Documentado el nuevo flujo en la guía de usuario (Paso 4) y en el marco teórico (§1.5, §3.5).

### Reescrito
- `PROMPTS/PROMPT-Agente-Bootstrap-SDD.md`: pasa de contener el meta-prompt histórico de bootstrap (SDD 1.0 → 2.0) a ser el prompt de entrada real del modelo de dos repositorios, que fija prerrequisitos y delega en `SDD/Devs/Orchestrator/Master-Prompt.md`. El contenido histórico del bootstrap se conserva en `SDD/Devs/Bootstrap/`.

### Corregido
- El `README.md` raíz tenía dos enlaces rotos a la guía de usuario y al marco teórico (diferencias de casing y separador); ahora resuelven.
- Ejemplos válido/inválido de nomenclatura en las 12 reglas que habían quedado idénticos u orientados a la convención anterior.
