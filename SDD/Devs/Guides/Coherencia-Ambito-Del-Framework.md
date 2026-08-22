# Nota de coherencia — El framework no tenía forma de nombrarse a sí mismo

**Documento:** Coherencia-Ambito-Del-Framework.md
**Versión:** 2.0 — reemitida tras auditoría independiente
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

## 2. Qué corrigió la reemisión

La primera emisión fue **RECHAZADA** por auditoría independiente. Los dos motivos decisivos, los dos
ciertos:

| Hallazgo | Corrección |
|---|---|
| **P0 · Se publicó minor lo que §VI.5 declara major** — *«se modifica una invariante D1-D9»* basta, sin condición | Se republica como **12.0**, con el bloque «Impacto sobre destinos existentes» |
| **P1 · La disyunción era falsa** — declaré que un identificador del framework *«no viaja a la documentación generada»*, y `Root-Rules.md` §7.1, cuyo `Archivo target` es `SDD/Docs/README.md`, nombra `AG-00`, `AG-05`, `AG-09` en su columna de responsable | **El fundamento se reescribe y sale reforzado**: los dos ámbitos **no colisionan en numeración** y **sí se citan a través de la frontera**; una cita por identificador **sólo resuelve si el identificador está bien formado** (R5). Que se lo cite desde afuera **es el motivo del ámbito propio** |
| **P1 · El barrido no cerraba** y usaba una categoría —«residuo correcto»— que §VI.3.2 no admite | Rehecho en §4, con las nueve como **exclusión propia enumerada con su motivo** |
| **P1 · Tres restatements de D3 quedaron falsos aguas abajo** | Corregidos, cada uno con su fila |
| **P1 · §III.7 se cumplió a medias** | Entra la cláusula de vigencia y la verificación D1–D9 **por archivo tocado** |
| **P2 · §9.2 se contradecía**: «las dos exclusiones» con una fila que se autodefinía como deuda | `AG-XX` **sale de la tabla de exclusiones** y pasa a ser **ítem diferido de §12.2** |

## 3. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Rules/Root-Rules.md` | 7.1 → **8.0** | §9.1 dos ámbitos y su relación; §9.2 retira la exclusión de `AG-XX` y alinea «familias alcanzadas»; §10 **R5** «único en su ámbito» |
| `README.md` | — | **D3**: «únicos en su ámbito declarado» |
| `Rules/Rules-Especificacion-Funcional.md` | 5.4 → **5.5** | §3.2 decía «producto, **como todo identificador**»: falso con dos ámbitos |
| `Orchestrator/Master-Prompt.md` | 8.10 → **8.11** | La tabla de invariantes que §5 presenta al usuario declaraba heredar D3 con la redacción vieja |
| `Rules/Rules-Documentacion.md` | 5.4 → **5.5** | §3.2 llamaba «del framework» a familias del producto |
| `CHANGELOG.md` | — | Entrada **12.0** con su bloque de impacto |
| `_legacy/11.2/` | — | Snapshot del conjunto superado, del **commit publicado**. **La carpeta se llama 11.2 porque archiva lo que 12.0 supera** |

## 4. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior | Forma vigente |
|---|---|---|
| El ámbito de unicidad deja de ser uno solo | `único(s) en el producto` **cuando habla del ámbito como si fuera uno** | `único(s) en su ámbito` |
| Una categoría declaraba su ámbito por generalización | `como todo identificador` | `el primero de los dos que declara §9.1` |

**Corrida sin distinguir mayúsculas, sobre el árbol vivo, con el patrón ampliado a `en todo el
producto` — la redacción alternativa que la primera corrida no cubrió:**

| Patrón | Antes | Reemplazadas | Residuo | Vivo |
|---|---|---|---|---|
| `único(s) en (el\|todo el) producto` | **12** | **3** | **9** | **16** |
| `como todo identificador` | **1** | **1** | **0** | **0** |

**Las identidades cierran**: `12 = 3 + 9` y `1 = 1 + 0`. El **vivo 16** son las 9 heredadas más **7 que
esta intervención escribe** —tres en esta nota, dos en filas de control de cambios nuevas y dos en la
entrada del `CHANGELOG`—.

**Exclusiones, enumeradas una por una con su motivo:**

| Ocurrencia | Cuántas | Clase o motivo |
|---|---|---|
| `Rules-Backlog-Tecnico.md` ×3, `Deriva-Rules.md`, `Rules-Documentacion.md` §3.2, `Master-Prompt.md` §3.4 y §15, `SDD-User-Guide.md` | **8** | **Exclusión propia del caso**: cada una nombra una **familia del producto**, cuyo ámbito **no cambió**. Decir que un `US-00001` es único en el producto sigue siendo verdadero y preciso |
| `Root-Rules.md`, fila **5.2** del control de cambios | **1** | Clase estable «Filas de control de cambios»: reenuncia R5 con la redacción de su fecha, y reescribirla falsearía el registro |
| Esta nota, las filas nuevas y la entrada del `CHANGELOG` | **7** | Clase estable «La declaración de la propia intervención» |

## 5. Verificación

### 5.1 Invariantes D1–D9, por archivo tocado (`§III.7` paso 4)

| Archivo | D1 | D2 | **D3** | D4 | D5 | D6 | D7 | D8 | D9 |
|---|---|---|---|---|---|---|---|---|---|
| `Root-Rules.md` | ✓ | ✓ | **modificada, es el objeto** | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| `README.md` | ✓ | ✓ | **modificada, es el objeto** | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| `Rules-Especificacion-Funcional.md` | ✓ | ✓ | ✓ conforme a la redacción nueva | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| `Master-Prompt.md` | ✓ | ✓ | ✓ ídem | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| `Rules-Documentacion.md` | ✓ | ✓ | ✓ ídem | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |

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
| 8 | Barrido por concepto | **Dos patrones**, identidades cerradas, exclusiones enumeradas una por una |
| 9 | Coherencia interna | §9.1, §9.2 y §10 R5 dicen lo mismo. **`AG-XX` ya no está a la vez «excluida» y «perteneciente»** |
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

**CONFORME, en reemisión.** La primera fue rechazada por dos motivos independientes, los dos ciertos y
los dos corregidos: **el bump** —§VI.5 obliga a major cuando se modifica una D1-D9— y **la disyunción**,
que era falsa y cuyo fundamento corregido **es más fuerte que el original**. El conjunto queda en
**SDD 12.0**.
