# Nota de coherencia — El ciclo de apartamientos

**Framework:** SDD
**Documento:** Coherencia-Ciclo-De-Apartamientos.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-17
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 9.7
**Origen:** el Product Owner — «si no se absorbieron, que se preserven esas lecciones o se estudien en el momento de migrar»

---

## 1. Alcance

Un destino acumula **reglas locales que el método no contempla** —los apartamientos de
`Root-Rules.md` §11— y **la migración no las miraba**. Esta intervención les da estado, contador y un
paso de revisión con tres resultados.

## 2. Lo que ya existía, y era la pieza difícil

**§11 exige desde hace tiempo que todo apartamiento declare «los disparadores concretos que superarían
la decisión».** Esa cuarta exigencia es lo que hace evaluable el ciclo entero **sin inventar criterio
nuevo**: al migrar no hay que juzgar si la lección sigue valiendo, hay que leer su disparador y
preguntar si la normativa vigente lo cumple. **El apartamiento ya declaró cómo se lo juzga.**

Lo que faltaba eran tres cosas, y ninguna era el criterio:

| Faltaba | Consecuencia |
| --- | --- |
| Que la migración los revisara | **Cero menciones** a apartamientos en `Migracion-Rules.md` y en el orquestador de migración |
| Estado en el ADR | Un apartamiento absorbido, uno contradicho y uno todavía vigente **se veían iguales**: un ADR viejo |
| Un disparador para reportarlo aguas arriba | El circuito de reportes vivía **fuera del framework**, como convención, y dependía de que alguien se acordara |

**Una precisión que evita un error.** La marca *«aguas arriba»* de `Master-Prompt.md` §10 **no era** el
canal: está definida para un defecto que una fase reprodujo de **otro artefacto del mismo destino**,
típicamente el intake. No apunta al método.

## 3. Las tres decisiones de diseño

**La primera: el contradicho no estrena detención.** Es la **detención por arbitraje** de §7.0, que
existe desde la 4.1 y cuya forma es idéntica —dos cosas aprobadas que se contradicen y ninguna
autoridad en el agente para elegir—. Lo único que cambia es qué se contradice: allá dos categorías del
mismo producto, acá el destino y el método a través de un salto de versión. **Agregar una detención
propia habría sumado carga sin sumar criterio**, y el framework ya tiene más de quince.

**La segunda: el contador es el disparador.** Un apartamiento que sobrevive **dos o más saltos** sin
ser contemplado **ya demostró que no es de un producto**: si fuera circunstancial, alguna versión lo
habría alcanzado. Se declara candidato a regla del framework, y **lo declara un número**. Es la primera
respuesta que el método tiene al problema del disparador, que falló dos veces registradas: el barrido
retroactivo, cuyo criterio «no se disparó ninguna de las tres veces», y los doce reportes de evidencia,
que quedaron marcados como pendientes cuatro días después de haberse resuelto.

**La tercera: los apartamientos preservados no se re-fundamentan.** Si uno sigue vigente, se conserva
con su **texto literal**. Reescribir su fundamento contra la normativa nueva produciría un ADR que dice
haber decidido algo que **en su fecha nadie decidió**, y §4.1 lo prohíbe por la misma razón por la que
no se rellena una sección sin fuente.

## 4. Barrido declarado (§VI.3.2)

| Concepto | Forma anterior | Forma vigente |
| --- | --- | --- |
| El ADR de apartamiento | cuatro campos | seis campos, con **estado** y **saltos sobrevividos** |

**Corrida:** las menciones vivas a apartamiento fuera de §11 son las de `Master-Prompt.md` §10 —el
criterio del audit— y las de las reglas de categoría que lo ofrecen como salida. **Ninguna enumera los
campos**, así que ninguna queda desactualizada por el agregado. **Regla 4 sobre el texto propio:** los
dos campos nuevos aparecen en §11, en §4.7 y en M1, que son los tres lugares que los declaran.

## 5. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Rules/Root-Rules.md` | 6.0 → **6.1** | §11 suma los campos **5** y **6** con su fundamento |
| `SDD/Devs/Rules/Migracion-Rules.md` | 3.6 → **3.7** | **§4.7 nueva**, y §6 suma dos criterios enumerables |
| `SDD/Devs/Orchestrator/Master-Prompt-Migracion.md` | 2.5 → **2.6** | M1 suma la revisión al plan |
| `CHANGELOG.md` | — | Entrada `[9.7]` |

## 6. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres |
| **D4**, **D5** | Conforme | Los tres archivos subieron versión y registraron su fila; comprobación 10 en cero |
| **D6** Trazabilidad | **Conforme, y es el punto** | §4.7 no define criterio: **lee el campo 4 del ADR**, que §11 ya exigía y que nadie consumía |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** Conjunto cerrado | Conforme | No se toca. El estado del apartamiento es un conjunto cerrado **nuevo y propio**, de cuatro valores, y no toca D8 |
| **D9** Evidencia | Conforme | La ausencia de revisión se midió: cero menciones a apartamientos en la regla de migración y en su orquestador |

## 7. Lo que esta nota deja anotado

**El inventario de detenciones nunca se miró completo.** Contando las obligatorias de generación,
maqueta, migración y reanudación hay **más de quince puntos** donde el proceso se detiene y pregunta.
Cada una está justificada por separado; **nadie midió la suma**. Y el modo de falla ya está
identificado con esas palabras desde la 8.11: **un proceso que pregunta demasiado enseña a contestar
sin leer**.

Esta intervención lo tuvo presente —por eso el contradicho reusa §7.0 en vez de estrenar detención—
pero **no lo resuelve**: hacerlo exige revisar las quince juntas, decidir cuáles son del mismo tipo y
cuáles se pueden agrupar en una sola parada, y es una intervención propia.

## 8. Veredicto

**APROBADO.** La migración revisa los apartamientos del destino con tres resultados y ninguno
silencioso, el criterio de la revisión sale del propio ADR en lugar de inventarse, el caso que exige
decidir usa la detención que ya existía, y los que sobreviven se reportan solos.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-17 | Emisión inicial. La migración pasa a **revisar los apartamientos** con tres resultados, leyendo el **campo 4 del propio ADR** en lugar de inventar criterio. El **contradicho reusa la detención por arbitraje** de §7.0. El **contador de saltos sobrevividos** es la primera respuesta del método al problema del disparador, que falló dos veces registradas. Deja anotado que **el inventario de detenciones nunca se miró completo**. |
