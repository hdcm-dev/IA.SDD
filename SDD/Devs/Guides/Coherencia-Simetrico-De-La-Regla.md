# Nota de coherencia — Una regla escrita sobre su caso dejó afuera su simétrico

**Framework:** SDD
**Documento:** Coherencia-Simetrico-De-La-Regla.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-18
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 9.17
**Origen del hallazgo:** la consolidación de la raíz de un destino real, novena de diez categorías, y la más chica de todas

---

## 1. Alcance

Extensión de **E4** en `Migracion-Rules.md` §4.3.2 —el procedimiento de emitir el documento
consolidado— para que cubra **los dos lados** del encabezado, y la corrección de un recuento del
catálogo de criterios encontrada por el barrido.

## 2. El defecto

**E4 decía «todo cuerpo se cierra con salto de línea».** Se escribió en la 9.14 contra un caso
observado: sin ese salto, el encabezado **siguiente** quedaba pegado a la última línea del cuerpo
anterior —`…la iteración entera.## 3. Excepciones admitidas`—.

**El simétrico no estaba, y produce el mismo Markdown roto por el otro lado:** el cuerpo pegado a **su
propio** encabezado. La regla se leía completa, y por eso nadie la miró de nuevo.

## 3. Por qué tardó cinco categorías en aparecer

**No fue descuido de la verificación: fue una rama que casi no se ejecuta.** El emisor pone un bloque
de atribución entre el encabezado y el cuerpo —«cada proyecto de código declara lo suyo acá»— **sólo
cuando la sección difiere entre las versiones**. Ese bloque aporta la línea en blanco por accidente, y
tapa el defecto.

La rama que lo destapa es la contraria: **la sección idéntica en todas las capas**, que se emite sin
nada en el medio. El inventario de la migración midió **16,3 % de solapamiento** entre versiones de un
mismo grupo, de modo que las secciones idénticas son la excepción. La corrida que finalmente la
ejecutó fue **la categoría más chica de la migración**: un grupo, un documento, dos secciones.

**Es el argumento para que la verificación de preservación corra siempre.** Cinco defectos del emisor,
los cinco encontrados por ella y los cinco antes de archivar; el quinto lo encontró la corrida que más
fácil habría sido saltear.

## 4. La decisión de diseño: enunciar el par, no agregar E5

Se evaluó agregar una regla nueva. **Se descartó**, y el motivo es el defecto mismo: dos reglas
hermanas enunciadas por separado vuelven a permitir que se aplique una y no la otra. E4 pasa a
enunciar **el par** en una tabla de dos filas —cierre y apertura— con el síntoma de cada una.

**Y la lección que la regla suma es sobre la forma de escribir reglas, no sobre saltos de línea.**
Cuando una regla nace de un caso, tiende a quedar enunciada **sobre ese caso** y no sobre la propiedad
que el caso ilustra. Corresponde preguntar **cuál es su simétrico** antes de darla por escrita. Los
cinco defectos del emisor tienen esta forma, y es el motivo por el que el par se escribe junto.

## 5. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Rules/Migracion-Rules.md` | 3.11 → **3.12** | §4.3.2 **E4** enuncia los dos lados con su tabla de síntomas, la explicación de por qué el segundo tardó, y la lección de forma. §6 suma un criterio **enumerable** |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.2 → **1.3** | §3 decía «las **once** comprobaciones»; §VI.3 tiene **doce** desde la 9.10 |
| `CHANGELOG.md` | — | Entrada `[9.17]` |
| `SDD/Devs/Guides/Coherencia-Simetrico-De-La-Regla.md` | — | Esta nota |

**El criterio de aceptación es enumerable a propósito.** «Ninguna línea que empiece con `#` tiene texto
pegado antes ni después» se verifica sin leer el documento, que es lo que distingue un criterio que se
corre de uno que se declara. `Catalogo-De-Criterios.md` §4.1 gobierna la clasificación.

## 6. El barrido por concepto

Concepto barrido: **E4** y **el recuento de comprobaciones de §VI.3**, en todo el árbol vivo.

**Un lugar corregido**: la fila del catálogo de criterios. **Tres lugares se dejaron y se declaran
acá**: las tres apariciones de «E4» en `Coherencia-Migracion.md` nombran **una etapa de aquella
migración**, no esta regla —homonimia, no residuo—; y la aparición de «once comprobaciones» en
`Coherencia-Sustitucion-Lexica-Y-Gobierno-Glosario.md` es el **registro de lo que se verificó en su
fecha**, que reescribir falsearía.

**La regla 4 del barrido, sobre el texto propio de esta intervención:** el texto nuevo de E4 no
introduce el enunciado anterior en ningún ejemplo ni en ninguna cita.

## 7. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D2** | Conforme | Registro, encoding y fechas sin cambios |
| **D3** Nombres | Conforme | La nota sigue `Coherencia-<Tema>.md` |
| **D4**, **D5** | Conforme | Los dos archivos tocados subieron versión y registraron su fila |
| **D6** Trazabilidad | Conforme | E4 cita la corrida que lo destapó y el solapamiento medido; no redefine ninguna mecánica de otra regla |
| **D7** Neutralidad | Conforme | El destino se cita como «una consolidación real», sin nombrar su dominio |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | Los 23 encabezados se contaron sobre el árbol del destino, y cada uno se contrastó contra su origen en `_fusion/` antes de corregirlo |

**Sobre la evidencia, un detalle que corresponde declarar.** En el mismo destino hay **cinco
encabezados más** con la misma forma, en una categoría que **no pasó por el emisor**. **No se
corrigieron**: vienen así del origen y no son residuo de esta regla. Corregirlos habría inflado el
recuento con casos que la regla no produce.

## 8. La pregunta final: ¿esta intervención comete el defecto que corrige?

`SDD-Development-Guide.md` §VI.3 la exige, y acá tiene contenido literal.

**La respuesta es no, y se verificó.** El criterio de aceptación nuevo se enunció sobre la propiedad
—«separado a los dos lados»— y no sobre el caso que lo originó, que habría sido «ningún encabezado
tiene su cuerpo pegado abajo».

## 9. Lo que esta nota deja anotado

**La lección de forma quedó escrita adentro de E4, que es una regla de migración.** Ahí sirve a quien
lee E4 y no a quien escribe una regla nueva en cualquier otra categoría, que es donde el patrón se
repite. El lugar propio sería la Parte IV de `SDD-Development-Guide.md` —«sobre qué forma le das a lo
que escribís»—, que ya alberga el criterio de paso o prosa.

**No se hace acá porque sería el defecto inverso:** generalizar a partir de un caso —cinco defectos de
**un mismo emisor**, en **una** migración— antes de tener evidencia de que el patrón aparece fuera de
él. Queda anotado para cuando la haya.

## 10. Veredicto

**APROBADO.** El conjunto 9.17 es internamente coherente en lo que esta intervención toca: E4 enuncia
el par completo, el criterio de aceptación que lo verifica es enumerable, y el único recuento
desactualizado del árbol vivo quedó corregido.

## 11. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-18 | Nota inicial de la intervención publicada como framework 9.17: **E4 pasa a exigir la separación del encabezado a los dos lados**. Registra por qué el simétrico tardó cinco categorías —la rama que lo produce es la sección idéntica en todas las versiones, y el solapamiento medio es 16,3 %—, la decisión de enunciar el par en lugar de agregar una regla hermana, y la lección de forma: **cuando una regla nace de un caso, corresponde preguntar cuál es su simétrico**. |
