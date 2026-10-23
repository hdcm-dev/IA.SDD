| Campo | Valor |
|---|---|
| Tipo | informe |
| Fecha | 2026-10-23 |
| Autor | Comisión de Arquitectura de la información (segunda ronda) |
| Corrige | — |
| Secciones de Mesa-De-Expertos-A-Pedido 1.15 leídas | Cabecera, §0, §1, §2.1, §3.1 a §3.4, §5.1 (esqueleto del barrido), las líneas de §5.5 a §5.7 que citan al destino, §8 (marco, cierre y desviación) y la cabecera de §9. Es la fila «Editás este documento o auditás su origen» del mapa (`<insumos>/…fork-1.15.md:73`), acotada a lo que toca la estructura del conjunto |

# Informe de la comisión de Arquitectura de la información, segunda ronda: la estructura del conjunto

Trabajé a ciegas respecto de la segunda ronda. De `actuaciones/` leí los folios 001 a 008 y ninguno posterior, y no consulté a otras comisiones. Parto del folio 006 (primera ronda, lectura (a)): conservo lo que sigue valiendo y digo qué corrijo bajo la lectura (b) que fija el folio 008.

**La mesa es consciente de la premisa.** `IA.SDD` se descarga en un workspace limpio y desde ahí se ejecutan los prompts. Mañana alguien lo forkea y suma sus conocimientos. Un conocimiento traído de otro repositorio que apunta a lo que no viaja queda incompleto (folio 008, §1). Por eso el objeto de este informe ya no es «un documento y su hermano». Es **el conjunto**: el conocimiento de la mesa a pedido, partido si hace falta, **más las dependencias que trae**, con un lugar y una forma para cada una.

## 0. Qué revisé y con qué medio

| Pieza | Medio | Qué miré |
|---|---|---|
| Folios 001 a 008; `evidencia/ev-01` a `ev-03` | lectura | Objetivo corregido O1, O2, O2′, O3 a O5; R1 a R4; la primera ronda como antecedente |
| `<insumos>/Knowledge-Mesa-De-Expertos-A-Pedido.fork-1.15.md` | `cat -n`, `sed -n`, `awk 'NR>=a&&NR<=b' \| wc -lc` por sección; `grep -n` de cada cita a las dos dependencias del destino | Qué cláusula usa qué dependencia, y si la salida de la cláusula depende de ella |
| `<insumos>/_convenciones_comunes.md` §7.1, §7.2, §7.4 y §10 | lectura entera de esas secciones + `wc -lc` | El cierre transitivo: qué citan, a su vez, las secciones que cita el fork |
| `<insumos>/_reglas_base_conocimiento.md` §4.6, §6.3 (K1 a K7) y §8 | lectura | K6, el techo en bytes, el deber de conservar verbatim lo importado |
| `SDD/Devs/Rules/Rules-Base-Conocimiento.md` 2.2 | `sed -n` de §0.0 a §0.4, §3.2, §3.3, §4.1, §4.2, §4.4, §4.5, §6, §7 y la fila de §9.2 (`:490`) | Techos, hermanos, divulgación progresiva, qué va en §8 y en §9, equivalentes de K6 y de la precedencia |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | `sed -n 576,577p`; `sed -n 1484,1490p` | Armado de la lista de conocimiento y precedencia del conocimiento; niveles P0 a P3 |
| `README.md`, `Conocimiento/README.md`, `Conocimiento/Index-Knowledge.md` | lectura | El recorrido en frío desde la raíz; dónde se lee «cómo se agrega un documento» |
| `SDD/Devs/Rules/Mesa-Rules.md`, `Root-Rules.md` | `sed -n` de `:367-371`, `:446`, `:459`, `:574` y `:944-950` | Escala de ancla; equivalentes parciales de la reversibilidad; citas entrantes |
| Árbol del framework | `git grep -i -c` de `cadena de consecuencias`, `Cadena-De-Consecuencias`, `apartamiento de un conocimiento`, `Apartamiento-De-Un-Conocimiento` sobre `SDD Conocimiento README.md` → **0** las cuatro; `git grep -n -i 'obst[aá]culo'` → sólo `Catalogo-De-Criterios.md:195`, `:206` y una guía, en otro sentido | Colisión de alias y ausencia de equivalente para la cadena de consecuencias |

**Lectura de P0 a P3 para este caso** (`Master-Prompt.md:1486-1489`, leída para la estructura de un conjunto):
- **P0**: la estructura impide cumplir O2′ (una referencia del conjunto apunta a algo que no está en la copia) o cumple O2′ violando R1 o R3.
- **P1**: haría salir la redacción con retrabajo, con lecturas divergentes entre el redactor y las reproducciones, o con una decisión del Product Owner contradicha sin marcar.
- **P2**: una pérdida acotada de encontrabilidad o de mantenimiento.
- **P3**: claridad.

## 1. Hallazgos

