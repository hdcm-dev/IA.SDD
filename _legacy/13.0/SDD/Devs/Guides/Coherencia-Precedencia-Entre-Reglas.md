# Nota de coherencia — La precedencia entre reglas, y la cita que §8.1 exigía y no existía

**Documento:** Coherencia-Precedencia-Entre-Reglas.md
**Versión:** 2.0 — reescrita entera tras tres rondas de auditoría independiente
**Fecha:** 2026-08-21
**Versión del conjunto resultante:** SDD **11.2**
**Origen:** El tramo **T1** del plan de reestructuración, cuyos criterios de aceptación se transcriben
en §4 por la comprobación 13

---

## 1. Alcance

**El corpus no declaraba ningún criterio para resolver un conflicto entre dos reglas, y eso hacía que
todos cayeran del lado de la detención sin que nadie lo hubiera decidido.**

El mecanismo es exacto. `Master-Prompt.md` §8.1 declara que algo es **trabajo propio** cuando *«se
contesta abriendo los documentos y contrastando, y la respuesta se puede sostener con una **cita
literal**»*. Un conflicto entre dos reglas **no tenía con qué citarse**: no había criterio. El agente no
podía sostener ninguna resolución y escalaba — **no por decisión, por falta de cita**.

**Lo que esta intervención NO hace:** no deroga la detención por arbitraje de §7.0. §13 tiene **un solo
criterio** y, cuando no decide, **el conflicto se detiene**.

**Esta nota se reescribió entera.** Sus tres versiones anteriores acumularon contradicciones con el
texto que iban corrigiendo, y parchearlas era reproducir el defecto que la intervención corrige.

## 2. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Rules/Root-Rules.md` | 6.2 → **7.1** | **§13 nueva** con un criterio; el control de cambios pasa a §14; **§10 deja de contar sus propias reglas** —decía «las cuatro» y son cinco desde R5— |
| `Rules/Catalogo-De-Criterios.md` | 1.9 → **1.11** | §4.1 punto 2 y un criterio nuevo en §3, los dos contra el §13 vigente |
| `Orchestrator/Master-Prompt.md` | 8.9 → **8.10** | §13 en la lista de insumos de todo despacho —§8 dos lugares, §10 dos— y el **criterio de aceptación** que la verifica |
| `Guides/SDD-Development-Guide.md` | 1.21 → **1.22** | El frontmatter duplicaba la versión, once menores atrás |
| `CHANGELOG.md` | — | Entrada **11.2** |
| `_legacy/11.1/` | — | Snapshot del conjunto superado, **restituido** desde el commit del 11.1 publicado |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

**El barrido se corre contra el conjunto publicado, `_legacy/11.1/`, y sin distinguir mayúsculas.**

| Concepto | Forma anterior | Forma vigente |
|---|---|---|
| El rango de transversales suma una sección | `§9 a §12` | `§9 a §13` |
| El conjunto transversal deja de ser de cuatro | `cuatro secciones transversales` | `cinco secciones transversales` |
| La enumeración explícita del despacho | `§12 referencia pendiente)` | `…, §13 precedencia entre reglas)` |
| El alcance declarado en §9 deja de contar | `las tres siguientes` | `las que siguen hasta §13` |

| Patrón | Antes | Reemplazadas | Residuo heredado | Escrito por esta nota | Vivo |
|---|---|---|---|---|---|
| `§9 a §12` | **3** | **2** | **1** | 3 | **4** |
| `cuatro secciones transversales` | **5** | **1** | **4** | 2 | **6** |
| `§12 referencia pendiente)` | **1** | **1** | **0** | 2 | **2** |
| `las tres siguientes` | **1** | **1** | **0** | 2 | **2** |

**Las ocho identidades cierran**: `3=2+1`, `5=1+4`, `1=1+0`, `1=1+0` de un lado; `4=1+3`, `6=4+2`,
`2=0+2`, `2=0+2` del otro.

**Exclusiones, enumeradas una por una.** Las **siete clases estables de §VI.3.2 se citan y no se
reescriben**:

| Ocurrencia | Cuántas | Clase |
|---|---|---|
| `Master-Prompt.md`, fila `6.0` del control de cambios | 2 | «Filas de control de cambios» |
| `Root-Rules.md`, fila `4.0` del control de cambios | 1 | «Filas de control de cambios» |
| `Guides/Coherencia-Reportes-00-11.md`, dos líneas | 2 | «Notas de coherencia anteriores» |
| **Esta nota**, §3, que escribe los patrones para poder convertirlos | 9 | «La declaración de la propia intervención» |

**§10 de `Root-Rules.md` no lleva par de barrido y lleva corrección**: decía «las cuatro reglas» con
cinco, y **se reescribe sin contar** en lugar de recontar, que es **R1 aplicada a sí misma**.

