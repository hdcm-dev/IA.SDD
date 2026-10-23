| Campo | Valor |
|---|---|
| Tipo | constancia |
| Fecha | 2026-10-23 |
| Autor | Corrector de la mesa |
| Corrige | — |

# Corrección tras la segunda reproducción: bloqueantes y menores de los folios 019 y 020

Es el segundo ciclo de corrección de T10 (resolución 013, §8). Leí la resolución 013, la constancia 018 y los
dos informes de la segunda reproducción a ciegas, 019 y 020. Apliqué, en el árbol de trabajo de la rama del
expediente, **todo bloqueante de los dos informes** con una frase del conocimiento que dice qué se hace, y
los **menores que son contradicciones entre los propios documentos de conocimiento**. Ningún cambio toca
una regla, un orquestador ni una plantilla: lo que sólo se resolvía en una regla quedó como pendiente, con su
default, en la nota de coherencia. `_legacy/` no se tocó. **No hice commit.** La comprobación corrió sobre una
copia nueva, armada con `git archive` de un árbol escrito con un índice temporal, sin tocar el índice de la
rama.

Las «referencias rotas» de 019 (R-1) y de 020 (B.1, punto 1) al expediente 0004 son artefacto de la
preparación, que retiró la carpeta del workspace limpio: no son defecto, y en la copia de este folio resuelven.
La de `ev-06` contra `Expediente-Rules.md` §3.1 (R-2 de 019, menor 9 de 020) ya es el pendiente P-6.

## 1. Lo aplicado

| Hallazgo | Folio | Qué se hizo | Dónde |
| --- | --- | --- | --- |
| B-1 | 019 | La huella del testimonio se comprueba en el folio con A8, y en la pieza de `evidencia/` sin sus tres líneas de cabecera: `tail -n +4 <pieza> \| sha256sum`, con el texto desde la cuarta línea y su salto final | Padre §3.2, fila del testimonio |
| B-2 · M-6 | 019 | Los informes y las fichas son secciones del registro de `Mesa-Rules.md` §2.1 **sólo en un destino y si la mesa cumple §0.0**; si no la cumple no hay ese registro, y son folios del expediente también en un destino. La corrida descartada queda donde iban sus informes | Padre §2.3, dos filas; §2.1 paso 2 |
| B.2-1 | 020 | La base de conocimiento de un destino es un fork sólo si el orquestador la abre en la ruta del índice. Una «convención de la casa» fuera de ese índice entra en `decisiones_cerradas` como regla o decisión del producto y no pasa por la excepción: lo que la contradice es un hallazgo, y sostener que ella es la contradictoria es el disparador 7 | Padre §3.4; excepción §1, «Supuestos» |
| B.2-2 · menor 1 | 020 | Si la mesa cumple §0.0, de este documento se toma **todo lo que la regla no regula**, por exclusión: la regla se queda con registro, composición, veredicto y parches, escalada, bloque de cierre y criterio de corte. La clase es corpus documental, que `CLASE DE OBJETO` declara sin cambiar el panel. La segunda cláusula de §0.0 la cumple la presidencia al leer el estado: una dimensión de `estado` que no se puede leer es el primer hallazgo y no descalifica la condición, con lo que deja de ser circular | Padre §1 |
| M-2 | 019 | La carta de los otros roles sale del esqueleto de §5.2: qué conserva, qué cambia y qué quita quien no emite hallazgos | Padre §5.2, párrafo nuevo; §2.1 paso 2 |
| M-3 | 019 | Una sola lista de pasos irreversibles en los dos documentos: el merge, una etiqueta o una publicación, borrar o migrar datos con pérdida, publicar un contrato, desplegar a producción. Los cinco renglones de §0 siguen verbatim (013, §3): el paso 2 nombra los que agrega el hermano | Padre §2.1 paso 2; excepción §4, rama reversible |
| M-5 | 019 | Si el mensaje cambia el objetivo y trae una señal, la señal entra con el relanzamiento, el jurado vuelve a votar la composición y el folio de composición anterior queda en la corrida descartada | Padre §2.1 paso 2 |
| M-7 | 019 | Los ejes que fijó quien pidió no se mueven, salvo el que obliga a mover «Datos reales», que se declara | Padre §3.3, «Caso que funciona antes que diseño» |
| M-10 | 019 | «Quien la convocó» es el presidente, que recibe el pedido, y no quien la pidió | Padre §4, «Quién aplica» |
| M-12 | 019 | Una fila cuyo `Tema` toca el objeto sólo con cierto stack se lista condicional, con el supuesto y el dato del intake que lo verifica. La salida del barrido se puede recortar en el contrato si el comando queda escrito | Padre §3.4 |
| M-13 · menor 10 | 019 · 020 | `{{FIN DE §0}}` es la línea anterior a `## 1.`, y `{{RUTA DE ESTE DOCUMENTO}}` es la ruta con la que lo abre el orquestador que corre. Las dos reproducciones calcularon fines distintos (102 y 101). El correcto es 102 | Padre §5.2 |
| M-4 | 019 | Donde `Mesa-Rules.md` se usa como forma, la señal y las afirmaciones que mira el núcleo se ubican en el objeto o en una frase del pedido. Lo dice el conocimiento, que es el que declara las diferencias de la forma, y la regla no se toca | Padre §2.2 |
| Menor 2 | 020 | La decisión que ejecutó una excepción sin ficha, si el pedido la pone en revisión, es el objeto y no una decisión cerrada: no la ampara y no hay disparador 7. Así deja de chocar con el padre §3.4 | Excepción §4, fila «Una excepción ya ejecutada sin ficha» |
| Menor 3 | 020 | Debajo del filtro de §3: la excepción ya ejecutada sin ficha es un hallazgo, y la ficha nace sólo si alguien sostiene hoy que cumplir es imposible | Excepción §3 |
| Menor 4 | 020 | En la rama de la regla el análisis se escribe igual, porque toda ficha admitida lo lleva. Sus caminos dicen qué se haría si cede la regla, y el cierre pregunta «¿cuál cede?» con ellos | Excepción §4 |
| Menor 5 | 020 | La ficha es una sección más sólo donde los informes lo son, y el cierre la cita por esa sección donde pide `{{folio}}` | Excepción §5.1; padre §2.3 |
| Menor 6 | 020 | «Cuenta los folios» dice también «o las secciones del registro, donde los informes lo son» | Padre §2.1 paso 10; excepción §5.2 |
| Menor 7 | 020 | «Los dos del jurado» se explican en el padre: el de composición y el de veredicto (`Mesa-Rules.md` §2.2, ítems 2 y 5) | Padre §2.1 paso 10 |
| Menor 8 | 020 | La clase corpus documental nombra el registro de decisiones y la decisión ya tomada que el pedido pone en revisión | Padre §2.2, tabla |
| Arrastre | — | Las tablas «Dependencias» suman lo que el texto nuevo cita: el padre, `Mesa-Rules.md` §5.1 y §5.2; la excepción, el padre §0 y `Mesa-Rules.md` §0.0. Las catorce anclas de la nota a la excepción se recalcularon por contenido, porque se corrieron hasta cinco líneas. Los dos controles de cambios suman una oración, y la nota pasa sus pendientes y su §5. En `[13.22]` cambian el ítem 5, las líneas de los falsos positivos del ítem 8, la oración del padre en «Cambiado» y los números de la comprobación | Los tres documentos de la corrección, la nota, `CHANGELOG.md` |