| Id | Nivel | Ancla | Hallazgo | Impacto si no se corrige | Propuesta |
|---|---|---|---|---|---|
| **AI2-01** | **P0** | E2: `_convenciones_comunes.md:229-230` (la guarda de §7.4 nombra la ruta del índice del destino), `:234` (§7.4 cita §7.1), `:140-154` (§7.1 arma la lista contra el acta y los parámetros del destino), `:163-178` (§7.1, carga en tres niveles), `:483` (§10 cita la carga en tres niveles en su «De dónde sale»). E2: `Master-Prompt.md:576` (la lista del framework, sin niveles) y `Rules-Base-Conocimiento.md:490` (el orquestador inyecta «el documento entero y verbatim»). E4: O2 y O2′ del folio 008, R1 | **El cierre transitivo no tiene criterio de corte, y sin él no termina en un lugar honesto.** Si se sigue cada cita de cada dependencia, §7.4 lleva a §7.1, y §7.1 lleva al acta del destino, a su despacho en tres niveles y a sus agentes. Ese tramo es **norma de despacho de otro pipeline**: traerlo a `Conocimiento/` lo vuelve conocimiento disfrazado de regla (`Rules-Base-Conocimiento.md:289`), y traerlo a la norma viola R1. Si se corta a ojo, O2′ deja de ser medible: nadie puede decir si el cierre está completo | El redactor y las dos reproducciones cortan en lugares distintos. O el conjunto arrastra mecanismos que el framework no tiene, o queda una cita a la carga en tres niveles que no resuelve | **Criterio de corte, una pregunta por cita: ¿la salida de la cláusula que cita depende de lo citado?** Hay tres resultados. (1) **Equiparar**: existe en el árbol algo que dice lo mismo *para el uso que hace la cláusula*, verificado con línea; se cita eso por ruta desde la raíz y por sección. (2) **Traer**: no hay equivalente y la salida depende de lo citado; se trae íntegro, como documento propio del catálogo si lo usan dos o más documentos o si es una convención general, y como texto en otro caso. (3) **Describir sin apuntar**: la salida no depende (anécdota, origen, historia); se dice el mecanismo sin ruta ni nombre. La cita que queda en (3) termina el cierre por esa rama. La clasificación completa está en §2. **Una cita sólo cuenta si la usa una cláusula de lo que se trae** (folio 008, §3, O2: «lo que citan sus dependencias y se usa») |
| **AI2-02** | **P1** | E2: fork `:205` (el `BLOQUEO`, en el padre), `:377` (ficha «sin admitir»), `:471` (K-2), `:518` («Por qué así»): las cuatro citan `_convenciones_comunes.md` §10. E1: `git grep -i -c 'cadena de consecuencias'` = 0, y `obstáculo` sin ese sentido. E2: `Mesa-Rules.md:446` y `:459` (el juez de riesgo y su veto acotado) tratan la irreversibilidad **de una corrección**, no la regla «entre reversible e irreversible no hay empate». E4: `Rules-Base-Conocimiento.md:280` («Un hecho, un lugar»). E2: `Index-Knowledge.md:40` (precedente: una convención de conducta del agente, `propio`, `transversal`, catalogada) | **La cadena de consecuencias es una dependencia sin equivalente, que usan los dos documentos de la mesa y que vale fuera de ella.** El destino la declara para «todo agente que recomiende, dictamine o elija» (`_convenciones_comunes.md:435-436`). El folio 006 (AI-07) proponía definir «obstáculo» en el padre y que el hermano lo citara. **Bajo (b) eso queda corto**: se trae sólo un trozo y se reparte entre dos documentos. Quedan sin casa los cuatro pasos, «a un agente al que le deniegan una acción no se la pide a otro» (`:462-465`), «la restricción también es una opción» (`:467-472`, que §7.4 cita en `:240`) y «la cadena se corre al ejecutar» (`:474-476`) | Si se reparte, el próximo conocimiento que un fork traiga citando la cadena no encuentra alias y repite el problema de este expediente (O5). Si se trae dentro del padre, el padre suma un tercer tema (`Rules-Base-Conocimiento.md:292`) | **Un documento propio**: `Conocimiento/Knowledge-Cadena-De-Consecuencias.md`, alias `Cadena-De-Consecuencias` (0 colisiones, E1), `propio`, `transversal`, `Condicion-de-carga: —`, **1.0**. Es **hoja del grafo de citas**: no cita al padre ni al hermano, para que otro conocimiento lo pueda traer solo. El padre (fila del bloqueo de §3.1) y el hermano (ficha «sin admitir», K-2, «Por qué así») lo citan por alias y sección. **Corrige el folio 006, AI-07**, en la casa del obstáculo |
| **AI2-03** | **P1** | E2: fork `:743-746` (el Product Owner del destino «fijó este documento como lugar de la regla de apartamientos»; la alternativa rechazada era un hijo que lleve el delta). E4: `Rules-Base-Conocimiento.md:372-376` (`propio` 600; superar el techo «no se justifica: se parte»). E1: con los tamaños de §3 de este informe, el padre con §5.5 a §5.7 y la regla de §7.4 adentro queda en ≈ 600 a 620 líneas en la forma del fork, antes de sumar la cadena | **La partición que propuso la primera ronda contradice una decisión del Product Owner, y nadie la marcó.** El folio 006 trató el párrafo `:742-746` como «propio del fork» y lo sacó. Lo que sale es la premisa (el deber de conservar verbatim del destino, que en el framework no existe). **La decisión de lugar es otra cosa**: es de quien hoy pide, y cae sobre la misma materia | El conjunto se publica contra una decisión de quien pidió, sin marcar. Es el anti-patrón que el propio fork prohíbe en «Comportamiento no es restricción», en la dirección inversa: ignorar un requisito con literal | **Default: partir**, porque el techo de §6.2 no deja otra forma conforme sin juntar renglones (folio 006, AI-01; folio 003, NB-02). **Sale marcado al Product Owner** con la alternativa de cumplir: un solo archivo con la excepción de §5 declarada en §0. Esa excepción no es honesta, porque §5.5 a §5.7 se pueden partir. El costo de volver a cumplir también va: unir dos archivos bajo un alias, cambio acotado. Para honrar el sentido de la decisión, el padre sigue siendo **la puerta**: el renglón 6 de «Lo que rige siempre» y la carta de §5.2 nombran al hermano por ruta |
| **AI2-04** | **P1** | E4: `Rules-Base-Conocimiento.md:210` (§9 declara índice, hermanos, consumidor y artefacto), `:256` (§8 = lo normativo que vive en la regla). E2: fork `:606-607`, `:629-630`, `:690` (citas fijadas a líneas de un commit). E4: O2′ (folio 008, §3) | **O2′ no tiene dónde medirse.** Hoy las dependencias de un conocimiento están dispersas en su texto, y nada dice, documento por documento, cuáles son ni cómo resuelve cada una. La comprobación queda en un `grep` que alguien tiene que saber escribir | La reproducción a ciegas mide otra cosa que el redactor. Un fork que mañana traiga un conocimiento no tiene la forma que copiar | Cada uno de los tres documentos lleva en **§9 una tabla «Dependencias»**, con tres columnas: *qué cita* (por ruta desde la raíz y sección, nunca por línea), *cómo resuelve* (`en el árbol` · `equiparada` · `traída a <alias> §n`) y *ancla de la equivalencia* (la línea del equivalente, sólo para las equiparadas). §8 queda para la frontera con la norma, y su párrafo «Dónde resuelven las citas» (folio 006, §4.2) remite a esa tabla. **Compuerta O2′** sobre una copia sin historia: (a) cada `.md` citado en los tres documentos resuelve contra `git ls-files`; (b) cada alias citado tiene fila en `Index-Knowledge.md`; (c) `grep -c -E '_convenciones_comunes\|_reglas_base\|Prompts/\|\bK[0-9]\b'` = 0 en cada documento |
| **AI2-05** | **P1** | E1: ev-01 (`Mesa-Rules.md`, `Master-Prompt.md`, `Expediente-Rules.md` y `Root-Rules.md` resuelven en `SDD/Devs/…`). E2: fork `:589-593` (las copias existen porque el fork «no tiene `Mesa-Rules.md`») y `:736-737` («se retiran en la misma edición» si las incorpora). E2: `README.md:154` (autosuficiencia), `Root-Rules.md:946-949` (§14.7, destino con norma propia). E4: `Rules-Base-Conocimiento.md:280` | **El §8 del fork, el que copia `Mesa-Rules.md`, no hace falta, y la lectura (b) lo confirma.** Las copias no son una dependencia del conocimiento: son **la norma del framework vista desde un destino que no la tenía**. En una copia del framework, esa norma viaja en el mismo árbol, y la condición de retiro que el propio fork se puso (`:736-737`) se cumple. **El caso contrario lo resuelve O5 mismo**: un destino sin la norma del framework que importe este conocimiento trae, por su propio cierre, las secciones de `Mesa-Rules.md` que usa, como hizo el fork. Las copias adentro del documento invierten esa responsabilidad | Si se conservan, dos fuentes de la misma regla, ancladas a líneas de `c9b3e46` que la próxima edición desmiente. Y 149 líneas que empujan el padre sobre el techo | Se quitan las copias (`:589-737`), el bloque mínimo de §5.6 (`:438-456`) y la desviación de `:742-746`, cuya decisión de lugar sale marcada (AI2-03). **No se quita nada por no resolver**: se quita por duplicado de algo que resuelve. Las aplicaciones que el fork escribió entre las copias se mudan a su sección, con la tabla de la primera ronda (folio 006, §4.2; folio 005, MC-05) |
| **AI2-06** | **P2** | E2: `README.md:30` (describe `Conocimiento/` sin nombrar el índice), `Index-Knowledge.md:14-15` (el índice es «lo que el orquestador abre para resolver un alias»), `Master-Prompt.md:576` (se abre «antes de cada despacho»), `Mesa-Rules.md:574` (único puntero normativo al padre, y dentro del disparador 3) | **El recorrido en frío depende de que el agente explore.** Ante «hacé una mesa de expertos», fuera de una corrida del orquestador, ninguna regla le dice que abra el índice. Lo encuentra si baja de `README.md` a `Conocimiento/` y lee los `Tema`. R1 no deja agregar el puntero | El agente que entra por `Mesa-Rules.md` §0.0 aplica la mesa por condición y no carga el padre. Peor todavía con dos documentos más | **Lo resuelve el texto de las filas del índice, que R1 sí permite tocar.** El `Tema` del padre conserva las palabras del pedido («mesa de expertos», «pedido explícito»). El de los otros dos dice en qué acto se cargan («apartarse de un conocimiento que rige»; «antes de recomendar, dictaminar o elegir entre opciones»). La falta de puntero **se anota como pendiente** en la nota de coherencia, fuera de R1 |
| **AI2-07** | **P2** | E2: `Index-Knowledge.md:20-28` (§2, «Cómo se agrega un documento»), `Conocimiento/README.md:35-40` (§3, «Cómo se extiende»: forkeando), `Rules-Base-Conocimiento.md:350-365` (§6.1, la lista que «lo verifica»). E4: O5 y R1 (folio 008, §3 y §4) | **O5 necesita un lugar de lectura y un lugar de exigencia, y no son el mismo.** Quien agrega un documento lee §2 del índice. Quien lo verifica corre la lista de §6.1 de la regla. Asentar O5 dentro del conocimiento de la mesa rompería «un documento, un artefacto»: es una propiedad del catálogo, no de la mesa | Si sólo se asienta en este expediente, el próximo fork no lo lee. Si sólo se asienta en la regla, R1 lo impide | **Default**: un párrafo en `Index-Knowledge.md` §2. «Un documento traído de otro repositorio llega con sus dependencias: cada una se equipara con lo que el árbol ya dice, se trae al catálogo o se describe sin apuntar, y su §9 lo declara (tabla «Dependencias»).» Lleva la compuerta de AI2-04. **Sale marcado**, porque R1 sólo nombra «su fila» del índice. Como **pendiente al Product Owner**, un ítem `[enumerable]` en `Rules-Base-Conocimiento.md` §6.1: tocarlo es tocar la norma (folio 008, §4) |
| **AI2-08** | **P3** | E2: fork `:55-75` (mapa de 11 filas, lectura «por rango de líneas»), `:789` (la 1.14 y sus vueltas de corrección). E4: `Rules-Base-Conocimiento.md:241-242` (índice → cabecera → cuerpo) y `:490` (cuerpo entero). E2: `_reglas_base_conocimiento.md:166-169` (el techo del nivel 1, que el framework no tiene) | **En el framework, la carga progresiva de la 1.14 no es un nivel del despacho: es una guía para el presidente que arma las cartas.** El orquestador inyecta el documento entero. Quien elige qué secciones da a cada rol es el presidente | Si el mapa se lee como mecanismo de despacho, se busca un nivel 1 que no existe. Y si se suman dos documentos más sin decir quién los carga, el mapa vuelve a crecer | El padre conserva el mapa de **siete filas** (folio 006, AI-05), presentado como «qué le das a cada rol», y le suma **una columna «además»**: `Apartamiento-De-Un-Conocimiento` entero en las filas de quien propone, refutador, análisis, jurado y quien aplica; `Cadena-De-Consecuencias` entero en las de presidente, refutador, análisis y jurado. **Los otros dos no llevan mapa**: se leen enteros. La salida de la cláusula de bloqueo no depende de cargar la cadena: el renglón 5 de «Lo que rige siempre» ya la dice («sale a quien pidió en el mismo turno, en una línea») |

