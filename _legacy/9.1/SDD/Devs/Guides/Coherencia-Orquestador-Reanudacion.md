# Nota de coherencia — El orquestador de reanudación

**Framework:** SDD
**Documento:** Coherencia-Orquestador-Reanudacion.md
**Versión:** 1.2
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.11
**Origen:** una pregunta del Product Owner al terminar una migración real — «si corto a mitad de camino, ¿cómo se continúa desde una sesión limpia?»

---

## 1. Alcance

Incorporación del **tercer orquestador** del método y de su prompt de entrada, más el barrido por
concepto sobre los lugares que enumeraban dos.

## 2. El hueco, y cómo se verificó que existía

**La pregunta se contestó buscando el procedimiento, y no había ninguno.** `Master-Prompt.md`,
`Master-Prompt-Migracion.md` y `Migracion-Rules.md` declaran detenciones, confirmaciones humanas y
auditores «invocados desde cero», pero **ninguno declara cómo se retoma**.

**Lo que había en su lugar era una propiedad cierta y no escrita:** el estado vive en el árbol y no
en la conversación. Es lo que hace que un agente distinto pueda seguir donde otro dejó, y es la razón
por la que el framework existe. **Que fuera cierta sin estar declarada es lo que hizo que nadie la
verificara.**

**Y la corrida que produjo la pregunta tenía la prueba del daño.** El destino declaraba en su
registro de cambios la etapa `b` y su código estaba en la `e`: **tres etapas fusionadas que nunca
actualizaron el único documento que declara el avance**, con la regla de actualizarlo escrita en la
segunda línea de ese mismo documento. Una sesión limpia habría concluido que faltaba arrancar la `c`.

**No es un caso aislado, y por eso el prompt no se limita a esa dimensión.** En la misma corrida
divergieron otras dos: el informe de migración declaró **tres veces** que la migración estaba
completa mientras había 146 documentos esperando en `_fusion/`, que es la señal que la propia regla
define como fusión sin terminar. Las tres divergencias tienen la misma forma: **una fuente
declarativa que quedó atrás y sigue afirmando lo último que alguien escribió**.

## 3. La decisión de diseño: contraste, no confianza

**Las seis dimensiones del estado tienen fuente declarativa; tres tienen además contraste
observable.** Las tres son exactamente las que divergieron. La regla que las gobierna es que **gana
el observable y la divergencia se declara**, nunca al revés.

Es la misma lección que la 8.9 incorporó al audit —un recuento correcto puede sostener una conclusión
falsa— aplicada al problema inverso: allá se trataba de no darle a una comprobación más alcance del
que tiene; acá, de no creerle a un documento sobre sí mismo.

**Y una decisión que conviene defender: las salidas son cuatro y no tres.** Las tres primeras invocan
un prompt —reparar, migrar, seguir en la versión declarada—; la cuarta, **continuar la
construcción**, no invoca ninguno. Es la más frecuente y la que más se pasa por alto, precisamente
porque es la única sin prompt propio. Un método que sólo ofrece lo que sabe ejecutar **sesga la
decisión hacia lo ejecutable**, y en un destino con documentación generada y código a mitad de camino
la respuesta correcta a «¿cuál orquestador corro?» es «ninguno».

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | **1.1** | Nuevo. **Cinco fases —R0 a R4—**, dos detenciones, seis dimensiones, cuatro salidas, nueve criterios y nueve anti-patrones |
| `PROMPTS/PROMPT-Agente-Reanudacion-SDD.md` | **1.0** | Nuevo. Tercer prompt de entrada, con la tabla de los tres y su cardinalidad |
| `Master-Prompt.md` | 7.5 → **7.6** | §2.1 apunta al orquestador de reanudación cuando no se sabe el estado, y declara que resuelve **una** de sus seis dimensiones |
| `Migracion-Rules.md` | 3.3 → **3.4** | Desambiguación: «el contrato entre los dos orquestadores» pasa a nombrarlos |
| `Master-Prompt-Migracion.md` | 2.1 → **2.2** | Misma desambiguación en su tabla de artefactos |
| `README.md`, `SDD-User-Guide.md`, `SDD-Development-Guide.md`, `SDD-Getting-Started-Guide.md`, `PROMPT-Agente-Migracion-SDD.md` | — | Los recuentos de «dos» pasan a tres, y las tablas de ruteo suman su fila |