**Lo que no se aplicó**, con su motivo:

| Hallazgo | Folio | Motivo |
| --- | --- | --- |
| R-1 · B.1-1 | 019 · 020 | Artefacto de la preparación: la carpeta del expediente 0004 se retiró del workspace limpio. Las tablas «Dependencias» ya declaran que ninguna de esas citas hace falta para aplicar los documentos |
| R-2 · menor 9 | 019 · 020 | Ya es el pendiente P-6 (folio 018) |
| Menor 11 | 020 | No es un defecto. El propio informe dice que se lee bien, y partir la celda del paso 2 movería la numeración que citan otros documentos |
| Menor 12 | 020 | Es un acierto, no un hallazgo |

## 2. Lo pasado a pendiente

Son menores sobre reglas del framework, y sólo se resuelven en ellas. Quedan en la nota de coherencia, §6, con
su default:

| # | Hallazgo | Folio | Regla | Default |
| --- | --- | --- | --- | --- |
| P-7 | M-1 | 019 | `Expediente-Rules.md` §1 e I1: si toda mesa a pedido abre expediente | Rige su §1 tal cual, y el padre §2.3 remite a ella |
| P-8 | M-8 | 019 | `Mesa-Rules.md` §6.2 a §6.7: P0 a P5 como fases y P0–P3 como niveles | Una carta cita la fase por su sección |
| P-9 | M-9 | 019 | `Root-Rules.md` §14: no hay clase para el arreglo que restituye lo prometido | «No altera el compromiso», con su observable |
| P-10 | M-11 | 019 | `Expediente-Rules.md` §6, A4 y A8: leen los cercos de código | Un folio que los ilustra los escribe con sangría |
| P-11 | R-3 | 019 | `Mesa-Rules.md` §6.1 (`:387`): una cita con puntos suspensivos que A10 no ve | Resuelve a mano |

