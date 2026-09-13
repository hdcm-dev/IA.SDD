# Mesa de expertos a pedido — cómo se arma, se despacha y se expedienta una mesa que alguien pide por nombre

**Alias:** Mesa-De-Expertos-A-Pedido
**Naturaleza:** propio
**Tema:** Mesa de expertos convocada por un pedido explícito y no por la condición de un orquestador: lectura del pedido, clase de objeto y variante del panel, despacho verificado, expediente de la mesa y filtros de juicio medidos en su uso
**Consumidor:** transversal
**Condicion-de-carga:** —
**Hereda-de:** —
**Sustituye:** —
**Compatible-con:** Rules-Base-Conocimiento.md 2.2
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-09-13

---

## 0. Propósito y alcance

Caracteriza **la convención con la que se arma una mesa de expertos cuando alguien la pide por
nombre** —«hacé una mesa de expertos en…», «presentales como caso…», «que busquen…»— sobre cualquier
objeto: un corpus de especificación, una interfaz en ejecución, el diseño de una norma o la
investigación de un defecto. Dice cómo se lee el pedido, qué variante del panel corresponde a cada
clase de objeto, cómo se despacha sin contaminar a las comisiones, y cómo queda el rastro.

**Por qué existe.** El framework ya regula una mesa: la de `Mesa-Rules.md`, que se convoca **por
condición** —corpus previo, estado leído, plan por aprobar (§0.0)— desde los orquestadores. Pero la
mayoría de las mesas corridas hasta hoy **no las convocó un orquestador: las pidió una persona**, y
sobre objetos que esa regla no mira —una pantalla viva, una norma que todavía no existe—. Cada una
reconstruyó a mano la misma forma. Este documento la fija para que el siguiente pedido no dependa de
recordar dónde estaba el marco de origen.

**Es autocontenido a propósito.** Lo caracterizado nació de un marco de orquestación multiagente
escrito fuera de este repositorio, del que `Mesa-Rules.md` importó cinco mecanismos y rechazó cuatro
(`Coherencia-Mesa-De-Evaluacion.md` §6). **No se cita su ruta**: si el marco se mueve, este documento
sigue resolviendo.

**Qué queda explícitamente afuera:**

| Qué | Dónde vive |
| --- | --- |
| La mesa normativa del método: su condición de convocatoria, su registro, el ciclo P0 a P5, el jurado, la escala de ancla E1–E4/C y la lista cerrada de siete disparadores de escalada | `SDD/Devs/Rules/Mesa-Rules.md`. **Se cita, no se repite** |
| Los niveles de hallazgo P0–P3, la compuerta mecánica y el criterio de corte por rondas | `Master-Prompt.md` §10, §10.0 y §10.1 |
| La forma de una detención, el origen del hecho y el lote con default | `Master-Prompt.md` §8.1 y §7.0 |
| La auditoría de lo que una fase acaba de producir | `Master-Prompt.md` §10: la mesa mira lo que ya existe o lo que se va a decidir |
| La forma normativa de un expediente de caso | **Ninguna regla la fija todavía.** §2.3 describe la práctica; si el framework adopta una norma de expedientes, esa norma gobierna y este documento se alinea |
| Herramientas concretas de orquestación de agentes | No se nombran: la convención vale con cualquiera que despache agentes sin contexto compartido |

## 1. Identidad del artefacto

| | |
| --- | --- |
| **Qué es** | Una convención de proceso colectivo: un pedido humano, un presidente que no vota y un panel de agentes con funciones separadas |
| **Quién pide** | Una persona —en general el Product Owner— que nombra el objeto, el dominio de los expertos y, a veces, dónde quiere los informes |
| **Presidente** | El agente que recibe el pedido. Arma el contrato de entrada, verifica sus propios datos, compone el panel, consolida sin juzgar y escribe el plan y el cierre. **No vota** |
| **Comisiones** | Especialistas a ciegas y en paralelo, cada uno con mandato y no-competencia declarados |
| **Refutador** | Ataca lo que las comisiones sostienen. Es el único que lee los informes, y por eso entra último |
| **Jurado y cuerpo de parches** | Los de `Mesa-Rules.md` §6.4 y §6.5, sin cambios |
| **Supuestos** | Hay forma de despachar agentes sin contexto compartido; si el objeto se ejecuta, hay un medio de observación declarado; la evidencia se versiona junto al expediente |

