| Campo | Valor |
|---|---|
| Tipo | informe |
| Fecha | 2026-10-23 |
| Autor | Auditor mecánico |
| Corrige | — |

# Auditoría mecánica de la redacción (T10, folio 013 §7, pasos 1 a 7 y 9)

| | |
|---|---|
| Secciones de Mesa-De-Expertos-A-Pedido 2.0 leídas | entero (audito su origen y su forma: §0, «Mapa de carga», última oración del párrafo previo a la tabla) |
| Objeto | El árbol de trabajo de la rama del expediente contra la base `c9b3e46` (13.21): `git diff c9b3e46` (cinco archivos) y los archivos sin seguimiento (los dos documentos nuevos, este expediente y `_legacy/13.21/`) |
| Cuándo | Sin commit de la redacción. Los folios 016 y 017 se escribieron mientras corría esta auditoría y no están auditados acá |
| Herramientas | Un resolvedor de referencias propio, independiente del guion de `evidencia/ev-04`, y una lista de términos privados; los dos viven fuera del repositorio. La lista tiene 47 patrones: los siete términos de `evidencia/ev-03`, identificadores de código y de servicios del destino tomados de sus dos dependencias, y números y rutas de expedientes y bitácoras del destino |

**Lectura P0–P3 para este caso.** **P0**: viola R1 o R2 en su núcleo (el nombre del producto, la
organización, el proveedor o un sistema del destino en el árbol), o una referencia de los documentos de
`Conocimiento/` tocados no resuelve en la copia sin historia. **P1**: un criterio `[enumerable]` de la norma
en rojo (`SDD/Devs/Rules/Rules-Base-Conocimiento.md` §6.1, `SDD/Devs/Rules/Expediente-Rules.md` §6, padre
§6), una ruta de expediente o de bitácora del destino en el árbol, o una dependencia que el jurado mandó
traer y no está. **P2**: una incoherencia entre piezas o una declaración incompleta que obliga a auditar dos
veces. **P3**: claridad. **Bloqueante** es P0 o P1.

## 1. Copia sin historia (paso 1)

| Qué | Comando | Resultado |
|---|---|---|
| Copia | `rsync -a --exclude=.git <worktree>/ <copia-limpia>/IA.SDD/` | 7.119 archivos, igual a `git ls-files` más `--others --exclude-standard` (7.119) |
| Forma | `ls -A <copia-limpia>`; `test ! -e <copia-limpia>/IA.SDD/.git` | `IA.SDD`; sin `.git` |
| `_legacy/13.21/` | `git archive c9b3e46 Conocimiento Examples PROMPTS README.md SDD Templates \| tar -x`, y `diff -rq` contra `_legacy/13.21/` | 140 y 140 archivos, `diff` vacío. **Sigue sin seguimiento** (T8 pendiente) |

## 2. Lista de `Rules-Base-Conocimiento.md` §6.1 (2.3), por documento

Los quince ítems, sobre la copia. Columnas: padre (`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md`
2.0), excepción (`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` 1.0) y cadena
(`Conocimiento/Knowledge-Cadena-De-Consecuencias.md` 1.0).

