# Nota de coherencia — La renumeración de `AG`, con el mapeo escrito antes de tocar un archivo

**Documento:** Coherencia-Renumeracion-AG.md
**Versión:** 6.0 — quinta reemisión, tras seis rondas de auditoría independiente
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
| 3 | **Sin colisión** | **Ninguno de los quince destinos existía** en el árbol |
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

**El alcance es el mismo en los cuatro**, y **incluye `CHANGELOG.md`**: §VI.3.2 obliga a correr los
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
```

**Cómo se leen. Los comandos 1 y 3 devuelven residuo, y eso es lo esperado: §VI.3.2 no pide que el
comando devuelva vacío, pide que *toda ocurrencia viva caiga en una exclusión enumerada*.** Declarar
«cero» fue el defecto de las dos emisiones anteriores, y las dos veces el cero se obtenía **filtrando la
evidencia** o **con un patrón que no matcheaba nada**.

| Comando | Qué devuelve | Dónde cae |
|---|---|---|
| **1** | Líneas de la entrada **12.0** del `CHANGELOG` | **La declaración de esta intervención**, séptima clase |
| **1** | Líneas de **entradas publicadas** del `CHANGELOG` —**7.0, 5.1, 4.1, 3.0, 2.2 y 2.1**— que narran el estado de su fecha | **Exclusión propia del caso**: son **registro fechado**, intocables por el mismo motivo que las filas de control de cambios. §VI.3.2 nombra las filas y no las entradas, y **esta intervención lo declara acá porque el barrido lo destapó** |
| **1** | **Doce líneas de esta nota** —§2 la tabla de clases y el mapeo, §3 el par forma anterior/vigente, §4, §5— | **La declaración de la propia intervención**, séptima clase. **Entran al barrido desde esta emisión**: antes las borraba `EXC` por ruta |
| **2** | `AG-00030M`, **una vez en la entrada 12.0 del `CHANGELOG` y tres en esta nota** | **La declaración de esta intervención**: es la **ilustración contrafáctica** de qué habría producido el orden de reemplazo equivocado. Las cuatro son la misma frase, escrita en los dos lugares donde la intervención se declara |
| **3** | Líneas de `Rules-Backlog-Tecnico.md`, `Deriva-Rules.md` y `Rules-Documentacion.md` | **Familias del producto**: nombran `US`, `BT`, `EP`, `SUP`, `CMP`, `OPS`… cuyo ámbito **no cambió** |
| **3** | **Tres líneas de esta nota** —§3 el par forma anterior/vigente, y el propio comando transcrito— | **La declaración de la propia intervención**: son el patrón, no una ocurrencia del patrón |
| **3** | `Master-Prompt.md` §3.4 y §15, `Master-Prompt-Reanudacion.md` §4, `SDD-User-Guide.md` y `Migracion-Rules.md` §4.3.1 | **Enunciados ya calificados por esta intervención** —«de estas familias», «para las familias del producto», «primer ámbito»—. **La emisión anterior los suprimía con un `grep -v` no declarado**, que es una exclusión sin enumerar; y **tres** no estaban calificados: `Migracion-Rules.md:152`, que la tercera ronda destapó porque el patrón declarado **no tenía comando que lo corriera**, `Master-Prompt-Reanudacion.md:266`, que la cuarta destapó, y `Migracion-Rules.md:213`, que **destapó el patrón ampliado de la quinta emisión** —y que al quedar calificado dejó de matchear, que es por qué el comando ya no lo devuelve—. Las tres esquivaban el patrón anterior por la preposición: decía «ámbito de unicidad**:** producto» y los textos dicen «unicidad **en el** producto» y «unicidad **pasa de** … **a** producto». **El patrón pasa a `ámbito de unicidad[^.]{0,20}producto`**, que es la corrección del instrumento y no de la ocurrencia |
| **3** | La entrada **12.0** del `CHANGELOG`, y las publicadas **9.5, 8.4 y 7.0** | Las mismas dos cajas del comando 1: **declaración de esta intervención** y **registro fechado**. **Dos correcciones de la sexta ronda entran acá.** La emisión anterior declaraba la `5.1`, **y el comando no devuelve ninguna línea suya**: una caja sobre-declarada es tan hallazgo como una línea sin caja. Y la `8.4` **no aparecía**, porque `EXC` no estaba anclado a la ruta y **borraba toda línea cuyo texto nombrara una nota de coherencia** — `CHANGELOG.md:1250` nombra `Coherencia-Referencias-Derivadas` y desaparecía por eso. **Un filtro que descarta por contenido y no por ruta suprime evidencia**, que es el defecto que §VI.3.2 nombra al pedir exclusiones enumeradas |
| **4** | Nada | — |

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
| 1 | Invariantes D1–D9 en todo archivo tocado | **D3 se modifica: es el objeto.** Las otras ocho, intactas en todos los archivos que el comando de §4 devuelve |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol |
| 3 | Referencias internas resuelven | Ningún archivo se movió ni se renombró |
| 4 | Sin contradicción con lo que ya estaba | **§9.2 declara `AG` alcanzada cuando ya cumple**, no antes. Es la contradicción que hundió a las dos intervenciones retiradas |
| 5 | Control de cambios **en cada archivo modificado** | **Una fila por archivo con tabla de registro.** `SDD-User-Guide.md` **sí la tiene** —la primera emisión afirmó dos veces que no, y era falso: lo levantó la auditoría—. **`README.md` es el único sin tabla**, y eso queda en §7 |
| 6 | El caso degenerado sigue produciendo el layout aplanado | Nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | **Contraste, no definición.** El alcance **declarado** es `ALC` de §3 más el snapshot que §VI.5 obliga; el **recalculado** es `git diff b40cb0d --name-only`. **Coinciden**: 35 archivos dentro de `ALC` y 95 de `_legacy/11.2/`, **cero fuera de los dos**. El comando está en §4 |
| 8 | Barrido por concepto | **§3**, con **cuatro corridas y su residuo declarado caja por caja**. Ninguna devuelve «cero» salvo la 4: los comandos 1 y 3 **devuelven residuo, y eso es lo esperado** —§VI.3.2 pide que toda ocurrencia caiga en una exclusión enumerada, no que el comando salga vacío—. La cuarta existe porque las tres primeras **no podían ver** que se estaban reescribiendo filas históricas |
| 9 | Coherencia interna | §9.1, §9.2 y §10 R5 dicen lo mismo sobre el ámbito, y la familia que §9.2 enumera **cumple el ancho que §9.2 exige** |
| 10 | Integridad del registro | **Cabecera = última fila en todos los archivos con tabla**, verificado archivo por archivo. **Y ninguna fila histórica alterada**, que es el comando 4 de §3 |
| 11 | Cobertura de la nota | **Esta nota** |
| 12 | Cobertura del catálogo | **Sin criterios nuevos**: no entra ninguna decisión que un agente deba tomar |
| **13** | **Devolución al origen** | **§6** |

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
  reemisión: sube a **1.16** con su fila.
- **Las tres notas de `References/Design/` conservan la forma vieja**, correctamente. Un lector que
  busque `AG-03` en el corpus va a encontrarlas: **es registro, no error**.

## 8. Veredicto

**CONFORME.** `SDD-Development-Guide.md` §VI.3 declara que *«el veredicto es `CONFORME` o `NO CONFORME`»*:
son los dos valores que existen, y la emisión anterior publicaba «CONFORME POR DECISIÓN», que no es
ninguno de los dos. **La calificación «cerró por decisión y no por criterio» de `Master-Prompt.md` §10.1
no es un tercer veredicto: es una declaración sobre cómo cerró la fase**, y viene con dos condiciones
—que la decisión suba al responsable de forma explícita y que se enumere lo que quedó abierto—. Tomar la
concesión sin cumplir las condiciones fue el defecto que levantó la sexta ronda.

**Las trece comprobaciones pasan**, el barrido publica sus **cuatro** corridas con el residuo entero en
las clases estables de §VI.3.2 y en la exclusión propia del caso declarada en §3 —que **no** es una de
las siete y por eso se declara—, el mapeo se evaluó con cinco pruebas **antes** de tocar un archivo, y el
conjunto queda en **SDD 12.0**.

**Lo que queda abierto, enumerado y no atribuible a esta intervención:** `Examples/` fuera del snapshot
—como en los cuarenta y seis anteriores—, el prefijo `E-` con dos referentes vivos, el bloque `009xx` sin
regla de asignación interna, y la regla de agotamiento de §9.2, que al ampliar el ancho destruiría la
codificación posicional `00NN0`/`00NN1`. Los cuatro son ítems diferidos por `Root-Rules.md` §12.2.
