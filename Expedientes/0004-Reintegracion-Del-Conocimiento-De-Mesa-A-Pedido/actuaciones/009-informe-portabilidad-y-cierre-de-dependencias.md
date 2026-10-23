| Campo | Valor |
|---|---|
| Tipo | informe |
| Fecha | 2026-10-23 |
| Autor | Comisión de Portabilidad y cierre de dependencias |
| Corrige | — |

# Informe de la comisión de Portabilidad y cierre de dependencias

Segunda ronda, bajo el objetivo corregido del folio 008: lectura (b), O2′ y O5. Trabajé a ciegas respecto de esta ronda. De `actuaciones/` leí 001 a 008 y ningún folio posterior. Las líneas «fork L*n*» son del fork 1.15, que está fuera del repositorio (`<insumos>`). Las líneas «conv :*n*» y «base :*n*» son de sus dos dependencias del destino, `_convenciones_comunes.md` (1.7) y `_reglas_base_conocimiento.md` (1.2), también en `<insumos>`. Las demás son de `IA.SDD` en `c9b3e46`, salvo que diga otra cosa. Todo lo que viene del destino va ofuscado: no nombro producto, organización, proveedor, sistemas, rutas de expedientes o bitácoras ni hashes de su repositorio. Cuando hace falta, remito a la línea del fork.

## 0. Qué revisé y con qué medio

| Medio | Qué se leyó o corrió |
|---|---|
| Lectura | Folios 001 a 008; ev-01 a ev-03; el fork 1.15 entero (en la convención del fork, «Secciones de Mesa-De-Expertos-A-Pedido 1.15 leídas: entero», porque esta comisión audita su origen); `_reglas_base_conocimiento.md` entero; `_convenciones_comunes.md` §1, §7 a §7.4, §10 y su control de cambios |
| Árbol del framework | `git show c9b3e46:<archivo>` de `Rules-Base-Conocimiento.md` 2.2 (§0 a §0.4, §4.2 a §4.5, §6, §7), `Mesa-Rules.md` 1.5, `Master-Prompt.md` 8.21, `Expediente-Rules.md` 1.1, `Root-Rules.md` 8.9 (§11, §13, §14), `Deriva-Rules.md` 5.5 §3, `Rules-Arquitectura-Tecnica.md` §3.3, `Conocimiento/Index-Knowledge.md`, `README.md:154` |
| Búsqueda de equivalentes | `git grep -n -I -E '<patrón>' c9b3e46 -- SDD Conocimiento README.md`, un patrón por concepto (tabla de §1) |
| Cotejo de las copias | `git show c9b3e46:<regla> \| sed -n '<rango>p'` para cada rango que cita el fork. Además, `diff` de `Mesa-Rules.md` y `Master-Prompt.md` de `c9b3e46` contra `_legacy/13.21/`, y de `Expediente-Rules.md` de `5b8a31b` contra `c9b3e46` |
| Prueba de O2′ | Una copia sin historia en un workspace vacío y un guion que resuelve cada referencia dentro de esa copia (§3). Se corrió sobre la 1.2 y sobre el fork |

**Lectura de P0–P3 para este caso** (`Master-Prompt.md:1486-1489`, la misma escala leída para el objeto):
- **P0**: hace fallar O2′ o viola una restricción dura (R1 a R4).
- **P1**: hace que el redactor o el reproductor a ciegas resuelvan una referencia a algo distinto de lo que el conocimiento necesita, o deja retrabajo después de la redacción.
- **P2**: una pérdida acotada.
- **P3**: claridad.

**Clases que uso en la tabla.** Primero separo **dependencia** (el conocimiento la necesita para aplicarse) de **trazabilidad** (origen histórico, que se describe sin ruta). Cada dependencia cae en una de cuatro clases:
- **R**: hay un equivalente en el árbol que dice lo mismo. Se re-ancla: cambia la cita, el contenido no.
- **M**: el contenido ya está escrito en el propio fork. Sólo hay que re-apuntar la cita, que hoy señala afuera.
- **T**: no hay equivalente. Se trae el contenido.
- **X**: traerla exige una regla. Se decide con default y sale marcada (folio 008, §4).

Las de trazabilidad llevan la clase **H**.

## 1. Cierre transitivo: una fila por dependencia

El cierre se armó así:
1. Lo que cita el fork.
2. De eso, lo que vive en `_convenciones_comunes.md` o en `_reglas_base_conocimiento.md`.
3. Lo que esas secciones citan a su vez, mientras el fork lo use.