| # | Ítem | Comando | Padre | Excepción | Cadena |
|---|---|---|---|---|---|
| 1 | `[enumerable]` Once campos, ninguno vacío | `sed -n 3,13p <doc> \| grep -cP '^\*\*[A-Za-zóé-]+:\*\* \S'` | 11 | 11 | 11 |
| 2 | `[enumerable]` `Knowledge-<Tema>.md`, ASCII | `basename <doc> \| grep -cP '^Knowledge-[A-Za-z0-9-]+\.md$'` | 1 | 1 | 1 |
| 3 | `[enumerable]` Alias único en el índice | ``grep -c "\| `<alias>` \|" Conocimiento/Index-Knowledge.md`` | 1 | 1 | 1 |
| 4 | `[enumerable]` §0 a §10 | `grep -oP '^## \K[0-9]+(?=\.)' <doc>` | 0 a 10 | 0 a 10 | 0 a 10 |
| 5 | `[enumerable]` Techo de §6.2, `propio` 600 | `wc -l <doc>` | 550 | 335 | 160 |
| 6 | `[enumerable]` Ocho campos comunes iguales a la fila | Guion propio: cabecera contra la fila de §3 del índice, nueve columnas sin `Documento` | iguales | iguales | iguales |
| 7 | `[enumerable]` Ofuscación declarada, con falsos positivos uno por uno | Lectura de la entrada `[13.22]` | cumple | cumple | cumple |
| 8 | `[enumerable]` Toda referencia resuelve en la copia, falsos positivos uno por uno | Resolvedor propio (§3) | 0 rotas; **falsos positivos no enumerados** (AM-04) | ídem | 0 rotas |
| 9 | `[enumerable]` Numeración contigua | `grep -oP '^#{3,4} \K[0-9.]+' <doc>` | 2.1–2.3, 3.1–3.4, 5.1–5.4; la subsección de §2.2 sin número | 5.1–5.3 | ninguna |
| 10 | `[enumerable]` Contradicción con el piso declarada | Lectura de §8 | no contradice, §8 lo dice | ídem, y declara su origen | ídem |
| 11 | `[interpretativo]` §0 declara qué queda afuera | Lectura | 8 filas, concretas | 6 filas | 4 filas |
| 12 | `[interpretativo]` Un `canonico` escribe el delta | — | no aplica | no aplica | no aplica |
| 13 | `[interpretativo]` No define criterios, nomenclatura ni gating | Lectura de §6 y §8 | §6 se verifica sobre el expediente | ídem | ídem, sobre el folio |
| 14 | `[interpretativo]` Las siete propiedades de §4.4 | Lectura | sostenidas | sostenidas | sostenidas |
| 15 | `[interpretativo]` Usable sin contexto previo | Lectura | sí, desde el alias, por el renglón 6 de §0 | sí | sí |

Medidas al lado: prosa de más de 110 **caracteres** fuera de tablas, código y cabecera: 0, 0 y 0. Un `awk` que
cuenta bytes da 11, 4 y 1, y son todos falsos positivos de tildes y comillas angulares. Tamaño: 64,6 KB, 30,8 KB
y 13,3 KB. El índice (`Conocimiento/Index-Knowledge.md` 1.7), la regla y la nota no son documentos de
conocimiento y la lista no se les aplica. Del índice medí la cabecera (`Compatible con: … 2.3`), la fila 1.7 y
las nueve filas contra sus cabeceras: **nueve de nueve iguales**.

## 3. O2′: referencias de los documentos tocados, en la copia

El resolvedor corrió sobre los tres documentos, el índice y la nota. Clases: rutas `*.md` con directorio y sin
él (las que repiten nombre sólo en `_legacy/` resuelven a la viva); `Archivo.md §n` y sus cadenas;
`Archivo.md:a-b` y los `:c-d` que siguen; alias entre acentos graves contra la columna del índice; `§n`
internos. Después coteé a mano cada aviso.

