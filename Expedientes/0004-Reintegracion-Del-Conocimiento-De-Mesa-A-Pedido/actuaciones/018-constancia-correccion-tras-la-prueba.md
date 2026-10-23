| Campo | Valor |
|---|---|
| Tipo | constancia |
| Fecha | 2026-10-23 |
| Autor | Corrector de la mesa |
| Corrige | — |

# Corrección tras la prueba: bloqueantes, referencias rotas y menores de los folios 015, 016 y 017

Es el ciclo de corrección de T10 (resolución 013, §8). Leí los folios 013 a 017 y apliqué, sobre el árbol de
trabajo de la rama del expediente, **todo bloqueante y toda referencia rota** de los tres informes, los
**menores repetidos en dos informes** y, a criterio fundado, los demás. Bajo O2′ una referencia rota se
arregla trayendo o haciendo coincidir, nunca borrando la cláusula. Nada va contra la resolución 013 ni
contra R1 a R4: lo que lo habría exigido queda abajo como pendiente, con su default. **No hice commit.** La
comprobación corrió sobre una copia nueva, armada con `git archive` de un árbol escrito con un índice
temporal, sin tocar la rama.

Redacción S2: dos piezas, antes del primer push, porque llevaban topología de un repositorio privado (S2,
«Dato de un repositorio privado»). `evidencia/ev-01-dependencias-del-fork-en-workspace-limpio.out`, huella
antes `91bf0d15ddb8da956a320f127a3597ef2d06887d3388229668a00d6545a06092`, después
`10de009780f0d111625ab5b861af05305a2b8114a68e9c09c07c6fc4716596f1`: las 36 filas `NO RESUELVE` llevan
cada ruta del destino reemplazada por un marcador de su función, y conservan su línea, sus ocurrencias y
su línea del fork, porque la nota de coherencia §3.2 cita la pieza por línea.
`actuaciones/007-informe-refutador-del-objetivo.md`, huella antes
`b942d488c4af3db74342711d33924f9df6a460ee0b4dd03b3541bc23040f8931`, después
`e47f444b306eae62f7ce49b779944a9c78e9374783e8cacd5a76616d18f5cee2`: una ruta de la carpeta de
conocimiento del destino, en la línea 48, pasa a un marcador con la marca `[redactado S2, folio 018]`, y el
resto del informe queda tal cual. Los originales se custodian fuera del repositorio, en el área de trabajo
de la sesión. No hay manifiestos que regenerar. Nada de esto se empujó todavía, así que no hay nada
publicado que retirar.

## 1. Lo aplicado