## 3. La comprobación, con sus números

| Qué | Comando | Resultado |
| --- | --- | --- |
| Copia sin historia | `GIT_INDEX_FILE` temporal copiado del índice de la rama, `git add -A`, `git write-tree`, y `git archive <árbol> \| tar -x` en un workspace vacío y nuevo; `ls -A`; `test -e …/.git` | El workspace tiene sólo `IA.SDD`, sin `.git`. El índice de la rama quedó como estaba. La copia se borró al terminar |
| Resolución, «Dependencias» y forma | El guion de `evidencia/ev-04`, copiado al área de herramientas de la sesión y corrido desde ahí con `python3 -I`, en modo `--estricto`, sobre los tres documentos, el índice y la nota | **0 fallas**: 319 rutas, 260 secciones, 58 rangos, 50 alias, 10 identificadores y 17 carpetas de expediente, y 29 de 29 filas «Dependencias». En modo estricto, las 2 rutas al folio 019 del expediente 0003 (D-28). Ninguna línea de prosa pasa de 110 columnas |
| La misma corrida con la regla | Igual, sumando `SDD/Devs/Rules/Rules-Base-Conocimiento.md` | 346 rutas, 277 secciones, 58 rangos, 50 alias, 16 identificadores y 18 carpetas de expediente. Fallan sólo las 6 líneas de la regla de más de 110 columnas, las mismas de la 2.2, que esta corrección no toca. La 018 contaba con la regla, y por eso daba 329, 257, 12 y 18 |
| Base, antes de la corrección | La misma corrida sobre `git archive HEAD` (9e48fd4), sin la regla | 0 fallas: 302 rutas, 240 secciones, 6 identificadores y 17 carpetas. Lo que sumó la corrección resuelve entero |
| Techos | `wc -l` | Padre **580**, contra 600 de `Rules-Base-Conocimiento.md` §6.2. Excepción 345 (redacción 480). Cadena 160 (200), sin cambios. Nota 258 |
| Falsos positivos, uno por uno | Los literales que el guion descarta por clase, fuera de los bloques de código | Padre: L198 `<carpeta-del-caso>/despacho/<rol>.md` y `<rol>-ficha-<n>.md`; L213 y L487 `README.md`; L222 `NNN-<slug>.txt`; L420 y L474 `<carpeta-del-caso>`. Excepción: L141 `actuaciones/NNN-informe-ficha-de-excepcion-<n>.md` y L146 `<rol>-ficha-<n>.md`. Cadena: ninguno. Son los de 018, corridos de línea |
| Anclas de la nota | `grep -n` del contenido de cada fila de la excepción citada por `Coherencia-Mesa-De-Expertos-A-Pedido.md` §3.4 | Las 14 anclas que se corrieron caen otra vez en su fila: de 106 a 109, de 219 a 224 y de 294 a 299, entre otras. Las de `Cadena-De-Consecuencias` no cambian |
| Ofuscación | Líneas agregadas por `git diff -U0` del árbol de trabajo: rutas del host, usuario, IPv4, correos y URL | 0. Lo agregado no nombra producto, organización, proveedor, sistema, ruta ni host del destino: los casos van como «un destino», «la casa» o «el fork» |

## 4. Apartamientos y declaraciones

| # | Qué | Motivo |
| --- | --- | --- |
| 1 | El padre pasó de 560 a **580 líneas**: 20 por encima del techo de redacción de 013 y 20 por debajo de 600 (`Rules-Base-Conocimiento.md` §6.2), que es el techo que fijó este encargo | Los dos bloqueantes de 020 y B-2 de 019 no entraban en una fila. Lo que pudo ir a una celda, fue a una celda. La nota de coherencia actualiza la fila del techo |
| 2 | La lista de pasos irreversibles se unificó sin tocar el renglón 2 de §0, que sigue verbatim (013, §3) | El paso 2 del padre y la rama reversible de la excepción nombran las dos mitades y dicen que es una sola lista |
| 3 | M-4 de 019 se resolvió en el conocimiento y no pasó a pendiente, aunque nombra `Mesa-Rules.md` §5.2 | La regla no cambia. Lo que se fija es cómo se lee su forma cuando se usa «como forma», y eso lo declara este documento (padre §1 y §2.2) |
| 4 | Los informes 019 y 020 no se editaron | Son verbatim (`Expediente-Rules.md` §3) |

Sigue: el commit de la redacción con esta corrección, y sobre `git archive` de ese commit los pasos 1 a 3 de la
resolución 013 §7, A7 y A11 · Presidente de mesa · Cierra con: el commit de la redacción y el pedido de fusión