| Clase | Resultado |
|---|---|
| Rutas y carpetas `Expedientes/…/` | 0 que no resuelvan. El folio 019 del expediente 0003 resuelve dentro de `Expedientes/`, como declara D-28 |
| `Archivo.md §n` | 0 encabezados inexistentes. Además coteé los encabezados de `Mesa-Rules.md` (§0.0, §2.2, §4, §5, §5.1, §5.5, §6.1 a §6.7, §7, §7.1, §8), `Master-Prompt.md` (§6, §7.0, §8.1, §9, §10, §10.0, §10.1), `Expediente-Rules.md` (§1, §3, §3.1, §3.3, §3.4, §6), `Root-Rules.md` (§11, §13, §14), `Deriva-Rules.md` (§3), `Rules-Arquitectura-Tecnica.md` (§3.3, §4.1) y `Rules-Base-Conocimiento.md` (§0.2, §0.4, §2.2, §4.4, §4.5, §6.1, §6.2, §7, §8) con `grep -nE '^#{2,4} '`: existen todos |
| Rangos `:a-b`, por contenido | Las 25 anclas de los tres documentos y de la nota caben en su archivo y dicen lo que se les atribuye: `Master-Prompt.md:576`, `:577`, `:983-988`, `:1001-1004`, `:1486-1489`; `Mesa-Rules.md:245`, `:249-251`, `:365-371`, `:384-387`, `:454-465`, `:507-512`, `:570-578`; `Rules-Arquitectura-Tecnica.md:130-132`, `:170`; `Expediente-Rules.md:367-369`; `Index-Knowledge.md:34`; `Rules-Base-Conocimiento.md:29`, `:32-34`, `:65-71`, `:98-103`, `:188-190`, `:340-342`, `:369`, `:424-428`, `:430-438`. Los dos avisos del resolvedor sobre `Mesa-Rules.md:1001-1004` y `:1486-1489` son suyos: esos rangos siguen a `Master-Prompt.md` en la misma celda (padre L539) |
| Literales citados | `Expediente-Rules.md` §3.3 punto 2 («del bloque tal como lo extrae A8», `:207`); §3.4 («Huella sólo para lo que no está versionado…», `:233`; `NNN-<slug>.txt`, `:231`); §3.1 («el siguiente libre»); `Mesa-Rules.md` §5.5 («un informe descartable»); §6.6 («La mesa no aplica»); §6.7 (4,9 y 5,8, `:522`); §7 y §8 («sólo sale si esa cláusula la deja», `:588`; «salió sin declarar por qué la autocorrección no alcanzaba», `:650`); §7, disparadores 1, 3 y 7; `Rules-Base-Conocimiento.md` §4.4 («Un hecho, un lugar», `:285`). Todos están. Una paráfrasis que no es literal: AM-14 |
| Alias | Los nueve del catálogo resuelven. `Lab-Geometria` en la nota (L69, L73, L75) es un repositorio público que la 1.0 ya nombraba, no un alias |
| `§n` internos | Los que el resolvedor marcó son del contexto: §0.0 y §6.7 del padre (L59, L485, L487, L500) son de `Mesa-Rules.md`, nombrada antes en la oración; los de la nota §3.1 son «padre §n» y «excepción §n», y existen en esos documentos |
| Identificadores | `K[0-9]` 0 en los tres documentos, el índice y la nota. `XC-<n>`, `K-1`, `K-2`, `C-n` se definen en la excepción §5. E1–E4 y C están en `Mesa-Rules.md` §6.1; P0–P3, en `Master-Prompt.md` §10.0 (`:1486`); A3, A8 y A11, en `Expediente-Rules.md` §6; D9, en `Deriva-Rules.md` §1 |
| Paso 3 de 013 | `grep -c -E` de los nombres de las dos dependencias del destino, de su carpeta de prompts y de `\bK[0-9]+\b`, y ``grep -c -E '`[0-9a-f]{7,40}`'``, sobre los tres documentos, el índice y la nota: 0 y 0 en los cinco. `_legacy` en los tres documentos: 0, así que no dependen de T8 |
| Citas entrantes (paso 6) | Seis: `Mesa-Rules.md:574`, `Root-Rules.md:948-949`, `Knowledge-Entorno-De-Ejecucion-Del-Agente.md:46`, `:145` y `:264`, y su nota `:39`. Caen en §2.1 (pasos 9 y 10) y en §3.1, que conservan número. La de `Mesa-Rules.md:574` atribuye a §3.1 un sentido que no es literal (AM-13) |

**Lo que no resuelve.** En los tres documentos y en el índice, **nada**. En la nota, una cita por diseño:
L109 nombra tres secciones (§7.2, §7.4 y §10) de las convenciones del destino. No da ruta ni archivo, y es
trazabilidad (clase H). Tampoco está declarada como falso positivo.

## 4. Cierre de dependencias contra los folios 009 y 013

