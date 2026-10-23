| Campo | Valor |
|---|---|
| Tipo | resolucion |
| Fecha | 2026-10-23 |
| Autor | Jurado de la mesa |
| Corrige | — |
| Reintegra | ninguna: el expediente cambia el framework y su base de conocimiento, no la especificación de un producto (`Root-Rules.md` §14 no aplica) |

# Consolidación de las dos rondas, estructura elegida y plan de redacción

**Base del jurado.** Leí los folios 001 a 012 y las evidencias ev-01 a ev-03. Comprobé en el worktree (rama del expediente sobre `c9b3e46`, 13.21) y en `<insumos>` lo que sostiene esta resolución. Lo que medí yo va con **J**; lo que tomo de un informe sin repetir la medida va con su id.

| Qué | Medio | Resultado |
|---|---|---|
| Tamaño del fork por sección | `awk 'NR>=a&&NR<=b' <fork> \| wc -lc` | §0 60 l · §1 18 · §2 93 · §3 64 (243 B/l) · §4 13 · §5.1-§5.4 89 · **§5.5-§5.7 168** · §6 28 · §7 23 · §8 175 (copias L589-L737: 149) · §9 23 · §10 20 |
| Líneas del fork si la prosa se reenvuelve a 100 columnas y cada fila de tabla queda en una línea | `awk` por sección (prosa `⌈largo/100⌉`, tabla y código 1) | Lo que va al padre (§0 a §5.4, §6, §7, marco de §8): **≈ 560**. §5.5 a §5.7: **≈ 235** |
| Densidad del catálogo | `wc -lc Conocimiento/Knowledge-*.md` | 48,9 a 89,7 B/l. La del fork es 155 B/l porque la prosa no está envuelta y las tablas de §3 llevan filas de 1,6 KB |
| `_convenciones_comunes.md` del destino | `grep -n '^#'` y `sed -n` | §7.4 en `:227-284`; §10 en `:433-485` (53 líneas). §10 alcanza a «todo agente», nombra un identificador de agente del destino y cierra con «De dónde sale» (`:478-484`), que remite a la carga en tres niveles de §7.1 (`:163-178`) |
| Colisión de los alias y del prefijo de la ficha | `git grep -i -c -E '<patrón>' -- SDD Conocimiento README.md \| wc -l` | `excepci[oó]n a un conocimiento` 0 · `Excepcion-A-Un-Conocimiento` 0 · `Cadena-De-Consecuencias` 0 · `cadena de consecuencias` 0 · `XC-[0-9]` 0 |
| «Apartamiento» en la norma | `Mesa-Rules.md:244` | El campo `restricciones_duras` del contrato de entrada (§4) lleva «apartamientos vigentes», con origen en el ADR de `Root-Rules.md` §11 |
| Fuerza dentro de una mesa | `Mesa-Rules.md:245`, `:249-251` (§4) | `decisiones_cerradas`: «sólo se reabre si un hallazgo con ancla E1 o E2 demuestra que es contradictoria» |
| «Desvío» | `Mesa-Rules.md:384-387` (§6.1); `Deriva-Rules.md:151-158` (§3) | §6.1 usa «desvío» para el código que se aparta de una decisión cerrada: dice lo mismo que el término del destino. La deriva de `Deriva-Rules.md` §3 compara la maqueta con el sistema construido: es otra cosa |
| Precedencia | `Master-Prompt.md:576-577` (§6); `Rules-Base-Conocimiento.md:98-103` (§0.4); `Root-Rules.md` §13 (`:772`) | Consultivo; ante conflicto manda la regla, salvo desviación justificada; entre reglas, §13 |
| Lo que hoy no resuelve en `Conocimiento/` | `git ls-files \| grep -i relevar` | Vacío: `Index-Knowledge.md:22` remite a `Relevar-Conocimiento.md`, que no existe |
| Foliatura de una ficha derivada | `Expediente-Rules.md` §6, A3 (`:365-366`) | El bucle exige `NNN` contiguos, uno por archivo. Una ficha `NNN-informe-<slug>-apartamiento-<n>.md` que comparte el número de su comisión (fork L155, L600-L601) **da `SALTO`** |
| Forma del expediente 0004 | `ls`; `head -3 evidencia/ev-01*` | Falta `README.md` (carátula, A2). Las tres evidencias abren con una sola de las líneas que pide A9 |
| Citas entrantes al padre | `git grep -n Mesa-De-Expertos-A-Pedido -- SDD Conocimiento` | `Mesa-Rules.md:574` (§3.1), `Root-Rules.md:948` (§2.1, pasos 9 y 10), `Knowledge-Entorno-De-Ejecucion-Del-Agente.md:46`, `:145`, `:264` (§3.1) |

**Rendimiento.** Ocho informes, 64 hallazgos (8 por comisión). La mayoría procede tal como vino o con la dirección que les corrige esta resolución. Los que la corrección del objetivo anula están en §2, y los que no proceden, en §10. Las dos rondas salen de la corrección del objetivo (folio 008), no del rendimiento.

## 1. La premisa, asentada como criterio

El Product Owner pidió que la mesa sea consciente de algo, y esta resolución lo toma así. `IA.SDD` se descarga en un workspace limpio y desde ahí se ejecutan los prompts. Mañana otro lo forkea y suma sus propios conocimientos. Un conocimiento traído de otro repositorio que apunta a lo que no viaja queda incompleto. De eso salen cuatro criterios que gobiernan todo lo que sigue:

1. **Resolver** (O2′). En una copia sin historia, toda referencia de los documentos que entran resuelve dentro de la copia.
2. **Llegar** (RC-06). Un agente que carga sólo el alias llega a cada dependencia que su acto necesita. No alcanza con que el archivo esté en la copia: tiene que estar en el camino de carga.
3. **No quitar** (O1, O2). Cada referencia que no resuelve tiene uno de cuatro destinos: un equivalente verificado con línea, lo citado traído al árbol, la norma del framework que manda en su lugar (con su ancla), o una descripción de su origen sin apuntar. Ninguna se borra sin uno de ellos.
4. **Valer para cualquier fork** (O5). La propiedad queda escrita donde la lee y la verifica el próximo que importe un conocimiento, no sólo en este expediente.