## 2. El cierre transitivo, clasificado con el criterio de AI2-01

| # | Cita (fork o dependencia, línea) | Lo que usa la cláusula | Equivalente en el árbol | Resultado | Dónde queda |
|---|---|---|---|---|---|
| 1 | Fork `:10`, `Compatible-con` de la regla base del destino | El campo | `Rules-Base-Conocimiento.md:230` | Equiparar | Cabecera de los tres: `Rules-Base-Conocimiento.md 2.2` |
| 2 | Fork `:224`, K6 | «Desviación» = un documento que contradice el piso y lo declara | `Rules-Base-Conocimiento.md:360` y `:100-102`, que dicen lo mismo que `_reglas_base_conocimiento.md:241` | Equiparar | §0 del hermano: la tríada de términos (folio 006, AI-03) con estas anclas. K6 no se nombra |
| 3 | Fork `:430`, §7.2 de las convenciones («rama de la regla») | Sólo «frente a una regla manda la regla» | `Master-Prompt.md:577` y `Rules-Base-Conocimiento.md:100-102`; para el ADR, `Root-Rules.md` §13 | Equiparar. La última oración de §7.2 (desviación en materia sin regla) **no la usa** el fork | §5 del hermano, rama de la regla |
| 4 | Fork `:205`, `:377`, §10 (obstáculo) | La salida: pregunta de una línea, en el momento, a quien tiene la llave | Ninguno (E1) | **Traer** | `Cadena-De-Consecuencias` §3 |
| 5 | Fork `:471`, `:518`, §10 paso 4 (reversible frente a irreversible) | «No hay empate: se toma la reversible y se anota la condición para revisarla» | Parcial y contiguo: `Mesa-Rules.md:446`, `:459` | **Traer** | `Cadena-De-Consecuencias` §2 y §4 |
| 6 | §7.4 `:240` → §10 «la restricción también es una opción» (transitiva) | Proponer cambiar una convención no es tocarla | Ninguno | **Traer** | `Cadena-De-Consecuencias` §3. El hermano lo cita en su filtro «¿Contradicción o conveniencia?» |
| 7 | Fork `:373`, `:461`, `:494`, §7.4 entera | La regla general del apartamiento: precedente no es regla, contradicción y no conveniencia, cuatro pasos, defaults por rama, «cumplir no es default» | Ninguno | **Traer íntegra** | Hermano §3 (regla) y §4 (defaults). La guarda «si el índice existe y tiene filas» se cumple por construcción: el hermano sólo se carga si hay catálogo |
| 8 | §7.4 `:234` → §7.1 (transitiva): «la lista de documentos aplicables» | Qué documentos rigen el objeto | `Master-Prompt.md:576` (la lista del framework) y, para la mesa, el barrido de §3.4 del padre | Equiparar | Hermano §3, con remisión a padre §3.4 |
| 9 | §10 `:483` → §7.1, carga en tres niveles (transitiva) | Nada: es la anécdota de «De dónde sale» | — | **Describir sin apuntar** | `Cadena-De-Consecuencias` §7, como mecanismo («el techo no era la palanca del contexto: lo era lo que se despacha»), sin ruta ni número de expediente |
| 10 | §7.1 `:140-154` → acta, parámetros y agentes del destino (transitiva) | Ninguna cláusula traída la usa | — | Fuera del cierre: el criterio corta acá | Se anota en la nota de coherencia, §3 |
| 11 | Fork `:788` y `_reglas_base_conocimiento.md:164-197`, techo en bytes y nivel 1 | Historia | `Rules-Base-Conocimiento.md:367-378` rige | Describir sin apuntar | Fila 2.0 de §10 del padre, en una cláusula |
| 12 | Fork `:743-746`, deber de conservar verbatim (`_reglas_base_conocimiento.md:313-315`) | La premisa de una desviación | No aplica: acá el documento es la fuente | Sale la premisa. **La decisión de lugar sale marcada** (AI2-03) | — |
| 13 | Fork `:280-281`, ruta del índice del destino | El comando del barrido | `Conocimiento/Index-Knowledge.md` | Equiparar, con la ruta como parámetro (folio 005, MC-08) | Padre §5.1 |
| 14 | Fork `:236-240`, `:757-769`, rutas de expedientes y bitácoras del destino | Origen de los filtros y de las versiones | — | Describir sin apuntar (folio 005, MC-04; folio 007, RO-08) | Padre §3.3 (casos con su mecanismo), §9 «Origen» → este expediente |
| 15 | `Mesa-Rules.md`, `Master-Prompt.md`, `Expediente-Rules.md`, `Root-Rules.md`, `Deriva-Rules.md`, notas `Coherencia-*` | Lo que citan | Resuelven (ev-01) | En el árbol | Ruta desde la raíz en la primera mención y cita por sección, nunca por línea |

