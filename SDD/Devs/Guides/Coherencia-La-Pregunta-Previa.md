# Nota de coherencia — La frontera estaba declarada y no se sabía reconocerla

**Framework:** SDD
**Documento:** Coherencia-La-Pregunta-Previa.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-18
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 9.19
**Origen del hallazgo:** `IA.SDD.Documentacion/Reportes/13`, y la corrida de audit independiente que le siguió sobre un destino real

---

## 1. Alcance

Incorporación de **la pregunta previa a toda detención** en `Master-Prompt.md` §8.1, de **la forma del
encargo al auditor** en §10, y de las **cinco reglas de emisión** que ese audit destapó en
`Migracion-Rules.md` §4.3.2.

## 2. El hueco, y por qué la regla que existía no alcanzaba

La **9.16** declaró la frontera: *defecto propio → el agente corrige; decisión de diseño → el humano*.
**Declaró de qué lado va cada cosa y no cómo reconocer de qué lado cae un hallazgo concreto.**

**Sin ese paso decide la asimetría de costos.** Detener cuesta al agente una sección del informe; al
humano le cuesta reconstruir contexto que no tiene, para decidir algo que no eligió mirar. El
equilibrio se corre siempre hacia detener, y se justifica como prudencia.

**Medido, sobre una corrida real de consolidación y cierre de migración:** de **cinco detenciones**
presentadas al Product Owner, **tres no eran del Product Owner** —dos filas de registro fuera de su
tabla, trece encabezados verificables contra su origen, y en qué orden consolidar dos categorías—.
Ninguna requería intención de producto; las tres tenían respuesta en el árbol.

**Y el daño no es sólo el tiempo del humano.** §8.1 exige que toda detención lleve análisis, opciones,
impacto y recomendación. Aplicado a un hallazgo que el agente podía cerrar, produce **tres párrafos de
análisis para una decisión que no había que tomar**, y entrena a leer las detenciones por encima — que
es exactamente lo que la 9.8 escribió §8.1 para evitar. Es el patrón que el framework ya registró dos
veces: *«un verificador que sobre-reporta entrena a ignorarlo»* y *«el procedimiento crece hasta dejar
de leerse»*. **Faltaba decirlo de la detención.**

## 3. La decisión de diseño: la cita, no el estrato

**El reporte 13 proponía un eje de clasificación nuevo** —tres estratos, con «verificable por lectura»
como el que faltaba— y declaraba su propia alternativa mínima: no crear el eje, y agregar una pregunta
previa. **Se eligió la alternativa mínima, y no por economía: porque la corrida mostró que el eje
sobraba.**

**Qué mostró la corrida.** Se encargaron tres audits independientes con **cita literal obligatoria**.
Ningún auditor tuvo que clasificar nada, y aun así la clasificación quedó hecha: **los cinco hallazgos
que se sostuvieron con cita eran resolubles contra el árbol y los cerró el agente**; el sexto —un
recuento cuyo criterio nadie había fijado— **no tuvo cita posible** y quedó para el humano.

**La exigencia de cita contesta la pregunta sola.** Pedirle además al auditor que declare de quién es
el hallazgo habría sido un concepto más que mantener, en un método que declara en su propia guía que un
procedimiento que crece deja de leerse. **Se incorpora el criterio y no el eje.**

**Y por eso §10 y §8.1 se tocan en la misma intervención**: la exigencia que hace útil al auditor es la
misma que resuelve la frontera de la detención. Separarlas habría dejado dos reglas que dependen una de
la otra en secciones distintas.

## 4. Qué compra la independencia, medido

`Master-Prompt-Migracion.md` §10 exige auditor independiente desde la 1.0 y **no declaraba para qué**,
lo que dejaba la puerta abierta a encargarle una verificación en forma de pregunta abierta.

| | Verificado en la corrida |
| --- | --- |
| **Sí compra: ausencia de compromiso** | Las **dos refutaciones** fueron sobre decisiones que el agente auditado había tomado y defendido. Ninguna verificación mecánica las alcanzaba |
| **No compra: independencia de criterio** | No se observó, y se declara como riesgo de diseño y no como medición: dos agentes del mismo modelo ante una pregunta abierta tienden a coincidir, y **una confirmación correlacionada cierra el hallazgo peor que no haberlo mirado** |

**El audit no movió ningún recuento** —416 filas, 18 504 líneas, los enlaces— como el propio informe
había anticipado. **Movió dos decisiones de juicio y destapó cuatro defectos** que ninguna verificación
buscaba. Es exactamente el reparto que §10.0 describe cuando dice para qué existe el auditor.

## 5. Las cinco reglas de emisión, y qué las hace distintas de las anteriores

`Migracion-Rules.md` §4.3.2 llevaba **E1 a E4** y **C1 a C5**, todas nacidas de defectos que **la
verificación de preservación había encontrado**. Las cinco nuevas nacen de defectos que **ninguna
verificación existente encontró**, y por eso cada una llega con su criterio enumerable:

| Regla | Qué destapó | Por qué no se veía |
| --- | --- | --- |
| **E5** · el índice de un documento absorbido no transpone | 93 entradas con ancla rota | El verificador comprobaba **archivos, no anclas internas** |
| **E6** · dos secciones que sólo difieren en su número son la misma | 4 secciones duplicadas | Y el daño mayor: **lo que se agrega después se registra en la equivocada** |
| **E7** · un documento que sale por S4 también sube su versión | 28 documentos | El registro se contradecía a sí mismo y nadie lo comparaba |
| **E8** · ninguna unificación de encabezados por sustitución de cadena | «a **este cada** proyecto de código», en 3 documentos | **El resultado seguía siendo un encabezado válido** |
| **C0** · la medición decide si fusionar, no con quién ligar | Un par mal apareado | La medición era correcta; se la usó para una pregunta que no contesta |

**E8 es el primer anti-patrón que §7 de esta misma regla nombra**, cometido por la consolidación que la
regla gobierna. Es el sexto caso del patrón que la Parte IV de `SDD-Development-Guide.md` describe desde
la 9.18, y esta vez con una vuelta más: **la regla estaba escrita para términos y no para encabezados**,
que es el simétrico de su alcance.

## 6. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.6 → **8.7** | §8.1 suma **la pregunta previa** con su medición y su «ante la duda, se detiene»; §10 suma **qué compra la independencia** y las **tres partes del encargo** |
| `SDD/Devs/Rules/Migracion-Rules.md` | 3.13 → **3.14** | §4.3.2 suma **E5 a E8** y **C0**; §6 suma **tres criterios enumerables** |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.4 → **1.5** | Dos situaciones nuevas en §3 |
| `CHANGELOG.md` | — | Entrada `[9.19]` |
| `SDD/Devs/Guides/Coherencia-La-Pregunta-Previa.md` | — | Esta nota |

## 7. El barrido por concepto

Conceptos barridos: **«detención»** y **«auditor independiente»**, en todo el árbol vivo.

**Nada más que actualizar.** §8.1 F1 a F4 declaran **la forma** de una detención legítima y siguen
siendo correctos: la pregunta previa se aplica **antes**, y decide si hay detención. Los tres
orquestadores nombran al auditor sin describir su encargo, de modo que la incorporación en §10 les llega
por la delegación que ya declaran.

**La regla 4, sobre el texto propio:** el bloque nuevo de §8.1 no introduce ninguna detención de
ejemplo que su propia regla desaconsejaría.

## 8. La pregunta final: ¿esta intervención comete el defecto que corrige?

**No, y se verificó con el criterio que la intervención incorpora.** De los seis hallazgos del audit,
**cinco se cerraron sin llevarlos al humano** y **uno se dejó abierto** —los recuentos de entidades de
dos modelos conceptuales, donde decidir qué cuenta como entidad no se resuelve contra el árbol—. La
regla se aplicó a la corrida que la originó, y la corrida se comportó como la regla predice.

**Lo que sí conviene declarar:** la evidencia de la clasificación es de **una corrida**, y §9 lo anota.

## 9. Lo que esta nota deja anotado

**Tres de cinco no es una tasa.** El patrón es consistente con la asimetría de costos de §2, pero una
corrida no mide una frecuencia. Si en las próximas la proporción de detenciones evitadas es
sensiblemente menor, la pregunta previa está de más y **la corrección barata es quitarla**, no
refinarla.

**Y un límite del criterio, que sólo se va a ver con uso.** «Sostenible con cita literal» es más nítido
que «¿es del humano?», pero **sigue siendo un juicio del agente sobre su propio trabajo**, que es el
compromiso que §10 existe para neutralizar. La corrida que originó la regla tuvo un auditor externo
estableciendo las citas; **una corrida sin auditor deja al agente citando para sí mismo**, y eso no se
midió.

## 10. Veredicto

**APROBADO.** El conjunto 9.19 es internamente coherente: la pregunta previa se aplica antes de F1 a F4
y no los contradice, el encargo al auditor de §10 declara la exigencia que la pregunta previa consume, y
las cinco reglas de emisión nuevas llegan cada una con su criterio de verificación.

## 11. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-18 | Nota inicial de la intervención publicada como framework 9.19. Registra que la 9.16 declaró la frontera de la autocorrección **sin declarar cómo reconocerla**, que en su lugar decidía la asimetría de costos —**tres de cinco detenciones de una corrida real no eran del humano**—, y que se eligió **la alternativa mínima del reporte 13** —una pregunta previa— **sobre el eje de estratos que ese reporte proponía**, porque la corrida mostró que **la exigencia de cita literal contesta la pregunta sola**. Documenta qué compra la independencia del auditor —ausencia de compromiso— y qué no —independencia de criterio—, y las cinco reglas de emisión que el audit destapó, las cinco invisibles para las verificaciones existentes. |