| Hallazgo | Folio | Qué se hizo | Dónde |
| --- | --- | --- | --- |
| AM-01 (P1) | 015 | Las rutas de folios, rondas, expedientes y bitácoras del destino, y las dos filas con la estructura de carpetas de su pipeline, pasan a un marcador de su función. Las filas de los dos archivos de dependencia del destino van igual. Línea por línea, sin mover ninguna | `evidencia/ev-01`, con la redacción S2 de arriba |
| AM-02 (P1) | 015 | La celda queda en `002`, como en `Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/actuaciones/010-…`. El alcance de la corrección pasa a una oración del cuerpo. No hubo push, así que no se reescribe nada publicado | Folio 008, cabecera y primera oración |
| B-1 | 016 | «Quién aplica»: quien convocó, en el lugar del orquestador, o quien el pedido designe, **nunca un rol del panel ni el jurado**. Cita literal de `Mesa-Rules.md` §6.6 («la mesa no aplica») y §1.2 («aplicar es del orquestador»), y de `Root-Rules.md` §14.1 («nunca la mesa»). «Hacé una mesa que lo corrija» autoriza a aplicar y no designa a la mesa. El esqueleto `QUIÉN APLICA` ya no ofrece «la mesa» | Padre §4, §2.1 paso 9 y §5.1 |
| B-2 · B3 | 016 · 017 | **Dónde escribe cada rol**: una ruta de trabajo, `<carpeta-del-caso>/despacho/<rol>.md`, que es la `{{RUTA DEL FOLIO}}` de la carta. El folio no se reserva: se incorpora sin editar al llegar, con el siguiente número libre (`Expediente-Rules.md` §3.1). En un destino, cada informe es su sección del registro único de `Mesa-Rules.md` §2.1 (punto 4 de §2.2), que el expediente folia por `ruta@commit`. Así deja de chocar con la regla, que manda un solo registro | Padre §2.3, tabla; excepción §5.1 |
| B-3 · B1 | 016 · 017 | Cuándo una mesa a pedido cumple `Mesa-Rules.md` §0.0: la tercera cláusula dice «sobre ese corpus», así que la cumple sólo un corpus de especificación que es el objeto. **Si la cumple**, la regla manda en lo que regula, y del documento se toma lo que ella no regula ni contradice: §0, §3.1, §3.4, los campos de §5.1, §2.3 y el paso 6 bis. Ya no se toman sólo §3.1 y §2.3, y deja de contradecir el renglón de §0 «se cargue lo que se cargue» | Padre §1; §2.3 y §8 remiten a §1 |
| B2 | 017 | «La ruta del índice que declara el intake» no existía. El índice que se barre es el del framework que corre o el de un fork, en la misma ruta (`Master-Prompt.md` §6; `Conocimiento/Index-Knowledge.md` §4: el intake cita alias). Una «convención de la casa» que está fuera de ese índice entra al contrato como regla o decisión del producto, con su fuente | Padre §3.4, §5.1 y la tabla «Dependencias» |
| B4 | 017 | Una decisión que el pedido pone en revisión es el objeto, no una `decisiones_cerradas`. Dos decisiones cerradas en conflicto son el disparador 7. **Una excepción ya ejecutada sin ficha** es un hallazgo y no una ficha retroactiva: nadie la escribe en nombre de quien no la escribió | Padre §3.4; excepción §4, fila nueva |
| Referencia de la nota L109 | 015 | Las tres secciones de las convenciones del destino se nombran por su función, no por su número | Nota §3.2, fila 34 |
| R-1 · rota 1 | 016 · 017 | El expediente 0004 no faltaba en una copia del framework: lo había excluido el montaje de las dos pruebas. En la copia nueva resuelve, con 18 carpetas de expediente en 0 fallas. Las tres tablas «Dependencias» aclaran que esas citas son origen y ejemplar, y que ninguna hace falta para aplicar el documento | Los tres documentos, §9 |
| R-3 · AM-13 | 016 · 015 | Se hace coincidir la cita entrante `Mesa-Rules.md:574`. §3.1 suma la fila del pedido que pide diseñar lo que el producto no prometía: es un cambio de alcance, el pedido foliado es el arbitraje y el ciclo no se bloquea. La regla no se toca. La constancia 014 lo había afirmado por sentido; ahora está literal | Padre §3.1 |
| Rota 3 · AM-05 | 017 · 015 | Primera mención con la ruta desde la raíz (D-27): `Mesa-Rules.md`, `Master-Prompt.md`, `Root-Rules.md`, `Deriva-Rules.md`, `Rules-Base-Conocimiento.md` y las dos notas de coherencia. La fila de las guías en «Dependencias» lleva las rutas completas | Padre §0, §3.3, §8, §9 |
| M-1 · M1 | 016 · 017 | La matriz de ruteo suma una fila para la mesa que alguien pide por nombre. Remite al índice de conocimiento y no nombra ningún documento, porque con `Conocimiento/` vacía nada cambia. Sale marcada (M-6) | `README.md` |
| M-4 · M6 | 016 · 017 | Qué se relanza: los despachos cuya carta lleva una cláusula que cambió. Lo que ya llegó es una corrida descartada con constancia (`Expediente-Rules.md` §3.4) y queda fuera de la cuenta. Una señal nueva para el panel entra por la ronda en caliente (`Mesa-Rules.md` §5.3). La celda deja de repetir el renglón 2 de §0, con lo que se cierra también M7 de 017 | Padre §2.1, paso 2 |
| M-10 · M2 | 016 · 017 | Un objeto de dos clases toma la clase de la pregunta principal del pedido. De la otra suma sólo los roles que una señal pida, y declara la clase descartada | Padre §2.2 |
| M-11 · M3 | 016 · 017 | `{{CARPETA DE FICHAS}}` es la ruta de trabajo de quien propone, con el nombre `<rol>-ficha-<n>.md` | Padre §2.3; excepción §5.1 |
| AM-03 | 015 | «Los catorce ítems» pasa a «los quince», y la guía pasa a 1.32 con su fila. Sale marcado (M-5) | `SDD/Guides/SDD-Development-Guide.md` §III.11 |
| AM-04 | 015 | Los literales de plantilla y el `README.md` suelto se enumeran uno por uno, con archivo y línea (§2) | `CHANGELOG.md` `[13.22]`, ítem 8 |
| AM-07 | 015 | Los nombres de las dos dependencias del destino se reemplazan donde la presidencia los escribió en evidencia (`ev-01`). En los folios se declaran falso positivo léxico (§2): son nombres genéricos de archivo, y los informes van sin editar (`Expediente-Rules.md` §3). En `ev-04` son el patrón de la propia comprobación | `evidencia/ev-01`; esta constancia |
| AM-08 · AM-09 · AM-10 | 015 | La distancia al techo se corrige (40 líneas contra 600; en el techo de redacción, 560). La prosa de la nota se reenvuelve a 110 columnas, sin líneas huérfanas. La fila 1.1 declara los cinco párrafos de la 1.0 que quitó. Las anclas de la nota a la excepción se recalculan por contenido: siete líneas corridas | Nota de coherencia |
| AM-11 | 015 | Las filas de las tablas «Dependencias» van por sección: `Mesa-Rules.md` lleva §2, §3, §8 y las demás que el texto cita; la regla base lleva §0.2 y §6.1 en la excepción | Padre y excepción, §9 |
| AM-14 | 015 | «El rótulo que esa regla declara ilegítimo» pasa a «un rótulo que esa regla no admite», seguido de la oración literal de `Master-Prompt.md` §10.1 | Padre §5.4 |
| M-2, M-3, M-5 | 016 | La fila de «qué queda afuera» dice que «apartamiento» era el término de origen y que no es el de `Root-Rules.md` §11. Un 401 que es el objeto de la investigación es el defecto, no un bloqueo. «La que menos agrega» queda definida | Padre §0 y §3.1 |
| M-6 | 016 | La cuenta de folios suma el perito y los roles de la clase «interfaz en ejecución» | Padre §2.1 paso 10 y §6; excepción §5.2 |
| M-7 | 016 | Lo que quien pidió escribe a mitad del caso va en una `providencia` con su testimonio, como el folio 008, y no en una `presentacion` | Padre §2.3, tabla |
| M-8 | 016 | La fila «comisión» del mapa de carga suma `Cadena-De-Consecuencias` §2, que la carta ya pedía | Padre §0 |
| M-9 | 016 | Con la cuenta real del caso que funciona, la medición la hace quien tiene el acceso, y se le pide. La comisión reproduce con una cuenta sembrada y declara el eje que no quedó fijo | Padre §4, «Datos reales» |
| M4, M5, M9 | 017 | Los campos de §5.1 son los de `Mesa-Rules.md` §4 en mayúsculas, y los tres que faltaban llevan «no aplica» y su motivo fuera de §0.0. La carta pide declarar el alias y la versión de los otros dos documentos. El barrido dice que el campo 1 es vacío | Padre §5.1 y §5.2 |

