# Nota de coherencia — El orquestador de reanudación

**Framework:** SDD
**Documento:** Coherencia-Orquestador-Reanudacion.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.10
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
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | **1.0** | Nuevo. Cuatro fases —R0 a R3—, dos detenciones, seis dimensiones, cuatro salidas, seis criterios y seis anti-patrones |
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

## 7. Lo que esta nota deja anotado

**El orquestador de reanudación no repara lo que encuentra, y eso deja una pregunta abierta: quién
repara una divergencia que no es de ningún orquestador.** El registro de cambios de un producto que
quedó tres etapas atrás no lo actualiza ni la generación ni la migración: lo actualiza el ciclo de
construcción, que **no tiene prompt en este método**. La salida D lo nombra y no lo resuelve.

No se resuelve acá porque **el ciclo de construcción es deliberadamente ajeno al framework** —el
método documenta antes de construir y no gobierna la construcción—, y darle un prompt sería
extenderlo a un territorio que declaró fuera de alcance. Pero la consecuencia queda: **hay una
dimensión del estado cuya fuente nadie tiene obligación de mantener**, y es la que divergió más.

## 8. Veredicto

**APROBADO.** El conjunto 8.10 es internamente coherente: los tres orquestadores están enumerados
como tres en todos los lugares vivos que los cuentan, las dos apariciones que seguían siendo ciertas
con «dos» quedaron desambiguadas, y las tres históricas están declaradas.
