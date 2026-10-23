# Nota de coherencia — La mesa que se pide por nombre, catalogada como conocimiento

**Framework:** SDD
**Documento:** Coherencia-Mesa-De-Expertos-A-Pedido.md
**Versión:** 1.1
**Estado:** Vigente
**Fecha:** 2026-10-23
**Versión del conjunto resultante:** SDD 13.22
**Origen:** pedido del Product Owner, 2026-09-13 — *«sería interesante que incorporases este prompt como
parte de la base de conocimiento […] no lo referencies de ahí, porque si mañana muevo el framework no lo
va a encontrar, entonces cuando te pide hacé una mesa de expertos en… presentales como caso tal o cual
cosa… que busque o algo similar a esto ya sepas que te estoy pidiendo sin tener que darte las
referencias — la constructiva del prompt la podés poner como parte de la base de conocimiento en un
markdown en el `Framework SDD`, luego con la experiencia de cómo lo hemos venido usando sabrás
determinar más especificaciones que sean necesarias»*. Y para la 1.1, el del 2026-10-23 que asienta
`Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/` (folios 001 y 008): incorporar el
conocimiento de un fork con sus dependencias, porque el framework se descarga en un workspace limpio —
*«la mesa debe ser consciente de esto»*.

---

## 1. Alcance

**1.0.** Alta de `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md`, alias `Mesa-De-Expertos-A-Pedido`, con
su fila en `Index-Knowledge.md`. No se tocó ninguna regla, orquestador ni plantilla.

**1.1.** El documento pasa a la 2.0 incorporando íntegra la sustancia de un fork suyo en un destino privado,
que llegó a la 1.15, y **se parte en tres documentos** de `Conocimiento/`: el padre, que sigue siendo la
puerta; su hermano `Excepcion-A-Un-Conocimiento` 1.0; y `Cadena-De-Consecuencias` 1.0, la dependencia que el
fork citaba de su destino y el árbol no tenía. **Se toca una regla**, marcada al Product Owner (§7, M-1):
`SDD/Devs/Rules/Rules-Base-Conocimiento.md` 2.3, para que la propiedad valga para cualquier fork. Ningún
orquestador ni plantilla cambia. La resolución que lo decide es el folio 013 del expediente.

## 2. La decisión de fondo: conocimiento, no norma

**El marco de origen ya entró una vez al framework, como norma**, y con una selección deliberada:
`Coherencia-Mesa-De-Evaluacion.md` §6 declara que de sus nueve mecanismos **cinco entraron y cuatro se
rechazaron** porque el método ya los tenía. Volver a traerlo como norma habría reabierto esa decisión sin una
contradicción que la funde, y copiarlo entero a `Conocimiento/` habría creado la segunda fuente que
`Rules-Base-Conocimiento.md` §4.5 nombra como **conocimiento disfrazado de regla**.

**Lo que el pedido necesita no es la mecánica, que ya está: es el uso.** `Mesa-Rules.md` §0.0 convoca por una
condición que supone corpus previo y un orquestador que lee estado, y **las mesas corridas desde su
publicación las pidió una persona**, sobre objetos que esa condición no alcanza. **El documento cataloga esa
forma y cita la norma para todo lo demás**; su §8 lo hace verificable.

**Y llega con su cierre (1.1).** El framework se descarga en un workspace limpio, y mañana otro lo forkea y
suma sus conocimientos: un conocimiento traído de otro repositorio que apunta a lo que no viaja queda
incompleto. La unidad del cierre es **la sección citada**, seguida de forma transitiva sólo por lo que usa una
cláusula de lo que se trae (folio 013, §1). Cada referencia tuvo uno de cuatro destinos —un equivalente
verificado con línea, lo citado traído al árbol, la norma del framework que manda en su lugar, o una
descripción de su origen sin apuntar— y ninguna se borró sin uno de ellos (§3.2). Entraron unas 57 líneas de
sustancia que no estaban ni en el árbol ni en el fork: la cadena de consecuencias y cuatro definiciones. De la
regla base del destino **no entró ninguna línea** (§3.3).

## 3. La evidencia de uso

**1.0.** Lo que el documento agrega a `Mesa-Rules.md` sale de mesas ya corridas. En el documento van anónimas,
por la compuerta de ofuscación; acá se declara de dónde sale cada afirmación.

