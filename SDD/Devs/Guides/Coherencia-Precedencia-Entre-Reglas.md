# Nota de coherencia — La precedencia entre reglas, y la cita que §8.1 exigía y no existía

**Documento:** Coherencia-Precedencia-Entre-Reglas.md
**Versión:** 1.1 — reemitida tras auditoría independiente
**Fecha:** 2026-08-20
**Versión del conjunto resultante:** SDD **11.2**
**Origen:** El tramo **T1** del plan de reestructuración, cuyos criterios de aceptación se transcriben
en §4 por la comprobación 13

---

## 1. Alcance

**El corpus no declaraba ningún criterio para resolver un conflicto entre dos reglas, y eso hacía que
todos cayeran del lado de la detención sin que nadie lo hubiera decidido.**

El mecanismo del defecto es exacto. `Master-Prompt.md` §8.1 declara que algo es **trabajo propio**
cuando *«se contesta abriendo los documentos y contrastando, y la respuesta se puede sostener con una
**cita literal**»*. Un conflicto entre dos reglas **no tenía con qué citarse**: no había criterio. Así
que el agente no podía sostener ninguna resolución y escalaba — **no por decisión, por falta de cita**.

**Lo que esta intervención NO hace, y conviene declararlo:** no deroga la **detención por arbitraje** de
§7.0 ni el punto 2 de `Catalogo-De-Criterios.md` §4.1. Los tres criterios resuelven conflictos **de
forma**; los de **intención** siguen siendo del humano, y ante la duda sobre de qué clase es el
conflicto **se detiene**.

## 2. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Rules/Root-Rules.md` | 7.0 → **7.1** | **§13 nueva**, precedencia; control de cambios pasa a §14 |
| `Rules/Catalogo-De-Criterios.md` | 1.9 → **1.10** | §4.1 punto 2 refinado y un criterio nuevo en §3 |
| `Orchestrator/Master-Prompt.md` | 8.9 → **8.10** | El rango transversal del despacho pasa a §9 a §13 |
| `Guides/SDD-Development-Guide.md` | 1.21 → **1.22** | El frontmatter duplicaba la versión. **Se registra acá el saneamiento que la primera emisión dejó sin fila** |
| `CHANGELOG.md` | — | Entrada **11.2** |
| `_legacy/11.1/` | — | Snapshot del conjunto superado, tomado del estado sin editar |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| El rango de transversales suma una sección | `§9 a §12` | `§9 a §13` |
| El conjunto transversal deja de ser de cuatro | `cuatro secciones transversales` | `cinco secciones transversales` |
| La enumeración explícita del despacho | `§12 referencia pendiente)` | `§12 referencia pendiente, §13 precedencia entre reglas)` |
| El alcance declarado en §9 deja de contar | `las tres siguientes` | `las que siguen hasta §13` — **R1: se reescribe sin contar en lugar de recontar** |

**Los tres últimos patrones faltaban en la primera emisión**, y su ausencia produjo el hallazgo P0 de la
auditoría: **§13 no llegaba al despacho de generación**. El patrón elegido —`§9 a §12`— alcanzaba dos
líneas de §10 y ninguna de §8, donde el concepto vive con otras palabras. Es la figura que la guía ya
tipificó: **una corrida sustantivamente correcta y literalmente incompleta**.

**Resultado de la corrida, sobre el árbol vivo:**

**Antes** se cuenta sobre `_legacy/11.1/`, que es el conjunto congelado; **vivo** sobre el árbol de hoy,
que incluye lo que esta intervención escribió. La identidad que tiene que cerrar es
**antes = reemplazadas + residuo heredado**, y aparte se enumera lo que la propia intervención agrega.

| Patrón | Antes | Reemplazadas | Residuo heredado | Agregado por esta intervención | Vivo |
|---|---|---|---|---|---|
| `§9 a §12` | **3** | **2** | **1** | **3** | 6 |
| `cuatro secciones transversales` | **3** | **1** | **2** | **2** | 4 |
| `§12 referencia pendiente)` | **1** | **1** | **0** | **1** | 2 |
| `las tres siguientes` | **1** | **1** | **0** | **1** | 2 |

**Las cuatro identidades cierran.** Y el recuento se declara con **cinco columnas y no con tres** porque
con tres no se podía distinguir el residuo heredado del texto que la propia nota escribe — que es
precisamente lo que hizo que la primera emisión declarara «residuo 1» sobre una corrida incompleta.

**Reconciliación contra el snapshot**, que es lo que la 10.0 no hizo: `grep -c` sobre
`_legacy/11.1/` da **3**, y **3 = 2 + 1**. La identidad cierra.

**Exclusiones, enumeradas una por una**, que es lo que la primera emisión no hizo. Las **siete clases
estables de §VI.3.2 se citan y no se reescriben**:

| Ocurrencia viva | Cuántas | Clase |
|---|---|---|
| `Master-Prompt.md`, fila `6.0` del control de cambios | 2 | «Filas de control de cambios» |
| `CHANGELOG.md`, entrada **11.2** de esta intervención | 1 | «Filas de control de cambios» |
| `Guides/Coherencia-Reportes-00-11.md` línea 92 | 1 | «Notas de coherencia anteriores» |
| **Esta nota**, §3, que escribe los patrones para poder convertirlos | 10 | «La declaración de la propia intervención», séptima clase |