**Relación con la mesa normativa, que decide todo lo demás.** Si el objeto pedido **cumple las tres
cláusulas** de `Mesa-Rules.md` §0.0, **es** esa mesa y esa regla la gobierna entera; de este documento
sólo se toman la lectura del pedido (§3.1) y el expediente (§2.3). Si no las cumple —no hay corpus
previo, o el objeto no es documental—, la mecánica de `Mesa-Rules.md` se usa **como forma** y las
diferencias son las que declara §2.2.

## 2. Estructura

### 2.1 El ciclo a pedido, paso por paso

| # | Paso | Quién | Qué produce |
| --- | --- | --- | --- |
| 1 | **Leer el pedido** (§3.1) | Presidente | El contrato de entrada (§5.1), con la presentación literal del pedido transcripta |
| 2 | **Verificar el despacho** | Presidente | Cada dato que va a pasarle al panel —sección, recuento, afirmación de colisión— con el comando que lo sostiene y su salida |
| 3 | **Base mecánica** | Presidente | Lo enumerable, medido antes de que nadie opine. Lo que falla entra con ancla E1 |
| 4 | **Componer el panel** | Jurado | Núcleo permanente más variables por señal con ubicación, ad hoc con carta de mandato, y **los descartes con su motivo** (`Mesa-Rules.md` §5 y §6.2) |
| 5 | **Comisiones** | Especialistas | Un informe por comisión, **verbatim**, con «lo que revisé y está bien» |
| 6 | **Refutación** | Refutador | El ataque a la lectura dominante, por evidencia y **por aplicación** |
| 7 | **Consolidación y peritaje** | Presidente | Raíces comunes; toda contradicción entre comisiones elevada como ítem y, si hace falta medir, un peritaje (§3.3) |
| 8 | **Veredicto y parches** | Jurado y cuerpo de parches | `Mesa-Rules.md` §6.4 y §6.5 |
| 9 | **Aplicación y verificación** | Quien el pedido designe | La verificación de cada parche, con evidencia antes y después |
| 10 | **Cierre** | Presidente | El bloque de `Mesa-Rules.md` §6.7, la deuda declarada y las preguntas que sobrevivieron, **en lote y con `SI NO RESPONDÉS`** |

### 2.2 Las cuatro clases de objeto y su variante

| Clase | Qué es E1 | Qué cambia en el panel | Regla de cierre propia |
| --- | --- | --- | --- |
| **Corpus documental existente** | La compuerta mecánica, un enlace que no resuelve, un comando con su salida | Nada: `Mesa-Rules.md` tal cual | La de `Mesa-Rules.md` §6.7 |
| **Interfaz en ejecución** | El registro de un medio de observación: error de consola, medición en el navegador, prueba de extremo a extremo en rojo. **E3** es un recorrido reproducible que deja a la persona sin salida, con captura del estado final | Se suman **usuarios estándar**, **moderador de objetivos** y **consultor de documentación** (§2.2.1). Las comisiones observan cada una con su propio medio | Un ajuste está aplicado cuando **existe la captura posterior**, con el mismo medio y el mismo encuadre que la anterior, versionadas juntas |
| **Diseño de una norma o decisión** | Una medición sobre el árbol que la norma va a alcanzar | Las comisiones de dominio **citan fuentes externas** —norma con su número, publicación con su autor— y **no inventan cláusulas**: si no se está seguro del apartado, se cita la norma sin apartado. El refutador ataca **el costo de aplicarla** | Un dictamen que responde **cada pregunta del pedido por separado**, sin «depende» |
| **Investigación de un defecto o contradicción** | La reproducción del defecto antes del arreglo | Un **perito** que diseña el experimento; las comisiones que se contradicen no votan el peritaje | La prueba que lo cubre se vio **fallar** antes del arreglo y pasar después |

