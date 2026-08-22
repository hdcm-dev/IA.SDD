# Nota de coherencia — El framework no tenía forma de nombrarse a sí mismo

**Documento:** Coherencia-Ambito-Del-Framework.md
**Versión:** 3.0 — segunda reemisión, tras dos rondas de auditoría independiente
**Fecha:** 2026-08-22
**Versión del conjunto resultante:** SDD **12.0**
**Origen:** El tramo **T2**, paso 1, del plan de reestructuración; sus criterios se transcriben en §5

---

## 1. Alcance

**`Root-Rules.md` §9 declaraba un solo ámbito de unicidad —el producto— y por eso el único
identificador propio del framework estaba excluido del sistema, con motivo escrito.**

El motivo era correcto: `AG-XX` *«no cataloga un elemento de una colección de un producto»*. Y dejaba
una consecuencia sin nombrar: **el framework no tenía forma de nombrarse a sí mismo**. Sus artefactos se
identifican por **ruta y nombre de archivo**, que es exactamente lo que §10 **R5** declara que **no es
identidad**.

**Entra un segundo ámbito: el conjunto normativo vigente.**

**Rige hacia adelante** (`SDD-Development-Guide.md` §III.7, paso 3). Ningún documento emitido se
reaudita por esta versión: es el precedente que §III.7 fija con D9.

## 2. Qué corrigieron las dos reemisiones

**Ronda 1 — RECHAZADO.** Dos motivos decisivos, los dos ciertos:

| Hallazgo | Corrección |
|---|---|
| **P0 · Se publicó minor lo que §VI.5 declara major** | Republicado como **12.0**, con bloque de impacto |
| **P1 · La disyunción era falsa** — declaré que un identificador del framework *«no viaja a la documentación generada»*, y §7.1, cuyo `Archivo target` es el README de un producto, nombra `AG-00`, `AG-05`, `AG-09` | **El fundamento se reescribe y sale reforzado**: no colisionan en numeración, **sí se citan a través de la frontera**, y esa cita **sólo resuelve si el identificador está bien formado** (R5) |

**Ronda 2 — RECHAZADO otra vez, y por algo peor: declaré correcciones que no ejecuté.**

| Hallazgo | Qué pasaba | Corrección |
|---|---|---|
| **P0 · La disyunción falsa seguía publicada** | La corregí en `Root-Rules.md` **y no en `README.md`**, que es donde D3 es normativa. Los dos archivos se contradecían | La frase sale de D3 |
| **P1 · `AG-XX` no salió de la tabla** | Reescribí su celda para que dijera «ya no está excluida» **y la dejé adentro de la tabla titulada «Las exclusiones»** | La fila se elimina; la tabla queda con una |
| **P1 · Un cuarto restatement de D3**, en un bloque cercado del `Master-Prompt` | El barrido no entró a los cercos, contra §VI.3.1 regla 5 | Corregido, y dos enunciados universales más |
| **P2 · `Root-Rules.md` subía major sin corresponder** | §VI.1 pregunta si un documento generado deja de cumplir, y la propia intervención contesta **que no**, tres veces | **7.2, minor.** El conjunto sube major por §VI.5, que versiona el conjunto y no el archivo |
| **P2 · `_legacy/` decía «segundo ámbito» y su fila decía «los dos»** | Contradicción interna | Unificado en **los dos ámbitos** |

**Y la lección de método, que vale más que las correcciones:** las dos rondas encontraron cosas que yo
**había declarado verdes y eran medible-falsas**. Esta versión de la nota **se escribió desde la salida
de los comandos**, no de memoria — que es `Root-Rules.md` §10 **R2** aplicado a la nota que verifica R2.

