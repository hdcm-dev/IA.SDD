| Campo | Valor |
|---|---|
| Tipo | informe |
| Fecha | 2026-10-23 |
| Autor | Comisión de Arquitectura de la información |
| Corrige | — |
| Secciones de Mesa-De-Expertos-A-Pedido 1.15 leídas | Entero (§0 a §10): la comisión audita la estructura del documento y su origen, que es la fila «Editás este documento o auditás su origen» del mapa de carga del fork (`<insumos>/…fork-1.15.md:73`) |

# Informe de la comisión de Arquitectura de la información

Trabajé a ciegas. De `actuaciones/` leí sólo los folios 001 y 002, y no consulté a otras comisiones.

## 0. Qué revisé y con qué medio

| Pieza | Medio | Qué miré |
|---|---|---|
| `actuaciones/001`, `002`; `evidencia/ev-01` a `ev-03` | lectura | pedido, enunciado y lectura (a), O1–O4, R1–R4, base mecánica |
| `<insumos>/Knowledge-Mesa-De-Expertos-A-Pedido.fork-1.15.md` | lectura entera + `awk 'NR>=a&&NR<=b' \| wc -lc` por sección | qué ocupa cada sección, qué es copia de una regla y qué es aplicación, qué cita al destino |
| `<insumos>/_reglas_base_conocimiento.md` §4.6 y §6.2; `<insumos>/_convenciones_comunes.md` §7, §7.4 y §10 | lectura | las dos dependencias del destino: lo que el fork toma de ellas |
| `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` 1.2 | lectura + `wc -lc` | §0, §1, §8 a §10; densidad del framework |
| `SDD/Devs/Rules/Rules-Base-Conocimiento.md` 2.2 | lectura de §0.2 a §0.4, §2.2, §3, §4, §6, §7 | techo, partición en hermanos, propiedades de forma, índice |
| `Conocimiento/Index-Knowledge.md`, `Conocimiento/README.md` | lectura | cómo encuentra un documento un agente que llega en frío; el modelo de fork |
| Catálogo del framework (`Conocimiento/*.md`) | `grep -n -i 'hermano\|techo\|excepci'` | precedentes de excepción de §5 y de hermanos |
| `SDD/Devs/Orchestrator/Master-Prompt.md`, `SDD/Devs/Rules/Root-Rules.md`, `SDD/Devs/Rules/Mesa-Rules.md` | `git grep -n 'Mesa-De-Expertos-A-Pedido'`, `git grep -n -i 'apartamiento\|obst[aá]culo'`, lectura puntual | citas entrantes al documento, cómo se carga, colisión de términos |

La lectura del pedido que aplico es la de la providencia: «incorpores ese conocimiento sobre `…/Knowledge-Mesa-De-Expertos-A-Pedido.md`» fija **dónde entra** la sustancia, y «que la mesa debata y discuta su estructura» deja abierta **la forma**. R1 admite «el documento (o sus hermanos)». Un hermano, entonces, no es un agregado, siempre que el archivo nombrado en el pedido siga siendo el punto de entrada y conserve su ruta y su alias (AI-04).

**Lectura de P0–P3 para este caso** (`Master-Prompt.md:1486-1489`, leída para una estructura):
- **P0**: la estructura hace imposible cumplir a la vez O1 y R3, o deja una dependencia que no resuelve en un workspace limpio (O2).
- **P1**: haría salir la redacción con retrabajo o con lecturas divergentes entre el redactor y las reproducciones.
- **P2**: una pérdida acotada de encontrabilidad o de mantenimiento.
- **P3**: claridad.

## 1. Hallazgos