**Unidad del cierre.** Es la **sección citada**, seguida de forma transitiva sólo por lo que **usa una cláusula de lo que se trae**. Convergen en esto NB2-01, AI2-01 y RC-01, y es la letra de 008 («lo que citan sus dependencias y se usa»). El corte es una pregunta por cita: ¿la salida de la cláusula depende de lo citado? Si no depende, la cita es trazabilidad y termina ahí esa rama. Con esa unidad, entran **unas 57 líneas de sustancia que no están ni en el árbol ni en el fork**: §10 del destino (53) y cuatro de definiciones. Las 57 de §7.4 del destino ya estaban escritas en el fork. Por archivo serían 1.717 líneas, y el cierre no convergería (RC-01).

## 2. Lo que la corrección del objetivo anula de la primera ronda

| Hallazgo (folio) | Lo que decía bajo la lectura (a) | Por qué cae | Lo reemplaza |
|---|---|---|---|
| NB-01 (003), MC-05 último párrafo (005), §4.2 de 006 | La desviación de fork L742-L746 «se quita, no se traduce» | 008, O2: nada se quita por no resolver | D-05: su premisa no se trae, su contenido entra como condicional general y su origen se describe |
| MC-02 (005) | Traer el obstáculo y la reversibilidad «en una o dos oraciones», sin sumar archivos | 008, O1: el conocimiento íntegro. §10 del destino mide que condensar le cuesta la habilidad (`:447-449`) | D-13: §10 entra íntegro como documento propio |
| AI-07 (006) | «Obstáculo» definido una vez en el padre, y el hermano lo cita | Deja sin casa cinco de las siete cláusulas de §10 (AI2-02) | `Cadena-De-Consecuencias` |
| NB-06 (003), dirección | §7.4 traído al texto «sin citarlo», bajo la lectura (a) | La forma cambia | D-09: va íntegro al hermano. **Sobrevive** el alcance acotado |
| RO-07 (007) | «Se descarta (b)» | Lo decidió el Product Owner en 008 | Su tabla de re-anclaje sobrevive como la mitad E del cierre |
| RO-04 (007), alternativa | Un hermano en *Especializar* que lleve las copias de §8 | Las copias tienen equivalente en el árbol (AI2-05, NB2-08) | D-24: cita por sección, después del `diff` foliado |
| NB-05 (003), AI-02 (006), fundamento | Las copias de §8 «sobran» | Bajo (b) no se quita por sobrar | El resultado es el mismo con otro fundamento: equivalente verificado con `diff` (NB2-08) |
| NB-03 (003), «los cinco renglones van al §0 de (b)» | Un tercer documento, el enunciado del problema | No lo anula 008, pero no procede: §4, C-1 | — |

## 3. Lo que sobrevive

| Tema | Hallazgos que convergen | Queda así |
|---|---|---|
| Partir: un solo archivo no entra bajo 600 sin juntar renglones o recortar | NB-02, AI-01, RC-05, AI2-03; **J** (≈ 560 + ≈ 235 reenvueltas) | Se parte. La medida es en líneas con la prosa envuelta, no en densidad (§4, C-9) |
| El padre conserva archivo, alias, §2.1 (pasos 1 a 10, con el 6 bis sin renumerar) y §3.1 | NB-04, AI-04, RO-04, RC-08 | Fijo. Lo comprueba la prueba (§7, paso 6) |
| Padre 2.0; los nuevos en 1.0; una sola fila de versión nueva | NB-07, AI-08, RO-05, RC-08 | §10 del padre: 1.0 a 1.2 verbatim y la fila 2.0 |
| `Compatible-con` con la norma anfitriona | NB-01 (en esto), D-01, NB2-07 | `Rules-Base-Conocimiento.md 2.3`, o 2.2 si M-1 se rechaza |
| La fila «Origen del hecho» con su salida entera | MC-01 | Corrige un defecto vigente de la 1.2 |
| Los casos de «De dónde sale» con su mecanismo y sus cifras, sin nombres; el barrido de ofuscación ampliado | MC-04, RO-08, H-05 | Ver §5, T1, y la prueba (§7, paso 5) |
| Las aplicaciones escritas entre las copias de §8 se mudan a su sección | MC-05, AI-02, tabla de §4.2 de 006 | Ver T1 y T2 |
| Los cinco renglones de §0, verbatim; el mapa de carga reducido a 7 filas | MC-06, AI-05, AI2-08 | Encabezado nuevo (C-10) y columna «además» |
| El supuesto de la evidencia, condicional; el folio autosuficiente y el barrido, incondicionales | MC-07 | Padre §1 y §2.3 |
| Las anclas del destino dentro de cláusulas generales | MC-08, H-08 | Ruta del índice como parámetro; ejemplo de estándar neutro; «los dos fijos son del método» |
| El conocimiento es consultivo | RO-01, PC-01 (C-1), NB2-03, RC-03 | La fuerza dentro de una mesa la pone `decisiones_cerradas` |
| El `Tema` sin la extensión a encargos sin mesa | RO-03, RC-08 | C-10 |
| O4 mide sobre este mismo expediente cada criterio `[enumerable]` | RO-06 | §7, paso 8 |
| El hermano se alcanza por cuatro vías | AI-06, RC-06 | Índice, renglón 6 de §0, carta de §5.2 y §9 |
| §2.2.1, única subsección de §2.2, va sin número | RO-04, `Rules-Base-Conocimiento.md` §6.1 | T1 |
| Las anclas del framework sin hash | PC-03 | Versión de la regla y § o `_legacy/13.21/<ruta>:<a-b>` |
| K6 y toda cita «`<regla>.md` §n» se cotejan por contenido | PC-04, NB2-02, RC-04 | D-02, D-03, D-29 |

## 4. Contradicciones y su resolución