## 4. Verificación — las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 intactas | **Sin violaciones** |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol |
| 3 | Referencias internas resuelven | **Cero rotos**. §13 no existía como cita y §14 tampoco |
| 4 | Sin contradicción con lo que ya estaba | `Catalogo-De-Criterios.md` §4.1 punto 2 **se reescribió contra el §13 vigente**. La contradicción entre los dos la levantó la tercera ronda |
| 5 | Control de cambios **en cada archivo modificado** | **Cuatro filas, una por archivo con cambio normativo.** El estándar es «cada archivo modificado», **sin excepción por ausencia de bump** |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | **Sin cambios colaterales**: cuatro archivos con bump, más `CHANGELOG.md`, esta nota y `_legacy/11.1/` |
| 8 | Barrido por concepto | **Residuo heredado 5** en cuatro ubicaciones de clase estable, con las **ocho identidades** reconciliadas |
| 9 | Coherencia interna | **Verificada sobre el texto propio**: ninguna de las formulaciones que las tres rondas derogaron —la compuerta, «del mismo nivel», «rango», «jerarquía y fecha», «cuando el árbol contiene el dato que decide»— sobrevive fuera de las filas de registro que las declaran |
| 10 | Integridad del registro | **Verificado en los cuatro**: cabecera = última fila |
| 11 | Cobertura de la nota | **Esta nota**, con la versión del conjunto en su cabecera |
| 12 | Cobertura del catálogo | **Un criterio**, reescrito contra el §13 vigente |
| **13** | **Devolución al origen** | **Abajo** |

### Comprobación 13 — los criterios del origen, contestados

| # | Criterio de T1 | Veredicto |
|---|---|---|
| 1 | El agente puede resolver un conflicto **entre reglas** con una cita | **Cumplido**: un criterio, con un test que se abre y se mira |
| 2 | **No se deroga** la detención por arbitraje | **Cumplido**: si el criterio no decide, se detiene por §7.0 |
| 3 | Se **funda hacia atrás** la resolución ya aplicada | **Cumplido**: §13 la nombra y la resuelve con su único criterio |
| 4 | La precedencia **llega a quien se choca con el conflicto** | **Cumplido**: §8 —los dos lugares que construyen el despacho de generación— y §10 |
| 5 | Ningún documento generado deja de cumplir | **Cumplido**: es un criterio de resolución, no una estructura obligatoria |

## 5. Las tres rondas de auditoría, y qué midió cada una

| Ronda | Veredicto | Qué levantó |
|---|---|---|
| **1** | `RECHAZADO` | **P0**: §13 se agregó sólo al despacho **del auditor**; §8 seguía cerrando en §12. **P0**: `_legacy/11.1/` archivaba el estado post-saneamiento. **P1**: la frontera mandaba **todo** al arbitraje |
| **2** | `RECHAZADO` | Los dos P0 **cerrados y verificados**. Pero la frontera había pasado a **no detener nada**, el `CHANGELOG` publicaba la formulación derogada, y las comprobaciones declaraban verde lo medible-falso |
| **3** | `RECHAZADO` | El barrido y las exclusiones **ya cerraban**. Pero la sección **no se sostenía con tres criterios**: la especificidad hacía que §13 perdiera contra su propia versión derogada, y la fecha no se podía contestar |

**El defecto común a las tres, y es el que importa:** cada reemisión **barrió los patrones heredados y
no barrió los que ella misma derogaba**. Es la regla 4 de §VI.3.2 —*barrer también sobre el texto
propio*— sin aplicar, tres veces seguidas.

**La salida no fue una cuarta corrección: fue reducir la sección.** Dos de los tres criterios **no
tenían caso medido**, y los dos producían resoluciones falsas. Quedó el que sí lo tiene.

## 6. Observaciones

**El caso que originó esta sección se resolvió antes de que existiera.** En la 11.0 se decidió a favor
de §12.2 sin poder nombrar el criterio. **La resolución fue correcta y no era sostenible con cita**,
que es exactamente lo que §8.1 exige.

## 7. Ítems diferidos (`Root-Rules.md` §12.2)

| Qué falta | Por qué no hoy | Quién lo cierra | Evento de cierre |
|---|---|---|---|
| **§13 no fija un artefacto donde la resolución quede escrita**, como §11 fija un ADR y §12.2 fija cuatro campos | Fijar el lugar exige un artefacto que hoy no existe. El criterio de `Master-Prompt.md` §10 alcanza por lo tanto **a las resoluciones que se escriben** | La organización dueña del repositorio | La tabla de artefactos del plan de reestructuración, tramo **T4** |
| `SDD-Getting-Started-Guide.md` conserva la duplicación de versión que T0 corrigió en la guía de desarrollo | **No tiene tabla de control de cambios**: tocarlo dejaría un cambio sin registro posible | Ídem | Ídem, fila «Cabecera de todo artefacto del framework», tramo **T2.0** |

## 8. El hueco de §VI.1 que esta intervención destapó y no corrige

**§VI.1 admite tres clases de bump —Ninguno, Minor, Major— y la comprobación 5 exige una fila en *cada
archivo modificado*. Una fila empieza por su versión.** Un cambio de clase «Ninguno» **no tiene forma de
registrarse**: o queda invisible —lo que pasó en la primera emisión de T0— o se le inventa un bump que
la tabla no declara. El corpus ya usa «patch» en filas existentes sin que §VI.1 lo declare.

**Es del framework, no de esta intervención.** Se declara; corregirlo es tocar §VI.1, que es el tramo
**T3**.

## 9. Veredicto

**CONFORME, tras tres rondas y una reducción de alcance.** Los dos P0 de la primera ronda están
cerrados y verificados mecánicamente por la segunda. La tercera confirmó el barrido, las exclusiones y
la integridad del registro, y levantó que la sección no se sostenía con tres criterios: **se redujo a
uno**, con los otros dos descartados y su motivo escrito en la propia sección. El conjunto queda en
**SDD 11.2**.