| Afirmación del documento | Fuente |
| --- | --- |
| Clase «interfaz en ejecución»: usuarios estándar, moderador de objetivos, consultor de documentación, capas de origen de interfaz, cierre por captura posterior, datos sembrados, escalada por identidad visual | Mesa de interfaz de `Lab-Geometria`, 2026-09-02: marco adaptado, cinco actas y cierre. **64 hallazgos, 47 correcciones aplicadas, 1 refutado, 3 deudas declaradas, 0 escaladas** |
| Peritaje que cambia una sola variable; «qué dice el sistema cuando no pudo»; pruebas probadas en rojo antes del arreglo | La misma mesa, acta del peritaje y acta de cierre |
| «Cada dato del despacho lleva su comando»: cuatro datos, tres mal | Mesa sobre la colisión léxica, 2026-09-12, que originó el reporte `28`: su plan y cierre, §3 |
| «Descripción o control»: 71 hallazgos, 55 y 16; la unidad de aplicación es el documento | Mesa sobre la documentación de un tercer destino, 2026-09-07, acta de la mesa §2 |
| Testimonio de quien pide como evidencia E4 | El registro de la mesa del 2026-09-12 de `Lab-Geometria`, contrato de entrada |
| Rendimiento por especialista 4,9 y 5,8 | `Mesa-Rules.md` §6.7 |
| «Ante un problema, mesa y no detención» | Instrucción del Product Owner del 2026-09-13, en la corrida que migra `Lab-Geometria` a 13.16 |

### 3.1 Las versiones del fork, sin rutas del destino

| Versión del fork | Qué trajo | Dónde quedó en la 2.0 | De dónde salió |
| --- | --- | --- | --- |
| 1.3 | Barrido de las convenciones que rigen; filtro «¿Contradicción o conveniencia?»; ficha y apartado de cierre; cada comisión escribe su folio | Padre §3.4 y §2.3; excepción §3, §5.1 y §5.2 | Dos mesas del destino que dejaron de lado su tabla de parámetros sin el costo de cumplir; la mesa de su bitácora de convenciones |
| 1.4 | El default según la contradicción; la cuenta de folios; la huella del testimonio | Excepción §4 y §5.2; padre §3.2 | Revisión de la 1.3 con mesa y reproducción a ciegas |
| 1.5 | La escala de ancla y los niveles en la carta | Padre §5.1 (`LECTURA P0–P3`) y §5.2; excepción §3 | Ronda 1 de esa revisión: el reproductor no pudo deducir E2 |
| 1.6 | «Origen del hecho» con su salida entera | Padre §3.3 | Ronda 3: el resumen perdía la salida de la cláusula |
| 1.7 | «Procedente», los dos folios del jurado, el campo «Aprobó» | Padre §4; excepción §5.1 y §5.2 | Menores repetidos de las rondas 1 a 3 |
| 1.8 | El rol de análisis de decisiones y el camino de compromiso | Padre §1 y §2.1; excepción §1 y §5.3 | Decisión del Product Owner del destino: elegir entre caminos y no entre «sí» y «no» |
| 1.9 | «Sin admitir» ante una medición imposible; «Sin C-2» | Excepción §4, §5.2 y §5.3 | Reproducción a ciegas de la 1.8 |
| 1.10 | `Por criterio` exige dos rondas | Padre §4 y §5.4 | Ronda 4: una mesa de una ronda cerró «Por criterio» |
| 1.11 | El jurado copiado; la lista de escaladas | Cita por sección (§3.6) | Ronda 5 |
| 1.12 | Rama de la regla y de la reversibilidad; quién sigue el provisorio | Excepción §4 y §5.3 | Rondas 6 y 7 |
| 1.13 | Enunciado del problema, caso que funciona, comportamiento no es restricción, bloqueo | Padre §0, §2.1, §3.1, §3.3 y §5.1 | Retrospectiva de un caso del destino: un 401 rodeado y un emisor que no se igualó |
| 1.14 | «Lo que rige siempre» y el mapa de carga | Padre §0, con el encabezado nuevo y el mapa de siete filas | Un expediente del destino ante su techo de 700 líneas |
| 1.15 | Ciclo de vida de la evidencia | Padre §1, §2.3, §3.2, §5.3, §6 y §7, con el supuesto condicional | Pedido del Product Owner del destino tras versionar un caso sin su evidencia cruda |