**Lo que no se aplicó**, con su motivo:

| Hallazgo | Folio | Motivo |
| --- | --- | --- |
| AM-06 | 015 | Hacer el commit no es de este encargo. La corrida sobre `git archive` de un árbol sin commit (§2) emula el paso 1. A7 no se puede evaluar sin la rama principal |
| R-2 · rota 2 | 016 · 017 | El nombre `ev-06` choca con `Expediente-Rules.md` §3.1, que manda `NNN-<slug>`. Pero la resolución 013 fijó `ev-01` a `ev-06`, y renombrar iría contra ella. La referencia resuelve: el archivo existe en la copia. **Pendiente marcado** (P-6) |
| M-12 | 016 | No es un defecto del documento. La cautela queda para la próxima reproducción en papel: los ejemplos de testimonio van en bloques `text` |
| M8 | 017 | El texto ya decide. Según padre §3.3, el pedido nunca está en la base, así que un hecho que se apoya en él es «de la corrida» por la letra, y el «ajeno» que rotuló la reproducción no es lo que el texto manda |
| M10 | 017 | El caso de origen de la excepción §3 es la evidencia de la cláusula, no un veredicto para copiar. La regla de cierre está en la columna del medio («Nombrar la alternativa no alcanza») |

## 2. La comprobación, con sus números