| Id | Nivel | Ancla | Hallazgo | Impacto si no se corrige | Dirección |
|---|---|---|---|---|---|
| **AI-01** | **P0** | E1: `wc -lc` del fork por sección: sin §10 (22 791 B), sin §9 (13 934 B), sin las copias de §8 (`:589-737`, 149 líneas, 14 213 B), sin la desviación del piso (`:742-746`, 524 B) y sin el bloque mínimo del fork en §5.6 (`:438-456`, 19 líneas, 1 409 B), **quedan 69 761 B en ≈ 574 líneas**: 121,5 B por línea. La 1.2 del framework tiene **27 718 B en 309 líneas**, 89,7 B por línea. Con esa densidad, lo que queda son **≈ 778 líneas**. E2: `Rules-Base-Conocimiento.md:372` (`propio`, **600 líneas**) y `:374-376` («se parte el documento en dos»; la única excepción es «un §5 de esqueletos que no se puede partir»). E2: `_reglas_base_conocimiento.md:176-180`: el destino pasó su techo a bytes porque, en líneas, la mejora «se cumplía juntando renglones» (de 89,7 a 140,5 B por línea) | **Un solo archivo no entra bajo 600 líneas sin pérdida.** Entra sólo si se conservan los renglones largos del fork (unas 600 líneas, y eso antes de sumar §9 y §10 nuevos) o si se juntan más. Esa es justo la maniobra que el destino diagnosticó como trampa del techo en líneas. Si no, O1 se cumple recortando materia. Tampoco vale acogerse a la excepción de §5: §5.5 a §5.7 sirven a otra situación (apartarse de un conocimiento) y se pueden partir sin volverse inútiles, así que la excepción no es honesta | Partir: un padre y un hermano (Alt-B, §3). No acogerse a la excepción de §5 ni juntar renglones para entrar |
| **AI-02** | **P1** | E2: `Rules-Base-Conocimiento.md:280` («Un hecho, un lugar… Duplicar garantiza deriva»). E1: ev-01, `Mesa-Rules.md`, `Master-Prompt.md`, `Expediente-Rules.md` y `Root-Rules.md` **resuelven** en `SDD/Devs/…`. E2: `Conocimiento/README.md:35-36` («forkea el repositorio… se lleva el método intacto»). E2: `Root-Rules.md:946-948`: a un destino con norma propia, la reintegración «llega **sólo** por la mesa a pedido»; la cita resuelve en el árbol del framework, no en el del destino. E2: fork `:606-607`, `:629-630`, `:690`: copias ancladas a «commit `c9b3e46`, líneas 454-465», etc. | En el framework, **las copias de §8 son una segunda fuente de la misma regla**, fijada a un commit y a líneas que la próxima versión de `Mesa-Rules.md` desmiente. El fork las necesitaba porque su catálogo vivía en un árbol sin esas reglas. En un workspace limpio, el árbol que trae el documento trae también las reglas | Quitar las copias (`:589-737`) y el bloque mínimo de §5.6 (`:438-456`). §8 vuelve a la forma de la 1.2 (`Knowledge…:274-291`) y suma un párrafo de **dónde resuelven las citas** (texto en §5.2 de este informe). **Las aplicaciones que el fork escribió dentro de §8 no son copia y no se pierden**: se mudan al cuerpo (tabla en §5.2) |
| **AI-03** | **P1** | E2: `Master-Prompt.md:1955`, glosario operativo: «**Apartamiento declarado** — ADR que declara por qué un artefacto obligatorio no se emite… Definido en `Root-Rules.md` §11» (`Root-Rules.md:621`). E2: `Rules-Base-Conocimiento.md:102` y `:360`: el documento que contradice el piso declara «la **desviación**». E2: fork `:224`: el término se distingue de «desviación» citando «`Rules-Base-Conocimiento.md` K6». E1: `git grep -n 'K6' -- SDD Conocimiento` → **0 líneas**: K6 es del destino (`_reglas_base_conocimiento.md` §6.3) | En el framework, «apartamiento» ya tiene un referente en el glosario del método, y la fila del fork que lo desambigua cita un ancla que no existe. Un agente que llega en frío lee «apartamiento» y lo busca en el glosario: encuentra el ADR de §11 y aplica la ficha equivocada. El hermano necesita un alias que no colisione | Alias del hermano: **`Apartamiento-De-Un-Conocimiento`** (no `Apartamiento` a secas). Su §0 y su fila de terminología distinguen tres figuras con su ancla: *apartamiento declarado* (`Root-Rules.md` §11: un artefacto obligatorio que no se emite), *desviación* (`Rules-Base-Conocimiento.md` §0.4: un documento que contradice el piso) y *apartamiento de un conocimiento* (la decisión de un agente que no sigue un conocimiento que rige). K6 sale |
| **AI-04** | **P1** | E1: `git grep -n 'Mesa-De-Expertos-A-Pedido' -- . ':(exclude)_legacy' ':(exclude)Expedientes'` → la citan con sección `Mesa-Rules.md:574` (§3.1), `Root-Rules.md:948` (§2.1, pasos 9 y 10), `Knowledge-Entorno-De-Ejecucion-Del-Agente.md:46` y `:145` (§3.1). E4: R1 (no se cambian reglas) | **La estructura del padre está fijada desde afuera.** El archivo, el alias, §2.1 (pasos 9 y 10) y §3.1 tienen que seguir en ese lugar y con ese número, porque dos reglas que R1 no deja tocar los citan. Una partición que mueva la lectura del pedido o el ciclo al hermano, o un renumerado, rompe esas citas sin que se puedan reparar | El padre conserva el nombre de archivo, el alias y la numeración de la 1.2. Sólo **suma** §3.4. El hermano se lleva §5.5 a §5.7 del fork con numeración propia. La nota de coherencia registra la verificación: `git grep` de las cuatro citas entrantes, antes y después |
| **AI-05** | **P2** | E2: `Master-Prompt.md:576`: el documento se suma **entero** al despacho de su consumidor; no hay lectura por rango. E2: `Rules-Base-Conocimiento.md:241-242`: la divulgación progresiva del framework es **índice → cabecera → cuerpo**. Ninguna regla tiene el «techo del nivel 1» del destino (`_reglas_base_conocimiento.md:166-169`). E2: fork `:789`: la fila 1.14 registra **cuatro vueltas de corrección** del mapa de carga. E1: lectura de `:61-73`: **8 de las 11 filas** del mapa dan alguna de §5.5, §5.6 o §5.7 | El mapa del fork es la pieza más cara de mantener: cada cambio de una sección obliga a revisar cada fila. Además, en el framework ninguna regla lo sostiene. Con el hermano, el **límite del archivo** hace el trabajo grueso del mapa, y las filas del padre pierden casi todas sus remisiones a apartamientos | Conservar **«Lo que rige siempre»** (los cinco renglones, más un sexto que remite al hermano), la regla de unidad («la sección entera») y la de respaldo. Reducir el mapa del padre a **siete filas**: presidente y perito; encargo sin mesa; comisión; roles de la interfaz; refutador; jurado y cuerpo de parches; quien aplica. Ninguna da secciones del hermano: el sexto renglón dice cuándo se carga. **El hermano no lleva mapa**: con unas 300 líneas, se lee entero. Sale la línea `:75` («§8 obligatorio… como en <destino>»), porque §8 ya no lleva copias |
| **AI-06** | **P2** | E1: ev-01: `Mesa-Rules.md` aparece **73 veces sin ruta**, y `Master-Prompt.md` 21. Resuelven sólo buscando por nombre suelto. E2: `Conocimiento/Index-Knowledge.md:14-15`: el índice es «el único lugar donde se declara qué existe», y el orquestador lo abre «para resolver un alias». E2: `Rules-Base-Conocimiento.md:210` (§9 declara los hermanos) | Un agente que llega en frío a un workspace limpio con «hacé una mesa de expertos» encuentra el padre por el índice, pero **el hermano tiene que encontrarse sin que nadie se lo nombre**. Si sólo aparece en §9 del padre, que la mayoría de las filas no carga, el agente que va a apartarse no lo carga nunca | El hermano se alcanza **por cuatro vías**: (1) su fila en `Index-Knowledge.md`, con un `Tema` que diga «apartarse de un conocimiento que rige»; (2) el sexto renglón de «Lo que rige siempre» del padre, con la ruta completa; (3) la carta de §5.2 del padre, en el renglón «Rigen estas convenciones… Si proponés apartarte», con la ruta del hermano; (4) §9 de los dos documentos, en las dos direcciones. Además, en §0 y en §8 de los dos, **la primera mención de cada regla va con su ruta desde la raíz** (`SDD/Devs/Rules/Mesa-Rules.md`) |
| **AI-07** | **P2** | E1: ev-01: `_convenciones_comunes.md`, **21 ocurrencias, NO RESUELVE**. Las de sustancia son §7.4 (`:229-282`: los cuatro pasos del análisis y los defaults) y §10 (`:450-460`: reversibilidad, paso 4, y «un obstáculo no es una decisión»). E1: `git grep -c -i 'obst[aá]culo' -- SDD/Devs/Rules SDD/Devs/Orchestrator Conocimiento` → sólo `Catalogo-De-Criterios.md`, 2 líneas en otro sentido. E2: el equivalente de la «rama de la regla» del fork (`:430`, «una regla de `_convenciones_comunes.md` §7.2») es `Master-Prompt.md:577` («Precedencia del conocimiento») junto con `Rules-Base-Conocimiento.md:100-103` | En el fork, la regla general del apartamiento **vive fuera del documento**. En el framework no tiene casa: si el hermano la cita, la cita no resuelve, y si nadie la trae, el hermano queda como una plantilla sin la regla que la gobierna | **El hermano es la casa de la regla general.** Su §3 trae los cuatro pasos de `_convenciones_comunes.md` §7.4 y los defaults, unas 30 líneas, sin citar el archivo del destino. La «rama de la regla» remite a `Master-Prompt.md` §6 y a `Rules-Base-Conocimiento.md` §0.4. **«Obstáculo» se define una vez en el padre**, en §3.1, fila del bloqueo, y el hermano lo cita (un hecho, un lugar). La reversibilidad (K-2) toma como fuente su propia viñeta «Reversible» y la cita de Bezos que ya trae el fork (`:519`) |
| **AI-08** | **P3** | E2: `Expediente-Rules.md` y R4 (no se reescribe lo publicado). E1: fork `:757-769`, §9 con rutas de expedientes y bitácoras del destino, y `:778-790`, filas 1.3 a 1.15 que narran su historia. E2: `Rules-Base-Conocimiento.md:281` («Forma de contrato… no la historia») | Si el padre sube a **1.3**, el alias tiene dos «1.3» con textos distintos: la del fork y la del framework. Un agente con los dos contextos no las distingue. Si §9 y §10 traen la historia del fork, el documento público carga rutas privadas y una historia que no es la suya | El padre sube a **2.0**: hay partición, §8 pierde las copias y cambia la fila del índice. Las filas 1.0 a 1.2 de §10 quedan **verbatim** (R4) y se suma **una** fila 2.0 que dice «integra la sustancia de un fork 1.3–1.15 de un destino privado; su numeración no se hereda». El hermano nace en **1.0**. En §9 de los dos, el «Origen» remite a **este expediente** (`Expedientes/0004-…`, en el árbol y ya ofuscado) y a las fuentes públicas de método que el fork cita (Pólya; Kepner y Tregoe; Zeller y Hildebrandt; Bezos; Nygard), sin rutas del destino |