#### 2.2.1 Los tres roles que suma la clase «interfaz en ejecución»

| Rol | Mandato | Límite |
| --- | --- | --- |
| **Usuario estándar** | Usar la interfaz con **un objetivo declarado antes de empezar**, sin cambiarlo, y decir dónde se trabó. Es el único que puede fundar un hallazgo de intuitividad | Tiene **prohibido** leer el código, la maqueta o la especificación, y proponer solución. Su evidencia admisible es E3. «Lo logré y me costó acá» también es hallazgo |
| **Moderador de objetivos** | Convertir el pedido en **objetivos medibles, cada uno con su instrumento**. «Que se vea mejor» no es un objetivo; «razón entre título y cuerpo de al menos 1,5, medida en el navegador» sí | No vota |
| **Consultor de documentación** | Por cada hallazgo, ubicar la regla o la decisión que lo gobierna y **verificar que la cita exista y diga lo que el hallazgo afirma** | Una cita que no resiste la verificación degrada el hallazgo a `C`. No emite hallazgos ni vota |

**Por qué el usuario estándar no se puede reemplazar por un experto:** un experto no puede simular no
saber; su juicio ya trae el modelo mental del sistema. **Y cuando lo que dice un usuario estándar
contradice a una comisión, el perito nunca es el mismo usuario**: la comisión que corresponde traduce el
recorrido a causa técnica, y el usuario no tiene que saber por qué le pasó lo que le pasó.

**Las capas de origen de una interfaz**, de arriba hacia abajo: catálogo de diseño → tokens del sistema
visual → componente → maqueta aprobada → superficie del producto → instancia desplegada. **El parche va
a la capa más alta que contiene el defecto**, y maqueta y superficie se tocan juntas o no se tocan: un
parche que toca una sola es una regresión programada.

### 2.3 El expediente de la mesa

Toda mesa a pedido deja una carpeta, aunque no encuentre nada. La forma que sostuvo el uso:

| Pieza | Quién la escribe | Regla |
| --- | --- | --- |
| `README.md` | Presidente | **Por dónde entrar**: qué leer si se quiere el resultado en una página, el hallazgo más grave, el plan, la evidencia. Y el **punto de continuación**: dónde está parada la mesa y qué sigue |
| `00-Contrato-De-Entrada.md` | Presidente | La presentación literal del pedido, el contrato de §5.1 y la verificación del despacho del paso 2 |
| `NN-Informe-<Comision>.md` | Cada comisión | **Verbatim**. El presidente no lo resume ni lo corrige: lo que tenga que agregar va en su propio documento |
| `NN-Informe-Refutador.md` | Refutador | Verbatim |
| `NN-Plan-Y-Cierre.md` | Presidente | Todo lo que agrega a los informes está **marcado como propio**, y toda medición que afirma lleva su comando |
| `evidencia/` | Quien la produce | Salidas de comandos, capturas y guiones, con la fecha y el origen de cada uno |

**Ubicación.** La que declare el pedido. Si el objeto es un destino del framework y la mesa cumple
`Mesa-Rules.md` §0.0, el registro normativo va donde esa regla lo manda y la carpeta lo enlaza, no lo
duplica. **Los documentos de un expediente no se reescriben**: una corrección es un documento nuevo que
cita al anterior.

## 3. Contrato de uso

### 3.1 Cómo se lee un pedido

**No se le pregunta a quien pidió nada que el pedido y el árbol contesten**, y la composición del panel
nunca se le eleva (`Mesa-Rules.md` §6.2).