**Cierra en el segundo nivel**: lo que §10 de las convenciones cita afuera de sí sólo aparece en su párrafo de origen (conv :478-484), que es trazabilidad.

### 1.1 Dependencias

| # | Dónde la cita el fork | Qué contenido toma | Equivalente en `IA.SDD` `c9b3e46` (verificado) | Clase | Qué se trae y en qué forma |
|---|---|---|---|---|---|
| D-01 | L10 `Compatible-con: _reglas_base_conocimiento.md 1.0` | La norma del catálogo que aloja el documento | `Rules-Base-Conocimiento.md:6` (2.2), campo `:230`, coincidencia con la fila `:357` | R | `Rules-Base-Conocimiento.md 2.2`. El número de versión del destino no se traslada |
| D-02 | L224 `Rules-Base-Conocimiento.md K6`. En el destino es base :241, y remite a base §0.3 | «Desviación» designa al documento que contradice el piso y lo declara | `Rules-Base-Conocimiento.md:100-102` («salvo que el documento documente la desviación con su justificación»), `:360` (§6.1) y `:83-99` (ítem rotulado). Dice lo mismo. **K6 no existe en el framework**: `git grep -n -E 'K[0-9]\b' c9b3e46 -- SDD Conocimiento` → 0 | R | Cita a `Rules-Base-Conocimiento.md` §0.4 y §6.1, sin invariante numerada |
| D-03 | L224, L431, L434: la carpeta de contexto del producto (conv §1, nivel 2) | La fuente de verdad del producto: una decisión aceptada «o su carpeta de contexto» manda en la rama de la regla. «Desvío» es el producto que no la sigue | La búsqueda del nombre de esa carpeta en el árbol (`git grep -n '<nombre>/'`) → **0**. La mitad «ADR `Aceptado`» sí tiene equivalente: `Rules-Arquitectura-Tecnica.md:132` y `:170`. «Desvío» es contiguo a «deriva mayor» (`Deriva-Rules.md` §3, `:151-158`), pero no es lo mismo: la deriva compara el sistema contra su línea de base, no contra una carpeta de contexto | T (la carpeta) + R (el ADR) | Una definición en el texto, de 1 a 2 líneas: «la fuente de verdad que el producto declare (en un destino que la tenga, su carpeta de contexto)» |
| D-04 | L280-281: barrido del índice con la ruta del destino | El comando del barrido y el de la versión | `Conocimiento/Index-Knowledge.md:32` (diez columnas) y `:39`. `cut -d'|' -f3,5,11` sobre `:39` da alias, `Tema` y `Estado`: **el mismo comando sirve** | R | Las rutas pasan a `Conocimiento/Index-Knowledge.md` y `Conocimiento/Knowledge-<alias>.md` |
| D-05 | L205 y L377 (conv §10, :454-465) | **Un obstáculo no es una decisión**: si falta *poder* y no *decidir*, se pregunta en una línea, en el momento, a quien tiene el acceso. Y un agente al que le deniegan una acción no se la pide a otro | **Ninguno.** `git grep -n -i 'obst[aá]culo'` → 3 líneas, todas con otro sentido (`Catalogo-De-Criterios.md:195`, `:206`; `Coherencia-Politica-De-Coincidencia.md:45`). `Master-Prompt.md` §8.1 (`:884-1105`) no trata la falta de permiso ni de credencial. `git grep -i 'deniegan\? una acci\|no se la pide a otro'` → 0 | **T** | Ver PC-02 |
| D-06 | L471 y L518 (conv §10, paso 4, :450-452) | Una decisión barata y reversible frente a una cara e irreversible **no es un empate**: se toma la reversible y se anota la condición para revisarla | Contiguo y distinto. `Mesa-Rules.md:446` (juez de riesgo e irreversibilidad), `:459` (veto) y `:575` (disparador 4) **escalan** lo irreversible: no mandan tomar lo reversible. `git grep -i 'se toma la reversible\|la reversible y se anota'` → 0 | **T** | Con §10, como unidad (PC-02) |
| D-07 | Transitiva: conv §7.4 :240 cita conv §10 :467-472, «la restricción también es una opción» | Proponer el cambio de una regla mal calibrada es una opción, y proponer no es tocar | El fork ya la escribe en L238: «una propuesta de cambio de la convención, que rige recién cuando se apruebe». En el árbol no hay equivalente: `git grep -i 'la restricción también es una opción'` → 0 | M + T | Entra con §10 |
| D-08 | Transitiva: el alcance de conv §10 (:435-436: los agentes que conducen una fase, todo orquestador y toda mesa) y «regla del marco» (:467) | A quién alcanza la cadena de consecuencias | Mapeo de términos: el orquestador es `Master-Prompt.md` §1 (`:43`); las reglas son las del conjunto normativo del framework | R (en la redacción) | Una línea dentro de lo que se trae: «todo agente que recomiende, dictamine o elija, y toda mesa» |
| D-09 | L373, L461, L494 (conv §7.4, :227-282). Su origen está en L782-784 | **Apartamiento de un conocimiento**: la ficha, los cuatro pasos, los defaults, la imposibilidad medida, el ADR `Propuesto` y el campo «quién lo aprobó», que **exige una regla** (L372-373) | **El contenido ya está en el fork**, pieza por pieza: el precedente no es una regla y la contradicción no es conveniencia (L238); los defaults (L263, L428-436); la ficha y la imposibilidad medida (L357-380); los cuatro pasos y el segundo camino (L460-510); el término (L224). **Lo que no está en el fork es la fuerza**. Conv :229-230 lo hace regir «para todo agente y toda mesa que el proyecto convoque», bajo la guarda del índice. En el framework, `Rules-Base-Conocimiento.md:21-31` y `:100-103` hacen consultivo a todo conocimiento; `git grep -i 'precedente del producto'` → 0 | M + **X** | Ver PC-01 |
| D-10 | Transitiva: conv §7.4 :233 cita «un documento de la lista de §7.1» | La lista de conocimientos aplicables: la unión de los que disparan por condición y los que se citan | `Master-Prompt.md:576`: «la unión de dos conjuntos: las filas cuya condición de carga evalúa verdadera … y …». Dice lo mismo | R | Cita a `Master-Prompt.md` §6 (`:576`) |
| D-11 | L430 (conv §7.2) | En la rama de la regla, qué es «la regla del destinatario» que manda | `Rules-Base-Conocimiento.md:100-103` («manda la regla de categoría»), `Master-Prompt.md:577` (precedencia del conocimiento) y `Root-Rules.md` §13 (`:772`, entre reglas). En el framework, la regla del destinatario es el archivo de reglas de su categoría: dice lo mismo para su propio árbol | R | Cita a `Rules-Base-Conocimiento.md` §0.4 y `Root-Rules.md` §13 |
| D-12 | Transitiva: la guarda de conv §7.4 :229 (la invariante de vaciado, base :236) | Con el catálogo vacío, nada cambia | `Rules-Base-Conocimiento.md:65-71` (§0.2). Dice lo mismo | R | Sólo si el jurado trae la regla de D-09 |
| D-13 | L154: el registro de auditoría del destino, foliado por `ruta@commit` | Cómo se folian los informes de una mesa en un destino | `Expediente-Rules.md:141-144` y §5 (`:306`). La 1.2 ya lo dice (`Knowledge-Mesa-De-Expertos-A-Pedido.md:122`) | R (ya resuelve) | — |
| D-14 | L173 y L184: las carpetas de insumos y de salidas del caso | Qué se versiona: lo que aportó quien pidió y la salida real del caso | El árbol del expediente (`Expediente-Rules.md:109-119`) tiene `README.md`, `actuaciones/` y `evidencia/`, y nada más. Las únicas apariciones de esos nombres en el árbol tienen otro sentido (`Coherencia-Conformacion-Pull-Request-Automatico.md:26`, carpeta de un tool-prompt) | M + T | La definición ya está entre paréntesis (L173). Los nombres se reemplazan por «lo que aporta quien pidió» y «la salida real del caso, donde el destino la guarde» |
| D-15 | L220 (A8, D9) y L694 (D1-D9) | El criterio del bloque de testimonio y la evidencia `humano` | `Expediente-Rules.md:395` (A8); `Deriva-Rules.md:22` (D9); `Catalogo-De-Criterios.md:97`; `Master-Prompt.md:449` (D1-D9). Dicen lo mismo | R (ya resuelve) | — |
| D-16 | L524: «cumple A1 a A12 de `Expediente-Rules.md` §6» | El conjunto de criterios del expediente | **Contiguo y distinto**: `Expediente-Rules.md:448` dice «**A1** a **A15** … A13 a A15 sólo para un expediente con `resolucion`» desde 13.20 (`5b8a31b`) | R con corrección | Ver PC-06 |
| D-17 | L411 y L503-513: ADR `Propuesto` → `Aceptado`, y «el registro de decisiones del producto» | Los estados del provisorio | `Rules-Arquitectura-Tecnica.md:170` (`Propuesto | Aceptado | Superado por ADR-YY | Rechazado`) y `:130-131` (`Adrs/` con índice). Dicen lo mismo | R (ya resuelve) | — |
| D-18 | L607, L629, L675, L758, L760, L763-766 (`c9b3e46`) y L769 (`5b8a31b`) | El ancla de las copias de §8 y de los orígenes | **Un commit no está en una copia sin historia.** Equivalente verificado: `_legacy/13.21/` es idéntico a `c9b3e46` para `Mesa-Rules.md` y `Master-Prompt.md` (`diff` vacío), y `Expediente-Rules.md` de `5b8a31b` es idéntico al de `c9b3e46` | R | Ver PC-03 |
| D-19 | L42, L225, L756 (`Coherencia-*`); L110, L664, L777 (`Root-Rules.md` §14 y §14.2); L233 (`Deriva-Rules.md` §3); §0.0 a §7.1 de `Mesa-Rules.md`; §7.0 a §10.1 de `Master-Prompt.md`; §1, §3, §3.3 y §3.4 de `Expediente-Rules.md` | Las reglas del framework que el fork cita por sección | Todas las secciones existen (encabezados verificados). Las 22 citas por rango de líneas dicen, textualmente, lo que el fork transcribe (§4, ítem 1) | R (ya resuelve) | — |
| D-20 | L584: `Rules-Base-Conocimiento.md` §0.4, «manda la regla» | La precedencia del conocimiento | `Rules-Base-Conocimiento.md:98-103`, dentro de §0.4 «Los tres modos de aportar». Dice lo mismo, **pero por coincidencia** (PC-04) | R | — |
| D-21 | L233: `Expedientes/0003-…`, folio 019 | El caso de la clase «decisión» del filtro | `Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/actuaciones/019-…` existe y trata el desvío de modo de render (R-E, R-F). Es del framework | R (ya resuelve, con comodín) | — |
| D-22 | L752: `Index-Knowledge.md` | El enlace al índice | Resuelve desde `Conocimiento/` | R | — |

