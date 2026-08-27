# Nota de coherencia — La renumeración de `AG`, con el mapeo escrito antes de tocar un archivo

**Documento:** Coherencia-Renumeracion-AG.md
**Versión:** 9.0 — octava reemisión, tras nueve rondas de auditoría, un ciclo de mejora continua con panel de nueve especialistas y jurado de cinco, y la autorización del paso 1 de §III.7
**Fecha:** 2026-08-23
**Versión del conjunto resultante:** SDD **12.0**
**Origen:** El tramo de identidad del plan de reestructuración, rediseñado después de que dos
intervenciones anteriores sobre el mismo objeto se retiraran tras cinco rondas de auditoría

---

## 1. Alcance

**La familia `AG` nunca cumplió el ancho de §9.2 y estaba excluida con motivo escrito.** El motivo era
correcto —*«no cataloga un elemento de una colección de un producto»*— y dejaba una consecuencia sin
nombrar: **el framework no tenía forma de nombrarse a sí mismo**, y sus roles se citaban por una forma
de dos dígitos que su propia regla prohíbe.

**Esta intervención la hace cumplir y recién entonces la declara alcanzada.** Ese orden es el objeto del
tramo, y es lo que las dos intervenciones retiradas hicieron al revés: **declararon la regla aplicable
sin producir el mapeo que la hace cumplible**, y el corpus pasaba a incumplirse a sí mismo en cientos de
lugares el mismo día.

**Rige hacia adelante** (`SDD-Development-Guide.md` §III.7 paso 3): ningún documento emitido se reaudita
por esta versión. Lo que un destino tiene que hacer está en el bloque de impacto del `CHANGELOG`.

## 2. El mapeo, evaluado antes de aplicarse

**Cuatro clases, no una.** Confundirlas rompe algo distinto en cada caso:

| Clase | Qué es | Destino |
|---|---|---|
| **A · Titular de categoría** | Uno por cada una de las doce categorías de `Docs/` | `AG-00000` … `AG-00110` |
| **B · Titular de nivel producto** | `AG-ROOT`, que no gobierna una categoría | **`AG-00990`**, bloque reservado |
| **C · Subagente de fase** | `AG-03M`, el de la Fase B2, que *«no es titular de ninguna categoría»* | **`AG-00031`** |
| **D · Marcador de plantilla** | `AG-XX`, el hueco que un ejemplo deja para «cualquier AG» | **`AG-XXXXX`** — se reescribe, no se renumera |

**El rango preserva lo que se leía.** `AG-00031` dice, por estar en el bloque `0003x`, que es de la
categoría 03 — **la hermandad queda escrita en el número** en lugar de en un sufijo compuesto, que
§9.2 prohíbe. Y deja `AG-00032` a `AG-00039` libres para futuros subagentes de fase de esa categoría.

**Lo que sí se pierde, declarado:** `AG-ROOT` decía *«soy la raíz»* sin abrir nada; `AG-00990` no lo
dice solo. **Se compensa con el bloque `009xx` declarado como reservado** para roles que no son de
categoría.

**Las cinco pruebas, corridas antes de tocar un archivo:**

| # | Prueba | Resultado |
|---|---|---|
| 1 | **Total** | **Quince formas** distintas en el árbol —**catorce identificadores y un marcador de plantilla**, que `Root-Rules.md` §9.2 declara que **no es un identificador**—, quince filas de mapeo, **ninguna sin destino** |
| 2 | **Inyectivo** | **Ningún destino repetido** |
| 3 | **Sin colisión con lo existente** | **Ninguno de los quince destinos existía** en el árbol. **El nombre dice «con lo existente» y no «sin colisión» a secas, porque es lo que la prueba comprueba**: mira el estado del árbol, no el conjunto de valores que la regla de acuñación de §9.2 puede producir. La colisión latente entre el bloque `009xx` y las categorías `90`-`99` **no la ve esta prueba** y queda como ítem diferido en §8 |
| 4 | **Conforme** | **Catorce** cumplen `AG-[0-9]{5}`; el decimoquinto, **`AG-XXXXX`**, es el **marcador de plantilla** y cumple el ancho con la notación que el corpus ya usa en `US-XXXXX` y `NB-XXXXX` |
| 5 | **Preserva significado** *(interpretativo)* | Número de categoría: se sigue leyendo. Hermandad de fase: **se lee mejor**. Que `ROOT` no es de categoría: **se pierde y se compensa** con el bloque reservado |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior | Forma vigente |
|---|---|---|
| La familia `AG` deja de tener dos dígitos | `AG-00` a `AG-11`, `AG-ROOT`, `AG-03M`, `AG-XX` | `AG-00NN0`, `AG-00990`, `AG-00031`, `AG-XXXXX` |
| El ámbito de unicidad deja de ser uno solo | `únicos en el producto` **cuando enuncia el ámbito como si fuera uno**, `como todo identificador`, `Ámbito de unicidad: producto` | `únicos en su ámbito declarado` |
| El marcador de plantilla toma la forma de su familia alcanzada | `AG-XX`, `RB-XX` | `AG-XXXXX`, `RB-XXXXX` |