**Lo que el cierre agrega en total**: un documento nuevo, la cadena, unas 53 líneas de origen (`_convenciones_comunes.md:433-485`, 4 059 B), y la regla de §7.4, unas 57 líneas (`:227-283`, 5 103 B), absorbida por el hermano. Todo lo demás se equipara o se describe. Ninguna pieza del cierre exige tocar una regla, un orquestador o una plantilla: **R1 se sostiene**, salvo el lugar de O5 (AI2-07).

## 3. Dos alternativas de estructura del conjunto

Las líneas están estimadas en la forma del fork: una fila de tabla es una línea, porque no se parte, y la prosa va a unas 110 columnas. Al lado va el tamaño en KB, para que no se lea como cumplimiento por renglones largos (folio 006, AI-01). Techos: `propio` 600, `canonico` 250 (`Rules-Base-Conocimiento.md:371-372`).

### Alt-1 — Dos documentos, con las dependencias embebidas

```
Conocimiento/
├── Index-Knowledge.md                              1.6 → 1.7 (fila del padre + 1 fila)
├── Knowledge-Mesa-De-Expertos-A-Pedido.md          2.0   ≈ 480–510 líneas, ≈ 64 KB
└── Knowledge-Apartamiento-De-Un-Conocimiento.md    1.0   ≈ 330–355 líneas, ≈ 33 KB
SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md   1.0 → 1.1
```