### 1.2 Trazabilidad (se describe sin ruta y sin hash)

| # | Dónde | Qué es | Por qué no es dependencia |
|---|---|---|---|
| H-01 | L742-746, «Desviación declarada respecto del piso», con base §8 (cuerpo importado verbatim) y base §5 (*Especializar*) | Cómo se gobernaba el cuerpo en el destino | La premisa no existe en el framework: aquí el documento no es importado, es del emisor. `git grep -i verbatim -- Rules-Base-Conocimiento.md` → sólo `:490`, con otro sentido. Bajo (b) **no se quita**: pasa a §9 como origen, descripto |
| H-02 | L768, L788, L789 (base §4.6, techo en bytes y techo de 700 líneas) | Por qué nació el mapa de carga | El mapa (L55-75) no cita base §4.6: se aplica solo. El motivo es historia |
| H-03 | L760, L761, L766, L782-787 (conv 1.5 y 1.6 §7.2, §7.4) | La versión de la regla del destino que siguió cada fila | El contenido que se usa está en D-09 y D-11 |
| H-04 | L704: la carta de una comisión de un expediente del destino | La forma de leer P0–P3 en una mesa | Las cuatro lecturas ya están escritas en L704-706 (M) |
| H-05 | L236, L238, L239, L240: rutas, archivos, identificadores y un hash del destino en la columna «De dónde sale» | El caso que enseña cada filtro | Es método con ejemplo. El mecanismo y las cifras se conservan sin nombres (005, MC-04; 007, RO-08) |
| H-06 | L757-769 (§9, orígenes 1.3–1.15) y L778-790 (§10) | Historia del fork | 21 de las 36 referencias que no resuelven están acá (§3) |
| H-07 | L75 y L596: el nombre del destino como ejemplo de destino sin la norma | Un ejemplo | La regla vale sin el ejemplo («en un destino sin la norma de la mesa») |
| H-08 | L263: una decisión del Product Owner en el destino | El fundamento de elegir entre caminos y no entre sí y no | El fundamento citable está en el propio texto (L516-520) |