**La corrida, no el recuento.** Esta nota **publica los comandos**, con sus exclusiones adentro para
que se puedan correr tal cual. El motivo está medido: en las intervenciones retiradas, tres notas
seguidas declararon números que **eran ciertos al medirlos y falsos al publicarlos**, porque la nota y
el `CHANGELOG` **son parte del árbol que la nota mide**.

**Las exclusiones son las siete clases estables de `SDD-Development-Guide.md` §VI.3.2, que se citan y
no se reescriben.** De ellas, este caso toca cuatro: notas de coherencia anteriores, `SDD/Devs/Bootstrap/`
—no editable por §I.2—, filas de control de cambios, y **la declaración de la propia intervención**.

**Las dos primeras y la cuarta son clases distintas, y la emisión anterior las colapsaba.** `EXC` decía
`Coherencia-` a secas, de modo que **esta nota se excluía a sí misma antes de clasificar**: sus
ocurrencias desaparecían por ruta en lugar de caer en una caja. La asimetría se veía a simple vista
—`AG-00030M` aparece en esta nota y en el `CHANGELOG`, y sólo la del `CHANGELOG` recibía caja—. **La
exclusión pasa a nombrar las notas *anteriores* y deja entrar a ésta**, cuyas ocurrencias caen todas en
la séptima clase y se declaran caja por caja como cualquier otra. Es la regla 4 de §VI.3.2 —*barrer
también sobre el texto propio*— aplicada al archivo donde más fácil es no aplicarla.

**El alcance es el mismo en los cinco**, y **incluye `CHANGELOG.md`**: §VI.3.2 obliga a correr los
patrones **sobre lo que la intervención acaba de escribir**, que *«es el único lugar donde nadie está
mirando»*. En la emisión anterior el comando 2 omitía ese archivo, **que era el único donde su patrón
matcheaba**.

```bash
ALC="SDD PROMPTS Templates README.md CHANGELOG.md"
# Anclado a la RUTA: sin el ^[^:]* el filtro borra toda línea cuyo TEXTO nombre una nota.
EXC='^[^:]*(_legacy|/Bootstrap/|Coherencia-(?!Renumeracion-AG\.md))'   # las notas ANTERIORES, no ésta
FILA='^\S+:\d+:\| [\d.]+ \| 20'          # filas de control de cambios

# 1 · formas viejas. La rama M captura AG-03M, que el patrón anterior no matcheaba.
grep -rnP "AG-([0-9]{2}M?|ROOT|XX)(?![0-9A-Za-z])" $ALC | grep -vP "$EXC" | grep -vP "$FILA"

# 2 · formas compuestas, que es lo que el orden de reemplazo evita
grep -rnoE "AG-[0-9]{5}[A-Za-z]" $ALC | grep -vP "$EXC"

# 3 · enunciados que declaran el ámbito como si fuera uno solo.
#     El patrón anterior era única?s?, ciego a «únicos», que es la forma que el corpus usa.
grep -rniE "únic[oa]s? en el producto|como todo identificador|ámbito de unicidad[^.]{0,20}producto" \
  $ALC | grep -vP "$EXC" | grep -vP "$FILA"

# 4 · ninguna fila de control de cambios histórica alterada
git diff b40cb0d -- $ALC | grep -E '^-\| [0-9]+\.[0-9]+ \| 20'

# 5 · el marcador de plantilla, en TODA familia y no sólo en AG. El patrón de la tabla de
#     conceptos nombra <PREFIJO>-XX y hasta esta emisión ningún comando lo corría: por ese
#     hueco pasó RB-XX -> RB-XXXXX sin declararse.
grep -rnP "\b[A-Z][A-Z0-9]{0,4}-XX(?![0-9A-Za-z])" $ALC | grep -vP "$EXC" | grep -vP "$FILA"
```