| # | Qué se contradice | Posiciones | Resolución y fundamento |
|---|---|---|---|
| C-1 | **Cuántos documentos** | Cuatro, con un documento del enunciado del problema (NB-03, NB2-04). Tres: padre, hermano de la excepción y cadena (AI2-02, Alt-2). Dos: el padre y un hermano que junta todas las dependencias traídas (RC-05, 012) | **Tres.** El enunciado es el paso 1 de toda mesa: si sale a otro archivo, se duplica o toda mesa carga dos documentos (`Rules-Base-Conocimiento.md:280`). Además, ningún mecanismo lo cargaría solo en un encargo sin mesa (RO-03; 006, Alt-C). El hermano único de 012 junta dos temas: cómo apartarse de un conocimiento y cómo razonar antes de recomendar. Eso rompe «un documento, un artefacto» (`:276`), y la cadena vale fuera de la mesa (AI2-02). **J**: aun con §5.5 a §5.7 afuera, el padre reenvuelto queda cerca de 560. Si también entrara la cadena, pasaría 600 |
| C-2 | **Dónde vive §10 del destino** | En el hermano del encargo si se parte, en §3 si no (PC-02). Documento propio (NB2-04 (d), AI2-02). Dentro del hermano común (012) | **Documento propio, hoja del grafo de citas.** La citan el padre y la excepción (fork L205, L377, L471, L518). Un hecho, un lugar. Como hoja, un fork puede traerla sola, y eso es O5 por forma |
| C-3 | **El término** | «Apartamiento de un conocimiento» (MC-03, AI-03, AI2-02, que no colisiona como alias). Un término sin «apartamiento» (RO-02, NB2-04, RC-04) | **«Excepción a un conocimiento»**, alias `Excepcion-A-Un-Conocimiento`, ficha `XC-<n>`. Decide el E2 de RC-04, medido por **J**: `Mesa-Rules.md:244` carga los «apartamientos vigentes» como `restricciones_duras`. Una ficha con Estado `rige` que se llame apartamiento puede entrar ahí, y eso vuelve no negociable una excepción a un documento consultivo. El calificativo protege al lector humano, no a la búsqueda. §0 del hermano declara que en su origen se llamaba «apartamiento». Sale como aviso, M-4 |
| C-4 | **§7.4 del destino** | Traerla íntegra al hermano (AI2-01, fila 7). Cerrarla en el documento de excepción, porque el fork ya la reescribe (NB2-03). Traer el contenido sin la guarda (RC-03). Que la fuerza sea X (PC-01) | **Las cuatro se componen.** El contenido entra al hermano y en un solo lugar: §3 enuncia la regla, §4 da los defaults y §5 los detalla, sin decirlo dos veces. Cada cláusula de `:227-284` se coteja con su línea del hermano en una tabla de la nota, y una cláusula sin línea es falla. **La guarda no se trae**: en el framework siempre estaría encendida (RC-03) y rompería `Rules-Base-Conocimiento.md:31-34` y `:65-71`. El alcance queda acotado a quien aplica el hermano. La fuerza dentro de una mesa va por `decisiones_cerradas` (NB2-03): el presidente lista ahí el barrido de §3.4. «Aprobó» es un campo de la ficha (C-1 de PC-01). Volverla general fuera de una mesa queda pendiente (P-1) |
| C-5 | **La desviación de fork L742-L746** | Quitarla (003, 005, 006). Pasarla a origen (H-01, NB2-02). Reescribirla como condicional general (RC-07 iii). Marcar la decisión de lugar (AI2-03) | **Las tres últimas, juntas.** La premisa, el deber del destino de conservar verbatim lo importado, no se trae (D-05). El contenido entra en §8 del padre como condicional para cualquier fork: «en un fork cuya norma mande conservar verbatim lo importado, editar este documento es desviación; la alternativa es un hijo con el delta». El origen se describe en §9. La decisión del Product Owner del destino de que este documento fuera el lugar de la regla sale marcada (M-3) |
| C-6 | **Dónde se asienta O5** | En la nota y en un criterio del §6 del documento, con la regla marcada (PC-07). En `Rules-Base-Conocimiento.md` 2.3, aplicado y marcado (NB2-06). En un párrafo de `Index-Knowledge.md` §2, marcado, con la regla como pendiente (AI2-07) | **Regla 2.3 aplicada y marcada (M-1), más un puntero de una oración en el índice (M-2).** NB2-06 es el único que mide las cuatro alternativas. Una nota no la lee el próximo fork. Un conocimiento que gobierna la base es el anti-patrón de `:289`. El README no es verificable. Y el criterio de §6 de un solo documento no alcanza a los demás. AI2-07 tiene razón en que hay un lugar de lectura y uno de exigencia: el índice §2 **cita**, la regla **dice**. Así no hay dos lugares para el mismo hecho |
| C-7 | **La carga en tres niveles** | Traer lo que usa el mapa (RC-01, 012). Describir sin apuntar, y que el mapa sea una guía del presidente (AI2-08, H-02) | **No se trae.** **J**: el mapa del fork (L55-L75) no la usa. Dice «por rango de líneas», que en el framework es el recorrido índice → cabecera → cuerpo (`Rules-Base-Conocimiento.md:241-242`), y el orquestador inyecta el documento entero (`:490`). Que el orquestador cargue por niveles es norma de despacho: queda como pendiente (P-3) |
| C-8 | **«Desvío»** | Contiguo a «deriva», no igual (PC-05). Coincide con `Mesa-Rules.md:384-387` (RC-04) | **Coincide con `Mesa-Rules.md` §6.1 (`:384-387`)**, verificado (**J**). La «carpeta de contexto» del destino sí se define en el texto (D-18) |
| C-9 | **Cómo se mide el techo sin la trampa** | Densidad de hasta 90 B/l (NB-02). Tamaño en KB al lado de las líneas (AI2-03) | **Prosa envuelta a 110 columnas como máximo; cada fila de tabla y cada línea de código en una línea.** Una cota de densidad es inviable: las tablas extractivas que pide `:279` llevan filas largas que no se pueden partir. La prueba cuenta 0 líneas de prosa de más de 110 columnas y declara las líneas y los KB |
| C-10 | **«Lo que rige siempre» y el encargo sin mesa** | Sigue rigiendo un encargo sin mesa (fork L5, L33). Sin mecanismo de carga, el «siempre» es una promesa que nadie ejecuta (RO-03, RC-08) | Los cinco renglones entran verbatim. El encabezado pasa a «**Lo que no se omite al aplicar este documento**». El `Tema` deja de nombrar los encargos sin mesa, y §0 dice que su mecánica le sirve a un encargo sin mesa que cargue el documento. Así el contenido no se pierde y la promesa no queda sin ejecutor. Que nadie lo cargue fuera de una mesa queda pendiente (P-4) |
| C-11 | **La ficha como folio derivado** | Fork L155 y L600-L601: comparte el número de su comisión. Nadie lo resolvió (SC-3 de 005) | **J**, hallazgo propio: en el framework, A3 la rechaza (§0). **La ficha es un folio `informe` con número propio de la serie**: `NNN-informe-ficha-de-excepcion-<n>.md`, autor la comisión que la propone. Lo que el fork completaba después («Sostiene», refutación, veredicto, «Aprobó») **no se escribe sobre la ficha**, porque lo publicado no se reescribe. Lo asientan los folios que actúan y la citan por `XC-<n>`: el informe del refutador, el del análisis de decisiones, la resolución del jurado y el folio del Product Owner. El apartado de cierre da el estado vigente de cada ficha. La cuenta de rendimiento de §5.6 no cuenta las fichas. Es una equiparación con `Expediente-Rules.md` §3 y §6 (D-30), no un cambio de la sustancia |

