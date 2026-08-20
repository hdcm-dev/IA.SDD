# Nota de coherencia — Intervención sobre los reportes de evidencia 00 a 11

**Framework:** SDD
**Documento:** Coherencia-Reportes-00-11.md
**Versión:** 1.1
**Estado:** Vigente
**Fecha:** 2026-08-15
**Autor:** AG-ROOT (Arquitecto de Soluciones) con verificación contra los doce reportes de evidencia
**Versión del conjunto resultante:** SDD 7.0

---

## 1. Alcance

Intervención sobre el framework a partir de los doce reportes de evidencia emitidos durante corridas
reales del orquestador de generación, entre el 2026-08-09 y el 2026-08-12, sobre el destino
`Repos-RPIs/RPI.VidelControl`. Cada reporte documenta un hueco normativo con incidentes verificados,
la cita de lo que la normativa vigente dice y no dice, la causa raíz y propuestas de intervención no
decididas.

Los doce se agruparon en cinco familias por **dónde vive su corrección**, no por cuándo se detecta el
defecto:

| Familia | Reportes | Qué corrige |
| --- | --- | --- |
| G1 — Atributo fijado sin declarar de qué depende | 01, 05, 06, 08 | Ámbito y ancho de identificadores, obligatoriedad por responsabilidad, nivel por artefacto |
| G2 — El dato que se copia o se deriva | 00 (A y B), 04 | Transcripción fiel y datos derivados en la prosa |
| G3 — Falta arbitraje entre categorías | 02, 03, 07 | Propagación por iteración, conjuntos cerrados, referencia pendiente y decisiones pendientes |
| G4 — El instrumento y el criterio de verificación | 09, 10, 00 (C) | Compuerta mecánica, criterio de corte, marcas de hallazgo, criterios de relación |
| G5 — El vocabulario del método | 11 | Glosario operativo como destino del vocabulario del framework |

Esta nota verifica el resultado contra las invariantes D1 a D9, la trazabilidad entre los archivos
tocados y la coherencia interna del conjunto.

## 2. Inventario de archivos

### 2.1 Creados

| Archivo | Rol |
| --- | --- |
| `SDD/Devs/Guides/Coherencia-Reportes-00-11.md` | Esta nota |
| `_legacy/6.0/` | Copia completa del conjunto normativo superado, 63 archivos |