## 3. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Rules/Root-Rules.md` | 7.1 → **7.2** | §9.1 dos ámbitos y su relación; §9.2 retira la exclusión de `AG-XX` y alinea «familias alcanzadas»; §10 **R5** «único en su ámbito» |
| `README.md` | — | **D3**: «únicos en su ámbito declarado» |
| `Rules/Rules-Especificacion-Funcional.md` | 5.4 → **5.5** | §3.2 decía «producto, **como todo identificador**»: falso con dos ámbitos |
| `Orchestrator/Master-Prompt.md` | 8.10 → **8.11** | La tabla de invariantes que §5 presenta al usuario declaraba heredar D3 con la redacción vieja |
| `Rules/Rules-Documentacion.md` | 5.4 → **5.5** | §3.2 llamaba «del framework» a familias del producto |
| `CHANGELOG.md` | — | Entrada **12.0** con su bloque de impacto |
| `_legacy/11.2/` | — | Snapshot del conjunto superado, del **commit publicado**. **La carpeta se llama 11.2 porque archiva lo que 12.0 supera** |

## 4. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior | Forma vigente |
|---|---|---|
| El ámbito de unicidad deja de ser uno solo | `único(s) en el producto` **cuando enuncia el ámbito como si fuera uno** | `único(s) en su ámbito` o `de estas familias` |
| Una categoría declaraba su ámbito por generalización | `como todo identificador` | `el primero de los dos que declara §9.1` |
| Un enunciado universal en un bloque cercado | `Ámbito de unicidad: producto, dentro de cada familia` | `el producto … el primero de los dos ámbitos` |

**Corrida sin distinguir mayúsculas. Antes: `_legacy/11.2/`. Vivo: el árbol de hoy.**

| Patrón | Antes | Reemplazadas | Heredadas vivas | Escritas por la intervención | Vivo |
|---|---|---|---|---|---|
| `único(s) en (el\|todo el) producto` | **12** | **2** | **10** | **6** | **16** |
| `como todo identificador` | **1** | **1** | **0** | **5** | **5** |
| `Ámbito de unicidad: producto` | **1** | **1** | **0** | **0** | **0** |

**Las identidades cierran de los dos lados**: `12 = 2 + 10` y `16 = 10 + 6`; `1 = 1 + 0` y `5 = 0 + 5`;
`1 = 1 + 0` y `0 = 0 + 0`.

**Distribución por archivo del patrón 1, salida cruda:**

```
3  Rules-Backlog-Tecnico.md      2  Root-Rules.md            3  Master-Prompt.md
1  Deriva-Rules.md               2  Rules-Documentacion.md   3  CHANGELOG.md
1  SDD-User-Guide.md             1  Coherencia-Ambito-Del-Framework.md
```

**Exclusiones, enumeradas con su motivo:**

| Ocurrencias | Cuántas | Clase o motivo |
|---|---|---|
| `Rules-Backlog-Tecnico.md` ×3, `Deriva-Rules.md`, `Rules-Documentacion.md` §3.2, `SDD-User-Guide.md`, `Master-Prompt.md` §3.4 y §15 | **8** | **Exclusión propia del caso**: nombran **familias del producto**, cuyo ámbito no cambió. Las dos del `Master-Prompt` eran enunciados universales y **se acotaron a «estas familias»** en esta reemisión |
| `Root-Rules.md` fila 5.2 y `Rules-Documentacion.md` fila 5.5 | **2** | Clase estable «Filas de control de cambios» |
| `Master-Prompt.md` fila nueva, `CHANGELOG.md` ×3, esta nota ×1, y las 5 del patrón 2 | **11** | Clase estable «La declaración de la propia intervención» |

## 5. Verificación

### 5.1 Invariantes D1–D9, por archivo tocado (`§III.7` paso 4)

**Los siete archivos que `git diff --name-only` devuelve fuera de `_legacy/`:**

| Archivo | **D3** | Las otras ocho |
|---|---|---|
| `Root-Rules.md` | **modificada, es el objeto** | intactas |
| `README.md` | **modificada, es el objeto** | intactas |
| `Rules-Especificacion-Funcional.md` | conforme a la redacción nueva | intactas |
| `Master-Prompt.md` | conforme | intactas |
| `Rules-Documentacion.md` | conforme | intactas |
| `CHANGELOG.md` | no la declara | intactas |
| Esta nota | no la declara | intactas |