## 5. Estructura elegida

```
Conocimiento/
├── Index-Knowledge.md                              1.6 → 1.7   catálogo de 7 a 9
├── Knowledge-Mesa-De-Expertos-A-Pedido.md          1.2 → 2.0   padre: la puerta
├── Knowledge-Excepcion-A-Un-Conocimiento.md        1.0         hermano del padre
└── Knowledge-Cadena-De-Consecuencias.md            1.0         dependencia traída, hoja
SDD/Devs/Rules/Rules-Base-Conocimiento.md           2.2 → 2.3   O5 (M-1, marcado)
SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md   1.0 → 1.1
CHANGELOG.md [13.22] (minor) · _legacy/13.21/ (ya copiado, se versiona)
```

Los tres documentos son `propio` y `transversal`, en el modo *Sumar*. Ninguno es variante de otro, así que llevan `Condicion-de-carga: —`, `Hereda-de: —` y `Sustituye: —`. **Grafo de citas**: el padre cita a la excepción y a la cadena. La excepción cita a la cadena y, sólo para los roles de la mesa, al padre. La cadena no cita a ninguno de los dos. El padre y la excepción se declaran **hermanos** en su §9. La cadena **no es hermana**, porque no sale de partir nada. Se declara en la tabla «Dependencias» de los otros dos, y su propio §9 nombra a quienes la citan como consumidores.

**Tabla «Dependencias» en el §9 de cada documento** (NB2-04, AI2-04). Es conforme, porque §9 ya admite filas además de las cuatro de `Rules-Base-Conocimiento.md:210`. Tiene una fila por referencia fuera del propio documento, con tres columnas:

| Columna | Qué lleva |
|---|---|
| Qué cita | Ruta desde la raíz y sección, nunca línea |
| Cómo resuelve | `en el árbol` · `equiparada` · `traída a <alias> §n` · `manda <regla> §n` |
| Ancla | La línea del equivalente, sólo para las equiparadas |

La compuerta de O2′ corre sobre esta tabla y sobre el texto.

## 6. Tratamiento de cada dependencia del cierre

Las clases son estas:
- **E**: equivalente verificado, con su línea. Cambia la cita, no el contenido.
- **M**: el contenido ya está escrito en el fork. Se re-apunta la cita.
- **T**: se trae al árbol, y la fila dice dónde.
- **N**: no se trae, porque manda la norma del framework. La fila da el ancla de lo que manda.
- **H**: trazabilidad. Se describe sin ruta ni hash.

Los ids D y H siguen los del folio 009 y suman los que agregaron 010, 011, 012 y este jurado.