### 2.2 Editados

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `README.md` | — | Invariante **D3**: ancho de cinco dígitos, ámbito de unicidad producto, remisión a `Root-Rules.md` §9 |
| `Root-Rules.md` | 3.1 → **4.0** | Cuatro secciones transversales nuevas: §9 identificadores, §10 datos derivados, §11 apartamiento, §12 referencia pendiente. Control de cambios pasa de §9 a §13 |
| `Master-Prompt.md` | 5.2 → **6.0** | §3.4 mapa de rangos; §6 grafo de obligaciones y reapertura con insumo; §7.0 detención por arbitraje y decisiones pendientes; §8 insumos del despacho; §10.0 compuerta mecánica; §10 cuatro criterios y dos marcas; §10.1 criterio de corte; §12 lectura del registro; §15 cuatro términos |
| `Vocabulario-Rules.md` | 2.1 → **2.2** | R3 nivel por artefacto; §8 alcance declarado de la regla |
| `Intake-Rules.md` | 3.2 → **3.3** | §5 coherencia intra-escenario; §7 su nivel de bloqueo |
| `PRODUCT-INTAKE-template.md` | 2.1 → **2.2** | §20 regla de transcripción fiel y dos anti-patrones |
| `Maqueta-Rules.md` | 3.1 → **3.2** | §3.5 propagación por iteración; §3.6 regla de escape, fila nueva, manifiesto en la regla de corte |
| `Deriva-Rules.md` | 3.1 → **4.0** | §2.1 ancho remitido a `Root-Rules.md` §9; §2.3 colección derivada |
| `Migracion-Rules.md` | 1.0 → **2.0** | §4.3.1 renumeración en dos pasadas con árbol de migración |
| `Rules-Especificacion-Funcional.md` | 4.0 → **4.1** | §3.2 códigos de error y `FA-NN`; §4.2 conjuntos cerrados |
| `Rules-Arquitectura-Tecnica.md` | 3.1 → **3.2** | Las cuatro menciones del modelo lógico condicionan sobre `tiene_persistencia` |
| `Rules-Examples.md` | 4.1 → **5.0** | §0, §2.1 y §2.2 gating por `redistribuible`; §4.6 trazabilidad falsable y bloque `discrimina` |
| `Rules-Plan-Sprint.md` | 3.1 → **4.0** | §2.1 columna de nivel y cuatro artefactos al nivel producto; §6 numeración y criterios |
| `Rules-Calidad-Y-Pruebas.md` | 3.1 → **3.2** | §6 fuente única de la condición de terminado; retiro del noveno destino de glosario |
| `Rules-Contexto.md` | 3.1 → **3.2** | §4.2 y §6 el acuerdo de equipo referencia y no enumera |
| `Rules-UX-UI-DX.md` | 4.0 → **4.1** | §6 criterio de gobierno de glosario, que no tenía |
| `Rules-Backlog-Tecnico.md` | 3.1 → **3.2** | §3.2 ancho uniforme; §6 primera cláusula del glosario |
| `Rules-Devops.md`, `Rules-Necesidades-Negocio.md`, `Rules-Prompts-AI.md` | 3.1 → **3.2** | §6 primera cláusula del glosario |
| `Rules-Documentacion.md` | 4.1 → **4.2** | §6 primera cláusula del glosario |
| `SDD-User-Guide.md` | 1.9 → **1.10** | §10.1 cinco entradas de glosario; §6 F-30 y F-31 |
| `SDD-Development-Guide.md` | 1.6 → **1.7** | Parte IV, regla de redacción de criterios de aceptación |
| `CHANGELOG.md` | — | Entrada `[7.0]` con bloque de impacto sobre destinos existentes |

Las diecisiete reglas recibieron además la clasificación `[enumerable]` / `[interpretativo]` de sus
criterios de aceptación, con su nota de política conservadora.

### 2.3 Deliberadamente no tocados

| Qué | Por qué |
| --- | --- |
| `SDD/Devs/Bootstrap/` | Registro de la auditoría que originó el framework. Reescribir su notación sería afirmar que verificó algo que en ese momento no existía |
| `SDD/Devs/Guides/Coherencia-*.md` anteriores | Ídem: el alcance de lo que una nota verificó no se toca nunca (`README.md`) |
| `_legacy/` | Los snapshots conservan la nomenclatura con que se emitieron. `Migracion-Rules.md` §4.3.1 lo declara explícitamente |
| `Marco-Teorico-SDD.md` | Recibió el barrido de notación y ningún cambio conceptual: su contenido no se ve alcanzado por esta intervención |

## 3. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** Idioma y registro | Conforme | Todo el material nuevo en español rioplatense neutro técnico, con tildes y eñes, sin emojis ni negritas decorativas. Nombres de archivo en ASCII sin acentos |
| **D2** Encoding | Conforme | UTF-8 sin BOM, LF, fechas `YYYY-MM-DD` |
| **D3** Nombres | **Modificada** | Es el cambio que hace major al conjunto. El ancho pasa de dos a cinco dígitos y se declara el ámbito de unicidad: producto. La forma Título-Con-Guiones y las prohibiciones de espacios, acentos y eñes quedan intactas. Decisión explícita del responsable del framework, tomada el 2026-08-15 |
| **D4** Sufijo de versión | Conforme, sin cambios | La modificación de D3 no la alcanza: D4 gobierna el sufijo de las copias archivadas, no el ancho del identificador. Se corrigieron las citas que las nombraban juntas por hablar ambas de nomenclatura |
| **D5** Una sola versión vigente | Conforme | Cada archivo tocado subió versión y registró su fila de control de cambios. El conjunto superado se copió completo a `_legacy/6.0/` antes de sobrescribir |
| **D6** Trazabilidad | Conforme y reforzada | Las cuatro secciones transversales nuevas se citan desde el despacho de §8, y las reglas que las consumen las nombran por sección. La referencia pendiente de §12 es, precisamente, un mecanismo de D6 para el caso en que el destino todavía no existe |
| **D7** Neutralidad de dominio | Conforme | Ningún ejemplo del material nuevo usa vocabulario, productos ni protocolos del dominio de un cliente. Las mediciones de las corridas reales se citan como magnitudes —191 estados, 374 sondas, 39 archivos renumerados— sin nombrar el dominio |
| **D8** Conjunto cerrado de tipos | Conforme, intacto | Los ocho valores no cambian. Lo que cambia es **de qué depende una obligación**: donde antes se preguntaba por el tipo, ahora se pregunta por un flag del proyecto de código que el orquestador ya derivaba |
| **D9** Evidencia verificable | Conforme y reforzada | `Root-Rules.md` §10 declara qué es un dato derivado y cómo se ancla, sin ampliar el alcance de D9, que sigue acotado a afirmaciones sobre el estado del sistema. La ampliación de D9 a los recuentos en prosa se evaluó y se descartó a propósito, y queda registrada como trabajo siguiente |