## 2. Dimensión de lo que hay que traer

| Qué | Origen | Líneas / bytes | Forma |
|---|---|---|---|
| Cadena de consecuencias: los cuatro pasos, el obstáculo, la restricción como opción y la cadena al ejecutar (D-05 a D-08) | conv §10, :433-485 | **53 / 4.059 B**: 46 de regla y 7 de origen (H) | PC-02 |
| Definiciones de términos sin equivalente: la carpeta de contexto, las carpetas de insumos y salidas, el alcance de §10 (D-03, D-08, D-14) | conv §1 y fork L173 | **≈ 4** | En el texto, donde se usan |
| Apartamiento de un conocimiento (D-09) | conv §7.4, :227-282 | 56 / 5.102 B en el destino. **Contenido nuevo: 0**, porque ya está en el fork | Sólo cambia la fuerza: X (PC-01) |
| Re-anclajes (D-01, D-02, D-04, D-10, D-11, D-16, D-18 y las 7 citas a conv §7.4 y §10 del cuerpo) | — | **≈ 27 líneas editadas**, sin contenido nuevo | Cambia la cita |
| Trazabilidad reescrita sin ruta (H-01 a H-08) | — | §9: 22 líneas; §10: 13 filas; cuerpo: 11 líneas | Se describe |