| # | Dependencia (fork o dependencia) | Clase | Tratamiento y lugar |
|---|---|---|---|
| D-01 | Fork L10, `Compatible-con` de la regla base del destino | N | `Rules-Base-Conocimiento.md` §4.1 (`:230`), la norma anfitriona: `Compatible-con: Rules-Base-Conocimiento.md 2.3` en los tres |
| D-02 | Fork L224, K6 | E | `Rules-Base-Conocimiento.md` §0.4 (`:100-102`) y §6.1 (`:360`). K6 no se nombra (PC-04) |
| D-03 | Regla base del destino, K1 a K7 (sólo K6 está citado) | E | Tabla de la nota: K1 `:65-71`, K2 `:32-33`, K3 `:29` y `:33-34`, K4 `:183-185`, K5 `:417-419`, K6 `:98-103`, `:335-337` y `:360`, K7 `:423-429` (NB2-02). De ese archivo no entra ninguna línea |
| D-04 | Fork L768, L788-L789: techo en bytes y nivel 1 del destino | N + H | Manda `Rules-Base-Conocimiento.md` §6.2 (`:369-376`). La historia va en una cláusula de la fila 2.0 |
| D-05 | Fork L742-L746: desviación respecto del deber de conservar verbatim lo importado | N + H | La premisa no aplica: el framework es el emisor. **Entra como condicional general en §8 del padre** (C-5). El origen va en §9. La decisión de lugar sale marcada (M-3) |
| D-06 | Las convenciones del destino §7.2, última oración, y la regla base §0.4 (`:59-61`): desviación en materia sin regla, el agente se detiene | N | Contradice `Rules-Base-Conocimiento.md:100-102` (RC-02), y el fork no la usa. §8 de la excepción: «si un fork tiene una precedencia más estricta, rige la del fork en ese fork» |
| D-07 | Las convenciones del destino §1: escalera de seis niveles | N | `Root-Rules.md` §13 |
| D-08 | Fork L430, las convenciones §7.2, primera oración: «frente a una regla manda la regla» | E | `Master-Prompt.md` §6 (`:577`) y `Rules-Base-Conocimiento.md` §0.4 (`:100-102`). Para el ADR, `Root-Rules.md` §13. Excepción §4, rama de la regla |
| D-09 | Fork L373, L461, L494: las convenciones §7.4 (`:227-284`) | M + T, con la guarda en N | Excepción §3, §4 y §5. La tabla de cotejo cláusula por cláusula va en la nota. La guarda no se trae (C-4). La fuerza dentro de una mesa, por `Mesa-Rules.md` §4 (`:245`, `:249-251`) |
| D-10 | §7.4 `:233` → §7.1: «la lista de documentos aplicables» | E | `Master-Prompt.md` §6 (`:576`) y el barrido de §3.4 del padre |
| D-11 | §7.4 `:282`: «desvío» | E | `Mesa-Rules.md` §6.1 (`:384-387`) (C-8) |
| D-12 | §7.4 `:240` → §10: «la restricción también es una opción» | T | Cadena §3. La excepción la cita en «¿Contradicción o conveniencia?» |
| D-13 | Fork L205, L377, L471, L518: las convenciones §10 (`:433-485`) | **T** | **`Cadena-De-Consecuencias` 1.0, íntegro.** §2 lleva la regla y los cuatro pasos, y el paso 4 es la reversibilidad que cita K-2. §3, el obstáculo, la acción denegada que no se le pide a otro agente, la restricción como opción y la cadena al ejecutar. El alcance (`:435-436`) se reescribe así: «sirve a quien recomiende, dictamine o elija entre opciones y cargue este documento». El identificador de agente del destino sale. «Regla del marco» pasa a «una regla del framework o del destino» |
| D-14 | §10 `:478-484`: «De dónde sale», que remite a la carga en tres niveles | H | Cadena §9: el mecanismo («el techo no era la palanca del contexto: lo era lo que se despacha») y sus cifras, con «medido en un destino privado, no reproducible desde esta copia» |
| D-15 | §7.1 `:140-178` (acta, parámetros y agentes del destino, carga en tres niveles) y §8.5 (delegación del merge) | — | Fuera del cierre: ninguna cláusula traída los usa (AI2-01, fila 10). La nota lo anota. §8.5 tiene además su equivalente en `Conformacion-Pull-Request-Automatico` (RC-02) |
| D-16 | Fork L280-L281: la ruta del índice del destino | E | `Conocimiento/Index-Knowledge.md` §3. El comando `cut -d'\|' -f3,5,11` sirve tal cual (D-04 de 009). La ruta va como parámetro (MC-08) |
| D-17 | Mapa de carga, «por rango de líneas» (fork L55-L75) | E | `Rules-Base-Conocimiento.md` §4.2 y §9.2 (`:241-242`, `:490`). El mapa es una guía de lo que el presidente le da a cada rol (C-7) |
| D-18 | Fork L224, L431, L434: la carpeta de contexto del producto | T + E | Una línea de definición: «la fuente de verdad que el producto declare». La mitad del ADR `Aceptado`, a `Rules-Arquitectura-Tecnica.md:132` y `:170` |
| D-19 | Fork L173, L184: las carpetas de insumos y de salidas del caso | T | Dos definiciones en el texto: «lo que aporta quien pidió» y «la salida real del caso, donde el destino la guarde». `Expediente-Rules.md` §3 (`:109-119`) no las tiene |
| D-20 | Fork L154: el registro de auditoría foliado por `ruta@commit` | E | `Expediente-Rules.md:141-144` y §5 |
| D-21 | Fork L220, L694: A8, D9, D1 a D9 | E | `Expediente-Rules.md:395`, `Deriva-Rules.md:22`, `Master-Prompt.md:449` |
| D-22 | Fork L524 y la 1.2 `:247`: «A1 a A12» | E con corrección | «los criterios de `Expediente-Rules.md` §6», sin rango (`:448` ya dice A1 a A15) |
| D-23 | Fork L411, L503-L513: ADR `Propuesto` → `Aceptado`, registro de decisiones | E | `Rules-Arquitectura-Tecnica.md:130-131` y `:170` |
| D-24 | Fork §8, copias L589-L737 (`Mesa-Rules.md` 1.5 §6.1, §6.4, §6.5, §6.7, §7, §7.1; `Master-Prompt.md` 8.21 §8.1, §10, §10.0, §10.1) | E | Cada copia se compara con `diff` contra la sección de `_legacy/13.21/` y contra la vigente, y la salida se folia (ev-06). Lo que coincide pasa a cita por sección. Lo que la copia agrega es contenido y se conserva: las cinco aplicaciones de MC-05 van a su sección (T1 y T2) |
| D-25 | Fork L438-L456: el bloque mínimo de §5.6 «en un fork sin `Mesa-Rules.md`» | E | `Mesa-Rules.md` §6.7 |
| D-26 | Fork L607, L629, L675, L758, L760, L763-L766, L769: hashes del framework | E | Versión de la regla y §, o `_legacy/13.21/<ruta>:<a-b>` (`diff` vacío, PC-03) |
| D-27 | `Coherencia-*`, `Root-Rules.md` §14, `Deriva-Rules.md` §3, secciones de `Mesa-Rules.md`, `Master-Prompt.md` y `Expediente-Rules.md` | E (ya resuelven) | Primera mención con ruta desde la raíz; después, cita por sección |
| D-28 | Fork L233: el expediente 0003, folio 019 | E | Resuelve. Se cita completo, sin comodín |
| D-29 | Fork L584: `Rules-Base-Conocimiento.md` §0.4 | E | Acierta por coincidencia (PC-04): cotejado por contenido con `:98-103` |
| D-30 | Fork L155, L387, L600-L601: la ficha como folio derivado `NNN-A<n>` | E | `Expediente-Rules.md` §3 y §6 (A3): folio propio de la serie (C-11) |
| D-31 | Fork L759: el «ejemplar completo», una bitácora del destino | E (reemplazo) | Los expedientes `0003` y este `0004` del framework, que corre la convención a la vista (RC-07 ii) |
| H-01 | Fork L742-L746 | H | Ver D-05 |
| H-02 | Fork L768, L788, L789: la historia del techo | H | Ver D-04 |
| H-03 | Fork L760, L761, L766, L782-L787: las versiones de las convenciones del destino | H | Nota §3, sin nombre de archivo |
| H-04 | Fork L704: la carta de un expediente del destino | H | La lectura de P0–P3 se conserva como campo `LECTURA P0–P3` de §5.1 del padre, sin la ruta |
| H-05 | Fork L236-L240: rutas, identificadores y un hash del destino en «De dónde sale» | H | Los casos se reescriben con su mecanismo y sus cifras, con la frase de D-14 (MC-04, RC-07 i) |
| H-06 | Fork L757-L769 (§9) y L778-L790 (§10) | H | §9, Origen → este expediente. La nota §3 lleva una fila por versión del fork, ofuscada |
| H-07 | Fork L75, L596: el nombre del destino como ejemplo | H | «en un destino sin la norma de la mesa» |
| H-08 | Fork L263: una decisión de quien pidió en el destino | H | Se funda en el propio texto (fork L516-L520: Bezos; Nygard). El origen se describe |
| H-09 | Fork L221 y las cifras de §1, §2.3 y §3.2 | H | Testimonio consultivo, con la frase de D-14 |

**Lo que entra como sustancia nueva al árbol:** §10 del destino, 53 líneas, en la cadena; unas 4 líneas de definiciones (D-18, D-19); y el cotejo de §7.4, cuyo contenido ya estaba en el fork. De la regla base del destino no entra ninguna línea. **Ninguna dependencia exige tocar una regla.** Lo único que toca una regla es O5, que no es una dependencia (M-1).

## 7. Comprobación mecánica que corre la prueba

