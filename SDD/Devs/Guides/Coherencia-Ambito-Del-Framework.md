# Nota de coherencia — El framework no tenía forma de nombrarse a sí mismo

**Documento:** Coherencia-Ambito-Del-Framework.md
**Versión:** 1.0
**Fecha:** 2026-08-21
**Versión del conjunto resultante:** SDD **11.3**
**Origen:** El tramo **T2**, paso 1, del plan de reestructuración; sus criterios de aceptación se
transcriben en §4 por la comprobación 13

---

## 1. Alcance

**`Root-Rules.md` §9 declaraba un solo ámbito de unicidad —el producto— y por eso el único
identificador propio del framework estaba excluido del sistema, con motivo escrito.**

El motivo era correcto: `AG-XX` *«no cataloga un elemento de una colección de un producto»*. Y dejaba
una consecuencia que nadie había nombrado: **el framework no tenía forma de nombrarse a sí mismo**. Sus
artefactos se identifican por **ruta y nombre de archivo**, que es exactamente lo que §10 **R5** declara
que **no es identidad**: *«una ruta relativa codifica dos cosas: la identidad del documento destino y la
posición relativa… la segunda se rompe cuando algo la altera»*.

**Entra un segundo ámbito: el conjunto normativo vigente.** Los dos son **disjuntos por
construcción** — un identificador del framework no viaja a la documentación generada, no entra en su
trazabilidad y no compite con las familias del producto.

**Lo que esta intervención NO hace, y es deliberado:** **no asigna ningún identificador y no renumera
`AG-XX`.** Declara el ámbito. La renumeración a cinco dígitos alcanza **585 ocurrencias en 36
archivos** y es un tramo propio: meterla acá dejaría esta etapa sin ser verificable por sí sola, contra
el contrato de segmentación de §VI.3.

## 2. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Rules/Root-Rules.md` | 7.1 → **7.2** | §9.1 declara **dos ámbitos** y la exclusión de `_legacy/` del espacio de candidatos; §9.2 **conserva** la exclusión de `AG-XX` **y le cambia el motivo**; §10 **R5** pasa de «único en el producto» a «único en su ámbito» |
| `README.md` | — | **D3** pasa de *«únicos en el producto»* a *«únicos en su ámbito declarado»*, con los dos ámbitos nombrados |
| `CHANGELOG.md` | — | Entrada **11.3** |
| `_legacy/11.2/` | — | Snapshot del conjunto superado, tomado del **commit publicado**, no del árbol de trabajo |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior | Forma vigente |
|---|---|---|
| El ámbito de unicidad deja de ser uno solo | `únicos en el producto` / `único en el producto` | `únicos en su ámbito declarado` / `único en su ámbito` |

**Resultado, sobre el árbol vivo y sin distinguir mayúsculas:**

| Patrón | Antes | Reemplazadas | Residuo | Vivo |
|---|---|---|---|---|
| `único(s) en el producto` | **11** | **2** | **9** | **9** |

**La identidad cierra: `11 = 2 + 9`.** Y **el residuo 9 no es residuo excluido: es residuo correcto.**

**Por qué no se tocan las nueve.** Cada una nombra una **familia del producto** —`US`, `BT`, `EP`,
`SUP`, `CMP`, `DOC` y las de `Master-Prompt.md` §3.4—, cuyo ámbito **no cambió**. Decir que un
`US-00001` es único en el producto sigue siendo verdadero y preciso. **Las dos que sí cambiaron son las
que hablaban del ámbito como si fuera uno solo**: D3 y `Root-Rules.md` §10 R5.

**Exclusiones propias del caso:** ninguna. Las **siete clases estables de §VI.3.2 se citan y no se
reescriben**; ninguna ocurrencia cae en ellas.

## 4. Verificación — las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 intactas | **D3 se modifica, declarado.** Es el objeto de la intervención; las otras ocho intactas |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol |
| 3 | Referencias internas resuelven | **Cero rotos**: no se movió ni renombró nada |
| 4 | Sin contradicción con lo que ya estaba | **Sin contradicciones**: la exclusión de `AG-XX` se conserva, con motivo actualizado, en lugar de quedar huérfana |
| 5 | Control de cambios **en cada archivo modificado** | **Una fila** en `Root-Rules.md`. `README.md` y `CHANGELOG.md` **no tienen tabla de registro**, y eso queda declarado en §6 |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | **Sin cambios colaterales**: dos archivos normativos, más el `CHANGELOG`, esta nota y el snapshot |
| 8 | Barrido por concepto | **Residuo 9, correcto por ámbito**, con la identidad reconciliada |
| 9 | Coherencia interna | **Sin contradicciones internas**: §9.1, §9.2 y §10 R5 dicen lo mismo sobre el ámbito |
| 10 | Integridad del registro | **Verificado**: cabecera 7.2 = última fila 7.2 |
| 11 | Cobertura de la nota | **Esta nota** |
| 12 | Cobertura del catálogo | **Sin criterios nuevos**: no entra ninguna decisión que un agente deba tomar. Se declara un ámbito |
| **13** | **Devolución al origen** | **Abajo** |

### Comprobación 13 — los criterios del origen, contestados

| # | Criterio de T2 paso 1 | Veredicto |
|---|---|---|
| 1 | El framework puede nombrarse a sí mismo | **Cumplido**: §9.1 declara su ámbito |
| 2 | Los dos ámbitos no se pisan | **Cumplido**: disjuntos por construcción, declarado en §9.1 |
| 3 | `_legacy/` fuera del espacio de candidatos | **Cumplido**, con el motivo de volumen escrito |
| 4 | **No se renumera nada todavía** | **Cumplido**: la exclusión de `AG-XX` se conserva con motivo de migración pendiente |
| 5 | Ningún documento generado deja de cumplir | **Cumplido**: las familias del producto no cambian de ámbito |

## 5. Observaciones

**El motivo de la exclusión cambió y la exclusión se quedó, y es la parte que conviene mirar.** Antes
`AG-XX` estaba afuera **porque no pertenecía al sistema**; ahora está afuera **porque su migración está
pendiente**. Es una diferencia de naturaleza: la primera era una decisión, la segunda es una deuda con
fecha de vencimiento en el tramo siguiente.

## 6. Ítem diferido (`Root-Rules.md` §12.2)

| Campo | Valor |
|---|---|
| **Qué falta** | La renumeración de `AG-XX` a cinco dígitos: **585 ocurrencias en 36 archivos** |
| **Por qué no hoy** | Meterla en esta etapa la dejaría sin ser verificable por sí sola, contra el contrato de segmentación de §VI.3 — y tres rondas de auditoría sobre la 11.2 mostraron que un barrido grande mezclado con un cambio normativo es donde el método falla |
| **Quién lo cierra** | La organización dueña del repositorio |
| **En qué evento** | La tabla de artefactos del plan de reestructuración, tramo de renumeración de roles |

**Y una limitación declarada de la comprobación 5:** `README.md` y `CHANGELOG.md` **no tienen tabla de
control de cambios**, de modo que un cambio en ellos **no se puede registrar en el archivo**. Es el
mismo hueco de §VI.1 que la 11.2 declaró y no corrigió.

## 7. Veredicto

**CONFORME.** Las trece comprobaciones pasan, el barrido reconcilia con **residuo correcto por ámbito**
y sin exclusiones propias, y el conjunto queda en **SDD 11.3**.