**Cómo se leen. Los comandos 1 y 3 devuelven residuo, y eso es lo esperado: §VI.3.2 no pide que el
comando devuelva vacío, pide que *toda ocurrencia viva caiga en una exclusión enumerada*.** Declarar
«cero» fue el defecto de las dos emisiones anteriores, y las dos veces el cero se obtenía **filtrando la
evidencia** o **con un patrón que no matcheaba nada**.

| Comando | Qué devuelve | Dónde cae |
|---|---|---|
| **1** | Líneas de la entrada **12.0** del `CHANGELOG` | **La declaración de esta intervención**, séptima clase |
| **1** | Líneas de **entradas publicadas** del `CHANGELOG` —**7.0, 5.1, 4.1, 3.0, 2.2 y 2.1**— que narran el estado de su fecha | **Exclusión propia del caso**: son **registro fechado**, intocables por el mismo motivo que las filas de control de cambios. §VI.3.2 nombra las filas y no las entradas, y **esta intervención lo declara acá porque el barrido lo destapó** |
| **1** | Líneas de esta nota, **en §2, §3, §6 y §7** —la tabla de clases y el mapeo, el par forma anterior/vigente, la ilustración del orden de reemplazo, los criterios del origen y los ítems no resueltos— | **La declaración de la propia intervención**, séptima clase. **Entran al barrido desde esta emisión**: antes las borraba `EXC` por ruta. **La emisión anterior las atribuía a §4 y §5, que no devuelven ninguna**, y declaraba un total: las dos cosas envejecen con la propia edición. **La caja nombra las secciones y no cuenta**, que es R1 aplicada acá igual que en §3 |
| **2** | `AG-00030M`, en la entrada 12.0 del `CHANGELOG` y en esta nota | **La declaración de esta intervención.** La forma nace de la **ilustración contrafáctica** —qué habría producido el orden de reemplazo equivocado—; el resto de las ocurrencias la citan: el párrafo que explica por qué la nota entró al barrido, y la propia fila de este residuo |
| **3** | Líneas de `Rules-Backlog-Tecnico.md`, `Deriva-Rules.md` y `Rules-Documentacion.md` | **Familias del producto**: nombran `US`, `BT`, `EP`, `SUP`, `CMP`, `OPS`… cuyo ámbito **no cambió** |
| **3** | Líneas de esta nota, **en §3** —el par forma anterior/vigente, y el propio comando transcrito— | **La declaración de la propia intervención**: son el patrón, no una ocurrencia del patrón |
| **3** | `Master-Prompt.md` §3.4 y §15, `Master-Prompt-Reanudacion.md` §4, `SDD-User-Guide.md` y `Migracion-Rules.md` §4.3.1 | **Enunciados ya calificados por esta intervención** —«de estas familias», «para las familias del producto», «primer ámbito»—. **La emisión anterior los suprimía con un `grep -v` no declarado**, que es una exclusión sin enumerar; y **tres** no estaban calificados: `Migracion-Rules.md:152`, que la tercera ronda destapó porque el patrón declarado **no tenía comando que lo corriera**, `Master-Prompt-Reanudacion.md:266`, que la cuarta destapó, y `Migracion-Rules.md:213`, que **destapó el patrón ampliado de la quinta emisión** —y que al quedar calificado dejó de matchear, que es por qué el comando ya no lo devuelve—. Las tres esquivaban el patrón anterior por la preposición: decía «ámbito de unicidad**:** producto» y los textos dicen «unicidad **en el** producto» y «unicidad **pasa de** … **a** producto». **El patrón pasa a `ámbito de unicidad[^.]{0,20}producto`**, que es la corrección del instrumento y no de la ocurrencia |
| **3** | La entrada **12.0** del `CHANGELOG`, y las publicadas **9.5, 8.4 y 7.0** | Las mismas dos cajas del comando 1: **declaración de esta intervención** y **registro fechado**. **Dos correcciones de la sexta ronda entran acá.** La emisión anterior declaraba la `5.1`, **y el comando no devuelve ninguna línea suya**: una caja sobre-declarada es tan hallazgo como una línea sin caja. Y la `8.4` **no aparecía**, porque `EXC` no estaba anclado a la ruta y **borraba toda línea cuyo texto nombrara una nota de coherencia** — `CHANGELOG.md:1250` nombra `Coherencia-Referencias-Derivadas` y desaparecía por eso. **Un filtro que descarta por contenido y no por ruta suprime evidencia**, que es el defecto que §VI.3.2 nombra al pedir exclusiones enumeradas |
| **4** | Nada | — |
| **5** | `AG-XX` y `RB-XX` en esta nota y en la entrada 12.0 del `CHANGELOG` | **La declaración de esta intervención**: son las dos reescrituras de marcador que el `CHANGELOG` narra en prosa por no ser renombres de identificador |
| **5** | Líneas de esta nota, **en §3** —las propias filas de este residuo, que nombran las formas para clasificarlas— | **La declaración de la propia intervención**: son el patrón, no una ocurrencia del patrón. **Es la fila simétrica de la que el comando 3 ya tenía y a este comando le faltaba**: nació en la séptima emisión sin ella, que es la misma clase de hueco que las emisiones anteriores cerraron en los comandos 1 y 3 |
| **5** | `CU-XX` en `Migracion-Rules.md` **§4.3.1**, y en `SDD-User-Guide.md` F-31 | **Narración de la forma anterior a la 7.0**: describen lo que un destino generado antes del salto **tiene escrito**, que es el objeto de la migración. Reescribirlos borraría lo que hay que reconocer |
| **5** | `AG-XX`, `CU-XX`, `VER-XX`, `EV-XX`, `EVE-XX`, `EXT-XX` y `OPS-XX` en entradas publicadas —**2.2, 3.0, 3.2, 4.1, 5.1, 7.0 y 8.2**— | **Registro fechado**, la misma exclusión propia del caso que declaran los comandos 1 y 3. **La emisión anterior omitía `AG-XX` de esta lista** y dejaba sin caja las tres líneas de las entradas 4.1, 5.1 y 7.0: la caja enumeraba las entradas y no la familia |

