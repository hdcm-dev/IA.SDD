# Nota de coherencia — Incorporación del archivo de reglas de base de conocimiento

**Framework:** SDD
**Documento:** Coherencia-Base-Conocimiento.md
**Versión:** 1.1
**Estado:** Vigente
**Fecha:** 2026-08-23
**Autor:** AG-00990 (Arquitecto de Soluciones)

---

## 1. Alcance

Primera intervención del plan de base de conocimiento, que corresponde al paso 1 de su orden de trabajo:
la emisión de `Rules-Base-Conocimiento.md`, el archivo de reglas que **regula el formato de un documento
de conocimiento y el contrato del índice que lo cataloga**.

**Qué se incorpora**: el continente. El formato, la nomenclatura del alias citable, las preguntas guía
del relevamiento, los criterios de aceptación con techo de tamaño, el contrato del índice, el
prompt-snippet citable y el contrato de AG-00980.

**Qué no se incorpora, y es deliberado**: ni un documento de conocimiento. El catálogo del framework
arranca y se queda vacío, porque los documentos son de la organización que los escribe y viven en su
repositorio. Es lo que evita acoplar el framework a una casa.

**Qué queda fuera de esta intervención** y corresponde a pasos posteriores del plan: el andamiaje de
intake, la mecánica del orquestador, el alta de AG-00980 en `Root-Rules.md` §9.2 y la separación de
capas de `Maqueta-Rules.md` §4. **Hasta que esos pasos corran, el archivo nuevo no lo consume nadie**, y
esa es la propiedad que hace segura a esta intervención: agrega una norma disponible sin cambiar el
comportamiento de ninguna corrida.

## 2. Inventario de archivos

### 2.1 Creados

| Archivo | Qué es |
| --- | --- |
| `SDD/Devs/Rules/Rules-Base-Conocimiento.md` 1.0 | El archivo de reglas. §0 frontera y modos de aporte, §1 especialidad, §2 documentos que produce, §3 nomenclatura y alias, §4 estructura de redacción, §5 preguntas guía, §6 criterios de aceptación, §7 contrato del índice, §8 prompt-snippet, §9 AG-00980, §10 control de cambios |
| `SDD/Devs/Guides/Coherencia-Base-Conocimiento.md` 1.0 | Esta nota |

### 2.2 Editados