**Total que entra al framework como contenido nuevo: unas 57 líneas.** Si el jurado elige el camino C-2 de PC-01, se suman hasta 56 en una regla, y eso sale marcado. **De `_reglas_base_conocimiento.md` no se trae ninguna línea**: su única dependencia, K6, tiene equivalente (D-02). Lo demás que el fork le toma es trazabilidad (H-01, H-02).

## 3. Comprobación mecánica de O2′

**Prototipo corrido**, con este procedimiento:
1. `W=$(mktemp -d)`; `git archive <commit> | tar -x -C "$W/IA.SDD"`; se copia `_legacy/13.21/`, que todavía no está versionado.
2. Se comprueba que `ls -A "$W"` da sólo `IA.SDD` y que no hay `.git`.
3. Se corre `python3 -I o2prima.py "$W/IA.SDD" <doc>…` (scratchpad local, fuera del repositorio; SHA-256 `5e4ae2b13789b337c43565ffa5e6e0bd44b31104b53deb091e7e6beda65a1791`).

| Corrida | Resultado |
|---|---|
| 1.2 del framework | **0 fallas**: 56 rutas y 37 citas de sección resuelven |
| Fork 1.15 puesto en `Conocimiento/` | **123 fallas**: 71 ocurrencias de ruta (**36 referencias únicas**, igual que ev-01), 36 líneas con un nombre o una ruta del destino, 15 hashes de commit y 1 invariante (K6). Salida local, con rutas del destino, SHA-256 `0e3124094a083960745f89f079ed8dff199a5dd7f9d4112107d0f64be50818a9` |

De las 36 referencias únicas, **15 están en el cuerpo y 21 en §9 y §10**. Las del cuerpo son:
- 10 dependencias: L10, L205, L280, L373, L377, L430, L461, L471, L494 y L518.
- 4 trazabilidad: L236 dos veces, L239 y L704. Los rótulos son los de §1.2.
- 1 trazabilidad que no se borra: L743 (H-01).
- 1 falso positivo de plantilla: L604, `actuaciones/NNN-…`.

**Qué hace el guion**, en el orden en que se propone asentarlo como texto en `evidencia/` (`Expediente-Rules.md:232`: un guion se asienta como texto, sin permiso de ejecución):

| Clase de referencia | Cómo resuelve | Falla si |
|---|---|---|
| Ruta `*.md`, con directorio o sin él, o abreviada con `…` | Primero contra la raíz de la copia, después contra la carpeta del documento, después por nombre único fuera de `_legacy/`. `…` se resuelve como comodín. `realpath` tiene que quedar dentro de la copia | No existe, es ambigua o sale de la copia por `../` |
| `Archivo.md §n` | El encabezado `^#{1,6} §?n[ .]` existe en ese archivo | Falta la sección |
| `Archivo.md:a-b` o «líneas a-b» | El rango cabe en el archivo **y**, si la línea transcribe un literal «…», el literal está en ese rango (normalizado) | Falta el rango o el texto no coincide. El prototipo sólo mide el rango; el cotejo de texto se hizo a mano en §4 |
| Hash `[0-9a-f]{7,40}` entre acentos graves | Nunca resuelve | Siempre: la copia no tiene historia |
| `Archivo.md Kn` / `An` / `Dn` | El identificador está definido en ese archivo | No está definido |
| Alias entre acentos graves | Columna `Alias` de `Conocimiento/Index-Knowledge.md`; `Hereda-de` resuelve a una fila `Vigente` | No está en el índice |
| Nombres del destino | `_convenciones_comunes`, `_reglas_base`, la ruta de su índice, el prefijo de las rutas de sus expedientes y el nombre de su carpeta de contexto → 0. Además, `grep -c -f <lista>`, con una lista de términos privados que vive **fuera** del repositorio → 0 | Cualquier aparición |