La corren la auditoría mecánica y cada una de las dos reproducciones a ciegas (O4), sobre el commit de la redacción. El guion se asienta como texto en `evidencia/ev-04-comprobacion-o2-prima.py`: no es ejecutable y abre con las líneas `# Método:`, `# Comando:` y `# Base:` (A9). Parte del prototipo del folio 009, §3, y le suma lo que pidieron 011 y 012. La salida va a `ev-05-salida-o2-prima.out`, y el cotejo de las copias a `ev-06-cotejo-de-las-copias-del-fork.diff`.

1. **Copia sin historia.**

   ```
   W=$(mktemp -d); mkdir "$W/IA.SDD"
   git archive <commit> | tar -x -C "$W/IA.SDD"
   test "$(ls -A "$W")" = IA.SDD && test ! -e "$W/IA.SDD/.git"
   ```

   Antes, `_legacy/13.21/` tiene que estar versionado: hoy está sin seguimiento.
2. **Resolución** (`python3 -I ev-04… "$W/IA.SDD" <docs>`), sobre los tres documentos, `Conocimiento/Index-Knowledge.md`, la nota y `SDD/Devs/Rules/Rules-Base-Conocimiento.md`:
   - rutas `*.md`, con directorio, sin directorio o con `…`, contra la raíz de la copia y la carpeta del documento, con `realpath` dentro de la copia;
   - `Archivo.md §n`: el encabezado existe;
   - `Archivo.md:a-b`: el rango cabe en el archivo y, si transcribe un literal, el literal está;
   - alias entre acentos graves: tienen fila en el índice;
   - identificadores `Kn`, `An`, `Dn` y `XC-n`: están definidos en el archivo citado.

   Falsos positivos declarados uno por uno: plantillas (`NNN-`, `<…>`, `{{…}}`) y el `README.md` suelto que nombra una carátula. **Esperado: 0.**
3. **Nada apunta afuera.** Sobre los tres documentos y la nota:

   ```
   grep -c -E '_convenciones_comunes|_reglas_base|Prompts/|\bK[0-9]+\b' <docs>   # → 0
   grep -c -E '`[0-9a-f]{7,40}`' <docs>                                            # → 0
   ```
4. **Tabla «Dependencias».** Cada referencia que el paso 2 encuentra fuera del propio documento tiene su fila en la tabla, y cada fila `equiparada` lleva ancla. **Esperado: 0 faltantes.**
5. **Ofuscación** (R2):

   ```
   grep -c -i -E -f "$PRIV" <docs> actuaciones/*.md   # → 0
   ```

   `$PRIV` es la lista de términos privados de ev-03, ampliada con identificadores, hashes y números de expediente del destino. **Vive fuera del repositorio**. Más A11 de `Expediente-Rules.md` §6 sobre lo que se empuja.
6. **Citas entrantes** (RC-08). `git grep -n 'Mesa-De-Expertos-A-Pedido'` en `SDD/` y `Conocimiento/` da las cinco de §0. Cada una cae en la misma sección del padre y con el mismo sentido, cotejado a mano y foliado.
7. **Techo y forma:**
   - `wc -l` de cada documento contra el techo de T1 a T3;
   - `awk` de las líneas de prosa de más de 110 columnas, fuera de tablas y bloques de código → **0** (C-9);
   - la lista de `Rules-Base-Conocimiento.md` §6.1 (2.3), ítem por ítem, para cada documento;
   - la fila del índice contra la cabecera, campo por campo, con guion (precedente de `[13.21]`).
8. **Llegar** (RC-06). Cada reproductor a ciegas recibe sólo el alias `Mesa-De-Expertos-A-Pedido` y un caso. Mide dos cosas:
   - que desde el padre llega a la excepción y a la cadena cuando su acto las necesita;
   - cada criterio `[enumerable]` de los tres §6 sobre este mismo expediente (RO-06).

   Un criterio que nadie completó se simplifica o se quita antes de publicar.
9. **Regresión sobre el resto del catálogo** (NB2-07). El paso 2 corre sobre los otros seis documentos y declara sus resultados, pero **no los reprueba**: el ítem nuevo no rige hacia atrás. `Knowledge-Template-HTML-SDD-Default.md:273` es un falso positivo declarado. `Index-Knowledge.md:22` se corrige (M-2).

**Verde** es: los pasos 2 a 7 en 0, sin faltantes, y el paso 8 con las dos reproducciones llegando a cada dependencia.

## 8. Plan de redacción, archivo por archivo

El **techo de redacción** es lo que el redactor no supera. El techo duro es el de `Rules-Base-Conocimiento.md` §6.2. Si un documento pasa su techo de redacción, el redactor no junta renglones ni recorta materia. Primero quita lo que se repite dentro del documento, como las remisiones de §0 que el mapa ya da. Si con eso no alcanza, sale a la presidencia con la medida, en una línea. La salida reversible es proponer el techo calibrable (`:378`), y eso sería norma, marcado.