### 3.2 Las 36 referencias del fork que no resolvían en un workspace limpio

Las filas son las de `NO RESUELVE` de `evidencia/ev-01` del expediente, por su línea en esa pieza, que lleva
cada ruta del destino reemplazada por un marcador de su función (folio 018). Clases del folio 013, §6: **E**
equivalente verificado, **T** traída, **N** manda la norma del framework, **H** trazabilidad descripta sin
apuntar, **FP** falso positivo.

| ev-01 | Fork | Qué era | Clase | Destino en el framework |
| --- | --- | --- | --- | --- |
| 7 a 11 | L757, L759 | Cinco folios de la bitácora del destino donde nació y se revisó la 1.3 | H | Padre §9, «Origen de la 2.0», y §3.1 de esta nota |
| 12 a 23 | L758, L760-L766 | Doce folios de las rondas 1 a 7 de esa revisión | H | Ídem |
| 24 a 28 | L768 | Cinco folios del expediente del destino sobre la carga progresiva | H | Ídem |
| 29 | L604 | La plantilla del folio del análisis de decisiones | FP | Excepción §1 y §2 fijan el folio |
| 30 | L239 | Un archivo de corrección del caso del 401 | H | Padre §3.3, el caso descripto sin nombres |
| 34 | L205 y 20 más | Las convenciones comunes del destino: su sección de precedencia frente a la regla, su regla de excepción y su cadena de consecuencias | E + T | La precedencia, equiparada a `Master-Prompt.md` §6 y `Rules-Base-Conocimiento.md` §0.4; la regla de excepción, traída a la excepción (§3.4 de esta nota); la cadena, traída a `Cadena-De-Consecuencias` (§3.5) |
| 36 | L757 | El documento de decisiones de arquitectura del destino | H | Excepción §3, el caso del filtro |
| 37 | L704 | La carta de una comisión de un expediente del destino | H | La lectura de P0–P3 en padre §5.1, sin la ruta |
| 38 | L761 | La re-decisión de otro expediente del destino, antecedente del rol de análisis | H | §3.1 de esta nota |
| 40 a 42 | L768 | Tres folios de pruebas sin contexto del expediente de la carga progresiva | H | Padre §9 y §3.1 de esta nota |
| 43 | L236 | Un folio de la bitácora del caso del 401 | H | Padre §3.3, peritaje |
| 47 | L760 | Las convenciones comunes del destino, con su ruta | E + T | Igual que la fila 34 |
| 48 | L280 | El índice de conocimiento del destino | E | `Conocimiento/Index-Knowledge.md` §3, con la ruta como parámetro (padre §5.1) |
| 49 | L236 | La bitácora de producción del caso del 401 | H | Padre §3.3 |
| 51 | L10 y 4 más | La regla base de conocimiento del destino: el `Compatible-con`, su techo en bytes y su deber de conservar verbatim lo importado | N | Manda `Rules-Base-Conocimiento.md`: `Compatible-con` 2.3, el techo de §6.2 y la desviación como condicional general (padre §8). Ver §3.3 |

Son 36: las filas agrupadas cuentan una referencia por línea de `ev-01` (5 + 12 + 5 + 3), y las demás, una.

### 3.3 La regla base del destino: sus siete invariantes, equiparadas

El fork citaba una invariante numerada de esa regla («consultivo, no normativo») con el nombre del archivo de
este framework, porque el destino declara que su numeración espeja la del emisor, y no la espeja. Ninguna
línea de esa regla entra: las siete invariantes tienen equivalente.