| Qué | Comando | Resultado |
| --- | --- | --- |
| Copia sin historia | Índice temporal (`GIT_INDEX_FILE`), `git add -A`, `git write-tree`, y `git archive <árbol> \| tar -x` en un workspace vacío y nuevo; `ls -A`; `test -e …/.git` | El workspace tiene sólo `IA.SDD`, sin `.git`. `_legacy/13.21/`: 140 archivos, `diff -rq` contra `git archive c9b3e46` vacío |
| Resolución, «Dependencias» y forma (pasos 2, 4 y 7) | `python3 -I` del guion de `evidencia/ev-04` con `--estricto`, sobre los tres documentos, el índice, la nota y la regla | **0 fallas** en los tres documentos, el índice y la nota: 329 rutas, 257 secciones, 58 rangos, 50 alias, 12 identificadores y 18 carpetas de expediente, y 29 de 29 filas «Dependencias». En modo estricto, 2 rutas al folio 019 del expediente 0003 (D-28). La regla trae 6 líneas de más de 110 columnas, las mismas de la 2.2 |
| Falsos positivos, uno por uno | Los literales que el guion descarta por clase, fuera de los bloques de código | Padre: L192 `<carpeta-del-caso>/despacho/<rol>.md` y `<rol>-ficha-<n>.md`; L207 y L467 `README.md`; L216 `NNN-<slug>.txt`; L400 y L454 `<carpeta-del-caso>`. Excepción: L137 `actuaciones/NNN-informe-ficha-de-excepcion-<n>.md` y L142 `<rol>-ficha-<n>.md`. Cadena: ninguno |
| Nada apunta afuera (paso 3) | Los dos `grep -c -E` de la resolución 013 §7 | 0 y 0 en los tres documentos y en la nota |
| Citas entrantes (paso 6) | `grep -rn -o` de `Mesa-De-Expertos-A-Pedido … §n` en `SDD/` y `Conocimiento/` | Seis citas desde fuera de los tres documentos, todas a §3.1, más la de `Root-Rules.md:948-949` a §2.1. La de `Mesa-Rules.md:574` encuentra ahora su materia literal en §3.1 |
| `Rules-Base-Conocimiento.md` §6.1, los quince ítems | `sed -n 3,13p \| grep -cP`; `grep -c '^## [0-9]*\.'`; `wc -l`; fila del índice contra la cabecera, por guion; `grep -oP '^#{3,4} '` | Campos 11 · 11 · 11; secciones 11 · 11 · 11; líneas **560** · 340 · 160, contra 600 y contra los techos de redacción 560 · 480 · 200; alias, una fila cada uno; **nueve de nueve** filas del índice iguales a su cabecera; numeración contigua. Los cinco `[interpretativo]` se sostienen: la corrección no tocó §0 «qué queda afuera» salvo una fila, ni §6 salvo un criterio |
| Ofuscación sobre todo el diff | Las líneas agregadas de `git diff -U0 c9b3e46 <árbol>`, sin `_legacy/` (34 archivos, 4.369 líneas). Tres listas de términos, fuera del repositorio: la del encargo, la ampliada de la presidencia y la del auditor | **Producto, organización, proveedor y sistemas del destino: 0.** Las coincidencias que quedan son falsos positivos léxicos. La lista del encargo marca 1 línea: el patrón genérico de secretos de un comando de ejemplo (017, L344). La ampliada marca 13: el nombre genérico de la carpeta de prompts del destino (9), el de su carpeta de contexto (2) y la carpeta `PROMPTS/` del propio framework (2, en el folio 015 y en éste). La del auditor suma los nombres de archivo de las dos dependencias del destino: 53 y 46 ocurrencias, sólo en folios y en el patrón de `ev-04`; en los documentos, el índice, la nota, la regla y `[13.22]`, 0. Ninguna ruta de expediente ni de bitácora del destino queda en el árbol. IPv4, correos y URL: 0 |
| A11 | El patrón de `Expediente-Rules.md` §6 (rutas y usuario del host) sobre las mismas líneas | 0 |
| `Expediente-Rules.md` §6 sobre este expediente | A1 a A6, A8, A9, A10, A13 y A14, con los comandos de la regla, en la copia (A10 con `grep -r` en lugar de `git grep`) | A1, A2, A3 (folios 001 a 018 contiguos), A4, **A5** (ya sin `CORRIGE`), A6, A8 y A9: vacíos. A13: `Reintegra: ninguna`. A14: el pedido de fusión, todavía sin constancia, como se espera. **A10 da dos**: la cita histórica del `CHANGELOG.md` que la auditoría ya había excluido, y una ruta ilustrativa de un destino imaginario en el folio 016, línea 342. El propio reproductor declaró escribir las rutas de ese destino en forma calificada, y en esa línea no lo hizo (abajo, pendiente 3). A7 no es evaluable sin commit |