## 5. El barrido por concepto, que esta intervención estrena

**Es la primera intervención que corre la comprobación 8 de `SDD-Development-Guide.md` §VI.3**, y
encontró **siete lugares** fuera del alcance declarado. El concepto barrido fue «los dos» aplicado a
orquestadores, master-prompts y prompts de entrada.

**Cuatro se actualizaron** —los recuentos y las tablas de ruteo—. **Dos se desambiguaron en lugar de
recontarse**: «el contrato entre los dos orquestadores» seguía siendo cierto —el plan es contrato de
generación y migración, y la reanudación no es parte— pero pasaba a ser ambiguo con tres, así que se
nombraron. **Tres se dejaron y se declaran acá**: las apariciones en `CHANGELOG.md` y en dos notas de
coherencia anteriores son **registros de lo que se verificó en su fecha**, y reescribirlas falsearía
el registro.

**El barrido justificó su incorporación en su primera corrida**: cuatro de los siete lugares no
estaban en el alcance que yo habría declarado —dos guías de usuario, la de arranque y un prompt de
entrada—, y sin el barrido habrían quedado diciendo «dos».

## 6. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D2** | Conforme | Registro, encoding y fechas sin cambios |
| **D3** Nombres | Conforme | El archivo nuevo sigue `Título-Con-Guiones` y el patrón `Master-Prompt-<Función>.md` |
| **D4**, **D5** | Conforme | Cada archivo tocado subió versión y registró su fila |
| **D6** Trazabilidad | Conforme | El orquestador nuevo cita la regla de cada dimensión que lee y no redefine ninguna mecánica |
| **D7** Neutralidad | Conforme | El destino que originó la pregunta se cita como «una corrida real», sin nombrar su dominio |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | Las tres divergencias que fundamentan el diseño se verificaron sobre el árbol y el historial del destino |

## 6.1 El hueco que la 1.0 dejó, señalado por el Product Owner el mismo día

**La 1.0 escribió un orquestador que diagnosticaba y se detenía.** Sus cuatro fases terminaban en un
informe, y las salidas decían a qué prompt ir. La pregunta que lo destapó fue directa: *«y si no se
migra —porque no hay que migrar o porque se eligió no hacerlo—, ¿retomaría, recuperaría el contexto y
seguiría?»*.

**La respuesta era no, y ése era el defecto.** Un prompt de reanudación que termina diciendo «ahora
ejecutá tal otro» **deja al siguiente volviendo a deducir lo que acaba de deducir**, que es
exactamente el trabajo que vino a evitar. Y en la salida más frecuente —continuar la construcción—
**no hay «tal otro»**: no tiene prompt, de modo que el humano se quedaba con un diagnóstico y sin
punto de continuación.

**Tres correcciones, y las tres son la misma:**

1. **El informe deja de ser un diagnóstico y pasa a ser el instrumento de entrega.** Suma el **diff
   normativo** que el orquestador siguiente consume, la **decisión** con su autor y fecha, y el
   **punto de continuación** —la etapa que sigue, su puerta de entrada y los documentos que la
   gobiernan—. Ese último bloque existe **para la salida que no tiene prompt**.
2. **Entra R4, la continuación.** Escrito el informe, **se sigue en la misma sesión**. Cortar ahí
   también es válido si el humano quiere sólo el diagnóstico; lo que no es válido es lo inverso,
   continuar sin escribirlo, porque entonces el contexto vuelve a vivir sólo en la sesión.