| Documento | Dónde caen las dependencias traídas |
|---|---|
| Padre | §3.1, fila del bloqueo: el obstáculo y «no se le pide a otro agente». §3.3, fila nueva «Cadena de consecuencias»: los cuatro pasos y «la cadena se corre al ejecutar» (+30 a 35 líneas sobre el padre de Alt-2) |
| Hermano | §3: la regla de §7.4 y «la restricción también es una opción». §5, K-2: la reversibilidad, citando el paso 4 en la fila del padre |

Ventaja: dos archivos, una fila nueva en el índice, recorrido de dos saltos. Costo: la cadena queda **repartida** entre dos documentos y no tiene alias, contra «un hecho, un lugar» (`Rules-Base-Conocimiento.md:280`) y contra O5 (AI2-02). El padre suma un tercer tema (`:292`) y queda a menos de 100 líneas del techo. El hermano depende del padre para una regla que no es de la mesa.

### Alt-2 — Padre, hermano de apartamientos y la cadena como documento propio (elegida)

```
Conocimiento/
├── Index-Knowledge.md                              1.6 → 1.7 (fila del padre + 2 filas; §2 + un párrafo, marcado)
├── Knowledge-Mesa-De-Expertos-A-Pedido.md          2.0   ≈ 440–480 líneas, ≈ 58 KB
├── Knowledge-Apartamiento-De-Un-Conocimiento.md    1.0   ≈ 320–345 líneas, ≈ 32 KB
└── Knowledge-Cadena-De-Consecuencias.md            1.0   ≈ 140–160 líneas, ≈ 11 KB
SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md   1.0 → 1.1, con «Pendientes de la norma»
CHANGELOG.md [13.22]; _legacy/13.21/ (ya hecho)
```

