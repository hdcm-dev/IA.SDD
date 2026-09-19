# Nota de coherencia — El dueño de cada fuente declarativa

**Framework:** SDD
**Documento:** Coherencia-Dueno-Fuentes-Declarativas.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.14
**Origen:** una instrucción del Product Owner — «cuando no tengas dueño, colocá un dueño genérico, y con eso lo resolvés y no dejás algo boyando»

---

## 1. Alcance

Cierre del único pendiente que una nota de coherencia declaraba sin resolver:
`Coherencia-Orquestador-Reanudacion.md` §7, **una dimensión del estado cuya fuente nadie tiene
obligación de mantener**.

## 2. El diagnóstico, y por qué el mío estaba a medias

**Yo había descartado la solución obvia.** Mi argumento era que declarar el dueño no alcanzaba, porque
el registro que se degradó **ya declaraba su regla de mantenimiento**, en su segunda línea. Al ir a
leer esa línea, decía:

> *Se actualiza en la rama de la etapa, no después de la fusión.*

**Declara el cuándo y no declara el quién.** Es una oración sin sujeto. Y una obligación sin sujeto
**no la incumple nadie en particular**, que es exactamente por qué se incumplió tres etapas seguidas
sin que nada chirriara. La instrucción del Product Owner apuntaba a la mitad que yo no tenía, y mi
objeción se apoyaba en no haber leído la regla que estaba citando.

**La otra mitad sigue valiendo, y la evidencia es fuerte.** La dimensión 5 tenía **dos** fuentes
declarativas y **las dos se degradaron**:

| Fuente | Qué exigía | Cómo terminó |
| --- | --- | --- |
| El registro de cambios del producto | Actualizarlo en la rama de la etapa | Quedó en la etapa `b` con el código en la `e` |
| La etiqueta por etapa cerrada | Etiquetar al fusionar, declarado como **el** instrumento de versionado | **Cero etiquetas en todo el repositorio** |
| *(no declarada)* El nombre de la rama en la confirmación de fusión | — | **Intacto**, y es lo único con lo que se pudo reconstruir el avance |

**Lo que sobrevivió es lo que nadie tuvo que recordar.** Las dos fuentes que exigían un gesto aparte
se degradaron; el subproducto del acto, no. Fusionar escribe el nombre de la rama sin que nadie lo
decida.

## 3. La solución, y por qué no extiende el alcance del framework

La nota anterior temía que resolver esto obligara a darle un prompt al ciclo de construcción, que el
método declara fuera de alcance. **No hace falta.** El framework no gobierna la construcción; lo que
hace es **exigir que el documento diga quién lo mantiene**, que es una propiedad del documento y no
del ciclo.

**R1 · Toda fuente declarativa nombra a su responsable, en el propio documento.** No en un plan ni en
una regla del framework: en el archivo que la persona abre cuando va a escribirlo.

**R2 · El genérico es obligatorio cuando ningún rol corresponde.** Orden de resolución: el rol que la
documentación del producto asigne; si no hay, el perfil de convención del intake; si tampoco, **la
organización dueña del repositorio**. Un responsable genérico es peor que uno preciso y **muchísimo
mejor que ninguno**: un campo vacío se lee como que la pregunta no se hizo, y un campo con la
organización se lee como que nadie más específico se hizo cargo todavía, que es verdadero y accionable.

**R3 · Entre dos fuentes posibles, gana la que es subproducto del acto.** Y su consecuencia sobre el
diseño: cuando la fuente **no** es un subproducto, el contraste observable **deja de ser opcional**.

**El framework ya sabía la respuesta y la aplicaba en un solo lugar.** `Rules-Devops.md` §4.8 tiene el
anti-patrón «CHANGELOG ausente o no mantenido» con la solución «generación automática desde
Conventional Commits»: es R3, escrito para el registro del **integrador** y nunca aplicado al registro
del **avance del producto**.

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.1 → **1.2** | §1 suma la columna **«quién la mantiene»** a las seis dimensiones; **§1.1** nueva con R1, R2 y R3 |
| `SDD/Devs/Rules/Rules-Devops.md` | 4.1 → **4.2** | §4.3 suma los ítems **7 y 8** a `Estrategia-Versionado.md`; §4.8 suma el anti-patrón con su caso observado |
| `SDD/Guides/SDD-Development-Guide.md` | 1.12 → **1.13** | La Parte IV suma el bloque «sobre las fuentes declarativas que declares», con sus cuatro preguntas |
| `SDD/Devs/Guides/Coherencia-Orquestador-Reanudacion.md` | 1.1 → **1.2** | §7 pasa de «lo que deja anotado» a **cómo se cerró** |
| `CHANGELOG.md` | — | Entrada `[8.14]` |

## 5. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Registro, encoding, fechas y nombres sin cambios |
| **D4**, **D5** | Conforme | Los cuatro archivos subieron versión y registraron su fila; comprobación 10 de §VI.3 aplicada |
| **D6** Trazabilidad | Conforme | §1.1 cita la dimensión que origina cada regla; el anti-patrón de DevOps cita el caso observado |
| **D7** Neutralidad | **Conforme, y costó** | El caso que fundamenta las tres reglas es de un destino real y se cita sin nombrarlo: «un producto declaró la etapa `b` con el código en la `e`» |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | Las tres fuentes de la tabla de §2 se verificaron sobre el árbol y el historial del destino: el registro, la ausencia total de etiquetas y los nombres de rama de las confirmaciones de fusión |

## 6. Lo que esta nota deja anotado

**R1 y R2 se exigen para las fuentes que el framework declara, y no hay forma de verificarlas en las
que el producto inventa.** Un producto puede crear mañana un documento que declare un estado sin
nombrar responsable, y ninguna comprobación del framework lo va a ver: no es un artefacto de ninguna
categoría. Lo que queda es la exigencia sobre las que sí conoce, más la pregunta de la Parte IV para
quien escribe reglas nuevas.

**Y una observación sobre cómo se llegó acá.** Las tres reglas salen de una instrucción de una sola
oración —no dejar el dueño boyando— más una lectura que yo no había hecho de la regla que estaba
citando como argumento en contra. **Mi objeción era correcta en la forma y falsa en el hecho**, y
verificarla llevó abrir un archivo.

## 7. Veredicto

**APROBADO.** El conjunto 8.14 cierra el pendiente de `Coherencia-Orquestador-Reanudacion.md` §7 sin
extender el framework al ciclo de construcción: las seis dimensiones del estado declaran quién las
mantiene, y las tres reglas gobiernan el diseño de toda fuente declarativa nueva.

## 8. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. Cierre de la dimensión sin dueño con tres reglas: **responsable nombrado en el propio documento**, **genérico obligatorio** cuando ningún rol corresponde, y **el subproducto del acto** por delante del documento que hay que acordarse de actualizar. Registra la evidencia de las tres fuentes de la dimensión 5 —dos degradadas y una intacta— y que el framework ya aplicaba R3 al registro del integrador y nunca al del avance. |