| Invariante del destino | Qué dice | Equivalente en `SDD/Devs/Rules/Rules-Base-Conocimiento.md` 2.3 |
| --- | --- | --- |
| 1 · vaciable | Con el catálogo vacío nada cambia | `SDD/Devs/Rules/Rules-Base-Conocimiento.md:65-71` (§0.2) |
| 2 · ninguna regla nombra un documento | Sólo existe el contrato del índice | `SDD/Devs/Rules/Rules-Base-Conocimiento.md:32-33` (§0.0) |
| 3 · se extiende sin tocar una regla | Agregar una fila no cambia la norma | `SDD/Devs/Rules/Rules-Base-Conocimiento.md:29` y `:33-34` (§0.0) |
| 4 · cita por alias | Renombrar un archivo no rompe una cita | `SDD/Devs/Rules/Rules-Base-Conocimiento.md:188-190` (§3.2) |
| 5 · consumidor obligatorio | Ninguna fila sin consumidor | `SDD/Devs/Rules/Rules-Base-Conocimiento.md:424-428` (§7.3) |
| 6 · consultivo, no normativo | Lo que contradice el piso declara la sustitución o la desviación | `SDD/Devs/Rules/Rules-Base-Conocimiento.md:98-103` (§0.4), `:340-342` (§5.5) y `:369` (§6.1) |
| 7 · sin identidad de versión propia | El catálogo entra en el snapshot | `SDD/Devs/Rules/Rules-Base-Conocimiento.md:430-438` (§7.4) |

### 3.4 La regla de excepción del destino, cláusula por cláusula

Es la sección de las convenciones comunes del destino sobre apartarse de un documento aplicable. Una cláusula
sin línea en el hermano es falla.

| Cláusula del destino | Dónde quedó |
| --- | --- |
| La guarda: rige si el índice existe y tiene filas, para todo agente y toda mesa | **No se trae** (folio 013, C-4): acá estaría siempre encendida. Lo dice `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:294` (§8) |
| Un precedente del producto no es una regla; frente a una regla manda la regla | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:87` (§3) |
| Por contradicción, no por conveniencia; la ficha con sus siete datos | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:88` (§3) y §5.1 |
| «Más simple», «no aplica del todo», «ya había un patrón»: se cumple y se propone | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:88` (§3) |
| Sale con un análisis de cuatro pasos, no con un sí o no; en una mesa lo hace el análisis de decisiones | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:89` (§3) y `:60` (§1) |
| Paso 1: alternativas, con la más cercana a cumplir; las imposibles, con su ancla | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:219` (§5.3) |
| Paso 2: criterios citados, sin inventar; dos fijos; pesos antes; lo cumplible sigue rigiendo; fuera del documento, el estándar | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:223`, `:229` y `:232` (§5.3) |
| Paso 3: uno o dos caminos, con recomendación y reversibilidad; sin segundo, cuál quedó segunda | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:234` (§5.3) |
| Paso 4: quien pidió elige, valida o pide otro; no se asienta por silencio | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:62` (§1) y `:117` (§4) |
| Default, regla o decisión aceptada: rige ella, deuda con evento de cierre | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:106` (§4) |
| Default, imposibilidad sin medir: obstáculo, se pide la medición, sin admitir | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:107` (§4) |
| Default, reversible: provisorio, ADR `Propuesto`, nada irreversible encima; definición de reversible | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:108` (§4) y `:241` (§5.3) |
| Default, no reversible: se espera | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:109` (§4) |
| El ADR pasa a `Aceptado` con la respuesta | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:111` (§4) |
| «Cumplir» no es default ante una imposibilidad | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:116` (§4) |
| El término «apartamiento»; «desviación» y «desvío» | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:29` (§0), con otro término (folio 013, C-3) y «desvío» equiparado a `Mesa-Rules.md` §6.1 |

### 3.5 La cadena de consecuencias del destino, cláusula por cláusula

| Cláusula del destino | Dónde quedó |
| --- | --- |
| Alcance: los agentes del destino, todo orquestador y toda mesa | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:20` (§0), reescrito: quien cargue el documento |
| La regla: se recomienda por lo que produce donde cae | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:45` (§2) |
| Pasos 1 a 4 | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:49-56` (§2) |
| Un obstáculo no es una decisión | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:63` (§3) |
| Una acción denegada no se le pide a otro agente | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:64` (§3) |
| La restricción también es una opción | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:65` (§3), con «una regla del framework o del destino» |
| La cadena se corre también al ejecutar | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:66` (§3) |
| De dónde sale | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:145` (§9), con su mecanismo y cifras; la carga en tres niveles del destino que nombraba queda descripta («lo que se despacha»), sin traerse |

### 3.6 Las copias de reglas que llevaba el fork

El fork copiaba trece pasajes de `Mesa-Rules.md` 1.5 y de `Master-Prompt.md` 8.21 porque su destino no tenía
esas reglas. `evidencia/ev-06` del expediente los compara palabra por palabra con la regla vigente y con
`_legacy/13.21/`, que son iguales: cuatro coinciden enteros (el jurado, la lista de disparadores, la escala de
ancla y los niveles) y los otros nueve difieren sólo en su marco («copia de…, líneas…»), en «[…]» que elide la
fuente o en la frase de aplicación que les sigue. **Lo que coincide pasa a cita por sección. Lo que la copia
agregaba es contenido y se conserva**, cada aplicación en su sección: una ronda es un ciclo completo y ni la
regla propia ni el presupuesto son criterio (padre §4 y §5.4); qué ancla admite una excepción (excepción §3);
la lectura de P0–P3 del caso (padre §5.1); «de la corrida» no suprime la pregunta (padre §3.3); una excepción
no se autocorrige (excepción §4).

### 3.7 Lo que quedó fuera del cierre, y por qué

| Pieza del destino | Por qué no entra |
| --- | --- |
| Su escalera de precedencia de seis niveles, y la detención ante una desviación en materia sin regla | Manda `Root-Rules.md` §13 y `Rules-Base-Conocimiento.md` §0.4, que dicen otra cosa; traerla apagaría la desviación justificada de otro documento del catálogo. La excepción §8 lo deja dicho para un fork |
| Su carga del conocimiento en tres niveles y su acta de parámetros | Ninguna cláusula traída la usa; el mapa del padre es una guía de quien preside (pendiente P-3) |
| Su delegación del merge | Tiene equivalente en `Conformacion-Pull-Request-Automatico` |
| Su techo en bytes y la desviación por editar un cuerpo importado | Manda `Rules-Base-Conocimiento.md` §6.2; la desviación entra como condicional general (padre §8) |

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` | 1.0 (13.17) → … → **2.0** (13.22) | Se parte y queda como la puerta |
| `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` | **1.0** | Nuevo, hermano del padre |
| `Conocimiento/Knowledge-Cadena-De-Consecuencias.md` | **1.0** | Nuevo, dependencia traída |
| `Conocimiento/Index-Knowledge.md` | 1.6 → **1.7** | La fila del padre, dos altas, la cabecera a 2.3 y §2 |
| `SDD/Devs/Rules/Rules-Base-Conocimiento.md` | 2.2 → **2.3** | §2.2, §6.1, §8 y §10 (M-1) |
| `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` | 1.0 → **1.1** | Esta nota |
| `SDD/Guides/SDD-Development-Guide.md` | 1.31 → **1.32** | El recuento de ítems de §6.1 (M-5) |
| `README.md` | — | Una fila de la matriz de ruteo (M-6) |
| `CHANGELOG.md` | — | Entradas `[13.17]` y `[13.22]` |
| `_legacy/13.16/`, `_legacy/13.21/` | — | El conjunto superado de cada intervención |