| Tramo | Archivo | Techo | Qué lleva |
|---|---|---|---|
| T0 | `Expedientes/0004-…/README.md` y las tres primeras líneas de ev-01 a ev-03 | — | La carátula de seis campos (A2) y el índice de actuaciones. Las líneas `# Método:`, `# Comando:` y `# Base:` de cada evidencia (A9). Se hace antes del primer commit y se asienta en una constancia |
| T1 | `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` 2.0 | **560** (duro 600) | Ver la tabla del padre, abajo |
| T2 | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` 1.0 | **480** | Ver la tabla del hermano, abajo |
| T3 | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md` 1.0 | **200** | Ver la tabla de la cadena, abajo |
| T4 | `Conocimiento/Index-Knowledge.md` 1.7 | 70 | La fila del padre reescrita desde su cabecera, con el `Tema` nuevo, y dos filas nuevas, cuyo `Tema` dice en qué acto se carga cada uno (AI2-06). La cabecera pasa a `Compatible con: … 2.3`, y las otras seis filas conservan su valor (precedente 1.5). En §2, la corrección de la línea 22 y una oración que remite a `Rules-Base-Conocimiento.md` §2.2 (M-2). Una fila 1.7 en §5 |
| T5 | `SDD/Devs/Rules/Rules-Base-Conocimiento.md` 2.3 (M-1) | +15 | **§2.2**, una viñeta junto a la de ofuscación: «Un documento que se suma desde otro repositorio llega con su cierre. Toda referencia resuelve en este árbol, por un equivalente verificado con línea o porque lo citado se trajo a `Conocimiento/`. La norma que lo gobernaba en su origen se reemplaza por esta. La trazabilidad al origen se describe sin apuntar». **§6.1**, un ítem `[enumerable]`: «Toda referencia de la prosa resuelve en una copia sin historia del árbol (§2.2); los literales de los esqueletos de §5 y los ejemplos se declaran uno por uno como falsos positivos». Rige desde 2.3. **§8**, una línea del snippet: «Si el artefacto viene de otro repositorio, traés su cierre (§2.2)». **§10**, la fila 2.3. Y la versión de la cabecera |
| T6 | `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` 1.1 | 220 | §1, el alcance: tres documentos y la regla. §3, la evidencia de 1.3 a 1.15, ofuscada, una fila por versión. Las tablas: las 36 referencias de ev-01 con su clase y su destino, sin rutas del destino; K1 a K7; el cotejo cláusula por cláusula de §7.4 y de §10; la salida resumida de ev-06. §4, el inventario. §5, §6.1 por documento. Un apartado «Pendientes de la norma» con P-1 a P-4 y la calibración del techo. Un apartado «Marcado al Product Owner» con M-1 a M-4. **Los archivos del destino se nombran por su función, sin nombre de archivo ni ruta**, para que el guion dé 0 también acá |
| T7 | `CHANGELOG.md` `[13.22]` | 70 | Minor, por el precedente de 13.9, 13.17, 13.19 y 13.21. Lleva las tres altas, la regla 2.3 marcada, el índice 1.7, la nota 1.1, la tabla de §6.1 por documento y la salida del guion |
| T8 | `_legacy/13.21/` | — | Ya copiado: se versiona tal cual y se verifica contra `git ls-tree c9b3e46` (003, §2.2) |
| T9 | `evidencia/ev-04` a `ev-06` | — | El guion de §7, su salida y el cotejo de las copias. Ofuscados, no ejecutables, con sus tres líneas |
| T10 | Prueba | — | La auditoría mecánica (§7, pasos 1 a 7 y 9) y las dos reproducciones a ciegas (paso 8), cada una con su folio. Después, un ciclo de corrección |
| T11 | Pedido de fusión | — | Lo abre el presidente, con el ciclo propio del framework. Se fusiona sólo con los controles en verde |

**Padre, T1** (unas 540 líneas):

| Sección | Lleva | Líneas |
|---|---|---|
| Cabecera | Once campos. El `Tema` de la 1.2, más la lectura del pedido como enunciado, las convenciones medidas y el ciclo de vida de la evidencia, **sin** «rigen también un encargo sin mesa» | 16 |
| §0 | El propósito. «Lo que no se omite al aplicar este documento»: los renglones 1 a 5 verbatim, con sus remisiones recalculadas, y un renglón 6 que nombra por ruta a `Knowledge-Excepcion-A-Un-Conocimiento.md` y a `Knowledge-Cadena-De-Consecuencias.md` y dice cuándo se cargan. Qué queda afuera, sin las ramas «en un fork»; la extensión a un encargo sin mesa, como uso posible. El mapa de 7 filas con la columna «además». La unidad y el respaldo | 80 |
| §1 | La identidad. El supuesto de la evidencia, condicional (MC-07) | 20 |
| §2 | §2.1, los pasos 1 a 10 con el 6 bis en una línea que remite al hermano. §2.2, con la subsección sin número. §2.3, el expediente y el ciclo de vida de la evidencia; la ficha como folio propio (C-11) | 115 |
| §3 | §3.1, cuya fila del bloqueo remite a la cadena §3. §3.2. §3.3, con los casos reescritos y «Origen del hecho» con su salida entera (MC-01); «¿Contradicción o conveniencia?» se muda al hermano. §3.4, donde el barrido se asienta en `decisiones_cerradas` en lugar de «entra con el peso de» (NB2-03) | 65 |
| §4 | Las decisiones; el criterio de corte aplicado a la mesa a pedido; la fila de la excepción en una línea que remite | 13 |
| §5 | §5.1 a §5.4. §5.1 lleva el campo `LECTURA P0–P3` y el barrido con la ruta como parámetro. La carta de §5.2 nombra a los otros dos documentos y remite la escala a `SDD/Devs/Rules/Mesa-Rules.md` §6.1. Párrafo «`Por criterio` exige dos rondas» | 98 |
| §6 / §7 | Sin los criterios ni los anti-patrones de la excepción. Los criterios citan «`Expediente-Rules.md` §6», sin rango (D-22) | 45 / 23 |
| §8 | Los tres párrafos de la 1.2. La extensión del contrato (fork L739-L740). La condicional para cualquier fork (C-5). «Dónde resuelven las citas», que remite a §9 | 28 |
| §9 | Índice; hermano: la excepción; consumidor; origen → este expediente, con la descripción de H-01 y H-06; la tabla «Dependencias», unas 10 filas | 28 |
| §10 | Las filas 1.0 a 1.2 verbatim y la fila 2.0: incorpora la sustancia de un fork de un destino privado que llegó a su 1.15, re-redactada contra este framework, sin ser el texto de ninguna de esas versiones | 9 |

**Hermano, T2** (unas 440 líneas). `Excepcion-A-Un-Conocimiento`:

| Sección | Lleva | Líneas |
|---|---|---|
| Cabecera | Once campos | 16 |
| §0 | Qué es y cuándo se carga: quien propone no seguir un conocimiento que rige, el refutador que juzga la ficha, el análisis de decisiones, el jurado, quien aplica el provisorio. La terminología, con cuatro figuras: excepción a un conocimiento (en su origen, «apartamiento»), apartamiento declarado (`Root-Rules.md` §11), desviación (`Rules-Base-Conocimiento.md` §0.4) y desvío (`Mesa-Rules.md` §6.1). La ficha no entra en `restricciones_duras`. La mesa vive en el padre | 30 |
| §1 / §2 | Los roles. El ciclo: ficha → refutación → análisis → veredicto → cierre, cada acto en su folio | 12 / 22 |
| §3 | La regla general de §7.4 (D-09): un precedente no es una regla; contradicción, no conveniencia; los cuatro pasos enunciados. El filtro «¿Contradicción o conveniencia?» con su caso reescrito, que cita la cadena §3 en «la restricción también es una opción» | 45 |
| §4 | Los defaults por rama, sin condensar: la regla (D-08), la imposibilidad sin medir, que es un obstáculo (cadena §3), el camino reversible, el no reversible. «Cumplir no es default». No se asienta por silencio. Una excepción no se autocorrige (disparador 7 de `Mesa-Rules.md` §7) | 18 |
| §5 | §5.1, la ficha: folio propio, `XC-<n>`, «Aprobó» como campo. §5.2, el apartado de cierre «Excepciones a conocimientos» y la cuenta de folios, sin las fichas. §5.3, el análisis del camino de compromiso; K-2 cita la cadena §2, paso 4; el ejemplo de estándar, neutro. Sin el bloque mínimo (D-25) | 235 |
| §6 / §7 | Criterios / anti-patrones de la excepción | 15 / 10 |
| §8 | Tres párrafos (NB2-05): en su origen era una regla de alcance general, y acá es consultiva; dentro de una mesa, la fuerza la da `decisiones_cerradas`; no es el apartamiento declarado ni la detención de `Master-Prompt.md` §8.1, y ante conflicto mandan ellas. Una cuarta oración: la precedencia más estricta de un fork rige en ese fork (D-06). «Todo agente», «toda mesa» y «rige siempre» aparecen sólo acá o en §9, y sólo para describir el origen | 15 |
| §9 / §10 | Hermano: el padre; la tabla «Dependencias»; origen → este expediente / 1.0 | 18 / 4 |