**Y una segunda comprobación, por el riesgo de renumeración.** §13 se insertó **antes** del control de
cambios, que pasa de §13 a §14. Barrido del patrón `` `Root-Rules.md` §13 `` sobre el árbol vivo antes
de la edición: **cero ocurrencias**. Ninguna cita queda colgada.

## 4. Verificación — las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 intactas | **Sin violaciones** |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol |
| 3 | Referencias internas resuelven | **Cero rotos**: §13 no existía como cita y §14 tampoco |
| 4 | Sin contradicción con lo que ya estaba | **Sin contradicciones.** §4.1 punto 2 **se refina y se cita**, no se reemplaza |
| 5 | Control de cambios actualizado | **Una fila por archivo** en los tres que suben versión |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | **Sin cambios colaterales**, tres archivos |
| 8 | Barrido por concepto | **Residuo 1**, de clase estable, **y reconciliado contra el snapshot** |
| 9 | Coherencia interna | **Sin contradicciones internas** |
| 10 | Integridad del registro | **Verificado en los tres**: cabecera = última fila |
| 11 | Cobertura de la nota | **Esta nota** |
| 12 | Cobertura del catálogo | **Un criterio nuevo** registrado |
| **13** | **Devolución al origen** | **Abajo** |

### Comprobación 13 — los criterios del origen, contestados

El origen es el tramo **T1**, y sus criterios de aceptación se transcriben acá porque la comprobación 2
impide citarlos desde afuera:

| # | Criterio de T1 | Veredicto |
|---|---|---|
| 1 | El agente puede resolver un conflicto **entre reglas** con una cita | **Cumplido**: §13, tres criterios ordenados, y el de jerarquía con un **test abierible** —¿viaja en todo despacho?— en lugar de la palabra «transversal», que el corpus usa también para seis archivos |
| 2 | **No se deroga** la detención por arbitraje | **Cumplido**: §13 declara la frontera y §4.1 punto 2 conserva el arbitraje para el resto |
| 3 | Se **funda hacia atrás** la resolución ya aplicada de §4.2.9 contra §12.2 | **Cumplido**: §13 la nombra como el caso medido que la originó |
| 4 | La precedencia **llega a quien se choca con el conflicto** | **Cumplido en la reemisión.** La primera lo declaró cumplido tocando sólo §10 —el despacho del **auditor**—; §8, que construye el despacho del **subagente que genera**, seguía cerrando en §12. Ahora los **cuatro** lugares nombran §13 |
| 5 | Ningún documento generado deja de cumplir | **Cumplido**: es un criterio de resolución, no una estructura obligatoria |

## 5. La auditoría independiente, y qué reemitió

**Dos auditores independientes, con encargo de refutar, devolvieron `RECHAZADO`.** Coincidieron en el
mismo P0 y cada uno aportó uno propio:

| Hallazgo | Qué se corrigió |
|---|---|
| **P0 · §13 no llegaba al despacho de generación** | `Master-Prompt.md` §8 líneas de insumos y la regla que declara **cuántas** secciones transversales viajan: de cuatro a **cinco** |
| **P0 · `_legacy/11.1/` no contenía el 11.1** | El snapshot se tomó del árbol de trabajo con T0 ya aplicado. **Restituido desde el commit del 11.1 publicado**, que §VI.5 autoriza: *«no reescribe historia, la restituye»* |
| **P1 · La frontera no era decidible** | «Conflicto de intención» estaba definido como *«dos cosas aprobadas que quieren cosas distintas»*, que **describe a toda pareja de reglas**: con la cláusula de duda, §13 quedaba inerte. Ahora la frontera **es la pregunta previa de §8.1** — ¿el árbol contiene el dato que decide?— y el empate se nombra como el caso típico de arbitraje |
| **P1 · T0 sin registro** | La guía sube a **1.22** con su fila. La primera emisión invocó §VI.1 «corrección de redacción»; **borrar metadato estructurado no es redacción** |
| **P2 · Barrido angosto, glosa contradictoria, §9 contando mal, §4.1 contradiciéndose** | Corregidos, y los tres patrones faltantes entraron a la tabla de barrido |

**Y una afirmación falsa de la primera emisión, corregida:** el commit de T0 decía que `last_review`
estaba *«desfasado»*. **No lo estaba**: coincidía con la fecha de la cabecera legible. Se eliminó por
ser la mitad de un par duplicado, no por estar mal.

## 6. Observaciones

**El caso que originó esta sección se resolvió antes de que existiera.** En la 11.0 se decidió a favor
de §12.2 aplicando, sin nombrarlas, jerarquía y fecha. **La resolución fue correcta y no era
sostenible con cita** — que es exactamente lo que §8.1 exige. Se declara acá en lugar de dejarlo
implícito.

**Y un límite que conviene dejar escrito.** §13 ordena los tres criterios, pero **no dice qué hacer
cuando dos reglas del mismo nivel, la misma especificidad y la misma fecha se contradicen**. Ese caso
cae en el arbitraje por la cláusula de frontera, que es la salida conservadora. Si aparece medido, la
corrección barata es un cuarto criterio, no refinar los tres.

## 6. Veredicto

**CONFORME, en reemisión.** La primera emisión fue **RECHAZADA** por dos auditorías independientes.
Corregidos los dos P0 y los cinco hallazgos menores, las trece comprobaciones pasan, el residuo del
barrido es **1 de clase estable y reconciliado contra el snapshot**, las exclusiones están **enumeradas
una por una**, y el conjunto queda en **SDD 11.2**.