## 2. Dos alternativas de estructura

### Alt-A — Un solo archivo, con mapa de carga (la forma del fork, trasplantada)

| Sección | Contenido | Líneas estimadas |
|---|---|---|
| Cabecera | Once campos; `Compatible-con: Rules-Base-Conocimiento.md 2.2` | 15 |
| §0 | Propósito, «Lo que rige siempre» (5), qué queda afuera, mapa de carga (11 filas) | 55–60 |
| §1 | Identidad, con el análisis de decisiones | 18 |
| §2 | 2.1 ciclo, 2.2 clases y 2.2.1, 2.3 expediente y ciclo de vida de la evidencia | 93 |
| §3 | 3.1 lectura del pedido, 3.2 convenciones, 3.3 filtros (con «¿Contradicción o conveniencia?», caso que funciona, comportamiento no es restricción), 3.4 convenciones medidas | 64 |
| §4 | Decisiones, con la fila del apartamiento y la del criterio de corte aplicada | 14 |
| §5 | 5.1 a 5.4; 5.5 ficha; 5.6 cierre de apartamientos (sin bloque del fork); 5.7 análisis del camino de compromiso | 240 |
| §6 / §7 | Criterios / anti-patrones | 28 / 23 |
| §8 | Forma de la 1.2 + dónde resuelven las citas | 25 |
| §9 / §10 | Trazabilidad sin rutas privadas / 1.0–1.2 + una fila | 12 / 6 |
| **Total** | | **≈ 600 con los renglones del fork; ≈ 780–860 con la densidad de la 1.2** |