| Qué mandó traer o resolver el jurado | Dónde está | Medida |
|---|---|---|
| D-13: §10 de las convenciones del destino, íntegro, en la cadena | Cadena §0 (alcance), §2 (regla y pasos 1 a 4), §3 (cuatro cláusulas), §9 (origen) | Lectura del original en `<insumos>`, `:433-485`, cláusula por cláusula: las siete y «De dónde sale» están. Cambian sólo el alcance (`:435-436`), «regla del marco» y la remisión a la carga en tres niveles, como manda D-13 y D-14 |
| D-09: §7.4 (`:227-284`) en la excepción, sin la guarda | Excepción §3, §4, §5.3; guarda fuera (§8, L289) | Las cuatro viñetas, los cuatro pasos, los cuatro defaults, el ADR que pasa a `Aceptado` y «cumplir no es default», cotejados contra la tabla de la nota §3.4: cada fila cae en su línea. El ejemplo de estándar que nombraba a un proveedor pasó a «la documentación oficial de la plataforma» (MC-08) |
| D-18, D-19: cuatro definiciones | Excepción L106 («la fuente de verdad que el producto declare»); padre L203 (lo que aporta quien pidió y la salida real del caso) | Están |
| D-02, D-03: K1–K7 sin traer ni nombrar | Nota §3.3, siete filas con ancla | `K[0-9]` 0; anclas cotejadas (§3) |
| D-05 / C-5: condicional para un fork | Padre §8, L503-506 | Está |
| D-06: precedencia más estricta de un fork | Excepción §8, L299-300 | Está |
| D-16: índice como parámetro | Padre §5.1, L313-315 | Está |
| D-22: «`Expediente-Rules.md` §6», sin rango | Padre §6, L408 | Está |
| D-24: copias de reglas a cita por sección, con `diff` | `evidencia/ev-06` (63 líneas, tres líneas de A9); padre §9, fila de las copias | Está |
| D-26: sin hashes | Paso 3 | 0 |
| D-27: primera mención con ruta desde la raíz | Excepción y cadena, sí. **El padre, no** | AM-05 |
| D-30, C-11: la ficha como folio propio | Excepción §5.1, L136-140 | Está |
| D-31: ejemplares 0003 y 0004 | Padre y excepción §9 | Está |
| H-01 a H-09 | Padre §3.2, §3.3, §5.1, §9; excepción §3; cadena §9; nota §3 | Descriptos sin ruta. Los casos llevan «medido en un destino privado, no reproducible desde esta copia» |
| De la regla base del destino, ninguna línea | — | Ningún término propio de esa regla en los documentos |
| O5: regla 2.3 (M-1) y puntero en el índice (M-2) | `Rules-Base-Conocimiento.md` §2.2, §6.1, §8, §10; `Index-Knowledge.md` §2 L24-26 | Están |

**Lo que el jurado mandó traer está todo.** Lo único abierto es la forma de las primeras menciones del
padre (AM-05), que no deja ninguna referencia rota.

## 5. Ofuscación sobre todo el diff, incluido el expediente

Universo: las líneas agregadas por `git diff -U0 c9b3e46` y los archivos sin seguimiento, salvo `_legacy/`.
Son 3.082 líneas.

| Barrido | Resultado |
|---|---|
| Los siete términos de `evidencia/ev-03` (producto, organización, proveedor y sistemas del destino) | **0** |
| IPv4 | 0 |
| Correos | 0 |
| URLs y hosts | 0 |
| Rutas y usuario del host (A11 emulado sobre lo agregado: `(/\|-)home[/-][a-z0-9_]+`, `/Users/`, el usuario) | 0. El texto de la constancia 014 §2 que transcribe el patrón no cumple el patrón |
| Rutas de la versión cruda de `evidencia/ev-01` | **Sí: `evidencia/ev-01` las conserva** (AM-01) |
| Nombres de archivo de las dos dependencias del destino | 0 en los documentos, el índice, la nota, la regla y la entrada `[13.22]`; 102 en folios 002 a 013, `ev-01` y `ev-04` (AM-07) |
| Hashes | Sólo `c9b3e46` y `5b8a31b` del framework, y uno de la base de otro folio; ninguno del destino |

## 6. R1

`git diff --name-only c9b3e46` da cinco archivos. En `SDD/` toca sólo
`SDD/Devs/Rules/Rules-Base-Conocimiento.md`, que sale marcada como M-1, y la nota de coherencia. Los bloques que
cambian en la regla son la cabecera, la viñeta de §2.2, el ítem de §6.1, la línea del snippet de §8 y la fila
2.3 de §10. Son los cuatro bloques de 013 §9, más la versión. `Templates/`, `PROMPTS/` y `Examples/`: 0
archivos. Ningún orquestador cambia. Un costo de M-1 queda fuera del diff y sin marcar (AM-03).

## 7. Coherencia entre `CHANGELOG.md`, índice, cabeceras y nota