| Forma del pedido | Qué se deduce, sin preguntar |
| --- | --- |
| «Hacé una mesa de expertos en `<dominio>`» | Núcleo permanente siempre; comisiones de ese dominio como catálogo variable, cada una con su señal. Si el dominio no está en el catálogo, **ad hoc con carta de mandato** |
| «Presentales como caso `<X>`» | `<X>` es el objeto y **la presentación literal del pedido es la primera pieza del expediente**. Las comisiones la reciben textual, no parafraseada |
| «Que busquen `<Z>`» / «en base a los estándares de la industria y la academia» | Mandato de investigación: fuentes externas citables por comisión (§2.2, diseño de una norma) |
| «Que vuelquen sus informes en `<ruta>`» | El expediente va en `<ruta>`, con los informes verbatim |
| «Que lleguen a una conclusión cerrada» | Dictamen pregunta por pregunta. Lo que no se pueda cerrar se declara con su motivo y su default |
| «Que evalúe si me necesita» | La lista cerrada de `Mesa-Rules.md` §7, con el origen del hecho calculado antes |
| El pedido llega **en medio de otro trabajo**, ante un problema | La mesa reemplaza la detención: se convoca, se resuelve, se registra, y **sólo sale al humano lo que después de la mesa sigue sin respuesta en el árbol** |

**Cuándo no hace falta una mesa**, aunque el reflejo la pida: cuando la pregunta la contesta **un
comando o una lectura**, o cuando no hay ninguna decisión que tomar. Una mesa para eso es teatro
deliberativo con acta.

### 3.2 Convenciones que no se rompen

| Convención | Qué se rompe si se ignora |
| --- | --- |
| **Comisiones a ciegas y en paralelo; el refutador, último** | El segundo repite al primero, y la coincidencia se lee como verificación sin serlo |
| **Cada dato del despacho lleva su comando** | La mesa hereda los errores de quien la convoca. Medido: en una mesa sobre una afirmación sin verificar, **el despacho llevaba cuatro datos y tres estaban mal**; dos comisiones los corrigieron por separado |
| **Todo hallazgo declara su clase de ancla**; un `C` sólo funda una pregunta | Correcciones fundadas en opinión (`Mesa-Rules.md` §6.1) |
| **Una afirmación de colisión o no colisión de un término, sólo con E1** | Una cita muestra dónde está una palabra, no dónde no está (`Mesa-Rules.md` §6.1). Medido: un refutador contó líneas donde había que contar ocurrencias |
| **La fuente declarativa se contrasta antes de fundar un `P0`** | Una fila de plan, una casilla o un recuento en prosa son afirmaciones sobre el trabajo y no el trabajo (`Mesa-Rules.md` §6.1) |
| **Un hallazgo heredado de un informe anterior entra como `C`** | Conocimiento reenviado que nunca se verifica |
| **El testimonio de quien pidió es evidencia E4**, con su fecha y su texto literal | Una decisión humana parafraseada deja de ser citable |
| **Los informes van verbatim** | El expediente deja de ser auditable: nadie puede distinguir lo que dijo la comisión de lo que entendió el presidente |
| **Niveles P0–P3**, nunca una segunda escala | Dos conjuntos cerrados para la misma pregunta (`Coherencia-Mesa-De-Evaluacion.md` §6) |
| **Quien diseña un parche no lo vota; quien lo aplica lo verifica** | Se elimina el único control que no es de quien escribió |

### 3.3 Filtros de juicio que el uso dejó