Ventaja: un solo punto de entrada y ninguna cita entre hermanos. Costo: queda en el techo o por encima (AI-01). Además arrastra el mapa de once filas con su costo de mantenimiento (AI-05) y no deja margen. El fork creció 481 líneas en 13 versiones, unas 37 por versión, así que la próxima mejora obliga otra vez a condensar o a partir.

### Alt-B — Padre con un hermano de apartamientos (recomendada)

**Padre:** `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md`, alias `Mesa-De-Expertos-A-Pedido`, **2.0**.

| Sección | Contenido | Líneas estimadas |
|---|---|---|
| Cabecera | Once campos; `Tema` de la 1.15 sin cambios de sentido | 15 |
| §0 | Propósito; «Lo que rige siempre», 5 + 1 renglones (el sexto: «si vas a apartarte de un conocimiento que rige, cargá entero `Conocimiento/Knowledge-Apartamiento-De-Un-Conocimiento.md`»); qué queda afuera, con rutas desde la raíz; mapa de 7 filas; unidad y respaldo | 50–55 |
| §1 | Identidad; el análisis de decisiones aparece en una línea que remite al hermano | 17 |
| §2 | 2.1 ciclo (paso 6 bis en una línea que remite al hermano), 2.2 y 2.2.1, 2.3 con ciclo de vida de la evidencia | 92 |
| §3 | 3.1 (con «obstáculo» definido en la fila del bloqueo), 3.2, 3.3 (sin «¿Contradicción o conveniencia?», que se muda), 3.4 | 58–62 |
| §4 | Decisiones; criterio de corte con su aplicación a una mesa a pedido; el apartamiento en una línea que remite | 12 |
| §5 | 5.1 (con `LECTURA P0–P3`), 5.2 (con el renglón que nombra el hermano), 5.3 (`.gitignore`), 5.4; «`Por criterio` exige dos rondas» | 92 |
| §6 / §7 | Sin los criterios ni los anti-patrones de apartamiento | 22 / 20 |
| §8 | Forma de la 1.2, campos que extienden el contrato y dónde resuelven las citas | 25–30 |
| §9 / §10 | Hermanos: el nuevo; Origen 2.0 → este expediente / 1.0–1.2 verbatim + fila 2.0 | 14 / 6 |
| **Total** | | **≈ 440–500** |