| Archivo | Cambio | Motivo |
| --- | --- | --- |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` 1.12 → 1.13 | §3 suma cuatro criterios; §4 suma la fila de la regla nueva y sus totales pasan de 202 a 208, de 97 a 100 `[enumerable]` y de 105 a 108 `[interpretativo]`; §1 pasa de dieciocho a diecinueve archivos de reglas | Comprobación 12 de `SDD-Development-Guide.md` §VI.3: quien toca, registra |
| `README.md` | Dos recuentos: la fila de `SDD/Devs/Rules/` pasa a diecinueve archivos y siete transversales; la fila de modificación de invariantes pasa a diecinueve | El recuento en prosa envejece si no se actualiza con el árbol (`Root-Rules.md` §10) |
| `SDD/Guides/SDD-Development-Guide.md` 1.25 | Un recuento en §VI: una invariante vive en diecinueve archivos de reglas | Mismo motivo |

### 2.3 Publicación

| Artefacto | Estado |
| --- | --- |
| `_legacy/12.1/` | Tomado **antes** de cualquier edición, desde árbol limpio de control de versiones, según `SDD-Development-Guide.md` §VI.5 |
| `CHANGELOG.md` | Entrada 12.2 |

## 3. Verificación de invariantes

| Invariante | Verificación | Resultado |
| --- | --- | --- |
| **D1** Lenguaje | Español rioplatense, sin emojis, sin lenguaje de marketing, en los dos archivos creados | Cumple |
| **D2** Codificación | UTF-8 sin BOM, LF, fechas `YYYY-MM-DD`. Verificado por conteo de `\r` = 0 y primeros bytes del archivo | Cumple |
| **D3** Nombres | `Rules-Base-Conocimiento.md` y `Coherencia-Base-Conocimiento.md`, Título-Con-Guiones ASCII. El patrón que la regla acuña, `Knowledge-<Tema>.md`, es ASCII y sin acentos por §3.1 | Cumple |
| **D4/D5** Versionado | Los dos archivos nuevos nacen en 1.0 con su control de cambios. Los tres editados suben o mantienen versión según corresponda y conservan una sola versión vigente. El conjunto superado se archivó completo | Cumple |
| **D6** Trazabilidad | La regla nueva se indexa en `Catalogo-De-Criterios.md` §3 y §4; esta nota inventaría lo tocado; el `CHANGELOG.md` registra la publicación | Cumple |
| **D7** Neutralidad de dominio | **Verificado con atención, porque es donde esta capacidad tiene su riesgo.** El archivo de reglas no nombra ningún dominio, cliente ni producto concreto: sus ejemplos son patrones de industria (`Patron-DAO`, `Clean-Architecture`, `Atomic-Design`) y artefactos del propio framework. La regla **declara explícitamente** (§2.2) que D7 no alcanza a la base privada de una organización y que la compuerta de ofuscación rige sólo en la promoción al catálogo público | Cumple |
| **D8** Tipos cerrados | No se agrega ni se altera ningún tipo de proyecto de código. La regla cita D8 sólo como campo contra el que se expresa una condición de carga | Cumple |
| **D9** Evidencia verificable | Toda afirmación del archivo sobre el framework cita el archivo y la sección de donde sale: `Master-Prompt.md` §6 punto 1 y §9, `Root-Rules.md` §9.2 §11 §13, `Index-Design-Rules.md` §4, `Index-Modelos-UX-UI.md` §3, `Maqueta-Rules.md` §4.1 §4.2 a §4.6 §7.2, `Templates/README.md`, `Vocabulario-Rules.md` §9 | Cumple |

## 4. Verificación de trazabilidad

| Afirmación de la regla nueva | Fuente citada | Verificado |
| --- | --- | --- |
| La segunda fuente está prohibida por nombre | `Master-Prompt.md` §6 punto 1 | Sí |
| El bloque `009xx` está reservado a roles que no son de categoría | `Root-Rules.md` §9.2 | Sí. `AG-00980` no aparece hoy en el conjunto normativo; el bloque nombra únicamente a `AG-00990` |
| Dos reglas que no viajan en todo despacho detienen el conflicto | `Root-Rules.md` §13 | Sí |
| Manda el base salvo desviación documentada y justificada | `Index-Design-Rules.md` §4 | Sí |
| El nombre del modelo es agnóstico del dominio de origen | `Index-Modelos-UX-UI.md` §3 | Sí |
| El piso de método y la decisión de stack conviven mezclados hoy | `Maqueta-Rules.md` §4.1 frente a §4.2 a §4.6 | Sí |
| El apartamiento del no-build existe y se registra como ADR de proyecto | `Maqueta-Rules.md` §7.2, último párrafo | Sí |
| Las formas constructivas se transmiten mal en prosa | `Templates/README.md` §1 | Sí |
| Los estándares de industria se nombran, no se enlazan | `README.md`, autosuficiencia | Sí |
| Un glosario declara qué designa un término | `Vocabulario-Rules.md` §9 | Sí |

## 5. Observaciones

1. **La regla se emite sin consumidor, y es intencional.** `Rules-Base-Conocimiento.md` no está citada
   por ningún orquestador ni por ninguna otra regla. Es la propiedad que permite emitirla sin riesgo: si
   los pasos siguientes del plan cambian de forma, esta norma se corrige antes de que nada dependa de
   ella. La contracara es que **una regla sin consumidor es una regla que nadie ejerce**, y el catálogo
   `Modelos-UX-UI/` es el precedente de qué pasa cuando eso se prolonga: está vacío desde su
   incorporación.

2. **Dos valores quedan calibrables y están declarados como tales.** Los techos de tamaño de §6.2 —250
   líneas para `canonico`, 600 para `propio`— se fijan para que el criterio exista desde el primer día.
   Se revisan con los primeros documentos reales en la mano.

3. **El §9 depende de una decisión abierta.** Si el responsable decide que AG-00980 lleve su propio
   archivo de reglas, con el precedente de `Maqueta-Rules.md` para AG-00031, la sección se muda entera.
   El archivo lo declara en su primera línea, de modo que la mudanza no sorprende a nadie.

4. **El recuento de anti-patrones de `Catalogo-De-Criterios.md` §4 sube por primera vez desde su
   emisión.** Pasó de 202 a 208 situaciones. Vale registrarlo porque el catálogo se emitió como una
   fotografía del corpus y esta es la primera intervención que la mueve.

## 6. Veredicto

**Coherente.** La intervención agrega una norma disponible sin alterar el comportamiento de ninguna
corrida: no hay orquestador que la lea, no hay despacho que cambie de forma y ningún documento generado
con la 12.1 deja de cumplir. El conjunto sube **minor** por incorporación, según la tabla de
`SDD-Development-Guide.md` §VI.5.

## 8. Segunda intervención: lo que el piloto encontró (12.3)

El paso 3 del plan escribió **el primer documento real contra la regla**: la caracterización de una
variante de Clean Architecture con capa de datos por DataManager, `canonico`, 247 líneas bajo un techo
de 250. El documento salió; **la regla no salió intacta**, que es exactamente para lo que el piloto
está en el plan como compuerta entre bloques.

| # | Hallazgo | Corrección en 1.1 |
| --- | --- | --- |
| 1 | **La cabecera no tenía `Tema`** y el índice lo exigía como columna. Un documento cumplía §4.1 y aun así no podía completar su fila | §4.1 suma el campo. Pasa de diez campos a once |
| 2 | **Los nombres de campo diferían entre §4.1 y §7.1** —`Condición de carga` contra `Condicion-de-carga`, `Hereda de` contra `Hereda-de`— | §4.1 adopta literalmente los nombres del índice |
| 3 | **El ítem de coincidencia con el índice era inverificable.** Decía «sus campos coinciden con la cabecera», y no todos los campos viajan al índice ni todas las columnas tienen campo | Nombra los **ocho campos comunes**. §7.1 declara la correspondencia |
| 4 | **La lista no detectaba numeración interna rota.** El piloto escribió una `§4.3` sin `§4.1` ni `§4.2` y los doce ítems la dieron por buena | §6.1 suma el ítem de numeración contigua. Pasa de doce a trece |

**Los cuatro son del mismo tipo y conviene nombrarlo**: la regla se escribió mirando el documento y el
índice **por separado**, y los defectos aparecen en la costura entre los dos. Ninguno se habría visto
releyendo el archivo; los tres primeros se ven al completar una fila con una cabecera al lado, y el
cuarto al correr la lista sobre un documento que la incumple.

**Veredicto de la compuerta: se pasa.** El archivo de reglas sirvió para caracterizar un artefacto
externo, que es lo que el paso 3 tenía que probar. Las cuatro correcciones son de costura y ninguna
toca la estructura del documento ni el contrato del índice, de modo que **el Bloque II puede avanzar**.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.1 | 2026-08-23 | Suma §8 con los cuatro hallazgos del piloto del paso 3 y el veredicto de la compuerta entre bloques. Conjunto resultante **12.3**. |
| 1.0 | 2026-08-23 | Emisión inicial. Cubre la incorporación de `Rules-Base-Conocimiento.md` 1.0, su registro en `Catalogo-De-Criterios.md` y la actualización de los tres recuentos de archivos de reglas que el árbol lleva en prosa. |