Excepciones que el guion declara:
- Las plantillas (`NNN-`, `<…>`, `{{…}}`).
- El `README.md` suelto, que en el texto nombra la carátula de un caso y no un archivo.

**Se corre** sobre cada documento que el expediente toque en `Conocimiento/` y sobre su nota de coherencia. Lo hacen la auditoría mecánica y las dos reproducciones a ciegas (O4), con salida 0 y la tabla foliada.

## 4. Hallazgos

| Id | Nivel | Ancla | Hallazgo | Impacto si no se corrige | Propuesta |
|---|---|---|---|---|---|
| **PC-01** | **P0** | E2: fork L372-373 («el campo "quién lo aprobó" que exige la regla del producto que aloja este fork»); conv :229-230 («rige además esto, para todo agente y toda mesa que el proyecto convoque»). E4: `Rules-Base-Conocimiento.md:21-31` y `:100-103`; R1 (folio 008, §4). E1: `git grep -i 'precedente del producto'` → 0 | **La única dependencia que no se puede traer entera sin una regla es la fuerza de conv §7.4.** Su contenido ya está materializado en el fork (D-09: L224, L238, L263, L357-380, L428-436, L460-510), y bajo la lectura (b) entra sin traer una línea. Lo que el fork toma de afuera es la **obligación**: el «Aprobó» exigido y el alcance sobre todo agente. En `Conocimiento/` no puede imponerse, porque es consultivo | Si se trae como texto que dice «exige», el conocimiento se vuelve norma (007, RO-01). Si se quita, se viola O2: «nada se quita». Si la cita queda, falla O2′ | **Default (C-1, reversible)**: el contenido entra tal cual. «Aprobó» pasa a ser un campo **de la ficha de este conocimiento** (§5.5), exigido por §6 del propio documento, que sólo verifica su aplicación (`Rules-Base-Conocimiento.md` §4.2, `:254`). El alcance se acota a «quien aplica este conocimiento». §8 declara que en el framework ninguna regla vuelve vinculante a un conocimiento. **C-2 (marcado al Product Owner)**: sumar a `Rules-Base-Conocimiento.md` una sección sobre cómo apartarse de un conocimiento aplicable, con la sustancia de conv §7.4 (≤ 56 líneas). Toca una regla: R1. C-2 es el más cercano a cumplir la fuente. **SI NO RESPONDÉS**: rige C-1, y C-2 queda como deuda en la nota de coherencia |
| **PC-02** | **P0** | E1: §1, D-05 y D-06 (`git grep` → 0 equivalentes; `Mesa-Rules.md:446`, `:575` son contiguos y distintos). E2: fork L205, L377, L471 (K-2 «fuente: `_convenciones_comunes.md` §10, paso 4»), L518 («la regla de la casa») | **Cuatro cláusulas del cuerpo descansan en conv §10, que no tiene equivalente en el árbol**: el bloqueo de un paso prescripto (L205), la ficha sin acceso para medir (L377), el criterio fijo K-2 de toda ponderación (L471) y el fundamento del provisorio (L518). Por transitividad (D-07, D-08) entran también «la restricción también es una opción» y su alcance | Falla O2′: un agente en una copia limpia no puede saber qué es un obstáculo ni de dónde sale K-2. Y K-2 es un criterio **fijo** de toda ponderación (L489-490) | **Se trae §10 entero** (53 líneas, 4.059 B), sin condensar: el propio §10 mide que recortar materia cuesta la habilidad (conv :447-449). Se ofuscan su alcance y su origen. **Vive en un solo lugar** (`Rules-Base-Conocimiento.md:280`, «un hecho, un lugar»), y las cuatro citas apuntan ahí. **Default**: si la mesa parte el documento (003, NB-03), va a la sección del hermano del encargo a agentes, porque el bloqueo es suyo, y el de la mesa lo cita. Sin partición, va a §3 del documento. No hace falta tocar ninguna regla: es una forma de razonar, consultiva. Su párrafo de origen (conv :478-484) va a §9, descripto |
| **PC-03** | **P1** | E1: el guion da 15 hashes que no resuelven: 10 del framework (L607, L629, L675, L758, L760, L763-766, L769) y 5 del destino (L239, L769). E1: `diff` vacío de `_legacy/13.21/` contra `c9b3e46` (`Mesa-Rules.md`, `Master-Prompt.md`) y de `5b8a31b` contra `c9b3e46` (`Expediente-Rules.md`). E2: `Rules-Base-Conocimiento.md:423-426` (identidad de versión: `_legacy/<versión>/` tiene los documentos exactos) | **Un commit no viaja en una copia sin historia**, y O2′ lo exige expresamente. Las copias de §8 y los orígenes de §9 se anclan a `c9b3e46` con línea | Las 10 anclas del framework fallan en un `git archive`, en una descarga sin `.git` o en un fork aplastado. Las 5 del destino son además datos de un repositorio privado (R2) | Las anclas del framework pasan a **versión de la regla + §**: «`Mesa-Rules.md` 1.5 §6.4». Si hace falta la línea, «`_legacy/13.21/SDD/Devs/Rules/Mesa-Rules.md:454-465`», que está en la copia y no cambia. Las del destino son trazabilidad (H-05, H-06) y van sin hash. El guion da 0 hashes |
| **PC-04** | **P1** | E1: `git grep -n -E 'K[0-9]\b' c9b3e46 -- SDD Conocimiento` → 0; el guion da K6 «no definido». E2: fork L224 («`Rules-Base-Conocimiento.md` K6»), L584 («`Rules-Base-Conocimiento.md` §0.4»). E2: base :319 («`Rules-Base-Conocimiento.md` §N → este archivo, §N; la numeración espeja la del emisor»). E2: en el destino, §0.4 es «Precedencia» (base :48) y §4.6 es el techo; en el framework, §0.4 es «Los tres modos de aportar» (`:90`) y el techo es §6.2 (`:367`) | **El fork cita la regla del framework por su nombre, pero con la numeración y las invariantes de la regla del destino**, porque la tabla de correspondencia del destino dice que las numeraciones se espejan, y no se espejan. En L584 acierta por coincidencia: la precedencia está en `:98-103`, dentro del §0.4 del framework. En L224 apunta a algo que no existe | Un guion que sólo mira si el nombre del archivo resuelve da por buena una cita equivocada. Es la falla que ev-01 ya mostró, «nombres de reglas citados sin su ruta». El redactor puede trasladar otra cita «`Rules-Base-Conocimiento.md` §n» con el sentido del destino | K6 se re-ancla a `Rules-Base-Conocimiento.md` §0.4 (`:100-102`) y §6.1 (`:360`), que dicen lo mismo (D-02). **Toda cita «`<Regla del framework>.md` §n / Kn» del fork se coteja por contenido, no por nombre**: lo hace el guion (§ e identificador definidos en ese archivo), y el cotejo literal lo hace la auditoría. Se anota en la nota de coherencia que la tabla de correspondencia del destino no vale como equivalencia (la nota sí está en el alcance de R1) |
| **PC-05** | **P1** | E1: la búsqueda del nombre de la carpeta de contexto del destino → 0. Los nombres de las carpetas de insumos y salidas sólo aparecen con otro sentido (`Coherencia-Conformacion-Pull-Request-Automatico.md:26`). `Expediente-Rules.md:109-119` (el árbol del caso no las tiene). `Deriva-Rules.md:155` (deriva mayor, contigua). E2: fork L173, L184, L224, L431, L434; conv :435-436 | **Tres términos del destino no tienen definición ni equivalente en el framework**: la carpeta de contexto del producto, las carpetas de insumos y salidas del caso, y el agente conductor de fase al que alcanza conv §10. «Desvío» parece «deriva», pero no dice lo mismo | Un reproductor en una copia limpia busca carpetas que no existen, o lee la rama de la regla de §5.6 contra la deriva de la maqueta | Se definen en el texto, ≈ 4 líneas en total (D-03, D-08, D-14): «la fuente de verdad que el producto declare», «lo que aporta quien pidió», «la salida real del caso, donde el destino la guarde», «todo agente que recomiende, dictamine o elija». «Desvío» se define en su lugar, sin identificarlo con «deriva». Lo verifica el renglón «nombres del destino» del guion |
| **PC-06** | **P2** | E2: fork L524 y la 1.2 `Knowledge-Mesa-De-Expertos-A-Pedido.md:247` («cumple A1 a A12 de `Expediente-Rules.md` §6») contra `Expediente-Rules.md:448` («**A1** a **A15** … A13 a A15 sólo para un expediente con `resolucion`») y `:266`. E1: `git log c9b3e46 -- Expediente-Rules.md` → `5b8a31b` (13.20) | **La referencia resuelve, pero ya no dice lo mismo.** Desde 13.20, el expediente de una mesa que resuelve suma A13 a A15, la reintegración. Lo arrastran la 1.2 y el fork | Una mesa a pedido con `resolucion` se da por conforme sin la reintegración que su propio paso 9 exige (L110) | «Cumple A1 a A15 de `Expediente-Rules.md` §6, con A13 a A15 sólo si hay `resolucion`», o se cita «§6» sin rango, que es la forma que no envejece. Se mide con el guion (identificador definido) |
| **PC-07** | **P1** | E1: §3 (1.2 → 0 fallas; fork → 123). E2: `README.md:154` («Autosuficiencia. Ningún archivo del **conjunto normativo** referencia otro repositorio»), `Rules-Base-Conocimiento.md:36-39` (el fork, sin «un repositorio ajeno que el framework tenga que alcanzar») y `:365` (interpretativo: «un agente sin contexto previo podría usar el artefacto leyendo sólo esto») | **O5 tiene en el árbol un principio contiguo, no igual.** La autosuficiencia de `README.md:154` alcanza al conjunto normativo, no a `Conocimiento/`. El ítem `:365` es interpretativo. **No hay comprobación enumerable** de que un conocimiento traído de otro repositorio llegue con sus dependencias | La propiedad general (O5) queda como intención, y el próximo fork que sume un conocimiento repite las 36 referencias rotas sin que nada lo detecte | **El instrumento es el guion de §3**, asentado como texto en `evidencia/`, corrido en la auditoría y en O4. **Default**: O5 se asienta en la nota de coherencia (dentro de R1) y en un criterio `[enumerable]` del §6 del propio documento: «en una copia sin historia, toda referencia resuelve; comando y salida». **Marcado al Product Owner**: llevar ese criterio a `Rules-Base-Conocimiento.md` §6.1, para que valga para todo conocimiento, toca una regla. **SI NO RESPONDÉS**: queda en la nota como pendiente |
| **PC-08** | **P2** | E2: folio 008 §3 (O2: «nada se quita por no resolver»; O1: «lo que es trazabilidad … se describe sin apuntar»). E2: la 1.2 `:32-35` («**No se cita su ruta**: si el marco se mueve, este documento sigue resolviendo»). E1: §3 (15 en el cuerpo y 21 en §9 y §10) | **La línea entre dependencia y trazabilidad ya tiene precedente en la 1.2, y hace falta aplicarla fila por fila.** Bajo (b), confundirlas tiene dos salidas malas: traer al framework material del destino que nadie aplica (los expedientes y bitácoras de H-05 y H-06), o borrar lo que (b) manda conservar (la desviación de L742-746, H-01) | O2′ falla, o se viola R2, o se pierde el «medido» de los filtros | La regla es la de §1. Si se aplica para hacer algo, es dependencia: R, M, T o X. Si narra de dónde salió, es trazabilidad: se describe en §9 **sin ruta ni hash**, con el mecanismo y las cifras. H-01 pasa a §9 como origen y no se borra. El barrido de R2 corre sobre §9 y §10 con la lista que vive fuera del repositorio |