| Pieza | Padre | Excepción | Cadena | Índice | Regla | Nota |
|---|---|---|---|---|---|---|
| Cabecera | 2.0 · 2026-10-23 · `Compatible-con` 2.3 | 1.0 · ídem | 1.0 · ídem | fila 1.7; `Compatible con` 2.3 | 2.3 | 1.1 · SDD 13.22 |
| Fila del índice | 2.3, Vigente | 2.3, Vigente | 2.3, Vigente | — | — | — |
| `[13.22]` | 1.2 → 2.0 | 1.0 | 1.0 | 1.6 → 1.7, de siete a nueve | 2.2 → 2.3, de catorce a quince ítems | 1.0 → 1.1 |
| Nota §4 | 2.0 | 1.0 | 1.0 | 1.7 | 2.3 | 1.1 |

Las versiones y fechas coinciden en todas las piezas. Las cifras de `[13.22]` coinciden con `evidencia/ev-05`:
308 rutas, 216 secciones, 58 rangos, 49 alias, 12 identificadores, 29 filas de «Dependencias» y seis citas
entrantes. Los desacuerdos son tres: AM-04, AM-08 y AM-10.

## 8. Criterios de `Expediente-Rules.md` §6 sobre este expediente

Con `X` este expediente, en el árbol de trabajo. A1, A2, A4, A6, A8, A9, A10 (sin lo preexistente del
`CHANGELOG.md`, citas históricas a otro repositorio) y A13 (`Reintegra: ninguna`) dan vacío. **A3** da
`SALTO 017-…`, porque faltaban este folio y el 016 cuando corrió: este folio lo cierra. **A5** da `CORRIGE
…/008-providencia-correccion-del-objetivo-y-segunda-ronda.md` (AM-02). **A7** y **A11** no se pueden evaluar sin
commit: A11 lo emulé (§5). **A14** da `T11 sin constancia`, que es esperable antes del pedido de fusión.

## 9. Hallazgos