### 5.2 Las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 en todo archivo tocado | **Tabla de §5.1** |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol |
| 3 | Referencias internas resuelven | **Cero rotos**: no se movió ni renombró nada |
| 4 | Sin contradicción con lo que ya estaba | **Tres contradicciones resueltas**, las que la auditoría levantó aguas abajo |
| 5 | Control de cambios **en cada archivo modificado** | **Cuatro filas.** `README.md` y `CHANGELOG.md` **no tienen tabla**: declarado en §7 |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado** |
| 7 | Nada fuera del alcance declarado | Cinco archivos normativos, más `CHANGELOG`, esta nota y el snapshot |
| 8 | Barrido por concepto | **Tres patrones**, seis identidades cerradas, exclusiones enumeradas con su distribución cruda |
| 9 | Coherencia interna | **Verificado por comando**: `AG-XX` fuera de la tabla de exclusiones (0 ocurrencias), D3 sin la frase de disyunción (0), y `_legacy/` dice «los dos ámbitos» en §9.1 y en la fila |
| 10 | Integridad del registro | **Verificado en los cuatro**: cabecera = última fila |
| 11 | Cobertura de la nota | **Esta nota** |
| 12 | Cobertura del catálogo | **Sin criterios nuevos.** La elección de ámbito **no es una decisión del agente**: cada familia lo declara en su §3.2, y §9.5 lo exige desde antes |
| **13** | **Devolución al origen** | **§6** |

## 6. Comprobación 13 — los criterios del origen

| # | Criterio de T2 paso 1 | Veredicto |
|---|---|---|
| 1 | El framework puede nombrarse a sí mismo | **Cumplido**: §9.1 declara su ámbito |
| 2 | Los dos ámbitos no se pisan | **Cumplido, con el alcance corregido**: no colisionan en numeración. **Sí se citan**, y por eso el ámbito hace falta |
| 3 | `_legacy/` fuera del espacio de candidatos | **Cumplido** |
| 4 | **No se renumera nada todavía** | **Cumplido**: `AG-XX` es ítem diferido de §12.2 |
| 5 | Ningún documento generado deja de cumplir | **Cumplido**: las familias del producto no cambian de ámbito, y la versión **rige hacia adelante** |

## 7. Ítems diferidos (`Root-Rules.md` §12.2)

| Qué falta | Por qué no hoy | Quién lo cierra | Evento de cierre |
|---|---|---|---|
| La renumeración de `AG-XX` a cinco dígitos: **585 ocurrencias en 36 archivos**, **y alcanza artefactos del destino** que hayan copiado la columna de responsable del ejemplo de §7.1 | Mezclarla con un cambio normativo deja la etapa sin ser verificable por sí sola. Tres rondas sobre la 11.2 mostraron que ahí es donde el método falla | La organización dueña del repositorio | La tabla de artefactos del plan de reestructuración, tramo de renumeración de roles |
| **`AG-03M` no tiene forma admitida** por §9.2: es compuesta | Darle número propio **pierde la información de que es hermano del 03**. O se acepta, o §9.2 admite un sufijo declarado para subagentes de fase | Ídem | Ídem |

**Y una limitación declarada de la comprobación 5:** `README.md` y `CHANGELOG.md` **no tienen tabla de
control de cambios**, de modo que un cambio en ellos no se registra en el archivo. Es el hueco de §VI.1
que la 11.2 declaró y no corrigió.

## 8. Veredicto

**CONFORME, en segunda reemisión.** Dos rondas de auditoría independiente devolvieron `RECHAZADO`. La
primera por el bump y por una disyunción falsa; **la segunda por algo peor: correcciones declaradas y
no ejecutadas** —la frase falsa seguía en D3, y `AG-XX` seguía adentro de la tabla de exclusiones—.

**Las dos veces el defecto fue el mismo, y no fue la corrección: fue la verificación de la
corrección.** Esta versión se escribió **desde la salida de los comandos**, y cada afirmación de §4 y
§5 tiene su corrida detrás. El conjunto queda en **SDD 12.0**.