| Filtro | La pregunta | De dónde sale |
| --- | --- | --- |
| **Descripción o control** | Antes de corregir un documento contra el producto: ¿lo que el documento afirma **describe** el producto, o **declara un control** que el producto no ejerce? Una descripción se corrige contra el producto. Un control no ejercido no se reescribe: reescribirlo **lo absuelve** sin que nadie vote la derogación, y va a deuda declarada | Una mesa sobre la documentación de un destino: de 71 hallazgos, **55 eran descripción y 16 controles** |
| **La unidad de aplicación es el documento** | ¿Esta corrección deja el documento mitad corregido y mitad viejo? Un documento mezclado es peor que uno uniformemente viejo | La misma mesa |
| **Qué dice el sistema cuando no pudo** | Además de si el producto hace lo que promete: ¿qué le dice a la persona cuando no pudo hacerlo? | Una mesa de interfaz: tres observadores se contradecían y **ninguna comisión podía verlo sola** |
| **El peritaje cambia una sola variable** | Ante una contradicción entre observadores, ¿qué experimento mínimo la resuelve? Dos corridas que difieren en **una** cosa, con evidencia de las dos | La misma mesa: dos envíos iguales salvo las claves del texto resolvieron la contradicción |
| **Una prueba que no se vio fallar no cierra** | ¿La prueba que cubre el defecto se corrió en rojo contra el estado anterior? | La misma mesa: las afirmaciones nuevas se probaron en rojo antes del arreglo |
| **Origen del hecho antes de escalar** | ¿El hecho que se quiere escalar lo produjo la misma corrida? Entonces es autocorrección, no pregunta (`Master-Prompt.md` §8.1) | `Mesa-Rules.md` §7 |

## 4. Decisiones ya tomadas

| Bifurcación | Decisión | Criterio |
| --- | --- | --- |
| Escala de severidad | **P0–P3** de `Master-Prompt.md` §10; se rechazan las S1–S4 del marco de origen | Dos escalas para la misma pregunta son dos conjuntos cerrados en conflicto |
| Formato de informes | **Documentos con tablas**; se rechazan los esquemas JSON del marco de origen | Un formato paralelo obligaría a auditar dos |
| Criterio de corte | **El de `Mesa-Rules.md` §6.7**, con el rendimiento por especialista **medido y declarado** en cada ciclo | En las dos primeras corridas reales el rendimiento no cayó entre ciclos (4,9 y 5,8 hallazgos procedentes por especialista): un umbral de rendimientos decrecientes no se adopta sin una medición que lo sostenga, y cerrar por decisión es legítimo si se declara |
| Quién aplica | **Quien el pedido designe.** Si el pedido no dice, la mesa entrega el plan y no aplica (`Mesa-Rules.md` §6.6) | El pedido puede autorizar aplicar; lo que no cambia es la separación entre diseñar, aprobar y verificar |
| Escalada en una interfaz | Cambiar paleta, marca o familia tipográfica **es cambio de alcance** y se escala; cambiar la escala de tamaños dentro de la misma familia no, y la mesa lo resuelve | Lo primero redefine la identidad del producto; lo segundo es el ajuste que se pidió |
| Datos reales | Toda acción de una comisión sobre un sistema vivo se limita a **datos que la propia comisión sembró** | Actuar sobre datos de personas reales es irreversible con impacto material |
| Composición | La vota el jurado; **empate convoca**; techo de cinco variables | `Mesa-Rules.md` §5.5: un especialista de más es un informe descartable, uno de menos es un punto ciego |

## 5. Esqueletos de referencia

### 5.1 Contrato de entrada

```text
PEDIDO (literal): «{{texto exacto, con fecha y quién lo hizo}}»
CLASE DE OBJETO: corpus documental | interfaz en ejecución | diseño de norma | investigación de defecto
OBJETO: {{qué se evalúa, con ruta y versión o commit}}
OBJETIVO: {{qué debe lograr, en una oración}}
PREGUNTAS DEL CASO: {{una por línea; el dictamen responde cada una}}
RESTRICCIONES DURAS: {{lo no negociable}}
DECISIONES CERRADAS: {{lo que no se reabre salvo contradicción con ancla E1 o E2}}
FUERA DE ALCANCE: {{lo que la mesa no toca}}
MEDIOS: {{con qué se observa, y qué queda sin observar}}
EXPEDIENTE: {{ruta}}
QUIÉN APLICA: {{la mesa | quien convoca | nadie: sólo plan}}
PRESUPUESTO: {{tope de hallazgos por comisión; rondas}}
DESPACHO VERIFICADO: {{cada dato con su comando y salida}}
```