| Id | Nivel | Ancla | Hallazgo | Impacto si no se corrige | Dirección |
|---|---|---|---|---|---|
| **AM-01** | **P1** | E1: `grep -n 'NO RESUELVE' evidencia/ev-01-dependencias-del-fork-en-workspace-limpio.out` → 36 filas; lectura: las filas 7 a 30, 36 a 38, 40 a 43 y 49 (32) son rutas de folios, rondas, expedientes y bitácoras del destino, con números de expediente y nombres de caso parciales; 47 y 48 dan la estructura de carpetas de su pipeline. La lista ampliada marca 17 de esas líneas | `evidencia/ev-01` versionaría en un repositorio público las rutas de expedientes y bitácoras del destino que el encargo prohíbe escribir en el árbol. La constancia 014 §3, fila 4, lo dejó para esta auditoría | Rompe R2 en el primer push, y lo publicado no se reescribe | Antes del primer commit, reemplazar cada ruta por un marcador de su función (por ejemplo `<folio-de-bitácora-del-destino>`). Se conservan la línea, las ocurrencias y la línea del fork, porque la nota §3.2 cita `ev-01` por número de línea. Se asienta en una constancia |
| **AM-02** | **P1** | E1: A5 de `Expediente-Rules.md` §6 → `CORRIGE …/008-…`. El folio 008 lleva `\| Corrige \| 002, §1 (…) y §2 (O2, R1) \|`, y `Expediente-Rules.md:136` pide «el folio que corrige, o `—`». Precedente: `Expedientes/0003-…/actuaciones/010-…` lleva `\| Corrige \| 002 \|` | Un criterio `[enumerable]` en rojo, que el primer criterio del padre §6 exige. La constancia 014 §2 corrió A1 a A4, A6 y A9, y no A5 | El expediente que corre la convención no la cumple | Dejar `002` en la celda y llevar el alcance de la corrección al cuerpo (el §3 de 008 ya lo tiene). Como no hubo commit, no es reescritura de lo publicado |
| AM-03 | P2 | E2: `SDD/Guides/SDD-Development-Guide.md:499` dice «los catorce ítems» de `Rules-Base-Conocimiento.md` §6.1, y la 2.3 tiene quince (`[13.22]`, `Rules-Base-Conocimiento.md:540`) | Un costo de M-1 que no está en 013 §9 ni en la nota §7. Lo levantó 014 §3, fila 7 | Una guía del framework desmiente a la regla desde el día de la publicación | Marcarlo como M-5 con su default, o corregirlo en el commit y marcarlo, porque toca `SDD/` fuera de lo que decidió 013 (R1) |
| AM-04 | P2 | E2: el ítem nuevo de §6.1 (`Rules-Base-Conocimiento.md:364-367`) pide que los literales de esqueletos y ejemplos «se declaran uno por uno como falsos positivos». `[13.22]` dice «0 fallas» y «Falsos positivos declarados: ninguno en los documentos», pero `ev-04` descarta por clase (`NNN-`, `<…>`, `{{…}}`, bloques de código, `README.md` suelto). Los literales en prosa que descarta así: padre L201 y L453 (`README.md`), L210 (`NNN-<slug>.txt`), L385 y L440 (`<carpeta-del-caso>`); excepción L136 (`actuaciones/NNN-informe-ficha-de-excepcion-<n>.md`) | El primer documento que estrena el ítem no lo cumple en su letra, y el próximo fork copia la forma | La regla nueva nace sin precedente que la cumpla | Enumerar esos seis literales, con archivo y línea, en el ítem 8 de `[13.22]` o en `ev-05` |
| AM-05 | P2 | E1: `grep -n -m1` por archivo en el padre. Primera mención sin ruta y primera con ruta: `Mesa-Rules.md` L58 / L73; `Master-Prompt.md` L74 / L510; `Root-Rules.md` L137 / L509; `Deriva-Rules.md` L264 / L535; `Rules-Base-Conocimiento.md` L493 (la de L10 es de formato) / L536; `Coherencia-Mesa-De-Evaluacion.md` L66 / nunca; `Coherencia-Condicion-De-Convocatoria.md` L523 / nunca. La tabla «Dependencias» (L540) dice «en el árbol, `SDD/Devs/Guides/`» | D-27 de 013 no se aplicó en el padre. Hoy resuelven, porque el nombre es único fuera de `_legacy/`, pero un resolvedor por nombre encuentra más de veinte copias en `_legacy/` | Un lector en una copia con `_legacy/` no sabe cuál es la que rige | Poner la ruta desde la raíz en esas siete primeras menciones, como ya hacen la excepción y la cadena |
| AM-06 | P2 | E1: `git status --short` da todo sin seguimiento, y `_legacy/13.21/` sin seguimiento (T8) | 013 §7 manda correr la prueba sobre el commit con `git archive`. Esta auditoría corrió sobre el árbol copiado con `rsync`. A7 y A11 quedan sin evaluar | Lo que se fusione puede no ser lo auditado | Después del commit: `git archive <commit>`, pasos 1 a 3 de 013 §7, A7 y A11, todo en una línea de la constancia de T11. `_legacy/13.21/` va en ese mismo commit |
| AM-07 | P2 | E1: `grep -o -i -E` de los nombres de archivo de las dos dependencias del destino sobre lo agregado → 55 y 47 ocurrencias, todas en folios 002 a 013, `ev-01` y `ev-04` | T6 los quitó de la nota «para que el guion dé 0 también acá», pero el expediente los conserva. No identifican al destino, pero son nombres de su pipeline | Dos criterios de ofuscación en el mismo cambio | Declararlos falso positivo léxico del barrido en el cierre, con su motivo, o reemplazarlos por su función antes del commit, como la nota |
| AM-08 | P3 | E2: nota §6, última fila: «El techo de §6.2 es calibrable: el padre quedó a diez líneas del suyo». `wc -l` da 550 contra 600 | Diez es la distancia al techo de redacción de 013 (560), no al de §6.2 | Se lee mal el margen | «a cincuenta líneas del techo de §6.2 y a diez del de redacción» |
| AM-09 | P3 | E1: lectura de la nota. Líneas huérfanas de una o dos palabras en L28, L31, L50, L54, L57, L59, L98, L126, L128, L144, L182, L185, L187, L189, L191, L193, L222, L253 y L256 | El reenvuelto quedó roto. En Markdown se ve bien, en el fuente no | Claridad del fuente | Volver a envolver la nota a 110 columnas |
| AM-10 | P3 | E1: `git diff c9b3e46 -- SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md \| grep '^-'`. La 1.1 quita párrafos de la 1.0: «Es el eje de extensión de `SDD-Development-Guide.md` §III.11», «Y resuelve la objeción de ubicación…», «no se midió nada nuevo para esta nota», «Una lección que se consideró y no entró…» y el recuento de `_legacy/13.16/` (131 archivos). Su fila 1.1 sólo declara el cambio de la fuente E4 | La 1.0 sigue en `_legacy/13.21/`, pero su control de cambios no dice qué se quitó | Una baja no declarada | Sumarlo a la fila 1.1, o reponer los párrafos marcados «1.0» |
| AM-11 | P3 | E2: tablas «Dependencias». La fila de `Mesa-Rules.md` del padre (L532) dice «§0.0, §2.2, §4 a §7», pero el texto cita también §2 y §3 (L485-486) y §8 (L271). La fila de la regla base en la excepción (L328) da §0.4, y el texto cita §0.2 (L290) y §6.1 (L35) | El paso 4 de 013 se verificó por archivo (29 de 29), y la tabla no llega a la sección | La tabla no basta para saber qué traer | Completar las secciones o declarar que la fila es por archivo |
| AM-12 | P3 | E2: D-08 de 013 manda `Root-Rules.md` §13 «para el ADR». La excepción §4 (L106) usa `Rules-Arquitectura-Tecnica.md` §3.3 (`:132`, verificado). 014 §3 no lo declara | Un apartamiento del plan sin declarar, aunque el equivalente es correcto | Trazabilidad del plan | Una fila en la próxima constancia |
| AM-13 | P3 | E1: `awk 'NR>=221&&NR<=241' <padre> \| grep -ci alcance` → 0, y lo mismo en la 1.2 de §3.1. `Mesa-Rules.md:574` atribuye a §3.1 del padre «el Product Owner pidió diseñar lo que el producto no prometía». La constancia 014 §2, paso 6, dice que §3.1 «sigue teniendo … la lectura del pedido como cambio de alcance» | Es preexistente y no lo introduce esta redacción, pero la constancia lo afirma como verificado | Una afirmación de la constancia que el árbol no sostiene literal | Asentar en la constancia de T11 que la cita es por sentido («cómo se lee un pedido») |
| AM-14 | P3 | E1: `grep -ci ilegítim` → 0 en `Mesa-Rules.md` y en `Master-Prompt.md`. Padre §5.4, L402-404: «es el rótulo que esa regla declara ilegítimo» | `Master-Prompt.md` §10.1 dice «se lee después como una fase que cerró por criterio», y ninguna de las dos reglas usa ese calificativo. Es una línea nueva de la 2.0 | Una paráfrasis que parece cita | «es el rótulo que esa regla no admite» o, mejor, citar la oración de §10.1 |