## 5. Verificación contra `Rules-Base-Conocimiento.md` §6.1

La lista completa, ítem por ítem y por documento, está en la entrada `[13.22]` del `CHANGELOG.md`, con el
comando de cada ítem enumerable, y la salida de la comprobación de la copia sin historia en `evidencia/ev-05`
del expediente; la de la corrección tras la prueba, en su folio 018.

## 6. Pendientes de la norma

No se aplican: tocarían una regla, un orquestador o el índice, y no hacen falta para que el cierre resuelva.

| # | Pendiente | Default |
| --- | --- | --- |
| P-1 | Que el régimen de excepción rija fuera de una mesa, para todo agente. Tocaría `Master-Prompt.md` §6 u §8, o `Rules-Base-Conocimiento.md` | No |
| P-2 | Una columna de dependencias en el índice. Tocaría `Rules-Base-Conocimiento.md` §7.1 | No: lo resuelven el mapa de carga y la tabla de §9 |
| P-3 | Que el orquestador cargue el conocimiento en tres niveles | Queda como norma de despacho por decidir |
| P-4 | Que una regla mande abrir el índice ante un pedido fuera del orquestador, o cargar el padre antes de un encargo sin mesa | No |
| — | El techo de §6.2 es calibrable: el padre quedó a cuarenta líneas del techo de §6.2 (600) y en el de redacción de la resolución (560) | Se mide con el próximo documento real |
| P-5 | Que `SDD/Devs/Rules/Catalogo-De-Criterios.md` lleve una fila para el pedido de una mesa por nombre: hoy remite a `Mesa-Rules.md` §0.0 (`:90`), y un agente que siga sólo el catálogo no llega al índice de conocimiento. Tocaría una regla | No: el `README.md` lo resuelve (M-6) |
| P-6 | Que la evidencia del expediente 0004 se renombre `NNN-<slug>` (`Expediente-Rules.md` §3.1): la resolución 013 fijó `ev-01` a `ev-06`, como el precedente publicado del 0003, y renombrar va contra ella | No: se conservan los nombres de la resolución, y el folio 018 lo declara |

