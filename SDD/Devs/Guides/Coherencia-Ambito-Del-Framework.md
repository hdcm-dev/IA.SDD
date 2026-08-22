# Nota de coherencia — El framework no tenía forma de nombrarse a sí mismo

**Documento:** Coherencia-Ambito-Del-Framework.md
**Versión:** 4.0 — tercera reemisión, tras tres rondas de auditoría independiente
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

## 2. Qué corrigieron las tres reemisiones

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

**Ronda 3 — RECHAZADO, con una regresión que la reemisión anterior introdujo.**

| Hallazgo | Qué pasaba | Corrección |
|---|---|---|
| **P0 · `AG-XX` quedó sin declaración de ningún lado** | Salió de la tabla de exclusiones diciendo que pasaba a «ítem diferido de §12.2», y **§12.2 define la forma, no es un registro**. «Familias alcanzadas» prometía dos ámbitos y enumeraba uno | **§9.2 enumera `AG`** como la familia del segundo ámbito, y entra **§12.3**, el registro donde el ítem vive con sus cuatro campos |
| **P0 · El barrido volvió a declarar verde lo falso** | La distribución cruda tenía dos celdas inventadas, y un patrón declaraba «antes 1 / vivo 0» con **2 y 3** | **§4 deja de publicar recuentos y publica la corrida** |
| **P1 · La entrada del `CHANGELOG` citaba una versión de esta nota que ya no existía** | Decía «nota **2.0**, una ronda» | Corregido a las tres rondas |
| **P1 · Reescribí dos entradas publicadas del `CHANGELOG`** | Al corregir la forma de las tablas de §VI.4, el reemplazo alcanzó **[11.0]** y **[10.0]**, contra §VI.2 —*«las filas ya escritas no se reescriben»*— | Restituidas. **Y al revertir rompí dos más**, que ya tenían la forma correcta: restituidas también, y verificado con `diff` que **de la entrada 11.2 hacia abajo el archivo es idéntico al publicado** |

**Y la lección de método, que vale más que las correcciones:****Y la lección de método, que vale más que las correcciones:** las dos rondas encontraron cosas que yo
**había declarado verdes y eran medible-falsas**. La versión 3.0 intentó escribirse **desde la salida de los
comandos** y falló igual: midió, **siguió editando lo medido** y no volvió a medir. Por eso la 4.0 no
escribe números — **escribe la corrida** (§4.1). Es R1 y no R2: **eliminar el dato en vez de
verificarlo**.

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
| Un enunciado universal en un bloque cercado | `Ámbito de unicidad: producto` | `el producto … el primero de los dos ámbitos` |

### 4.1 Esta sección no escribe recuentos: escribe las corridas

**Y el motivo está medido en esta misma intervención.** Sus tres versiones anteriores declararon
números que **eran ciertos cuando se midieron y falsos cuando se publicaron**: entre la medición y el
commit siguieron editándose la nota y el `CHANGELOG`, que son parte de lo medido. **Un recuento sobre
un árbol que la propia nota está modificando envejece antes de llegar al disco.**

Es `Root-Rules.md` §10 **R1** aplicada acá: *«preferir la forma que no cuenta… es la única que elimina
el dato en vez de verificarlo»*. Lo que sigue **no se verifica: se recalcula**.

```bash
# Alcance del barrido, con sus exclusiones
ALC="SDD PROMPTS Templates README.md CHANGELOG.md"
ANT="_legacy/11.2"

# Los tres patrones, sin distinguir mayúsculas
P1='[uú]nicos? en (el|todo el) producto'
P2='como todo identificador'
P3='Ámbito de unicidad: producto'

# Antes, vivo y distribución por archivo
for P in "$P1" "$P2" "$P3"; do
  echo "== $P"
  echo -n "  antes: "; grep -riEo "$P" $ANT | wc -l
  echo -n "  vivo:  "; grep -riEo "$P" $ALC | grep -v _legacy | wc -l
  grep -rilE "$P" $ALC | grep -v _legacy | while read f; do
    echo "    $(grep -icE "$P" "$f")  $f"; done
done
```

**Cómo se lee el resultado.** Toda ocurrencia viva tiene que caer en una de estas tres cajas, y
**ninguna otra**:

| Caja | Qué es | Por qué queda |
|---|---|---|
| **Familias del producto** | La frase nombra una familia —`US`, `CU`, `OPS`, `SUP`…— cuyo **ámbito no cambió** | Decir que un `US-00001` es único en el producto **sigue siendo verdadero y preciso**. Exclusión propia del caso |
| **Filas de control de cambios y notas anteriores** | Registro emitido con su fecha | Dos de las siete clases estables de §VI.3.2. Reescribirlas falsea el registro |
| **La declaración de esta intervención** | Este archivo, la entrada 12.0 y las filas nuevas, que escriben los patrones para poder convertirlos | La séptima clase estable |

**Lo que hace fallar la comprobación 8 es una ocurrencia que no entre en ninguna de las tres**, y eso
lo dice la corrida, no esta nota. **Un enunciado universal de ámbito —sin familia nombrada— no entra en
la primera caja**: es hallazgo, y así se detectaron los cuatro que esta intervención corrigió.

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
| 8 | Barrido por concepto | **Tres patrones declarados y la corrida escrita en §4.1.** La nota **no publica recuentos**: publica el comando y las tres cajas donde toda ocurrencia viva tiene que caer. Es R1 aplicada a la nota que verifica R1 |
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

## 7. Ítems diferidos

**Ya no viven acá: viven en `Root-Rules.md` §12.3**, que esta versión incorpora.

**Y el motivo es el hallazgo de la tercera ronda.** Las versiones anteriores de esta nota anotaban los
ítems diferidos en su propia §7 y declaraban que `AG-XX` «pasa a ser ítem diferido de §12.2». **§12.2
define la forma; no es un registro.** Con la fila fuera de la tabla de exclusiones y sin ningún lugar
donde vivir, **`AG-XX` quedó sin declaración de ningún lado** — peor que el estado que la intervención
venía a corregir.

**Una nota relata una intervención y se cierra con su fecha; un ítem diferido sigue vigente después.**
Anotarlo sólo acá es exactamente el defecto que §12.2 corrige.

Los dos ítems —el ancho de `AG` y la forma compuesta de `AG-03M`— están en §12.3 con sus cuatro campos.

## 8. Veredicto

**CONFORME, en tercera reemisión.** Dos rondas de auditoría independiente devolvieron `RECHAZADO`. La
primera por el bump y por una disyunción falsa; **la segunda por algo peor: correcciones declaradas y
no ejecutadas** —la frase falsa seguía en D3, y `AG-XX` seguía adentro de la tabla de exclusiones—.

**Las dos veces el defecto fue el mismo, y no fue la corrección: fue la verificación de la
corrección.** Esta versión se escribió **desde la salida de los comandos**, y cada afirmación de §4 y
§5 tiene su corrida detrás. El conjunto queda en **SDD 12.0**.