**Grafo de citas**: padre → hermano, cadena · hermano → padre (sólo para los roles de la mesa), cadena · cadena → nada. La cadena es hoja, y el par padre–hermano se declara en el §9 de los dos.

**Padre** — `Mesa-De-Expertos-A-Pedido`, `propio`, `transversal`, `—`, **2.0**. Conserva archivo, alias y numeración por las citas entrantes (folio 006, AI-04).

| Sección | Contenido | Líneas |
|---|---|---|
| Cabecera | Once campos; `Compatible-con: Rules-Base-Conocimiento.md 2.2` | 15 |
| §0 | Propósito; «Lo que rige siempre», 5 renglones verbatim más el sexto, que nombra al hermano por ruta; qué queda afuera, sin las ramas «en un fork»; mapa de 7 filas con la columna «además» (AI2-08); unidad y respaldo | 50–55 |
| §1 | Identidad; el supuesto de la evidencia, condicional (folio 005, MC-07) | 17 |
| §2 | 2.1 ciclo, pasos 1 a 10 sin renumerar, 6 bis en una línea que remite al hermano; 2.2 con su subsección sin número; 2.3 expediente y ciclo de vida de la evidencia | 90 |
| §3 | 3.1, con la fila del bloqueo citando `Cadena-De-Consecuencias` §3; 3.2; 3.3 con los casos reescritos sin nombres y la fila «Origen del hecho» con su salida entera (folio 005, MC-01); 3.4. «¿Contradicción o conveniencia?» se muda al hermano | 58–62 |
| §4 | Decisiones; criterio de corte aplicado a la mesa a pedido | 12 |
| §5 | 5.1 a 5.4; la carta de §5.2 nombra a los otros dos documentos y remite la escala a `SDD/Devs/Rules/Mesa-Rules.md` §6.1 | 92 |
| §6 / §7 | Sin los criterios ni los anti-patrones del apartamiento | 22 / 20 |
| §8 | Los tres párrafos de la 1.2, la extensión del contrato (fork `:739-740`) y «Dónde resuelven las citas», que remite a §9 | 22–25 |
| §9 | Índice, hermanos (los dos), consumidor, origen → este expediente; tabla «Dependencias» (AI2-04), unas 8 filas | 22 |
| §10 | 1.0 a 1.2 verbatim, más la fila 2.0 | 7 |
| **Total** | | **≈ 440–480** |

**Hermano** — `Apartamiento-De-Un-Conocimiento`, `propio`, `transversal`, `—`, `Hereda-de: —`, **1.0**.

| Sección | Contenido | Líneas |
|---|---|---|
| Cabecera | Once campos | 15 |
| §0 | Qué es; cuándo se carga; qué queda afuera: la tríada apartamiento de un conocimiento · apartamiento declarado (`Root-Rules.md` §11) · desviación (`Rules-Base-Conocimiento.md` §0.4), más la deriva (`Deriva-Rules.md`); la mesa vive en el padre | 25 |
| §1 | Roles: quien propone, refutador, análisis de decisiones, jurado, quien pidió | 12 |
| §2 | Ciclo: ficha → refutación → análisis → veredicto → cierre | 20 |
| §3 | **La regla general traída de §7.4**: precedente no es regla; contradicción, no conveniencia; los cuatro pasos (aquí en enunciado, con el detalle en §5.3); el filtro «¿Contradicción o conveniencia?» con su caso sin nombres; terminología | 40–48 |
| §4 | Los defaults por rama, verbatim en su lógica: regla, imposibilidad sin medir, reversible, no reversible; «cumplir no es default»; no se asienta por silencio; un apartamiento no se autocorrige | 14 |
| §5 | 5.1 ficha; 5.2 cierre «Apartamientos de conocimientos» y la cuenta de folios; 5.3 análisis del camino de compromiso (K-2 cita `Cadena-De-Consecuencias` §2, paso 4) | 150 |
| §6 / §7 | Criterios / anti-patrones | 8 / 8 |
| §8 | Consultivo: manda la regla (`Master-Prompt.md` §6; `Rules-Base-Conocimiento.md` §0.4); no redefine `Root-Rules.md` §11; no vuelve vinculante a ningún otro conocimiento (folio 007, RO-01) | 12 |
| §9 / §10 | Hermano: el padre; Dependencias; Origen → este expediente / 1.0 | 15 / 4 |
| **Total** | | **≈ 320–345** |