## 7. Marcado al Product Owner

| # | Qué | Default aplicado | Volver atrás |
| --- | --- | --- | --- |
| M-1 | La propiedad de que un conocimiento traído llega con su cierre, en `Rules-Base-Conocimiento.md` 2.3: §2.2, §6.1 (sin efecto hacia atrás), §8 y §10 | Se aplica | Cuatro bloques de la regla y el `Compatible-con` de los tres documentos y de la cabecera del índice |
| M-2 | `Index-Knowledge.md` §2, fuera de «su fila»: la remisión a un tool-prompt de relevamiento que no existe y la oración que remite a §2.2 | Se aplica | Dos líneas |
| M-3 | Partir contradice la decisión del Product Owner del destino de que este documento fuera el lugar de la regla de excepciones | Se parte; el padre es la puerta | Unir los dos bajo el alias del padre, que pasaría las 600 líneas |
| M-4 | Aviso: «apartamiento» pasa a «excepción a un conocimiento» | Se aplica | Renombrar un archivo, un alias, la fila y el prefijo `XC-` |
| M-5 | `SDD/Guides/SDD-Development-Guide.md` §III.11 decía «los catorce ítems» de `Rules-Base-Conocimiento.md` §6.1, que con la 2.3 son quince: un costo de M-1 fuera de la resolución | Se aplica: la guía pasa a 1.32 | Una palabra y una fila |
| M-6 | La matriz de ruteo del `README.md` raíz suma una fila para el pedido de una mesa por nombre, que remite al índice de conocimiento y no nombra ningún documento | Se aplica | Una fila |

## 8. Veredicto

**1.0, APROBADO.** El conjunto 13.17 era el 13.16 más un documento de catálogo.

**1.1, por aprobar con la prueba del expediente.** El conjunto 13.22 es el 13.21 con el conocimiento partido
en tres y una regla tocada, marcada. La propiedad de `Rules-Base-Conocimiento.md` §0.2 se conserva —con
`Conocimiento/` vacía, el framework corre igual—, porque ninguna regla nombra a los documentos nuevos y la
regla de excepción entró sin su guarda.

---

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.1 | 2026-10-23 | Documenta la 2.0 del documento y sus dos documentos nuevos (expediente `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`): el cierre de dependencias y su unidad (§2), las versiones del fork sin rutas del destino (§3.1), el destino de cada una de las 36 referencias que no resolvían (§3.2), la equiparación de las siete invariantes de la regla base del destino (§3.3), el cotejo cláusula por cláusula de las dos secciones traídas (§3.4, §3.5), el de las copias de reglas (§3.6), lo que quedó fuera del cierre (§3.7), los pendientes de la norma (§6) y lo marcado al Product Owner (§7). La fuente del testimonio E4 deja de nombrar el archivo de otro repositorio y lo describe. Se quitan de la 1.0, porque la 1.1 reescribe esos apartados: la remisión a `SDD-Development-Guide.md` §III.11 como eje de extensión, la objeción de ubicación, «no se midió nada nuevo para esta nota», la lección que se consideró y no entró, y el recuento de `_legacy/13.16/` (131 archivos); la 1.0 sigue entera en `_legacy/13.21/`. Tras la prueba (folio 018): los pendientes P-5 y P-6, lo marcado M-5 y M-6, y las anclas de la excepción recalculadas. |
| 1.0 | 2026-09-13 | Emisión inicial. Documenta el alta de `Mesa-De-Expertos-A-Pedido`, la decisión de catalogar el uso y no reabrir la norma, y la fuente de cada afirmación del documento. |