### 5.2 Despacho de una comisión

```text
Sos {{COMISIÓN}} en una mesa de expertos sobre {{OBJETO}}. Tu encargo es refutar, no verificar.
Trabajás a ciegas: no vas a ver el informe de ninguna otra comisión.

Caso, tal como lo presentó quien pidió la mesa: «{{PEDIDO LITERAL}}»

Tu competencia es {{COMPETENCIA}}. No te corresponde {{NO_COMPETENCIA}}: si encontrás algo ahí,
emitís una solicitud de convocatoria con la señal y su ubicación, no un hallazgo.

Por cada hallazgo: nivel P0–P3, clase de ancla E1–E4 o C con su cita o su comando y salida,
impacto si no se corrige y dirección de la corrección, no su redacción.
{{Si la clase es diseño de norma: toda afirmación sobre la industria o la academia, con su fuente;
sin cláusulas inventadas.}}

Tope: {{N}} hallazgos. Declarás hasta tres ítems de «lo que revisé y está bien».
Escribís tu informe verbatim en {{RUTA DEL EXPEDIENTE}}/{{NN}}-Informe-{{COMISIÓN}}.md.
```

### 5.3 Carpeta del expediente

```text
<expediente>/
├── README.md                      por dónde entrar · punto de continuación
├── 00-Contrato-De-Entrada.md
├── 01-Informe-<Comision>.md       verbatim
├── …
├── NN-Informe-Refutador.md        verbatim
├── NN-Plan-Y-Cierre.md            lo propio del presidente, marcado
└── evidencia/
```

### 5.4 Campos de cierre que suma la clase «interfaz en ejecución»

Al bloque de `Mesa-Rules.md` §6.7:

```text
  MEDIOS
    Usados:        {{medio: qué observó}}
    Sin observar:  {{qué quedó fuera del alcance de los medios, y por qué}}
```

## 6. Criterios de aceptación

- [ ] `[enumerable]` El expediente existe y tiene `README.md`, `00-Contrato-De-Entrada.md`, un informe por comisión convocada, el del refutador y `NN-Plan-Y-Cierre.md`.
- [ ] `[enumerable]` El contrato de entrada transcribe el pedido literal con su fecha.
- [ ] `[enumerable]` Todo dato numérico o de sección que el despacho pasó al panel tiene su comando y su salida en el contrato.
- [ ] `[enumerable]` El registro de convocatoria enumera convocados con su señal y **descartados con su motivo**.
- [ ] `[enumerable]` Todo hallazgo declara nivel P0–P3 y clase de ancla, y ningún `C` fundó un parche.
- [ ] `[enumerable]` En la clase «diseño de norma», toda afirmación sobre la industria o la academia lleva fuente.
- [ ] `[enumerable]` En la clase «interfaz en ejecución», todo parche declarado aplicado tiene captura anterior y posterior con el mismo medio y encuadre.
- [ ] `[enumerable]` Las preguntas a quien pidió salieron en un solo lote, cada una con `SI NO RESPONDÉS` y su origen del hecho.
- [ ] `[interpretativo]` Los informes de comisión son verbatim y ninguno cita a otro del mismo ciclo, salvo el refutador.
- [ ] `[interpretativo]` Ninguna pregunta que salió a quien pidió tenía respuesta en el pedido o en el árbol.
- [ ] `[interpretativo]` El `README.md` permite a alguien que no siguió la mesa saber qué se decidió y dónde está parada.

