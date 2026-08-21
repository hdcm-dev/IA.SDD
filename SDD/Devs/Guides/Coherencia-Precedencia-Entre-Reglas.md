# Nota de coherencia — La precedencia entre reglas, y la cita que §8.1 exigía y no existía

**Documento:** Coherencia-Precedencia-Entre-Reglas.md
**Versión:** 1.0
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
| `CHANGELOG.md` | — | Entrada **11.2** |
| `_legacy/11.1/` | — | Snapshot del conjunto superado, tomado del estado sin editar |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| El rango de transversales suma una sección | `§9 a §12` | `§9 a §13` |

**Resultado de la corrida, sobre el árbol vivo:**

| Patrón | Antes | Reemplazadas | **Residuo** |
|---|---|---|---|
| `§9 a §12` | **3** en 1 archivo | **2** | **1** |

**Reconciliación contra el snapshot**, que es lo que la 10.0 no hizo: `grep -c` sobre
`_legacy/11.1/` da **3**, y **3 = 2 + 1**. La identidad cierra.

**Exclusiones.** Las **siete clases estables de §VI.3.2 se citan y no se reescriben**. El residuo **1**
es `Master-Prompt.md:1634`, **fila de control de cambios** de la versión 6.0 — clase «Filas de control
de cambios»: reescribirla falsearía el registro.

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
| 1 | El agente puede resolver un conflicto **entre reglas** con una cita | **Cumplido**: §13, tres criterios ordenados |
| 2 | **No se deroga** la detención por arbitraje | **Cumplido**: §13 declara la frontera y §4.1 punto 2 conserva el arbitraje para el resto |
| 3 | Se **funda hacia atrás** la resolución ya aplicada de §4.2.9 contra §12.2 | **Cumplido**: §13 la nombra como el caso medido que la originó |
| 4 | La precedencia **llega a quien se choca con el conflicto** | **Cumplido**: el rango del despacho pasa a §9 a §13 |
| 5 | Ningún documento generado deja de cumplir | **Cumplido**: es un criterio de resolución, no una estructura obligatoria |

## 5. Observaciones

**El caso que originó esta sección se resolvió antes de que existiera.** En la 11.0 se decidió a favor
de §12.2 aplicando, sin nombrarlas, jerarquía y fecha. **La resolución fue correcta y no era
sostenible con cita** — que es exactamente lo que §8.1 exige. Se declara acá en lugar de dejarlo
implícito.

**Y un límite que conviene dejar escrito.** §13 ordena los tres criterios, pero **no dice qué hacer
cuando dos reglas del mismo nivel, la misma especificidad y la misma fecha se contradicen**. Ese caso
cae en el arbitraje por la cláusula de frontera, que es la salida conservadora. Si aparece medido, la
corrección barata es un cuarto criterio, no refinar los tres.

## 6. Veredicto

**CONFORME.** Las trece comprobaciones pasan, el residuo del barrido es **1 de clase estable y
reconciliado contra el snapshot**, y el conjunto queda en **SDD 11.2**.