3. **La decisión viaja, y por eso no se vuelve a preguntar.** `Master-Prompt.md` §2.1 lee la decisión
   del informe e informa el desfase **como decidido**; `Master-Prompt-Migracion.md` M1 **verifica** el
   diff en lugar de reconstruirlo. Preguntar dos veces lo mismo **enseña a contestar sin leer**, que
   es peor que no haber preguntado.

**La 1.0 cometió el defecto que la 8.9 había escrito para evitar**, en su versión de alcance: la
pregunta «¿mi intervención cometió el defecto que corrige?» tenía respuesta afirmativa —un prompt
contra la pérdida de contexto que no entregaba contexto— y no me la hice antes de publicar. Queda
registrado porque **es el cuarto caso del mismo patrón**, y los tres anteriores están en esa misma
regla.

## 7. Lo que esta nota dejaba anotado, y cómo se cerró

**El orquestador de reanudación no repara lo que encuentra, y eso deja una pregunta abierta: quién
repara una divergencia que no es de ningún orquestador.** El registro de cambios de un producto que
quedó tres etapas atrás no lo actualiza ni la generación ni la migración: lo actualiza el ciclo de
construcción, que **no tiene prompt en este método**. La salida D lo nombra y no lo resuelve.

No se resuelve acá porque **el ciclo de construcción es deliberadamente ajeno al framework** —el
método documenta antes de construir y no gobierna la construcción—, y darle un prompt sería
extenderlo a un territorio que declaró fuera de alcance. Pero la consecuencia queda: **hay una
dimensión del estado cuya fuente nadie tiene obligación de mantener**, y es la que divergió más.

**Se cerró en la 8.14, y la mitad que faltaba la aportó el Product Owner.** Yo había concluido que
nombrar al dueño no alcanzaba, porque el registro que se degradó **ya declaraba su regla**. Al ir a
leerla, la regla decía: *«se actualiza en la rama de la etapa, no después de la fusión»*. **Declara el
cuándo y no declara el quién**: es una oración sin sujeto, y una obligación sin sujeto no la incumple
nadie en particular. Faltaba un dueño, literalmente.

La solución **no extiende el framework al ciclo de construcción**, que es lo que esta nota temía. No le
da un prompt ni lo gobierna: exige que el documento **nombre a su responsable**, con un genérico
obligatorio —hasta la organización dueña del repositorio— cuando ningún rol corresponde, y que entre
dos fuentes posibles gane **la que es subproducto del acto**. `Master-Prompt-Reanudacion.md` §1.1 lo
declara con sus tres reglas, `Rules-Devops.md` §4.3 lo exige en la estrategia de versionado del
producto, y la Parte IV de `SDD-Development-Guide.md` lo pregunta a quien escribe una regla nueva.

## 8. Veredicto

**APROBADO.** El conjunto 8.10 es internamente coherente: los tres orquestadores están enumerados
como tres en todos los lugares vivos que los cuentan, las dos apariciones que seguían siendo ciertas
con «dos» quedaron desambiguadas, y las tres históricas están declaradas.
| 1.1 | 2026-08-16 | §6.1 nueva: el hueco que la 1.0 dejó —diagnosticaba y se detenía, sin entregar el contexto— y sus tres correcciones. El informe pasa a ser **instrumento de entrega**, entra **R4** y **la decisión viaja** para que el orquestador siguiente no vuelva a preguntar. Registra que la 1.0 **cometió el defecto que corregía**, cuarto caso del patrón que la 8.9 declara. |
| 1.2 | 2026-08-16 | §7 pasa de «lo que deja anotado» a **cómo se cerró**: la 8.14 resuelve la dimensión sin dueño sin extender el framework al ciclo de construcción. Registra que la regla del registro degradado **declaraba el cuándo y no el quién**, y que la mitad que faltaba la aportó el Product Owner. |