**Una línea que no caiga en ninguna de esas casillas es hallazgo**, y así se detectaron los dos P0 de la
segunda ronda.

**Y el comando 4 es nuevo, por el peor hallazgo de la intervención.**

**El reemplazo reescribió 52 filas de control de cambios fechadas**, insertando en registros de julio
identificadores nacidos el 2026-08-22 — una fila de `Rules-Examples.md` del 2026-07-26 llegó a decir
«pasa de `AG-00110` a `AG-00100`» **y terminaba invocando el principio que acababa de romper**. Es la
clase que §VI.3.2 declara intocable: *«reescribirlas lo falsea»*.

**Y el barrido no podía verlo por construcción:** el comando 1 descarta toda línea que sea fila de
registro fechada, de modo que su cero **se obtenía filtrando la evidencia**. Por eso entra el comando 4,
que mira exactamente eso.

**Las 52 filas se restituyeron desde el commit publicado.** Y la restitución **rompió dos más**: un
archivo tiene tres filas `1.0` con la misma fecha y distinto texto —dos de bloques de ejemplo, una del
registro propio—, y un reemplazo indexado por versión las pisó. Restituidas por contexto.

**Los otros dos patrones también estaban mal escritos:** el 1 no matcheaba `AG-03M` —una de las quince
formas del mapeo— y el 3 usaba `única?s?`, **ciego a `únicos`**, que es la forma que el corpus usa: el
cero se obtenía **sin haber mirado**.

**El orden de reemplazo es parte del método, no un detalle:** de más específico a más general
—`AG-03M`, `AG-ROOT`, `AG-XX` primero— y con frontera de palabra. Al revés, `AG-03` habría convertido
`AG-03M` en `AG-00030M`, **la forma compuesta que este tramo elimina**.

## 4. Alcance, y una corrección del propio alcance

**El alcance declarado inicialmente dejaba afuera dos carpetas normativas** —`SDD/Devs/References/Design/`
y `SDD/Devs/Modelos-UX-UI/`—, que el orquestador **inyecta en el despacho**. Lo detectó el barrido, no
una auditoría posterior: la primera corrida dejó ocurrencias vivas fuera de las clases estables.

**Se declara porque es el defecto que este tramo corrige, cometido por este tramo, y detectado a tiempo
por tener el mapeo escrito.**

