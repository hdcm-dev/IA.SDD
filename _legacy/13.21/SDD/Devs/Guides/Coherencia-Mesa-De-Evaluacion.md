# Nota de coherencia — La etapa que faltaba entre leer el estado y decidir qué hacer

**Framework:** SDD
**Documento:** Coherencia-Mesa-De-Evaluacion.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-27
**Autor:** AG-00990 (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 13.7
**Origen:** una observación del Product Owner sobre el ciclo de reanudación — *«entra en rondas
consultando temas que ya estaban resueltos, y el framework no hace una mirada analítica y estratégica
completa de lo que ya existe antes de retomarlo»*

---

## 1. Alcance

Incorporación de **la mesa de evaluación** como mecanismo de preplanificación, con su regla propia
(`Mesa-Rules.md`), su rol (`AG-00970`) y sus dos puntos de convocatoria: **R1.5** del orquestador de
reanudación y **M1** del de migración.

## 2. El hueco, y cómo se verificó que existía

**Se buscó el procedimiento que analiza el corpus antes de decidir qué hacer con él, y no hay
ninguno.** Lo que hay son dos mecanismos que parecen cubrirlo y no lo cubren, y **los dos lo declaran
por escrito**:

| Mecanismo | Qué declara de sí mismo | Por qué no cubre el hueco |
| --- | --- | --- |
| `Master-Prompt-Reanudacion.md` §2, «Lo que no se hace en R0» | *«No se abre ninguna categoría documental para juzgar su contenido. La reanudación reconstruye dónde está el trabajo, no si está bien hecho»* | Lee **ubicación**, nunca contenido |
| `Master-Prompt.md` §10 | *«Cada cierre de fase dispara un audit independiente»* | Corre **después de producir**. Sobre un corpus que todavía nadie tocó, no corre nunca |

**Entre las dos hay un intervalo en el que se toma la decisión más cara del método —qué hacer con el
destino— sin que nadie haya leído el destino.** Y el plan que sale de ahí se compone con el **diff
normativo**, que compara dos versiones del framework y es ciego a lo que el destino dice de sí mismo.

## 3. La medición, que es lo que convierte la intuición en hallazgo

**Dos mediciones del propio framework, ninguna nueva, las dos ya registradas:**

**Primera — las detenciones que no eran del humano.** `Master-Prompt.md` §8.1 y
`Coherencia-La-Pregunta-Previa.md` §2 registran que, en una corrida real de consolidación y cierre de
migración, **de cinco detenciones presentadas al Product Owner tres no eran suyas**: dos filas de
registro fuera de su tabla, trece encabezados verificables contra su origen y el orden de consolidar
dos categorías. *«Ninguna requería intención de producto; las tres tenían respuesta en el árbol.»*

**Es exactamente la observación del Product Owner, medida al 60 %.**

**Segunda — los hallazgos que viajaban sin abrirse.**
`IA.SDD.Documentacion/Informes/Memoria-De-Antecedentes-Casos-Resueltos.md` §2.2 registra que los diez
hallazgos abiertos de un destino estaban repartidos en **cinco informes de migración** que hubo que
cruzar a mano, y que al abrirlos **tres no eran lo que declaraban ser**: cuatro «enlaces rotos» que no
lo eran, cuatro citas «a documentos inexistentes» que existían renumerados, y una propagación
declarada pendiente que ya había ocurrido tres veces. **Los cuatro falsos enlaces rotos viajaron tres
informes** antes de que alguien los abriera.

El informe lo formula mejor de lo que yo podría: *«un hallazgo copiado de un informe al siguiente no
es conocimiento recuperado, es conocimiento reenviado. La diferencia es que el segundo nunca se
verifica.»*

**Las dos mediciones son el mismo defecto visto de los dos lados.** Del lado del humano, consultas que
el árbol contestaba. Del lado del árbol, afirmaciones que nadie contrastó. Las dos las produce la
misma ausencia: **nadie abre el corpus antes de planificar sobre él**.

## 4. La decisión de diseño: un mecanismo, no un cuarto orquestador

**La tentación era escribir `Master-Prompt-Preplanificacion.md`.** Se descartó, y el criterio lo da el
propio método: los tres orquestadores están separados por **cardinalidad** —una vez por producto, una
por salto de versión, una por reanudación—, y la preplanificación no tiene una cardinalidad propia:
ocurre **una vez por plan de cambios**, que es un evento **de dentro** de las otras tres.

**El precedente correcto es el audit.** `Master-Prompt.md` §10 es un mecanismo que los tres
orquestadores invocan, con su regla, su rol y su artefacto, y **no es un orquestador**. La mesa se
construyó con esa forma exacta: mecánica en `Mesa-Rules.md`, invocación en el orquestador, por el
principio de delegación de la especialidad de `Master-Prompt.md` §1.

## 5. Dónde va, que es la pregunta que el prompt de origen pedía resolver

El origen planteaba dos ubicaciones posibles: **antes, para componer el plan**, o **durante la
migración, para crear y aprobar el plan**. La respuesta es que **son el mismo momento visto desde dos
prompts**, y el método ya tenía el artefacto que los une: `Master-Prompt-Migracion.md` §12 declara que
el plan de migración es *«el contrato entre el orquestador de generación y el de migración»*.

**El momento es uno: después de leer el estado, antes de aprobar el plan.** Tres argumentos, y los
tres se sostienen contra el árbol:

1. **Antes no se puede.** El contrato de entrada de la mesa (`Mesa-Rules.md` §4) es la salida de R0.
   Convocarla antes sería planificar sobre lo que se supone, que es lo que `Migracion-Rules.md` §3
   rechazó con cinco fundamentos al descartar los playbooks por salto, y lo que `Master-Prompt.md`
   §8.1 generaliza: *«un plan escrito antes de tener el estado a la vista planifica sobre lo que se
   supone»*.
2. **Después es tarde.** R2 es donde el humano elige entre las cinco salidas, y M4 es donde el plan se
   aplica. Los hallazgos que aparecen en M4 aparecen **de a uno, sobre un árbol ya en escritura**, y
   cada uno es una detención. Es el mecanismo que produce las rondas.
3. **Corre una vez y sirve a las cinco salidas.** Su plan de cambios es la lista de trabajo de la
   salida A, entra al plan de migración de la B y la E, funda la verificación artefacto por artefacto
   que la C exige, y es el punto de continuación de la D.

**Y por eso M1 la verifica en lugar de reconvocarla** cuando la invocación llega desde la reanudación.
No es una optimización: es el precedente que la 2.3 del orquestador de migración ya fijó para el diff
normativo — *«reconstruirlo desde cero no lo hace más confiable: lo hace más lento, y arriesga dos
diffs del mismo salto que no coinciden»*.

## 6. Qué se importó del marco de origen y qué se rechazó

El marco propuesto —`Mesa-Evaluadora.md` del prompt de origen— trae nueve mecanismos. **Cinco entran,
cuatro se rechazan porque el método ya los tiene**, y rechazarlos es lo que impide que la mesa se
convierta en un segundo framework adentro del framework.

| Mecanismo propuesto | Decisión | Motivo |
| --- | --- | --- |
| Panel compuesto por **señal observable**, con núcleo permanente y ad hoc con carta de mandato | **Entra** | El método no tiene nada que elija revisores por lo que el artefacto contiene. Es el aporte más grande |
| **Jurado de cinco funciones objetivo**, votando por hallazgo | **Entra** | El método detecta y corrige, y **nunca pesa si corregir vale la pena**. Todo hallazgo se convierte en trabajo |
| **Separación entre quien diseña el parche y quien lo aprueba** | **Entra** | Hoy el que encuentra es el que corrige |
| **Escaladas agrupadas con default declarado** | **Entra** | Es la respuesta directa a las rondas. §8.1 fijaba la **forma** de una detención; faltaba el **lote** |
| **Lista cerrada de siete disparadores de escalada** | **Entra** | §8.1 fija el criterio —*«¿tiene respuesta en el árbol?»*— y no enumera los casos en que la respuesta es no |
| Severidades **S1 a S4** | **Se rechaza** | El método tiene **P0 a P3** (`Master-Prompt.md` §10). Dos escalas para la misma pregunta son dos conjuntos cerrados en conflicto, que es lo que §7.0 existe para arbitrar |
| Cinco **chequeos mecánicos de coherencia** propios | **Se rechaza** | Es la **compuerta mecánica** de §10.0, que además ya exige banco de casos desde la 13.6. La mesa la corre; no la redefine |
| Criterio de parada por **rendimientos decrecientes del 20 %** y `ciclos_max` | **Se rechaza** | §10.1 ya lo fija: dos rondas sin hallazgo interpretativo, y cuatro rondas suben al humano declarando que cerró **por decisión y no por criterio** |
| **Esquemas JSON** para hallazgo, veredicto y parche | **Se rechaza** | Los informes del método son documentos con tablas, sujetos a D1 a D9. Un formato paralelo obligaría a auditar dos |

**Lo único que se importó como escala propia es la clase del ancla, E1 a E4 y C.** El método exige
cita literal desde la 9.19 y **no la gradúa**, y esa graduación resuelve mecánicamente la pregunta
previa de §8.1: con ancla, lo cierra el agente; sin ancla posible, es del humano. No es un concepto
nuevo: es el que ya estaba, con nombre.

## 7. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Rules/Mesa-Rules.md` | **1.0** | Nuevo. Once secciones, cuatro principios, ciclo P0 a P5, **catorce criterios de aceptación** y **doce anti-patrones** |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.9 → **1.10** | **§3.1 nueva: R1.5**, con sus tres motivos de ubicación, su tabla de cuándo se convoca y qué recibe R2. §4.0 suma cuatro renglones a la recomendación; §5 suma el bloque de resultado de mesa al informe; R4 redefine qué ejecuta la salida A y qué lleva la B |
| `SDD/Devs/Orchestrator/Master-Prompt-Migracion.md` | 2.8 → **2.9** | §1 suma la fila de la mesa al contrato de citas; §2 suma el insumo; **M1 la convoca o la verifica**; M6 suma un P0 por parche aplicado aguas abajo |
| `PROMPTS/PROMPT-Agente-Reanudacion-SDD.md` | 1.3 → **1.4** | §3 declara R1.5 y §4 declara que las consultas llegan **en lote y con default**. Corrige además su cabecera, que declaraba 1.0 con el registro en 1.3 |
| `PROMPTS/PROMPT-Agente-Migracion-SDD.md` | 2.0 → **2.1** | La fase M1 pasa a nombrar la mesa; §4 suma su registro a lo que se recibe |
| `SDD/Devs/Rules/Root-Rules.md` | 8.5 → **8.6** | **Alta de `AG-00970`** en el bloque `009xx`, por la regla de acuñación que la 8.5 escribió |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.13 → **1.14** | §3 suma **cinco criterios**; §4 suma la fila de la regla nueva; los totales pasan de 208 a **220**, de 100 a **107** y de 108 a **113** |
| `README.md`, `SDD-Development-Guide.md` 1.29, `SDD-User-Guide.md` 1.20 | — | Recuentos de diecinueve a **veinte** archivos de reglas y de siete a **ocho** transversales; fila de ruteo nueva |

## 8. El barrido por concepto

**Concepto barrido**: los recuentos de archivos de reglas y de reglas transversales, y las
enumeraciones de master-prompts. Cinco lugares alcanzados, **cuatro actualizados y uno declarado**:

- `README.md`, dos recuentos, y **un dato que además estaba viejo**: la fila de modificación de
  invariantes decía «los dos orquestadores» y el tercero existe desde el conjunto 8.10.
- `SDD-Development-Guide.md` §I.2 y §V, con el mismo dato viejo en la segunda.
- `SDD-User-Guide.md` §4.4.
- `Catalogo-De-Criterios.md` §1.
- **Declarado y no tocado**: las apariciones de «diecinueve» y «diecisiete» en `CHANGELOG.md` y en
  notas de coherencia anteriores. Son **registros de lo que se verificó en su fecha**, y reescribirlas
  falsearía el registro. Es el mismo criterio de `Coherencia-Orquestador-Reanudacion.md` §5.

**El barrido encontró dos recuentos que ya estaban viejos antes de esta intervención** —«los dos
orquestadores», en dos archivos—, que es exactamente el rendimiento que `SDD-Development-Guide.md`
§VI.3 comprobación 8 declara esperar de él.

## 9. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1**, **D2** | Conforme | Registro, encoding y fechas sin cambios |
| **D3** Nombres | Conforme | `Mesa-Rules.md` sigue el patrón `<Tema>-Rules.md` de las transversales; `Coherencia-Mesa-De-Evaluacion.md` sigue Título-Con-Guiones ASCII; `AG-00970` cumple `AG-[0-9]{5}` |
| **D4**, **D5** | Conforme | Cada archivo tocado subió versión y registró su fila |
| **D6** Trazabilidad | Conforme | La regla nueva **cita y no redefine** §10, §10.0, §10.1, §8.1, §7.0, §9 y `Root-Rules.md` §12.2. Los orquestadores citan `Mesa-Rules.md` y no duplican su mecánica |
| **D7** Neutralidad | Conforme | Los dos destinos que aportan la evidencia se citan por su informe, sin describir su dominio |
| **D8** Conjunto cerrado | Conforme | No se toca. La mesa **no crea una segunda escala de severidad**, que era el único riesgo |
| **D9** Evidencia | Conforme | Las dos mediciones que fundan la intervención estaban registradas antes y se citan con su archivo y su sección. **No se midió nada nuevo para esta nota** |

## 10. Lo que esta intervención deja anotado

**La mesa cuesta.** Un panel de núcleo más hasta cinco variables, con jurado de cinco y cuerpo de
parches, es el despacho más caro que el método declara. Los topes de `Mesa-Rules.md` §5.5 y §6.7 lo
acotan y **no lo miden**: nadie corrió todavía una mesa sobre un destino real, de modo que **no hay
una cifra de cuánto cuesta ni de cuánto ahorra**.

**Se declara como ítem diferido** con los cuatro campos de `Root-Rules.md` §12.2: se cierra cuando la
primera corrida real emita su registro de mesa, y lo que hay que medir está declarado — **hallazgos
procedentes sobre convocados**, y **detenciones presentadas al humano antes y después**, que es la
cifra que originó todo esto y la única que dice si la intervención funcionó.

**Y una advertencia sobre el modo de falla de este mecanismo**, que la literatura ya reporta y el
propio marco de origen nombra: el **teatro deliberativo**, un panel que produce actas y ningún parche.
La salvaguarda está escrita —todo voto con fundamento, todo parche con texto exacto— y el indicador
que la delata es el registro de convocatoria contrastado al cierre. Si una especialidad se convoca
cinco veces y nunca aporta un `PROCEDE`, **el defecto es de la señal, no del destino**.

## 11. Veredicto

**APROBADO.** El conjunto 13.7 es internamente coherente: la mesa entra como mecanismo y no como
orquestador, sus cuatro rechazos evitan las duplicaciones que habrían creado conjuntos cerrados en
conflicto, los recuentos alcanzados quedaron al día en los cuatro lugares vivos y declarados en los
históricos, y `AG-00970` se acuñó por la regla que `Root-Rules.md` §9.2 escribió para eso.

---

## 12. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-27 | Emisión inicial. Documenta la incorporación de la mesa de evaluación, el hueco medido entre R0 y el audit, la decisión de construirla como mecanismo y no como cuarto orquestador, la ubicación única —después de leer el estado, antes de aprobar el plan— con sus tres argumentos, y los **cuatro rechazos** al marco de origen que impiden duplicar lo que el método ya tiene. |