## 3. Apartamientos y declaraciones

| # | Qué | Motivo |
| --- | --- | --- |
| 1 | El padre quedó en **560 líneas**, el techo de redacción de 013, contra 600 de `Rules-Base-Conocimiento.md` §6.2 | Lo nuevo sumaba 39 líneas. Se quitó lo que el documento repetía, como manda 013 §8: el paso 2 ya no copia el renglón 2 de §0; §8 remite a §1 en lugar de repetirlo; «Dónde resuelven las citas» ya no lista las reglas que la tabla «Dependencias» nombra; las dos remisiones de §6 y §7 caben en una línea. Las aclaraciones que entraban en una tabla fueron a una fila |
| 2 | Los cinco renglones de §0 siguen verbatim (013, §3) | La definición de «la que menos agrega» y el detalle del relanzamiento fueron a §3.1 y a §2.1, paso 2, no a los renglones |
| 3 | AM-12: la excepción §4 funda la superación de un ADR en `Rules-Arquitectura-Tecnica.md` §3.3 (`:132`), no en `Root-Rules.md` §13 como decía D-08 de 013 | Es el equivalente que dice lo mismo para el ADR, verificado con su línea. `Root-Rules.md` §13 ordena las reglas entre sí, no los ADR. La constancia 014 no lo declaró: queda declarado acá |
| 4 | Se editaron dos folios ya escritos: la celda `Corrige` del 008 (AM-02) y la línea 48 del 007 (redacción S2) | Ninguno se había empujado, así que S1 no rige todavía. Los demás informes quedan sin editar |
| 5 | Las secciones citadas de las reglas se cotejaron por contenido | «la mesa no aplica» (`Mesa-Rules.md:486`), «aplicar es del orquestador» (`:140`), «sobre ese corpus» (`:27`), «nunca la mesa» (`Root-Rules.md:865`, §14.1), la oración de `Master-Prompt.md` §10.1 (`:1522-1523`), «el intake no registra ninguna raíz» (`Index-Knowledge.md:50-51`), la ronda en caliente (`Mesa-Rules.md:324-326`, §5.3) y el disparador 5 (`:576`) |

## 4. Pendientes y lo marcado al Product Owner

| # | Qué | Default | Volver atrás |
| --- | --- | --- | --- |
| M-5 | `SDD/Guides/SDD-Development-Guide.md` 1.32: «los quince ítems» (AM-03), un costo de M-1 fuera de 013 | Se aplica | Una palabra y una fila de control de cambios |
| M-6 | `README.md`, matriz de ruteo: la fila de la mesa que alguien pide por nombre (M-1 de 016, M1 de 017). No es regla, orquestador ni plantilla, pero 013 no la preveía | Se aplica | Una fila |
| P-5 | `SDD/Devs/Rules/Catalogo-De-Criterios.md:90` manda el pedido de mesa a `Mesa-Rules.md` §0.0. Darle una fila al conocimiento tocaría una regla (R1) | No se toca: el `README.md` resuelve la entrada | — |
| P-6 | Renombrar la evidencia de este expediente a `NNN-<slug>` (`Expediente-Rules.md` §3.1; R-2 de 016, rota 2 de 017). Iría contra los nombres que fijó 013, como el precedente publicado del 0003 | Se conservan `ev-01` a `ev-06`, y la colisión queda declarada acá | Renombrar seis archivos antes del push y sus citas en los tres documentos, la nota y `[13.22]` |
| A la presidencia 1 | AM-06: el commit con `_legacy/13.21/` y la corrida sobre `git archive` del commit (pasos 1 a 3 de 013 §7, A7 y A11) | Antes del pedido de fusión | — |
| A la presidencia 2 | Las reproducciones a ciegas no volvieron a correr sobre la corrección | La auditoría de la presidencia decide si hace falta una tercera, porque los cambios tocan §1, §2.3 y §4 del padre | — |
| A la presidencia 3 | A10, folio 016, línea 342: una ruta de un destino imaginario sin calificar, en un informe verbatim | Se declara falso positivo acá y el informe no se edita. La otra salida es calificarla antes del push, con una constancia | — |

Sigue: el commit de la redacción, con `_legacy/13.21/`, y sobre `git archive` de ese commit los pasos 1 a 3 de la resolución 013 §7, A7 y A11 · Presidente de mesa · Cierra con: el commit de la redacción y el pedido de fusión