**Y tres notas de coherencia de `References/Design/` fueron alcanzadas por el segundo pase y se
restituyeron**: son clase estable.

**Y una segunda familia quedó alcanzada por la regla nueva del marcador, fuera del objeto declarado.**
`SDD-User-Guide.md` §7.1 escribía `runbooks/RB-XX-<Nombre>.md`, y §9.2 pasa a exigir `<PREFIJO>-XXXXX`
a **toda familia alcanzada** — `RB` lo está por el «y equivalentes» de §9.2, porque un runbook cataloga
elementos de una colección del producto. **La reescritura es correcta y no estaba declarada**: la
levantó la sexta ronda, y pudo pasar porque la comprobación 7 anterior era una tautología. Queda en la
tabla de conceptos de §3 y narrada en el `CHANGELOG`. **No es un renombre de identificador y por eso no
va en la tabla de §VI.4**: un marcador no viaja a ningún artefacto emitido.

**El alcance se recalcula, no se declara:**

```bash
# archivos y líneas tocadas, con el mismo alcance que §3
git diff b40cb0d --stat -- $ALC

# comprobación 7: lo tocado FUERA del alcance declarado y del snapshot que §VI.5 obliga.
# Devuelve vacío, y ese vacío es el contraste — no la definición del alcance.
git diff b40cb0d --name-only \
  | grep -vE "^(SDD/|PROMPTS/|Templates/|README\.md|CHANGELOG\.md|_legacy/11\.2/)"
```

**La emisión anterior enunciaba la comprobación 7 como *«el alcance es lo que ese comando devuelve»*,
que es una tautología: definido así, nada puede quedar afuera y la comprobación no puede fallar.** Es el
mismo hueco por el que pasó `RB-XX → RB-XXXXX` sin declararse. **Ahora hay dos conjuntos y se los
compara**, que es lo que `SDD-Development-Guide.md` §VI.3 fila 7 pide al decir «alcance **declarado**».

## 5. Verificación — las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 en todo archivo tocado | **Tabla propia más abajo**, una fila por invariante. §III.7 paso 4 la exige y la emisión anterior la resolvía en esta sola celda |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol |
| 3 | Referencias internas resuelven | Ningún archivo se movió ni se renombró |
| 4 | Sin contradicción con lo que ya estaba | **§9.2 declara `AG` alcanzada cuando ya cumple**, no antes. Es la contradicción que hundió a las dos intervenciones retiradas |
| 5 | Control de cambios **en cada archivo modificado** | **Una fila por archivo con tabla de registro.** `SDD-User-Guide.md` **sí la tiene** —la primera emisión afirmó dos veces que no, y era falso: lo levantó la auditoría—. **Tres de los archivos tocados no tienen tabla**: `README.md` —que queda en §7—, el propio `CHANGELOG.md`, que **es** el registro, y **esta nota**. La emisión anterior decía «`README.md` es el único», y era falso. Que una nota de coherencia no la lleve tiene precedente admitido —`Coherencia-Precedencia-Entre-Reglas.md` está en 2.0 sin tabla—, **y es lo que hizo invisible que esta nota cambiara sin subir versión** hasta la sexta ronda. Queda en §7 |
| 6 | El caso degenerado sigue produciendo el layout aplanado | Nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | **Contraste, no definición.** El alcance **declarado** es `ALC` de §3 más el snapshot que §VI.5 obliga; el **recalculado** es `git diff b40cb0d --name-only`. **Coinciden**: 35 archivos dentro de `ALC` y 95 de `_legacy/11.2/`, **cero fuera de los dos**. El comando está en §4 |
| 8 | Barrido por concepto | **§3**, con **cinco corridas y su residuo declarado caja por caja**. Ninguna devuelve «cero» salvo la 4: los otros cuatro **devuelven residuo, y eso es lo esperado** —§VI.3.2 pide que toda ocurrencia caiga en una exclusión enumerada, no que el comando salga vacío—. **La cuarta existe porque las tres primeras no podían ver que se estaban reescribiendo filas históricas, y la quinta porque el patrón del marcador vivía en la tabla de conceptos sin comando que lo corriera** — que es el defecto que la tercera ronda ya había levantado sobre otro patrón |
| 9 | Coherencia interna | §9.1, §9.2 y §10 R5 dicen lo mismo sobre el ámbito, y la familia que §9.2 enumera **cumple el ancho que §9.2 exige** |
| 10 | Integridad del registro | **Cabecera = última fila en todos los archivos con tabla**, verificado archivo por archivo. **Y ninguna fila histórica alterada**, que es el comando 4 de §3 |
| 11 | Cobertura de la nota | **Esta nota** |
| 12 | Cobertura del catálogo | **Sin criterios nuevos**: no entra ninguna decisión que un agente deba tomar |
| **13** | **Devolución al origen** | **§6** |