**Hermano:** `Conocimiento/Knowledge-Apartamiento-De-Un-Conocimiento.md`, alias `Apartamiento-De-Un-Conocimiento`, `propio`, `transversal`, `Condicion-de-carga: —`, `Hereda-de: —` (es hermano y no especialización), **1.0**.

| Sección | Contenido | Líneas estimadas |
|---|---|---|
| Cabecera | Once campos | 15 |
| §0 | Qué es; cuándo se carga (quien va a proponer apartarse, el refutador que juzga la ficha, el análisis de decisiones, el jurado que la vota, quien aplica el provisorio); qué queda afuera: las tres figuras de AI-03, con su ancla; la mesa vive en el padre | 25 |
| §1 | Roles: quien propone, refutador, análisis de decisiones, jurado, quien pidió | 12 |
| §2 | Ciclo del apartamiento: ficha → refutación → análisis → veredicto → cierre; las dos ramas del default | 20 |
| §3 | La regla general (los cuatro pasos de AI-07); filtro «¿Contradicción o conveniencia?»; «un precedente del producto no es una regla»; terminología | 30–35 |
| §4 | Sólo por contradicción; caminos y no «sí o no»; default por rama y por reversibilidad; un apartamiento no se autocorrige (disparador 7 de `Mesa-Rules.md` §7) | 10 |
| §5 | 5.1 ficha (con su ruta derivada del folio de la comisión); 5.2 apartado de cierre «Apartamientos de conocimientos» y cuenta de folios; 5.3 análisis del camino de compromiso | 150 |
| §6 / §7 | Criterios / anti-patrones del apartamiento | 8 / 8 |
| §8 | Frontera: `Rules-Base-Conocimiento.md` §0.4 y `Master-Prompt.md` §6 mandan; no redefine `Root-Rules.md` §11 | 12 |
| §9 / §10 | Hermano: el padre; Origen → este expediente / 1.0 | 12 / 4 |
| **Total** | | **≈ 280–340** |

**Descartada — Alt-C, tres documentos** (con un tercero, «enunciado del problema», para encargos sin mesa). El enunciado es el paso 1 de toda mesa. Partirlo obliga a duplicarlo (`Rules-Base-Conocimiento.md:280`) o a que toda mesa cargue siempre dos documentos. Además, ningún orquestador del framework lo cargaría solo: la carga es por condición o por cita (`Master-Prompt.md:576`), y R1 no deja cambiarla. El enunciado se queda en el padre, en «Lo que rige siempre» renglones 1 a 5, y que el orquestador no lo cargue antes de un encargo sin mesa **se anota como pendiente** en la nota de coherencia.