## 4. Trazabilidad de la intervención

Cada corrección declara el reporte que la origina en la fila de control de cambios del archivo que la
recibe. La cadena inversa, para verificar que ningún reporte quedó sin tratar:

| Reporte | Corrección | Dónde |
| --- | --- | --- |
| 00 huecos A y B | Transcripción fiel y coherencia intra-escenario | `PRODUCT-INTAKE-template.md` §20, `Intake-Rules.md` §5 y §7 |
| 00 hueco C | Marca de hallazgo *aguas arriba* | `Master-Prompt.md` §10 |
| 01 | Ámbito de unicidad, mapa de rangos, códigos de error, titularidad | `README.md` D3, `Root-Rules.md` §9, `Master-Prompt.md` §3.4, `Rules-Especificacion-Funcional.md` §3.2 |
| 02 | Propagación por iteración, regla de escape, fila nueva, manifiesto en la regla de corte | `Maqueta-Rules.md` §3.5 y §3.6 |
| 03 | Conjuntos cerrados marcados, detención por arbitraje, registro de decisiones pendientes, verificación cruzada P0 | `Rules-Especificacion-Funcional.md` §4.2, `Master-Prompt.md` §7.0 y §10 |
| 04 | Datos derivados en la prosa y control de recuentos anclados | `Root-Rules.md` §10, `Master-Prompt.md` §10 y §10.0 |
| 05 | Ancho, colecciones derivadas, estabilidad y capacidad juntas | `Root-Rules.md` §9, `Deriva-Rules.md` §2.1 y §2.3 |
| 06 | Obligatoriedad por flag del proyecto, apartamiento declarado | `Rules-Arquitectura-Tecnica.md`, `Rules-Examples.md`, `Root-Rules.md` §11 |
| 07 | Referencia pendiente, reapertura con insumo, fuente única exigible | `Root-Rules.md` §12, `Master-Prompt.md` §6, `Rules-Calidad-Y-Pruebas.md` §6, `Rules-Contexto.md` §4.2 |
| 08 | Nivel por artefacto, artefactos del equipo al nivel producto, numeración de iteraciones | `Vocabulario-Rules.md` §4 R3, `Rules-Plan-Sprint.md` |
| 09 | Compuerta mecánica, criterio de corte, marca de detectabilidad, clasificación de criterios | `Master-Prompt.md` §10.0, §10 y §10.1; §6 de las diecisiete reglas |
| 10 | Trazabilidad falsable, bloque `discrimina`, regla de redacción de criterios | `Rules-Examples.md` §4.6, `SDD-Development-Guide.md` Parte IV |
| 11 | Vocabulario del método al glosario operativo, cuatro términos nuevos, dos reglas que no tenían el criterio | `Master-Prompt.md` §15, `Vocabulario-Rules.md` §8, §6 de las trece reglas de categoría |

## 5. Observaciones