## 5. Lo que revisé y está bien

1. **Las copias del fork son fieles y se pueden re-anclar sin pérdida.** Las 22 citas por rango a `c9b3e46` (`Mesa-Rules.md` `:272`, `:365-371`, `:409-421`, `:427-429`, `:454-465`, `:469-471`, `:486`, `:501`, `:507-512`, `:521-522`, `:570-578`, `:587-589`, `:602-603`, `:648-650`; `Master-Prompt.md` `:983-988`, `:1001-1004`, `:1281-1284`, `:1486-1489`, `:1514-1524`; `Expediente-Rules.md` `:206-209`, `:231-233`) dicen lo que el fork transcribe. `_legacy/13.21/` es idéntico a `c9b3e46` en esos archivos.
2. **La 1.2 del framework ya cumple O2′**: el guion le da 0 fallas, con 56 rutas y 37 secciones.
3. **El cierre es chico y cierra en el segundo nivel.** De las dos dependencias del destino, sólo conv §10 aporta contenido que no existe en el árbol, unas 53 líneas. Conv §7.4 aporta fuerza, no contenido. De la regla base del destino sólo se usa K6, y tiene equivalente. **Ninguna dependencia exige traer al framework ninguno de los dos archivos enteros.**

## 6. Solicitudes de convocatoria

| A quién | Señal | Ubicación |
|---|---|---|
| Normativa de la base de conocimiento | Dónde se asienta O5 (PC-07) y si C-2 de PC-01 es una regla nueva de la base | `Rules-Base-Conocimiento.md` §6.1 y §0.4; `README.md:154` |
| Arquitectura de la información | En qué documento vive conv §10, que usan la mesa y el encargo (PC-02) | Fork L205, L377, L471, L518 |
