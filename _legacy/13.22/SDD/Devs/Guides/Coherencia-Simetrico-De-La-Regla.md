# Nota de coherencia — Una regla escrita sobre su caso dejó afuera su simétrico

**Framework:** SDD
**Documento:** Coherencia-Simetrico-De-La-Regla.md
**Versión:** 1.1
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

**Y la lección que este caso deja es sobre la forma de escribir reglas, no sobre saltos de línea.**
Cuando una regla nace de un caso, tiende a quedar enunciada **sobre ese caso** y no sobre la propiedad
que el caso ilustra. Corresponde preguntar **cuál es su simétrico** antes de darla por escrita, y es el
motivo por el que el par se escribe junto. *(La 9.17 la escribió adentro de E4; la 9.18 la subió a
`SDD-Development-Guide.md` Parte IV, que es donde vive ahora. Lo cuenta §9.)*

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

## 9. Lo que esta nota dejaba anotado, y cómo se cerró en la 9.18

**La lección de forma había quedado escrita adentro de E4, que es una regla de migración.** Ahí sirve a
quien lee E4 y no a quien escribe una regla nueva en cualquier otra categoría, que es donde el patrón
se repite.

**Yo había recomendado no subirla, y el Product Owner decidió lo contrario.** Mi argumento era que
generalizar desde **un mismo emisor en una sola migración** sería el defecto inverso. **El argumento
era razonable y la premisa era falsa**, y alcanzó con ir a buscarla: el patrón ya estaba documentado
**dos veces más en el framework, con origen distinto del emisor**, en la propia §VI.3.1 de la guía.

| Regla | Se enunció sobre | Lo que quedó afuera |
| --- | --- | --- |
| Comprobación 4, «sin contradicción con lo que ya estaba» | los **archivos tocados** | el concepto fuera del alcance declarado, y el interior de lo ya tocado — **tres intervenciones seguidas** |
| La regla 4 del barrido | **el árbol** | **el texto propio de la intervención** — «la parte que faltó las cinco veces» |
| **E4** | **el cierre** del cuerpo | **la apertura**: el cuerpo pegado a su propio encabezado |

**Tres familias, tres orígenes, un mismo defecto de forma.** Con eso, el bloque de la Parte IV no
generaliza desde un caso: recoge tres.

**Y la constancia que corresponde dejar, porque es del tipo que esta nota registra.** Mi recomendación
se apoyó en un recuento de evidencia que **no verifiqué antes de recomendar**, teniendo el árbol a
mano y siendo la verificación un `grep`. Es la misma forma que los cinco defectos del emisor: **una
conclusión correcta sobre el caso que tenía enfrente, enunciada como si cubriera el resto**.

**Se cerró en la 9.18.** `SDD-Development-Guide.md` Parte IV suma «sobre las reglas que escribas a
partir de un caso observado», con las tres familias, sus cuatro preguntas, la regla de que **dos
reglas hermanas van juntas** y su límite —hay reglas cuyo caso **es** la propiedad—.
`Migracion-Rules.md` **E4 no duplica la lección: apunta**, y conserva el caso como evidencia.
`Catalogo-De-Criterios.md` suma la situación.

## 10. Veredicto

**APROBADO.** El conjunto 9.17 es internamente coherente en lo que esta intervención toca: E4 enuncia
el par completo, el criterio de aceptación que lo verifica es enumerable, y el único recuento
desactualizado del árbol vivo quedó corregido.

## 11. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-18 | Nota inicial de la intervención publicada como framework 9.17: **E4 pasa a exigir la separación del encabezado a los dos lados**. Registra por qué el simétrico tardó cinco categorías —la rama que lo produce es la sección idéntica en todas las versiones, y el solapamiento medio es 16,3 %—, la decisión de enunciar el par en lugar de agregar una regla hermana, y la lección de forma: **cuando una regla nace de un caso, corresponde preguntar cuál es su simétrico**. |
| 1.1 | 2026-08-18 | §9 pasa de «lo que deja anotado» a **cómo se cerró en la 9.18**: la lección de forma sube a la Parte IV de `SDD-Development-Guide.md`, y **E4 apunta en lugar de duplicar**. Registra que la recomendación de no subirla **se apoyaba en una premisa falsa** —que la evidencia era de un solo emitor— y que verificarla era un `grep`: el patrón ya estaba documentado **dos veces más, con origen distinto**, en §VI.3.1 de la propia guía. |