**Una corrección se aplicó en forma reducida, y se declara.** El plan preveía agregar una columna de
nivel a la tabla maestra §2.1 de las doce reglas de categoría. Se aplicó de otra forma:
`Vocabulario-Rules.md` §4 R3 exige la columna **solo cuando una categoría contiene artefactos de más
de un nivel**, y la cabecera gobierna al resto. El motivo es que en once de las doce categorías la
columna repetiría el mismo valor en todas sus filas, y una columna de valores idénticos agrega
superficie de desincronización sin agregar información. Hoy la única categoría que la lleva es la 07.

**Dos defectos introducidos durante la intervención, detectados y reparados.** Trece filas de control
de cambios quedaron con una columna de más, porque el script de edición supuso cuatro columnas en
tablas de tres; y una fila de `Root-Rules.md` recibió su texto en la columna de fecha. Se registran
acá porque son exactamente la clase de defecto que el reporte `04` documenta —una corrección aplicada
a medias— y porque los encontró una comprobación mecánica y no una lectura.

**El barrido de notación se midió antes y después.** 336 sustituciones de patrón (`-XX` a `-XXXXX`) y
177 identificadores de ejemplo normalizados a cinco dígitos, con cero residuos. Se conservaron las dos
familias excluidas: 17 apariciones de `AG-XX` y 20 del ordinal de iteración.

**Lo que esta intervención no hizo, con su motivo.** Correr la comprobación del grafo de obligaciones
sobre las diecisiete reglas; el inventario completo del vocabulario propio del framework; adelantar la
condición de terminado a la Fase A; decidir si el «glosario de categoría» es un artefacto real; y
ampliar D9 a los recuentos en prosa. Los cinco están declarados en el plan de aplicación, y ninguno
queda como hueco silencioso.

**Un pendiente estructural quedó explícito.** Durante la intervención se confirmó, con mediciones
sobre tres destinos reales, el pendiente que `Vocabulario-Rules.md` §8 ya declaraba: la **unidad de
entrega** está definida y no es un nivel del layout, y las once categorías cuelgan del nivel de
proyecto de código. Es una intervención estructural aparte, y ésta es su prerrequisito: el nivel por
artefacto de R3 es lo que permite declarar qué artefacto corresponde a qué nivel.

> **Reexpresado.** Esta nota verificó el conjunto **7.0**, y en ese momento el pendiente estaba sin
> ejecutar. La versión **8.0** lo ejecutó, en la misma sesión: el nivel intermedio pasó a la unidad de
> entrega y `Vocabulario-Rules.md` §8 lo declara cerrado. La celda se reexpresa porque su redacción
> original —«sin ejecutar»— quedaría falsa contra el árbol vigente; lo que la nota **verificó** no se
> toca, según `README.md`. Su nota de coherencia es
> [`Coherencia-Unidad-De-Entrega.md`](Coherencia-Unidad-De-Entrega.md).

## 6. Veredicto

**APROBADO.** El conjunto normativo 7.0 es internamente coherente:

- Los doce reportes están tratados y cada uno declara dónde vive su corrección.
- Las correcciones no se contradicen entre sí: los seis cruces posibles se resolvieron de forma
  explícita en el plan de aplicación, y el más delicado —que el audit verifique recuentos sin
  ancla— quedó acotado por la regla que lo produce.
- Cada archivo tocado subió versión con su fila de control de cambios, y el conjunto superado está
  archivado completo en `_legacy/6.0/`.
- La única invariante modificada es D3, con decisión explícita del responsable, y su impacto sobre
  destinos existentes está declarado en la entrada `[7.0]` del `CHANGELOG.md` con su vía de
  reparación, que la migración normativa ahora sabe ejecutar.

---

## Control de cambios

| Versión | Fecha | Descripción |
| --- | --- | --- |
| 1.0 | 2026-08-15 | Nota inicial de la intervención sobre los reportes 00 a 11, conjunto 7.0. |
| 1.1 | 2026-08-15 | **Reexpresión de una celda de §5**, según el procedimiento de `README.md`: la nota declaraba el pendiente de la unidad de entrega «sin ejecutar», y la versión 8.0 lo ejecutó en la misma sesión, de modo que esa redacción quedaría falsa contra el árbol vigente. Se declara bajo qué versión se hizo la verificación original y se enlaza la nota de coherencia que registra su cierre. El alcance de lo que esta nota verificó no se toca. |