**Comprobación 1 en detalle — las nueve invariantes.** §III.7 paso 4 pide verificarlas «en cada archivo
tocado». Se verifican **por clase de archivo y no una tabla por archivo**: son 35 archivos dentro del
alcance más 95 del snapshot, y §III.7 invoca el precedente de D9 contra el volumen que «ahoga a los
reales». Cada fila declara **con qué** se verificó, para que la afirmación sea contrastable y no una
declaración de buena fe.

| # | Invariante | Verificación | Resultado |
|---|---|---|---|
| **D1** | Estructura de carpetas | `git diff b40cb0d --name-status` no devuelve ningún `R` ni `D`: ninguna carpeta se creó, movió ni eliminó fuera de `_legacy/11.2/`, que §VI.5 obliga | Intacta |
| **D2** | Codificación y fin de línea | El diff no contiene cambios de encoding ni de terminador; los archivos tocados son los mismos blobs UTF-8 con LF | Intacta |
| **D3** | Nombres e identificadores | **Se modifica: es el objeto.** El tramo de nombres de archivo queda **intacto** —ningún archivo cambió de nombre—; el tramo de identificadores pasa a «únicos en su ámbito declarado». **Decisión explícita del responsable del framework, tomada el 2026-08-23** (`SDD-Development-Guide.md` §III.7, paso 1) | **Modificada, declarada y autorizada** |
| **D4** | Sufijo de versión en copias archivadas | El snapshot usa la convención de carpeta de §VI.5 (`_legacy/<version>/`), como los **cuarenta y seis** anteriores. Divergencia preexistente entre D4 y §VI.5, no introducida acá | Sin cambio |
| **D5** | Registro de cambios por archivo | Comprobaciones **5** y **10** de esta misma tabla: una fila por archivo con tabla, y cabecera igual a la última fila en los 32 que la tienen | Intacta |
| **D6** | Dirección del grafo de dependencias | Ninguna arista nueva hacia atrás: la titularidad de `AG` vive en `Root-Rules.md` §9.2, que **ya viajaba** en los insumos de todo despacho por §8. Verificado que §9 no ganó ningún lector nuevo | Intacta |
| **D7** | Autosuficiencia del repositorio | Comprobación **2**: cero referencias nuevas fuera del árbol | Intacta |
| **D8** | Conjunto cerrado de tipos de unidad de entrega | Ningún tipo agregado ni quitado; el diff no toca la enumeración | Intacta |
| **D9** | Evidencia verificable | Esta nota publica **cinco comandos corribles** y su residuo encajonado, en lugar de recuentos que envejecen | Intacta |

**El snapshot `_legacy/11.2/` queda fuera de esta verificación, y se declara:** §VI.5 lo declara
**intocable**, de modo que verificar invariantes sobre él sería auditar el pasado. Lo que sí se verifica
es que **sea byte a byte el estado de `b40cb0d`**, y eso está en la comprobación 7.

## 6. Comprobación 13 — los criterios del origen

| # | Criterio del tramo | Veredicto |
|---|---|---|
| 1 | **El mapeo se escribe y se evalúa antes de aplicarse** | **Cumplido**: §2, cinco pruebas |
| 2 | El mapeo es **total, inyectivo y sin colisión** | **Cumplido**: pruebas 1 a 3 |
| 3 | **No se pierde significado**, o se declara la pérdida | **Cumplido**: la hermandad se preserva; la de `AG-ROOT` **se declara perdida y compensada** |
| 4 | El ámbito se declara **cuando la familia ya cumple** | **Cumplido**: el reemplazo corre primero y §9.2 la enumera después |
| 5 | El impacto sobre destinos **se declara y no se niega** | **Cumplido**: el bloque del `CHANGELOG` **no es vacío** |

## 7. Ítems declarados y no resueltos

