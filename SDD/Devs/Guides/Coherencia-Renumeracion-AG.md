# Nota de coherencia — La renumeración de `AG`, con el mapeo escrito antes de tocar un archivo

**Documento:** Coherencia-Renumeracion-AG.md
**Versión:** 2.0 — reemitida tras auditoría independiente
**Fecha:** 2026-08-22
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
| 1 | **Total** | 15 identificadores distintos en el árbol, 15 filas de mapeo, **ninguno sin destino** |
| 2 | **Inyectivo** | **Ningún destino repetido** |
| 3 | **Sin colisión** | **Ninguno de los quince destinos existía** en el árbol |
| 4 | **Conforme** | Los quince cumplen `AG-[0-9]{5}`, y el marcador cumple el ancho |
| 5 | **Preserva significado** *(interpretativo)* | Número de categoría: se sigue leyendo. Hermandad de fase: **se lee mejor**. Que `ROOT` no es de categoría: **se pierde y se compensa** con el bloque reservado |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior | Forma vigente |
|---|---|---|
| La familia `AG` deja de tener dos dígitos | `AG-NN`, `AG-ROOT`, `AG-03M`, `AG-XX` | `AG-00NN0`, `AG-00990`, `AG-00031`, `AG-XXXXX` |
| El ámbito de unicidad deja de ser uno solo | `únicos en el producto` **cuando enuncia el ámbito como si fuera uno**, `como todo identificador`, `Ámbito de unicidad: producto` | `únicos en su ámbito declarado` |

**La corrida, no el recuento.** Esta nota **publica los comandos**, con sus exclusiones adentro para
que se puedan correr tal cual. El motivo está medido: en las intervenciones retiradas, tres notas
seguidas declararon números que **eran ciertos al medirlos y falsos al publicarlos**, porque la nota y
el `CHANGELOG` **son parte del árbol que la nota mide**.

**Las exclusiones son las siete clases estables de `SDD-Development-Guide.md` §VI.3.2, que se citan y
no se reescriben.** De ellas, este caso toca cuatro: notas de coherencia anteriores, `SDD/Devs/Bootstrap/`
—no editable por §I.2—, filas de control de cambios, y **la declaración de la propia intervención**.

```bash
# 1 · ninguna forma vieja fuera de las clases estables
grep -rnP "AG-([0-9]{2}|ROOT|XX)(?![0-9A-Za-z])" SDD PROMPTS Templates README.md   | grep -v "_legacy\|/Bootstrap/\|Coherencia-" | grep -vP "^\S+:\d+:\| [\d.]+ \| 20"

# 2 · ninguna forma compuesta, que es lo que el orden de reemplazo evita
grep -rnoE "AG-[0-9]{5}[A-Za-z]" SDD PROMPTS Templates README.md \
  | grep -v "_legacy\|Coherencia-Renumeracion"

# 3 · ningún enunciado que declare el ámbito como si fuera uno solo
grep -rniE "(única?s? en el producto|como todo identificador|Ámbito de unicidad: producto)" \
  SDD PROMPTS Templates README.md | grep -v "_legacy\|Coherencia-\|/Bootstrap/" \
  | grep -vP "^\S+:\d+:\| [\d.]+ \| 20" | grep -viE "de estas familias|primer ámbito|su ámbito"
```

**Los tres devuelven cero.** El primero, en su versión anterior, filtraba **el match** en lugar de **la
línea** y por eso devolvía 30: las treinta filas nuevas que narran el mapeo —«`AG-ROOT` toma
`AG-00990`»— son la séptima clase, y **escribir la forma anterior como patrón literal es la función de
esta sección**.

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

**El alcance se recalcula, no se declara:**

```bash
git diff b40cb0d --stat -- SDD PROMPTS Templates   # archivos y líneas tocadas
```

## 5. Verificación — las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 en todo archivo tocado | **D3 se modifica: es el objeto.** Las otras ocho, intactas en los 32 |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol |
| 3 | Referencias internas resuelven | Ningún archivo se movió ni se renombró |
| 4 | Sin contradicción con lo que ya estaba | **§9.2 declara `AG` alcanzada cuando ya cumple**, no antes. Es la contradicción que hundió a las dos intervenciones retiradas |
| 5 | Control de cambios **en cada archivo modificado** | **Una fila por archivo con tabla de registro.** `SDD-User-Guide.md` **sí la tiene** —la primera emisión afirmó dos veces que no, y era falso: lo levantó la auditoría—. **`README.md` es el único sin tabla**, y eso queda en §7 |
| 6 | El caso degenerado sigue produciendo el layout aplanado | Nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | 32 archivos, más `CHANGELOG`, esta nota y el snapshot |
| 8 | Barrido por concepto | **§3**, con sus tres corridas **que devuelven cero** y las clases estables **citadas de §VI.3.2**, no reescritas |
| 9 | Coherencia interna | §9.1, §9.2 y §10 R5 dicen lo mismo sobre el ámbito, y la familia que §9.2 enumera **cumple el ancho que §9.2 exige** |
| 10 | Integridad del registro | **Verificado en los 30**: cabecera = última fila |
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

**CONFORME.** Las trece comprobaciones pasan, el barrido publica sus tres corridas con residuo entero en
clases estables, el mapeo se evaluó con cinco pruebas **antes** de tocar un archivo, y el conjunto queda
en **SDD 12.0**.