**Cadena, T3** (unas 160 líneas). `Cadena-De-Consecuencias`:

| Sección | Lleva | Líneas |
|---|---|---|
| Cabecera / §0 | Once campos. Cómo se razona antes de recomendar, dictaminar o elegir. Qué queda afuera: la escalada (`Mesa-Rules.md` §7), la detención (`Master-Prompt.md` §8.1) y la precedencia (`Master-Prompt.md` §6) | 16 / 20 |
| §1 | Una forma de razonar, no un formato. Sirve a cualquier rol que la cargue | 10 |
| §2 | La regla y los cuatro pasos, verbatim en su lógica | 20 |
| §3 | El obstáculo frente a la decisión; la acción denegada que no se le pide a otro agente; la restricción como opción; la cadena al ejecutar | 28 |
| §4 | Decisiones: el paso 4 no tiene empate; Bezos, decisiones de tipo 1 y tipo 2 | 6 |
| §5 | Esqueleto de una cadena en un folio: opción · dónde cae · cuánto pesa (comando y salida) · qué pierde la otra · reversible | 12 |
| §6 / §7 | Criterios / anti-patrones | 8 / 10 |
| §8 | Las tres partes de NB2-05, adaptadas | 10 |
| §9 | Consumidores por cita: el padre y la excepción. Dependencias: ninguna fuera del árbol. Origen (D-14) | 12 |
| §10 | 1.0 | 4 |

## 9. Lo que sale marcado al Product Owner

Por la delegación del 2026-09-14, la estructura elegida queda aprobada. Lo que sigue sale marcado porque toca la norma (R1) o el alcance, o porque contradice una decisión del Product Owner. Cada punto lleva su default.

| # | Qué | Default que se aplica | SI NO RESPONDÉS | Volver atrás |
|---|---|---|---|---|
| M-1 | Asentar O5 en `Rules-Base-Conocimiento.md` 2.3: la viñeta de §2.2, el ítem de §6.1, la línea del snippet de §8 y la fila de §10 | **Se aplica** (T5) | Rige 2.3 | Cuatro bloques de la regla, más el `Compatible-con` de los tres documentos y de la cabecera del índice, de 2.3 a 2.2. Lo de O5 quedaría en `Index-Knowledge.md` §2 y como pendiente en la nota |
| M-2 | `Index-Knowledge.md` §2, fuera de «su fila»: corregir la remisión a `Relevar-Conocimiento.md`, que no existe, y sumar la oración que remite a §2.2 | **Se aplica** (T4) | Queda | Dos líneas |
| M-3 | Partir el conocimiento contradice la decisión del Product Owner del destino de que este documento fuera el lugar de la regla de excepciones (fork L743-L746) | **Se parte.** El padre queda como la puerta: el renglón 6 de §0 y la carta de §5.2 nombran al hermano por ruta | Queda partido | Unir los dos bajo el alias del padre. Así el padre pasa las 600 líneas, y la única forma conforme sería la excepción de §5, que no es honesta (AI-01) |
| M-4 | **Aviso**: el término del destino, «apartamiento», pasa a ser «excepción a un conocimiento» en el framework (C-3) | **Se aplica** | Queda | Renombrar un archivo, un alias, la fila del índice y el prefijo de la ficha. Es un cambio mecánico |

**Pendientes de la norma** (no se aplican y van a la nota, T6):

| # | Pendiente |
|---|---|
| P-1 | Que el régimen de excepción rija fuera de una mesa, para todo agente. Tocaría `Master-Prompt.md` §6 u §8, o `Rules-Base-Conocimiento.md`. Corresponde a C-2 de PC-01, M-3 de 010 y la primera decisión de 012. Default: no |
| P-2 | Una columna de dependencias en el índice. Tocaría `Rules-Base-Conocimiento.md` §7.1. Default: no; lo resuelven el mapa de carga y la tabla de §9 |
| P-3 | Que el orquestador cargue el conocimiento en tres niveles. Es norma de despacho |
| P-4 | Que ninguna regla mande abrir el índice ante un pedido fuera del orquestador, ni cargar el padre antes de un encargo sin mesa (AI2-06, RO-03) |

## 10. Lo que no procede

| Qué | Por qué |
|---|---|
| El documento del enunciado del problema (NB-03, NB2-04 (b)) | C-1 |
| Traer la regla base del destino, entera o en parte (lectura literal de 008) | Tendría dos normas de la base en el árbol: dos techos y una regla normativa dentro de la carpeta anexa (NB2-02). Todas sus aristas resuelven por E o por N |
| Traer las convenciones del destino por archivo | No converge y choca con R2 (RC-01) |
| El hermano *Especializar* con las copias de §8 (RO-04) | D-24 |
| Repartir §10 entre dos documentos (Alt-1 de 011) | Rompe «un hecho, un lugar» y O5 (AI2-02) |
| Un hermano único con todas las dependencias traídas (012) | C-1 |
| Conservar la guarda de §7.4 o su alcance «todo agente» | C-4, RC-03 |
| Una cota de densidad en bytes por línea | C-9 |
| La ficha como folio derivado que comparte el número de su comisión | C-11 |

Sigue: T0 a T9, con el presidente como implementador y un redactor designado. Después, T10 (la prueba de §7) y T11. · Cierra con: 13.22 fusionado, la constancia de cada tramo T0 a T11, y la respuesta del Product Owner a M-1 a M-4, o su default.