## 3. Elección: Alt-B, y por qué

1. **Cumple R3 con margen y sin pérdida (O1).** El padre queda unas 100 a 160 líneas bajo el techo y el hermano, a la mitad. Nadie tiene que juntar renglones ni recortar (AI-01). Al ritmo del fork, unas 37 líneas por versión, quedan tres o cuatro versiones de margen.
2. **Un documento, un artefacto** (`Rules-Base-Conocimiento.md:276`). La regla del apartamiento no es de la mesa: el propio destino la declara «para todo agente y toda mesa» (`_convenciones_comunes.md:229-230`). Separarla le da su propia unidad de carga, y el hermano es su casa en el framework (AI-07).
3. **Respeta las citas entrantes** que R1 no deja tocar. El padre conserva archivo, alias y numeración, y sólo suma (AI-04).
4. **Abarata la carga progresiva.** El límite del archivo reemplaza la mayor parte del mapa, que fue la pieza que más vueltas de corrección costó (AI-05).
5. **Es reversible.** Si el Product Owner prefiere un archivo, unir dos documentos bajo el mismo alias es un cambio acotado: el hermano no tiene citas entrantes de reglas. Partir más tarde un archivo de 600 líneas, en cambio, obliga a repasar cada remisión interna.

Costo declarado: el hermano agrega una fila al índice, una nota de coherencia más amplia y unas 75 líneas de cabecera, §0, §1, §8 a §10. Agrega también un riesgo de encontrabilidad, que AI-06 mitiga con cuatro vías.

## 4. Respuestas a las preguntas del foco

### 4.1 Cómo encuentra lo que rige un agente que llega en frío a un workspace limpio

| Paso | Qué abre | Qué encuentra |
|---|---|---|
| 1 | `Conocimiento/Index-Knowledge.md` | Dos filas `transversal` sin condición de carga: la mesa a pedido y el apartamiento de un conocimiento, cada una con su `Tema` |
| 2 | La cabecera y §0 del padre | «Lo que rige siempre» (6 renglones) y el mapa de 7 filas: qué secciones cargar según su rol |
| 3 | Las secciones de su fila, enteras | Lo que necesita su acto |
| 4 | Si va a apartarse o juzga una ficha, el hermano entero | La regla general, la ficha, el análisis y el cierre |
| 5 | Las reglas citadas, por ruta desde la raíz | `SDD/Devs/Rules/Mesa-Rules.md`, `Expediente-Rules.md`, `Root-Rules.md`, `SDD/Devs/Orchestrator/Master-Prompt.md`: están en el mismo árbol |

Una comisión no necesita nada de esto: su carta (§5.2 del padre) le trae la escala, P0–P3 leídos para el caso y la ruta del hermano. Lo que sí cambia frente al fork es que **la carta deja de copiar la escala** «en un destino sin `Mesa-Rules.md`». Basta remitir a `SDD/Devs/Rules/Mesa-Rules.md` §6.1, salvo que el presidente decida copiarla para que la comisión no tenga que abrir la regla. Esa es una decisión de despacho, no de la estructura del documento.

### 4.2 Qué pasa con el §8 del fork

**En el framework las copias sobran: se quitan.** Lo que en el fork era aplicación **se muda**:

| Pieza del fork | Qué es | Destino en Alt-B |
|---|---|---|
| `:596-601` carpeta del fork, ruta de la ficha `NNN-A<n>` | forma propia del fork / aplicación | La carpeta la fija `Expediente-Rules.md` y no se repite. La ruta derivada de la ficha va al hermano, §5.1 |
| `:602-604` núcleo permanente y folio del análisis | copia + aplicación | El núcleo, por remisión a `Mesa-Rules.md` §5.1. El folio del análisis, al hermano, §1 |
| `:605-623` jurado | copia de `Mesa-Rules.md` §6.4 | Sale. El voto sobre la ficha y el camino queda en el paso 8 del padre |
| `:624-627` plan | copia de §6.5 | Sale |
| `:629-656` criterio de corte, clases de hallazgo y «lo que sigue en una mesa a pedido» | copia + **aplicación** (una ronda es un ciclo completo; ni la regla propia ni el presupuesto son criterio; con cuatro rondas, sube) | La copia sale. La aplicación va a la fila «Criterio de corte» de §4 del padre y al párrafo «`Por criterio` exige dos rondas» de §5 |
| `:657-674` escalada | copia de `Mesa-Rules.md` §7 | Sale. Que un apartamiento es el disparador 7 va al hermano, §4 |
| `:675-689` escala de ancla | copia de §6.1 + **aplicación** (qué ancla admite un apartamiento) | La copia sale. La aplicación va al hermano, §3 |
| `:690-706` niveles P0–P3 y su lectura para una mesa | copia + **aplicación** | La copia sale. La lectura de los cuatro niveles va a §5.1 del padre como campo `LECTURA P0–P3`, **sin** la ruta de ejemplo del destino (`:704`) |
| `:707-734` origen del hecho | copia de `Master-Prompt.md` §8.1 + **aplicación** («de la corrida» no suprime la pregunta; un apartamiento no se autocorrige) | La copia sale. La primera aplicación va a §3.3 del padre, fila «Origen del hecho»; la segunda, al hermano, §4 |
| `:736-737` retiro de las copias | condición del fork | Sale: se cumple ahora |
| `:742-746` desviación del piso | propia del fork, que edita un cuerpo importado | Sale. En el framework este documento **es** el cuerpo |

Texto propuesto para el párrafo nuevo de §8 del padre (dirección, no redacción final):

> **Dónde resuelven las citas.** Las reglas que este documento cita viajan en el mismo árbol que él: `SDD/Devs/Rules/Mesa-Rules.md`, `SDD/Devs/Rules/Expediente-Rules.md`, `SDD/Devs/Rules/Root-Rules.md` y `SDD/Devs/Orchestrator/Master-Prompt.md`. Una mesa sobre un destino cuya norma no es la del framework las lee de este árbol y usa su mecánica como forma (§1). No se copian acá: una copia fija una versión que la siguiente edición de la regla desmiente (`Rules-Base-Conocimiento.md` §4.4, «Un hecho, un lugar»). Quien lleve este documento a un catálogo que no tiene esas reglas hace una copia fuera del framework y responde por ella.

## 5. Lo que revisé y está bien

- **La cabecera de la 1.15 cumple la forma de once campos** de `Rules-Base-Conocimiento.md:220-234`. Sólo cambia `Compatible-con`, que pasa a `Rules-Base-Conocimiento.md 2.2` (fork `:10`), y el `Tema` sirve sin cambios de sentido para el padre.
- **«Lo que rige siempre» (fork `:25-33`)** es la pieza de mayor rendimiento por línea para un agente que llega en frío: 9 líneas, 2 543 B, cada renglón con su hoja. Pasa al padre tal cual, salvo el sexto renglón.
- **El precedente de partición existe en el catálogo:** `Knowledge-Template-HTML-SDD-Default.md:866` declara un hermano en §9. Las dos excepciones de §5 del catálogo (`Knowledge-Template-HTML-SDD-Default.md:38-42`, `Knowledge-Conformacion-Pull-Request-Automatico.md:41-44`) se fundan en esqueletos indivisibles, que no es el caso de §5.5 a §5.7 (AI-01).

## 6. Solicitudes de convocatoria

- **Portabilidad y workspace limpio:** el barrido de ev-03 alcanza, además de §9 y §10, la columna «De dónde sale» de §3.3 del fork (`:236-240`). Esas filas nombran expedientes, claves y componentes del destino, y el mecanismo tiene que quedar sin esos nombres. No es mi competencia: lo señalo con su ubicación.
- **Normativa de la base de conocimiento:** confirmar si subir a **2.0** (AI-08) pide algo más que la fila de §10 y la del índice. No encontré regla de mayor o menor para un documento de conocimiento.

## 7. Agregados marcados

- **Agregado:** el nombre del alias del hermano (`Apartamiento-De-Un-Conocimiento`). Lo funda AI-03 y no sale del pedido.
- **Agregado:** la versión 2.0 del padre (AI-08). La funda la colisión de numeración y no sale del pedido.
- **Agregado, para la nota de coherencia y no para el documento:** el orquestador no carga el padre antes de un encargo sin mesa. R1 no deja resolverlo, así que se anota como pendiente.