## 7. Anti-patrones

| Anti-patrón | Por qué |
| --- | --- |
| **Despachar datos sin verificarlos** | La mesa se convoca para corregir una afirmación sin verificar y el despacho repite el defecto. Es la evidencia central del caso medido, y queda escrita en el cierre |
| **Resumir los informes** | El presidente reemplaza la voz de la comisión por la suya y el panel deja de ser independiente en el registro |
| **Preguntar a quien pidió la composición del panel** | Devuelve la clase de consulta que la mesa existe para eliminar |
| **Una mesa para lo que contesta un comando** | Teatro deliberativo: actas sin decisión |
| **Detenerse ante un problema en lugar de convocar** | El humano recibe una pregunta que el conjunto contestaba |
| **Comisiones de investigación sin fuentes** | Una norma diseñada «según la industria» sin citas es opinión con apariencia de estado del arte |
| **Refutador que sólo ataca la evidencia** | En el diseño de una norma, el defecto más caro es una ceremonia que nadie completa; hay que atacar el costo de aplicarla |
| **Cerrar un defecto visual con una prueba en verde** | La prueba no mira la pantalla; la captura sí |
| **Corregir un control no ejercido reescribiendo el documento** | Lo deroga sin decisión (§3.3) |
| **Usar al usuario estándar como perito de su propio hallazgo** | Tiene que saber por qué le pasó, y su valor es no saberlo |

## 8. Frontera con las reglas

**Todo lo normativo de la mesa vive en `Mesa-Rules.md`**, y este documento **no redefine ninguna de sus
piezas**: la condición de convocatoria (§0.0), el registro (§2), los principios (§3), el contrato de
entrada (§4), la composición (§5), el ciclo (§6) y la escalada (§7) se citan. Cuando una mesa a pedido
cumple §0.0, **esa regla manda entera** y este documento sólo aporta la lectura del pedido y el
expediente.

**No sustituye nada.** Ningún ítem de `Mesa-Rules.md` está rotulado como decisión de stack, de modo
que lo que §2.2 declara para las clases que esa regla no mira **no es sustitución: es la extensión de
una forma a objetos que la regla no alcanza**. Si una mesa normativa encontrara contradicción entre
este documento y `Mesa-Rules.md`, **manda la regla** (`Rules-Base-Conocimiento.md` §0.4).

**No define criterios de aceptación de ningún artefacto que el framework genere.** Los de §6 se
verifican sobre el expediente de la mesa, que no es un entregable de categoría.

**Deuda del artefacto, declarada.** La práctica de expedientes de §2.3 precede a cualquier norma: si
el framework adopta una, §2.3 se reescribe contra ella.

## 9. Trazabilidad

| | |
| --- | --- |
| **Índice** | [`Index-Knowledge.md`](Index-Knowledge.md) |
| **Hermanos** | Ninguno |
| **Consumidor** | `transversal`. Sin condición de carga: se aplica cuando alguien pide una mesa por nombre, o cuando un trabajo en curso tropieza con un problema que se resuelve convocando en lugar de detener |
| **Artefacto de referencia** | Ninguno. Lo caracterizado es una convención de proceso |
| **Origen de lo caracterizado** | `Mesa-Rules.md` 1.3; `Coherencia-Mesa-De-Evaluacion.md` §6 (qué se importó del marco de origen y qué se rechazó); `Coherencia-Condicion-De-Convocatoria.md`; y las mesas a pedido corridas entre el 2026-09-01 y el 2026-09-13 sobre destinos del framework, declaradas en `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` §3 |

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-09-13 | Emisión inicial. Cataloga la mesa de expertos convocada por pedido explícito: la lectura del pedido, las cuatro clases de objeto con su variante, el despacho verificado, el expediente de la mesa y los filtros de juicio que dejaron las mesas corridas, sin redefinir ninguna pieza de `Mesa-Rules.md`. |