- **`README.md` no tiene tabla de control de cambios**, de modo que su cambio **no se registra en el
  archivo**. Es el hueco de §VI.1 que la 11.2 declaró: admite un bump «Ninguno» y la comprobación 5
  exige una fila que empieza por su versión. **Sigue sin dueño.**
- **La primera emisión de esta nota afirmó dos veces que `SDD-User-Guide.md` tampoco la tiene, y es
  falso**: la tiene, con quince filas. El archivo se modificó **sin fila y sin bump**. Corregido en la
  reemisión: sube a **1.17** con sus dos filas —la 1.16 por la renumeración, y la 1.17 por el paso de
  acuñación del `AG` titular que §7.1 no tenía—. **La séptima ronda levantó que acá decía 1.16**: el
  recuento se midió antes de la corrección y se publicó después.
- **El paso 1 de `SDD-Development-Guide.md` §III.7 estuvo abierto y quedó cerrado.** El procedimiento
  obligatorio para modificar una invariante global empieza por *«1. Decisión explícita del responsable
  del framework, registrada por escrito»*, y las **nueve** rondas de auditoría anteriores no lo miraron:
  la intervención citaba de esa lista los pasos 3 y 5 y nunca el 1. Lo levantaron dos especialistas por
  caminos independientes y el jurado lo votó **5-0**. **La decisión se tomó el 2026-08-23** y quedó
  registrada en la fila D3 de §5, con la forma del precedente —`Coherencia-Reportes-00-11.md:89`, la
  anterior modificación de invariante—. **Se deja escrito acá porque el hecho de que faltara es el
  hallazgo**, y borrarlo dejaría el procedimiento pareciendo cumplido desde el principio.
- **Tres citas del corpus vivo nombran el rol equivocado**, y se registran como **observación y no se
  corrigen acá**: `Rules-Devops.md:56` y `:57` —cruzadas entre sí— y `Rules-UX-UI-DX.md:53` dicen
  `AG-00100 Technical Writer` y `AG-00110 Developer Advocate`, contra el padrón de
  `Marco-Teorico-SDD.md` §4.3. **Verificado que preexisten en `b40cb0d`** con la forma vieja
  —`AG-10 Technical Writer`—: son residuo del intercambio 10 ↔ 11 de la 3.0 y **el reemplazo de esta
  intervención fue fiel**. `SDD-Development-Guide.md` §VI.3.2 lo resuelve: *«un descubrimiento no
  habilita un cambio… se registra como observación, se reporta y se espera decisión»*. **Lo que sí es
  hallazgo de método** es que ningún comando del barrido las puede ver: tienen la forma vigente y el
  referente equivocado, y los cinco patrones buscan la forma anterior.
- **Las tres notas de `References/Design/` conservan la forma vieja**, correctamente. Un lector que
  busque `AG-03` en el corpus va a encontrarlas: **es registro, no error**.

## 8. Veredicto

**CONFORME.** Los cinco pasos del procedimiento de `SDD-Development-Guide.md` §III.7 están cumplidos, y
el **paso 1 —la decisión explícita del responsable, tomada el 2026-08-23— es el último que se cerró**:
estuvo abierto durante nueve rondas sin que ninguna lo mirara, porque la intervención citaba de esa
lista los pasos 3 y 5 y nunca el 1. `Master-Prompt.md` §8.1 lo clasificaba sin ambigüedad —lo que
requiere **autoridad** no es trabajo propio— y por eso ninguna reemisión podía cerrarlo.

`SDD-Development-Guide.md` §VI.3 declara que *«el veredicto es `CONFORME` o `NO CONFORME`»*:
son los dos valores que existen, y la emisión anterior publicaba «CONFORME POR DECISIÓN», que no es
ninguno de los dos. **La calificación «cerró por decisión y no por criterio» de `Master-Prompt.md` §10.1
no es un tercer veredicto: es una declaración sobre cómo cerró la fase**, y viene con dos condiciones
—que la decisión suba al responsable de forma explícita y que se enumere lo que quedó abierto—. Tomar la
concesión sin cumplir las condiciones fue el defecto que levantó la sexta ronda.

**Lo verificado, que queda en pie y no depende de la detención:** las trece comprobaciones pasan, el barrido publica sus **cinco** corridas con el residuo entero en
las clases estables de §VI.3.2 y en la exclusión propia del caso declarada en §3 —que **no** es una de
las siete y por eso se declara—, el mapeo se evaluó con cinco pruebas **antes** de tocar un archivo, y el
conjunto queda en **SDD 12.0**.

