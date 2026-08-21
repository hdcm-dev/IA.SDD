# Nota de coherencia — La precedencia entre reglas, y la cita que §8.1 exigía y no existía

**Documento:** Coherencia-Precedencia-Entre-Reglas.md
**Versión:** 1.2 — segunda reemisión, tras dos rondas de auditoría independiente
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

**Antes** se cuenta sobre `_legacy/11.1/`, que es el conjunto congelado; **vivo** sobre el árbol de hoy.
La identidad que tiene que cerrar es **antes = reemplazadas + residuo heredado**, y **vivo** se verifica
aparte como **residuo heredado + lo que esta nota escribe**. La corrida es **sin distinguir mayúsculas**:
la primera la corrió con distinción y dejó dos ocurrencias vivas fuera del recuento.

| Patrón | Antes | Reemplazadas | Residuo heredado | Escrito por esta nota | Vivo |
|---|---|---|---|---|---|
| `§9 a §12` | **3** | **2** | **1** | 3 | **4** |
| `cuatro secciones transversales` | **5** | **1** | **4** | 2 | **6** |
| `§12 referencia pendiente)` | **1** | **1** | **0** | 2 | **2** |
| `las tres siguientes` | **1** | **1** | **0** | 2 | **2** |

**Las cuatro identidades cierran de los dos lados**: `3=2+1`, `5=1+4`, `1=1+0`, `1=1+0` para la primera;
y `4=1+3`, `6=4+2`, `2=0+2`, `2=0+2` para la segunda.

**Residuo heredado total: 5**, en cuatro ubicaciones, todas de clase estable.

**Exclusiones, enumeradas una por una**, que es lo que la primera emisión no hizo. Las **siete clases
estables de §VI.3.2 se citan y no se reescriben**:

| Ocurrencia | Cuántas | Clase |
|---|---|---|
| `Master-Prompt.md`, fila `6.0` del control de cambios | 2 | «Filas de control de cambios» |
| `Root-Rules.md`, fila `4.0` del control de cambios | 1 | «Filas de control de cambios» |
| `Guides/Coherencia-Reportes-00-11.md` líneas 49 y 92 | 2 | «Notas de coherencia anteriores» |
| **Esta nota**, §3, que escribe los patrones para poder convertirlos | 9 | «La declaración de la propia intervención», séptima clase |

**Las cinco heredadas y las nueve propias suman las catorce ocurrencias vivas de los cuatro patrones.**

---

## 4. Verificación — las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 intactas | **Sin violaciones** |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol |
| 3 | Referencias internas resuelven | **Cero rotos**: §13 no existía como cita y §14 tampoco |
| 4 | Sin contradicción con lo que ya estaba | **Sin contradicciones.** §4.1 punto 2 **se refina y se cita**, no se reemplaza |
| 5 | Control de cambios actualizado | **Una fila por archivo** en los **cuatro** que suben versión |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | **Sin cambios colaterales**: **cuatro** archivos con bump, más `CHANGELOG.md`, esta nota y `_legacy/11.1/` |
| 8 | Barrido por concepto | **Residuo heredado 5**, en cuatro ubicaciones de clase estable, **con las cuatro identidades reconciliadas contra el snapshot** |
| 9 | Coherencia interna | **Dos corregidas en esta reemisión**: `Root-Rules.md` §10 decía «las cuatro reglas» y tiene cinco —R1 aplicada a sí misma: se reescribe sin contar—, y esta nota tenía **dos secciones numeradas 6** |
| 10 | Integridad del registro | **Verificado en los cuatro**: cabecera = última fila |
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

## 7. Ítem diferido (`Root-Rules.md` §12.2)

| Campo | Valor |
|---|---|
| **Qué falta** | `SDD/Guides/SDD-Getting-Started-Guide.md` conserva la misma duplicación de versión que esta intervención corrigió en la guía de desarrollo, y `SDD-User-Guide.md` no tiene frontmatter: **tres guías, tres formas** |
| **Por qué no hoy** | `SDD-Getting-Started-Guide.md` **no tiene tabla de control de cambios**, así que modificarlo dejaría un cambio sin registro posible — el defecto que esta misma intervención corrigió en T0 |
| **Quién lo cierra** | La organización dueña del repositorio, en el tramo **T2.0** de unificación de cabeceras |
| **En qué evento** | La tabla de artefactos del plan de reestructuración, fila «Cabecera de todo artefacto del framework» |

**Se declara acá porque la auditoría lo levantó con el argumento correcto:** la corrección de T0 quedó
enunciada **sobre el caso** y no sobre la propiedad, que es el defecto de forma que la Parte IV de la
guía describe desde la 1.19.

## 8. El hueco de §VI.1 que esta intervención destapó y no corrige

**`SDD-Development-Guide.md` §VI.1 admite tres clases de bump —Ninguno, Minor, Major— y la comprobación
5 exige una fila de control de cambios en *cada archivo modificado*. Una fila empieza por su versión.**
De modo que un cambio de clase «Ninguno» **no tiene forma de registrarse**: o no se registra —y queda
invisible, que es lo que pasó en la primera emisión de T0— o se le inventa un bump que la tabla no
declara.

La fila 1.22 de la guía dice «Sube **patch**», y **`patch` no es una de las tres clases de §VI.1**. El
corpus ya usa esa palabra en otras filas —`Master-Prompt.md` fila 8.5 entre ellas—, de modo que **el
hueco es del framework y no de esta intervención**. Se declara y no se corrige acá: corregirlo es tocar
§VI.1, que es el tramo **T3**.

## 9. Veredicto

**CONFORME, en segunda reemisión.** Dos rondas de auditoría independiente devolvieron `RECHAZADO`. La
primera levantó dos **P0** —§13 no llegaba al despacho de generación, y `_legacy/11.1/` archivaba el
estado post-saneamiento—, los dos cerrados y verificados mecánicamente por la segunda ronda. La segunda
levantó que **la frontera había pasado de no resolver nada a resolverlo todo**, que el `CHANGELOG.md`
publicaba la formulación derogada, y que **esta nota declaraba verdes comprobaciones medible-falsas**:
el residuo, el recuento de archivos y la coherencia interna.

Corregido todo: la compuerta de intención **corre primero**, el `CHANGELOG.md` se reescribió contra el
texto vigente, el barrido se recorrió **sin distinguir mayúsculas** con sus cuatro identidades cerrando
de los dos lados, y §13 **estrena criterio de aceptación** en `Master-Prompt.md` §10. El conjunto queda
en **SDD 11.2**.

**Y queda dicho lo que no se corrigió**: el hueco de §VI.1 de §8 de esta nota, que es del framework y se
trata en su propio tramo.