## 10. Lo que revisé y está bien

1. **O2′ se cumple en los tres documentos y en el índice.** Ninguna ruta, sección, rango, alias ni
   identificador queda sin resolver en la copia, y coteé por contenido las 25 anclas con línea.
2. **El cierre está completo y es fiel.** La cadena trae las siete cláusulas de su origen y la excepción todas
   las de §7.4, sin la guarda. Ninguna línea de la regla base del destino entró, y ningún término privado de
   `ev-03` aparece en el diff.
3. **R1 se respeta y la forma cierra.** En `SDD/` el diff toca sólo la regla marcada y la nota.
   `_legacy/13.21/` es idéntico a la base (140 archivos, `diff` vacío). Las nueve filas del índice son iguales
   a sus cabeceras.

**Rendimiento.** 14 hallazgos: 2 P1, 5 P2 y 7 P3. Bloqueantes: AM-01 y AM-02. Los dos se corrigen antes del
primer commit, y ninguno toca un documento de `Conocimiento/`.

Sigue: corregir AM-01 y AM-02 (y, a criterio de la presidencia, AM-03 a AM-14), hacer el commit con `_legacy/13.21/` y volver a correr sobre `git archive` los pasos 1 a 3 de 013 §7, A7 y A11 · Presidente de mesa · Cierra con: la constancia de la corrección y el commit de la redacción