**Cadena** — `Cadena-De-Consecuencias`, `propio`, `transversal`, `—`, **1.0**.

| Sección | Contenido | Líneas |
|---|---|---|
| Cabecera | Once campos | 15 |
| §0 | Qué es: cómo se razona antes de recomendar, dictaminar o elegir; qué queda afuera: la escalada (`Mesa-Rules.md` §7; `Master-Prompt.md` §8.1) y la precedencia (`Master-Prompt.md` §6) | 18 |
| §1 | Identidad: forma de razonar, no formato; vale para cualquier rol que recomiende | 10 |
| §2 | Los cuatro pasos: dónde cae, cuánto pesa ahí (medido con comando), qué pierde la alternativa, si es reversible | 15 |
| §3 | Un obstáculo no es una decisión; una acción denegada no se le pide a otro agente; la restricción también es una opción; la cadena se corre al ejecutar | 25 |
| §4 | Reversible frente a irreversible: no hay empate. Bezos, «tipo 1» y «tipo 2» | 6 |
| §5 | Esqueleto de una cadena en un folio: opción · dónde cae · cuánto pesa (comando y salida) · qué pierde la otra · reversible | 12 |
| §6 / §7 | Criterios / anti-patrones, con el caso de «De dónde sale» descripto sin apuntar (fila 9 de §2) | 6 / 10 |
| §8 / §9 / §10 | Frontera / Dependencias: ninguna fuera del árbol / 1.0 | 10 / 10 / 4 |
| **Total** | | **≈ 140–160** |

## 4. Elección: Alt-2, y por qué

1. **Cumple O2′ con un lugar para cada dependencia.** Lo traído tiene alias y fila, y lo equiparado tiene ancla con línea en la tabla «Dependencias». La compuerta de AI2-04 se corre sobre los tres archivos sin interpretar nada.
2. **Cumple O5 por forma, no por promesa.** El próximo conocimiento que un fork traiga citando la cadena o el apartamiento resuelve por alias en vez de repetir este expediente. Alt-1 lo obliga a reabrir el padre.
3. **Un hecho, un lugar, y un tema por documento** (`Rules-Base-Conocimiento.md:276`, `:280`). Cada regla traída queda en un solo documento, y los otros la citan.
4. **Margen bajo los techos**: unas 120 a 160 líneas en el padre, unas 255 en el hermano y unas 440 en la cadena. Al ritmo del fork, unas 37 líneas por versión (folio 006, §2), son tres o cuatro versiones de margen en el padre.
5. **Es reversible.** La cadena no tiene citas entrantes de reglas, y se puede volver a meter en el hermano con un cambio acotado. Partir más tarde un padre que la contiene obliga a repasar cada remisión.
6. **Mantiene la carpeta vaciable** (`Conocimiento/README.md:27-31`). Los tres documentos se cargan sólo por cita (`—`), y ninguna regla nombra a los dos nuevos.

Costo declarado: un documento más que en Alt-1, una fila más en el índice y unas 75 líneas de cabecera, §0, §8 a §10 que no son materia. Además, el padre gana un tercer destino de remisión, que AI2-08 encauza con la columna «además».

## 5. Respuestas a las preguntas del foco

### 5.1 Cómo llega en frío un agente y encuentra lo que rige

| Paso | Qué abre | Qué encuentra |
|---|---|---|
| 1 | `README.md:30` | `Conocimiento/` como catálogo de oficio, vaciable y extensible por fork |
| 2 | `Conocimiento/Index-Knowledge.md` §3 | Tres filas `transversal` sin condición. Elige por `Tema` (AI2-06): «mesa de expertos convocada por un pedido explícito» |
| 3 | Cabecera y §0 del padre | «Lo que rige siempre» (6 renglones, cada uno con su salida en el renglón) y el mapa de 7 filas con la columna «además» |
| 4 | Las secciones de su fila, enteras (unidad y respaldo del fork, `:58-59`) | Lo que necesita su acto |
| 5 | Si su fila lo da: el hermano o la cadena, enteros | La regla general del apartamiento; la cadena de consecuencias |
| 6 | Las reglas, por ruta desde la raíz | `SDD/Devs/Rules/Mesa-Rules.md`, `Expediente-Rules.md`, `Root-Rules.md`, `SDD/Devs/Orchestrator/Master-Prompt.md`: en el mismo árbol |

Una comisión no hace este recorrido: su carta (§5.2 del padre) le lleva la escala por remisión, la lectura P0 a P3 del caso y las rutas de los otros dos documentos. El único tramo que el árbol no garantiza es el paso 1→2 fuera de una corrida del orquestador (AI2-06).

### 5.2 ¿El §8 del fork que copia `Mesa-Rules.md` sigue haciendo falta?