**Lo que queda abierto, en la forma de cuatro campos que `Root-Rules.md` §12.2 obliga.** La emisión
anterior los enumeró en prosa y los declaró «diferidos por §12.2» **sin los campos 3 y 4**, con uno que
empaquetaba dos decisiones. §12.2 califica eso **P1 — «no es contable»**, de modo que la comprobación 6
de `Master-Prompt.md` §10.0 no podía verlos ni escalarlos. **Es el defecto que los reportes 12 a 14
originaron, cometido por la nota que lo cita.** Va partido y con los cuatro campos:

| # | Qué falta, y qué sección lo exige | Por qué no hoy, y de qué depende | Quién lo cierra | En qué evento se cierra |
|---|---|---|---|---|
| 1 | **`Examples/` no entra al snapshot** y §VI.5 no lo excluye ni lo nombra | §VI.5 enumera tres exclusiones y ninguna lo alcanza; incluirlo o excluirlo cambia los **cuarenta y seis** snapshots ya publicados | La organización dueña del repositorio (§12.2, cláusula de defecto) | Cuando `SDD-Development-Guide.md` **§VI.5** declare `Examples/` en su lista de exclusiones o en la de contenido obligatorio |
| 2 | **El prefijo `E-` tiene dos referentes vivos** —`E-<DOMINIO>-NNNNN` y el escenario de intake `E-1`— y §9.5 exige que toda familia viva quede clasificada | Elegir **cuál de los dos se renombra** no se contesta abriendo el árbol: `Master-Prompt.md` §8.1 lo manda a intención de producto | La organización dueña del repositorio | Cuando `Root-Rules.md` **§9.2** liste `E-` en su tabla de alcanzadas o en la de exclusiones |
| 3 | **`F-NN` sin clasificar**, con dos referentes: la FAQ de `SDD-User-Guide.md` §6 —citada **desde otros documentos**— y la capacidad funcional del intake | Mismo motivo que el 2, y agravado: el motivo «posición dentro de un documento» que excluye a `FA-NN` **no le aplica**, porque se cita cruzando la frontera del documento | La organización dueña del repositorio | Cuando `Root-Rules.md` **§9.2** liste `F-NN` en una de sus dos tablas |
| 4 | **El bloque `009xx` no tiene regla de asignación interna**, y §9.2 lo declara reservado sin decir cómo se reparte | No hay un segundo rol de nivel producto que fuerce la decisión: fijarla ahora sería inventar el caso | La organización dueña del repositorio | Cuando `Root-Rules.md` **§9.2** sume la regla de asignación a la tabla de titularidad y bloques |
| 5 | **La regla de agotamiento de §9.2 es incompatible con la codificación posicional de `AG`**: ampliar el ancho reasigna el referente de todo identificador de la familia, y el bloque `009xx` **se solapa con las categorías `90` a `99`** | El solapamiento es latente y no vivo —hay doce categorías y `NN` llega a `11`—, y acotar `NN` hoy clava un techo que la categoría 90 tendría que migrar. **Se difiere por separado del 4: son dos decisiones y §12.2 prohíbe empaquetarlas** | La organización dueña del repositorio | Cuando `Root-Rules.md` **§9.2** declare la excepción de agotamiento para familias con codificación posicional, o acote el dominio de `NN` en su tabla de bloques |
| 6 | **El padrón de `AG` no tiene las columnas que §9.3 presupone.** §9.3 exige que un identificador retirado deje *«su fila con estado `Retirado` y la fecha»*, y la tabla §4.3 de `Marco-Teorico-SDD.md` no las tiene | La regla **recién ahora alcanza a `AG`**: en la base la familia estaba excluida. Corregirlo exige decidir **dónde vive el padrón** —hoy la familia se acuña en una regla y el catálogo vive en una guía—, que es una intervención propia | La organización dueña del repositorio | Cuando `Root-Rules.md` **§9.2** declare cuál es el registro de la familia `AG`, y ese registro tenga las columnas de §9.3 |

**Ninguno de los seis es atribuible a esta intervención**, salvo el 6, que ella vuelve aplicable al
incorporar `AG` al sistema. **Los seis son contables**: cada uno nombra un artefacto y una sección que
alguien puede abrir, que es lo que §12.2 pide y lo que distingue esta figura de una promesa.