No (AI2-05). Las copias son la norma del framework copiada para un destino que no la tenía. En una copia del framework, esa norma viaja en el mismo árbol. Para el destino que no la tenga, la obligación de traerla es la misma que O5 le pone a este expediente: quien importa trae lo que usa. Lo que se conserva de §8 son **las aplicaciones** que el fork escribió entre las copias, cada una en su sección (folio 006, §4.2), y el párrafo de extensión del contrato (`:739-740`).

### 5.3 Qué se condensa sin perder la salida de una cláusula

| Pieza | Se condensa así | La salida que no se pierde |
|---|---|---|
| Casos de «De dónde sale» en §3.3 | Mecanismo sin nombres ni rutas (folio 005, MC-04) | «La primera salida es igualar la columna que cambia»; `git log -S` antes de tratar una línea como invariante; lo que acepta un receptor no fija lo que manda un emisor |
| Mapa de carga | 11 filas a 7, más la columna «además» | Respaldo (una remisión del propio acto se carga y se declara) y unidad (la sección entera) |
| §7.4 traída al hermano | §3 la enuncia, §5.3 lleva el detalle de los cuatro pasos: no se dice dos veces | **Las cuatro ramas del default, sin condensar**: cada rama es una salida distinta. Y «cumplir no es default ante una imposibilidad» |
| §10 traída a la cadena | «De dónde sale» en una o dos oraciones, sin expediente ni cifras del destino | «Pregunta de una línea, en el momento, a quien tiene la llave»; «se toma la reversible y se anota la condición para revisarla» |
| Copias de §8 | Remisión por sección | La regla misma, que viaja en el árbol |
| «Origen del hecho antes de escalar» | Sin el paréntesis «en un fork sin esa regla» | «Sólo sale si la autocorrección no alcanza y la salida declara por qué»; «un apartamiento sale siempre» (la lección de la 1.6) |
| No se condensa | — | Los renglones 1 a 5 de «Lo que rige siempre», `SI NO RESPONDÉS`, «no se asienta por silencio», la cuenta de folios del paso 10 |

## 6. Lo que revisé y está bien

- **Las equivalencias de las filas 1, 2, 3, 8 y 13 de §2 dicen lo mismo para el uso que hace la cláusula**, con línea. K6 (`_reglas_base_conocimiento.md:241`) y `Rules-Base-Conocimiento.md:360` piden lo mismo: sustitución sobre un ítem rotulado, o desviación declarada. La precedencia que usa la rama de la regla es la primera oración de §7.2, y `Master-Prompt.md:577` la repite.
- **Ningún alias propuesto colisiona** (E1, §0). En particular, «apartamiento de un conocimiento» da 0 frente al «apartamiento declarado» de `Root-Rules.md` §11.
- **El folio 006 sigue valiendo** en AI-01 (partir), AI-03 (alias del hermano), AI-04 (el padre conserva archivo, alias y numeración), AI-05 (mapa de 7 filas), AI-06 (las cuatro vías al hermano) y AI-08 (padre 2.0, hermano 1.0). Esta ronda corrige AI-07 (la casa del obstáculo, AI2-02) y la omisión de la decisión de lugar (AI2-03).

## 7. Solicitudes de convocatoria

- **Portabilidad y cierre de dependencias**: verificar mi clasificación de §2 fila por fila, en particular la fila 10 (el criterio corta en §7.1) y la 3 (la última oración de §7.2 no se usa). Si encuentra una cláusula traída cuya salida dependa de algo que clasifiqué como «describir», el cierre crece y Alt-2 tiene que absorberlo.
- **Normativa de la base de conocimiento**: el lugar de O5 (AI2-07) y si una dependencia traída como documento propio declara a su importador como hermano en §9 o sólo en la tabla «Dependencias».
- **Refutador del objetivo corregido**: el costo de Alt-2 frente a Alt-1 para quien llega en frío (tres archivos en lugar de dos).

## 8. Lo que sale marcado al Product Owner, y agregados

| # | Qué | Default | Por qué sale |
|---|---|---|---|
| M-1 | La partición contradice la decisión del Product Owner de que este documento sea el lugar de la regla de apartamientos (fork `:745`) | Partir. El padre queda como puerta, y la alternativa de cumplir y su costo van a la vista (AI2-03) | Es una decisión de quien pide, sobre la misma materia |
| M-2 | Un párrafo de O5 en `Index-Knowledge.md` §2 | Se escribe (AI2-07) | R1 sólo nombra «su fila» del índice |
| M-3 | Un ítem `[enumerable]` de O5 en `Rules-Base-Conocimiento.md` §6.1 | **No** se escribe. Queda como pendiente en la nota de coherencia | Toca la norma (folio 008, §4) |
| M-4 | La falta de puntero hacia el índice ante un pedido fuera del orquestador | Pendiente en la nota de coherencia (AI2-06) | Resolverlo toca una regla |

**Agregados** (no salen del pedido; los funda este informe): el alias y el documento `Cadena-De-Consecuencias` (AI2-02); la tabla «Dependencias» en §9 (AI2-04); la columna «además» del mapa (AI2-08).
