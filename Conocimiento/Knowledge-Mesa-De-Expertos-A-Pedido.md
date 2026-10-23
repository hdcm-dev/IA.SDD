# Mesa de expertos a pedido — cómo se arma, se despacha y se expedienta una mesa que alguien pide por nombre

**Alias:** Mesa-De-Expertos-A-Pedido
**Naturaleza:** propio
**Tema:** Mesa de expertos convocada por un pedido explícito y no por la condición de un orquestador: lectura del pedido como enunciado del problema, clase de objeto y variante del panel, convenciones que rigen medidas, despacho verificado, expediente de la mesa con el ciclo de vida de su evidencia y filtros de juicio medidos en su uso
**Consumidor:** transversal
**Condicion-de-carga:** —
**Hereda-de:** —
**Sustituye:** —
**Compatible-con:** Rules-Base-Conocimiento.md 2.3
**Versión:** 2.0
**Estado:** Vigente
**Fecha:** 2026-10-23

---

## 0. Propósito y alcance

Caracteriza **la convención con la que se arma una mesa de expertos cuando alguien la pide por nombre**
—«hacé una mesa de expertos en…», «presentales como caso…», «que busquen…»— sobre cualquier objeto: un
corpus de especificación, una interfaz en ejecución, el diseño de una norma o la investigación de un
defecto. Dice cómo se lee el pedido, qué variante del panel corresponde a cada clase de objeto, cómo se
despacha sin contaminar a las comisiones, y cómo queda el rastro. Su mecánica de enunciado, objetivo con
origen, bloqueo y refutación del objetivo **le sirve también a un encargo a agentes sin mesa** que cargue
este documento (fila de herramientas de orquestación, abajo).

**Lo que no se omite al aplicar este documento**, se cargue lo que se cargue de él; cada renglón remite a
su hoja:

1. Antes del primer despacho, plantear el `ENUNCIADO`: la función de cada frase de quien pidió, el sujeto,
   el origen de cada condición y los agregados marcados. Una frase con dos lecturas se escribe con las dos
   y se toma la que menos agrega, declarada (§3.1, «Todo pedido que plantea un problema»; §5.1).
2. Escribir el `OBJETIVO` con el origen de cada cláusula; lo que no lo tiene es agregado (§2.1, paso 2;
   §5.1). Si quien pidió escribe mientras un encargo corre y toca su objetivo o lo que da por fijo, se
   rehace el enunciado, el turno siguiente muestra objetivo vigente → objetivo corregido, y el encargo se
   detiene antes de su próxima fase irreversible (merge, etiqueta, publicación) y se relanza; «tenés
   razón» sin ese cambio no es una corrección (§2.1, paso 2).
3. Si hay un caso que funciona, tomarlo de referencia y armar la tabla diferencial antes de diseñar; la
   primera salida es igualar la pieza que difiere (§3.3, «Caso que funciona antes que diseño»). Lo que la
   corrección agrega para otras entradas —un default, una lista de formas reconocidas— es un agregado y
   sale marcado a quien pidió, que decide (§3.3, misma fila; §7, «Tratar el comportamiento actual como
   dato»). «Mantener compatibilidad», «como hoy» o «se decidió en el expediente N» sin una frase de quien
   pidió no entran al objetivo (§3.3, «Comportamiento no es restricción»).
4. El comportamiento actual no es una restricción: lo fijo es un requisito de quien pidió, con su literal,
   o una regla o decisión aceptada que manda eso para ese componente, con E2. Se lee la decisión y se
   verifica que mande eso y no algo contiguo: la que fija lo que acepta un receptor no fija lo que manda
   un emisor (§3.3, «Comportamiento no es restricción»).
5. Si falla un paso que el pedido prescribe, primero la prueba de una variable; si no cierra, el `BLOQUEO`
   sale a quien pidió en el mismo turno, en una línea. No se rodea por otro camino que mide otra cosa
   (§3.1, §5.2; §7, «Rodear en silencio un paso prescripto que falló»).
6. Dos documentos de esta base completan éste y se cargan enteros cuando el acto los pide:
   `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md`, al proponer, juzgar, analizar, votar o aplicar
   una excepción a una convención que rige (paso 6 bis de §2.1), y
   `Conocimiento/Knowledge-Cadena-De-Consecuencias.md`, antes de recomendar, dictaminar o elegir entre
   opciones, y ante un obstáculo (§3.1, fila del bloqueo). El mapa de abajo dice a qué rol le toca cada
   uno.

**Por qué existe.** El framework ya regula una mesa: la de `SDD/Devs/Rules/Mesa-Rules.md`, que se convoca
**por condición** —corpus previo, estado leído, plan por aprobar (§0.0)— desde los orquestadores. Pero la
mayoría de las mesas corridas **las pidió una persona**, y sobre objetos que esa regla no mira —una pantalla
viva, una norma que todavía no existe—. Cada una reconstruyó a mano la misma forma. Este documento la fija
para que el siguiente pedido no dependa de recordar dónde estaba el marco de origen.

**Es autocontenido a propósito.** Lo caracterizado nació de un marco de orquestación multiagente escrito fuera
de este repositorio, del que `Mesa-Rules.md` importó cinco mecanismos y rechazó cuatro
(`SDD/Devs/Guides/Coherencia-Mesa-De-Evaluacion.md` §6). **No se cita su ruta**: si el marco se mueve, este
documento sigue resolviendo.

**Qué queda explícitamente afuera:**

| Qué | Dónde vive |
| --- | --- |
| La mesa normativa del método: su condición de convocatoria, su registro, el ciclo P0 a P5, el jurado, la escala de ancla E1–E4/C y la lista cerrada de siete disparadores de escalada | `SDD/Devs/Rules/Mesa-Rules.md`. **Se cita, no se repite** |
| Los niveles de hallazgo P0–P3, la compuerta mecánica y el criterio de corte por rondas | `SDD/Devs/Orchestrator/Master-Prompt.md` §10, §10.0 y §10.1 |
| La forma de una detención, el origen del hecho y el lote con default | `Master-Prompt.md` §8.1 y §7.0 |
| La auditoría de lo que una fase acaba de producir | `Master-Prompt.md` §10: la mesa mira lo que ya existe o lo que se va a decidir |
| La forma normativa de un expediente de caso | `SDD/Devs/Rules/Expediente-Rules.md`, desde la 13.18. **Se cita, no se repite**: §2.3 y §5.3 remiten a ella |
| Dejar de seguir una convención que rige —lo que en el origen se llamaba «apartamiento», que no es el apartamiento declarado de `SDD/Devs/Rules/Root-Rules.md` §11—: la ficha, el análisis del camino de compromiso, el default y el apartado de cierre | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md`, hermano de éste |
| Cómo se razona antes de recomendar, y qué es un obstáculo | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md` |
| Herramientas concretas de orquestación de agentes | No se nombran: la convención vale con cualquiera que despache agentes sin contexto compartido. **La mecánica sí sirve fuera de la mesa**: un encargo a agentes con objetivo de diseño o de corrección —implementar, revisar, entregar— que cargue este documento lleva el enunciado y la cláusula de bloqueo de §3.1, el objetivo con el origen de cada cláusula (§5.1) y una revisión que refuta como el paso 6 de §2.1 |

**Mapa de carga.** Es una guía para quien preside: qué secciones le da a cada rol en su carta. Primero se
leen la cabecera y este §0; después, las secciones que la fila da para la situación, y lo de la columna
«además», entero. Quien edita este documento o audita su origen lo lee entero. En la clase «interfaz en
ejecución», cada fila suma §2.2 y §5.4. **Respaldo**: una remisión a una sección que no cargaste, hecha en
el texto que gobierna tu propio acto, no se infiere; se carga esa sección y se declara en el folio: para
el cruce del paso 10 de §2.1 vale aunque su fila no la dé. Una remisión que sólo está en el texto del acto
de otro rol no se sigue. **Unidad**: una sección es su encabezado y todo lo que hay debajo hasta el
próximo encabezado de nivel igual o superior; §3 incluye §3.1 a §3.4, y §2.2 incluye su subsección. Se
carga siempre la sección entera: un paso o una fila entre paréntesis dicen dónde mirar, no acotan la
carga.

| Situación | Secciones de este documento | Además |
| --- | --- | --- |
| Presidís una mesa (cualquier paso) o hacés su peritaje (paso 7) | §1, §2, §3, §4, §5, §6, §7, §8 | `Cadena-De-Consecuencias`; `Excepcion-A-Un-Conocimiento` si hay una ficha |
| Conducís un encargo a agentes sin mesa, o sos un agente despachado en él (el revisor que refuta el objetivo, quien implementa) | §2.1 (pasos 2, 6 y 7), §2.2, §3.1, §3.3, §5.1, §7 | `Cadena-De-Consecuencias` |
| Sos una comisión, o usuario estándar, moderador de objetivos o consultor de documentación | La carta (§5.2), §2.2, §3.2, §3.3 y §4. El usuario estándar no carga §3.3 ni da dirección de la corrección: su límite está en §2.2 | `Cadena-De-Consecuencias` §2, antes de recomendar entre opciones (la carta lo pide); `Excepcion-A-Un-Conocimiento` si vas a proponer no seguir una convención que rige |
| Sos el refutador | Lo del presidente | `Excepcion-A-Un-Conocimiento` y `Cadena-De-Consecuencias` |
| Hacés el análisis de decisiones (paso 6 bis) | §2.2, §3.3, §4, §8 | `Excepcion-A-Un-Conocimiento` y `Cadena-De-Consecuencias` |
| Sos el jurado (componés el panel o votás el veredicto) o el cuerpo de parches (paso 8) | §2, §3, §4, §7, §8 | `Excepcion-A-Un-Conocimiento` y `Cadena-De-Consecuencias` |
| Aplicás o verificás el plan (paso 9) | §2.1, §2.2, §2.3, §3, §4, §5.3, §7, §8 | `Excepcion-A-Un-Conocimiento` si seguís un camino provisorio |

## 1. Identidad del artefacto

| | |
| --- | --- |
| **Qué es** | Una convención de proceso colectivo: un pedido humano, un presidente que no vota y un panel de agentes con funciones separadas |
| **Quién pide** | Una persona —en general el Product Owner— que nombra el objeto, el dominio de los expertos y, a veces, dónde quiere los informes |
| **Presidente** | El agente que recibe el pedido. Arma el contrato de entrada, verifica sus propios datos, compone el panel, consolida sin juzgar y escribe el plan y el cierre. **No vota** |
| **Comisiones** | Especialistas a ciegas y en paralelo, cada uno con mandato y no-competencia declarados |
| **Refutador** | Ataca lo que las comisiones sostienen. Es el único que lee los informes, y por eso entra último |
| **Análisis de decisiones** | Entra cuando el refutador admite una ficha de excepción. Escribe el análisis del camino de compromiso de `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §5.3. **No vota** |
| **Jurado y cuerpo de parches** | Los de `Mesa-Rules.md` §6.4 y §6.5, sin cambios |
| **Supuestos** | Hay forma de despachar agentes sin contexto compartido; si el objeto se ejecuta, hay un medio de observación declarado. **Si el destino no declara un almacén de evidencia**, la evidencia cruda que generan los agentes queda local, y lo que se versiona —y se retoma en un caso posterior— es el expediente procesado (§2.3) |

**Relación con la mesa normativa.** Las tres cláusulas de `Mesa-Rules.md` §0.0 se leen sobre **el objeto de la
mesa**: la tercera pide el plan o la decisión «sobre ese corpus», así que las cumple sólo un corpus de
especificación que es el objeto; un defecto del código, una interfaz o una norma por diseñar no, aunque el
destino tenga especificación. La segunda la cumple la presidencia al leer el estado del objeto con la forma de
`Mesa-Rules.md` §4: una dimensión de `estado` que no se puede leer es el primer hallazgo, con su supuesto, y
no descalifica la condición. **Si las cumple**, esa regla manda en lo que regula —registro, composición
(paso 4), veredicto y parches (paso 8), escalada, bloque de cierre y criterio de corte— y de este documento
se toma **todo lo demás**: §0, el enunciado y el objetivo, las cartas, la refutación del objetivo (paso 6),
el paso 6 bis si hay ficha, la cuenta y el cruce del paso 10, §2.3, §3, «Quién aplica» de §4 y los campos de
§5.1 (§8). La clase es corpus documental: `CLASE DE OBJETO` la declara y no cambia el panel (§2.2). **Si no
las cumple**, la mecánica de `Mesa-Rules.md` se usa **como forma** y las diferencias son las que declara §2.2.

## 2. Estructura

### 2.1 El ciclo a pedido, paso por paso

| # | Paso | Quién | Qué produce |
| --- | --- | --- | --- |
| 1 | **Leer el pedido y plantear el enunciado** (§3.1) | Presidente | El contrato de entrada (§5.1), con la presentación literal del pedido transcripta, **el enunciado del problema** (`ENUNCIADO`, §3.1) y las **convenciones que rigen** el objeto, medidas con un barrido del índice de conocimiento (§3.4). **Ningún despacho sale antes del enunciado** |
| 2 | **Verificar el despacho** | Presidente | Cada dato que va a pasarle al panel —sección, recuento, afirmación de colisión— con el comando que lo sostiene y su salida; **y el objetivo**, con el origen de cada cláusula (§5.1). Un documento de opciones de quien convoca no viaja como «lectura previa»: viaja, si hace falta, como hipótesis a refutar. **Si quien pidió escribe mientras un encargo corre**, rige el renglón 2 de §0, y relanzar es esto: vuelven a salir los despachos cuya carta lleva una cláusula que cambió; lo que ya llegó se conserva como corrida descartada, con su constancia (`SDD/Devs/Rules/Expediente-Rules.md` §3.4), donde iban sus informes (§2.3) y fuera de la cuenta del paso 10; lo que escribió se asienta en una `providencia` con su testimonio (§2.3). Las fases irreversibles ante las que se detiene son las del renglón y las de `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §4: borrar o migrar datos con pérdida, publicar un contrato, desplegar a producción. Si sólo trae una señal nueva para el panel, entra por la ronda de convocatoria en caliente (`Mesa-Rules.md` §5.3); si cambia el objetivo y trae una señal, la señal entra con el relanzamiento, el jurado vuelve a votar la composición, y el folio de composición anterior queda en la corrida descartada. Toda carta —de comisión, refutador, análisis, jurado, perito, usuario estándar, moderador de objetivos, consultor de documentación, cuerpo de parches o quien aplica— lleva la ruta y la versión de esta norma con su lectura en dos pasos, la línea «Secciones … leídas» de §5.2 y la lectura de P0–P3 del caso (§5.1), y sale del esqueleto de §5.2; cada carta se archiva en `evidencia/` y se versiona: es texto liviano (§2.3) |
| 3 | **Base mecánica** | Presidente | Lo enumerable, medido antes de que nadie opine. Lo que falla entra con ancla E1 |
| 4 | **Componer el panel** | Jurado | Núcleo permanente más variables por señal con ubicación, ad hoc con carta de mandato, y **los descartes con su motivo** (`Mesa-Rules.md` §5 y §6.2) |
| 5 | **Comisiones** | Especialistas | Un informe por comisión, **verbatim**, con «lo que revisé y está bien», **escrito por la propia comisión en la ruta de folio que le dio el despacho** (§5.2). Toda comisión que proponga no seguir una convención que rige deja su ficha (`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §5.1) |
| 6 | **Refutación** | Refutador | El ataque a la lectura dominante, por evidencia y **por aplicación**, **y al objetivo**, contra el pedido literal: qué se dio por fijo sin que nadie lo pidiera, y si hay una solución más chica que lo cumple (un revisor que sólo verifica fidelidad al objetivo no refuta); y, por cada ficha de excepción, **«¿cuánto cuesta realmente cumplir?»**. Una excepción sin refutación foliada no llega al jurado |
| 6 bis | **Camino de compromiso** | Análisis de decisiones | Por cada ficha que el refutador admitió, el análisis de `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §5.3, en un folio propio. Sin ficha admitida, no se convoca |
| 7 | **Consolidación y peritaje** | Presidente | Consolida sin juzgar y no vota (§1). Raíces comunes; toda contradicción entre comisiones elevada como ítem y, si hace falta medir, un peritaje (§3.3). **Si un hallazgo invierte una conclusión ya comunicada**, antes de proponer salidas se rehace el enunciado (§3.1), y la primera salida evaluada es la que iguala la pieza que difiere del caso que funciona (§3.3) |
| 8 | **Veredicto y parches** | Jurado y cuerpo de parches | `Mesa-Rules.md` §6.4 y §6.5. Sobre una excepción, el jurado vota la ficha y si el camino recomendado está fundado |
| 9 | **Aplicación y verificación** | Quien aplica (§4): nunca un rol del panel | La verificación de cada parche, con evidencia antes y después; **y, como último tramo, la reintegración a la especificación** de `Root-Rules.md` §14 (02, 03, 05, 06 y la fuente de alcance según la clase del cambio que la resolución declaró) |
| 10 | **Cierre** | Presidente | **Cuenta los folios**, o las secciones del registro donde los informes lo son (§2.3): comisiones convocadas + refutador + análisis de decisiones, si se convocó + perito, si lo hubo + cada rol convocado de la clase «interfaz en ejecución» + los dos del jurado, el de composición y el de veredicto (`Mesa-Rules.md` §2.2, ítems 2 y 5); las fichas se listan aparte. Si no da, la mesa no está cerrada. El bloque de `Mesa-Rules.md` §6.7 —con la fila `Reintegra` de la resolución—, el apartado **«Excepciones a conocimientos»** (`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §5.2), la deuda declarada y las preguntas que sobrevivieron, **en lote y con `SI NO RESPONDÉS`**; una fila de alcance propuesta al Product Owner y una excepción **no se asientan por silencio**. Cruza la fila «Secciones leídas» de cada folio contra el «Mapa de carga» de §0: un hallazgo que se apoya en una sección no declarada en el folio vuelve al refutador como ítem; una sección cargada por respaldo y declarada vale aunque su fila del mapa no la dé |

### 2.2 Las cuatro clases de objeto y su variante

| Clase | Qué es E1 | Qué cambia en el panel | Regla de cierre propia |
| --- | --- | --- | --- |
| **Corpus documental existente** —también un registro de decisiones, o una decisión ya tomada que el pedido pone en revisión— | La compuerta mecánica, un enlace que no resuelve, un comando con su salida | Nada: `Mesa-Rules.md` tal cual | La de `Mesa-Rules.md` §6.7 |
| **Interfaz en ejecución** | El registro de un medio de observación: error de consola, medición en el navegador, prueba de extremo a extremo en rojo. **E3** es un recorrido reproducible que deja a la persona sin salida, con captura del estado final | Se suman **usuarios estándar**, **moderador de objetivos** y **consultor de documentación** (abajo). Las comisiones observan cada una con su propio medio | Un ajuste está aplicado cuando **existe la captura posterior**, con el mismo medio y el mismo encuadre que la anterior, versionadas juntas: son salida del caso (§2.3, §5.3) |
| **Diseño de una norma o decisión** | Una medición sobre el árbol que la norma va a alcanzar | Las comisiones de dominio **citan fuentes externas** —norma con su número, publicación con su autor— y **no inventan cláusulas**: si no se está seguro del apartado, se cita la norma sin apartado. El refutador ataca **el costo de aplicarla** | Un dictamen que responde **cada pregunta del pedido por separado**, sin «depende» |
| **Investigación de un defecto o contradicción** | La reproducción del defecto antes del arreglo y, si existe, **la medición del caso que funciona** con la misma entrada (§3.3, «Caso que funciona antes que diseño») | Un **perito** que diseña el experimento; las comisiones que se contradicen no votan el peritaje | La prueba que lo cubre se vio **fallar** antes del arreglo y pasar después |

**La regla de cierre propia de cada clase se suma al criterio de corte y no lo reemplaza.** Dice cuándo está
terminado lo que la clase entrega, no cuándo la mesa cierra **por criterio**, que lo decide siempre
`Mesa-Rules.md` §6.7. Una mesa que cumple su regla propia en una sola ronda cierra **por decisión** (§4,
«Criterio de corte»). **Un objeto de dos clases** —un defecto que se ve en una interfaz, un corpus que pide
una decisión— toma la de la pregunta principal del pedido y de la otra suma sólo los roles que una señal pida;
cierra con la regla de la clase tomada, y `CLASE DE OBJETO` declara la descartada. **Donde `Mesa-Rules.md`
se usa como forma** (§1), la «señal observable en el corpus» de su §5.2 y las afirmaciones que mira su núcleo
permanente (§5.1) se ubican en el objeto o en una frase del pedido, con su cita.

#### Los tres roles que suma la clase «interfaz en ejecución»

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
visual → componente → maqueta aprobada → superficie del producto → instancia desplegada. **El parche va a
la capa más alta que contiene el defecto**, y maqueta y superficie se tocan juntas o no se tocan: un
parche que toca una sola es una regresión programada.

### 2.3 El expediente de la mesa

**Toda mesa a pedido deja registro, aunque no encuentre nada.** Cuándo ese registro es un expediente,
dónde vive, qué forma tiene y cómo se sella lo fija `SDD/Devs/Rules/Expediente-Rules.md`, y **este
documento no la repite**. Lo que agrega para una mesa a pedido es la correspondencia de sus piezas con los
tipos de actuación de esa regla:

| Pieza de la mesa | Cómo entra al expediente |
| --- | --- |
| El pedido literal | Folio `presentacion` con su bloque de testimonio |
| El contrato de entrada de §5.1 y la verificación del despacho | Folio `providencia` |
| La carta de cada comisión | Pieza de `evidencia/`, antes de despachar. Es texto liviano: se versiona |
| Los informes de las comisiones, del refutador, del perito, del análisis de decisiones y los dos del jurado | Folios `informe` verbatim. Sólo en un destino y si la mesa cumple `Mesa-Rules.md` §0.0 (§1) son secciones del registro único de su §2.1 (punto 4 de §2.2), que el expediente folia por `ruta@commit`; si no la cumple, no hay ese registro y son folios también en un destino. **Los escribe cada uno en su ruta de trabajo** (última fila): el presidente no transcribe, incorpora y cuenta |
| Cada ficha de excepción | Folio `informe` con número propio de la serie, antes del veredicto (`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §5.1); donde los informes son secciones del registro (fila de arriba), una sección más, que el cierre cita por ella. Los folios que actúan sobre ella la citan por `XC-<n>` |
| Lo que quien pidió escribe mientras la mesa corre | Folio `providencia` de quien preside, con su bloque de testimonio, que rehace el enunciado (§0, renglón 2). No `presentacion`, que devolvería el expediente a «abierto» |
| El plan y el cierre, con lo que el presidente agrega marcado como propio | Folio `resolucion` |
| **Dónde escribe cada rol** antes de su folio | En su **ruta de trabajo**, la `{{RUTA DEL FOLIO}}` de la carta: `<carpeta-del-caso>/despacho/<rol>.md`, y sus fichas ahí mismo, `<rol>-ficha-<n>.md` (`{{CARPETA DE FICHAS}}`). El folio no se reserva al despachar: quien preside incorpora cada pieza sin editarla cuando llega, con el siguiente número libre (`Expediente-Rules.md` §3.1) o, en un destino, como su sección del registro. Incorporar es mover el texto, no transcribirlo; `despacho/` queda vacía |

**«Vive en la sesión del coordinador» no es un estado admisible del registro** (§7). **Si la mesa cumple
`Mesa-Rules.md` §0.0** (§1), el registro normativo va donde esa regla lo manda y el expediente lo folia, no lo
duplica. **Si la mesa no cumple la condición de `Expediente-Rules.md` §1**, deja su carpeta con los informes
verbatim y su punto de continuación, sin forma de expediente.

**La evidencia es material de trabajo; lo que se retoma es el expediente.** Capturas, logs crudos,
volcados, exports, capturas de las herramientas del navegador, imágenes y videos se tratan y se trabajan;
de ellos sale una descripción —el folio— y de los folios, el expediente. Un caso posterior retoma el
expediente procesado, no la evidencia. **Si el destino no declara un almacén de evidencia**, lo pesado o
crudo queda local, fuera del versionado, por el `.gitignore` de la carpeta del caso (§5.3).

| Pieza | Dónde queda |
| --- | --- |
| `README.md`, actuaciones y folios: presentación, providencia, informes, fichas, análisis, plan y cierre | Versionada |
| Texto que un folio cita y relee tal cual, ya barrido: la carta de cada despacho, el texto del pedido que sostiene la huella del testimonio (§3.2), un extracto, la salida de un comando, el `.txt` que acompaña a una imagen | Versionada, en `evidencia/` |
| Lo que aporta quien pidió —documentos, capturas— y la salida real del caso, donde el destino la guarde —la captura anterior y posterior de §2.2— | Versionada tras el barrido; una captura así dentro de `evidencia/` se exceptúa por su ruta (§5.3) |
| Evidencia cruda que generan los agentes: capturas (png, jpg), capturas crudas de las herramientas del navegador (ndjson), videos; un log, volcado o export enteros | Local, excluida por el `.gitignore`; su huella y su ruta van en el folio que la cita, con el extracto |
| Un archivo del pedido o de quien pidió con credenciales en claro | Local, excluido por su ruta; se avisa a quien pidió. Si es el texto del testimonio, su huella se toma sobre ese original y se versiona una copia redactada, marcada como tal |

**Cada folio vale por sí solo**, porque la pieza cruda no viaja: trae las cifras, el comando o el medio
que las produjo, el extracto mínimo que las muestra y, por cada pieza cruda que lo respalda, su ruta local
y su huella SHA-256. Es `Expediente-Rules.md` §3.4 —«huella sólo para lo que no está versionado o sale del
repositorio»; una imagen lleva al lado su `NNN-<slug>.txt` con las tres líneas— aplicada a toda la
evidencia cruda: ese `.txt` se versiona y la imagen no.

**Antes de versionar, se barre** lo que va a entrar al commit: secretos y datos personales —credenciales,
tokens, teléfonos, patentes—, incluidos lo que aportó quien pidió y la salida real del caso. Lo que
aparece en un extracto se redacta; un archivo del pedido o de quien pidió con credenciales en claro no se
versiona, y se le avisa. El cierre declara el barrido con su comando, su resultado y lo que se redactó o
quedó afuera.

## 3. Contrato de uso

### 3.1 Cómo se lee un pedido

**No se le pregunta a quien pidió nada que el pedido y el árbol contesten**, y la composición del panel
nunca se le eleva (`Mesa-Rules.md` §6.2).

| Forma del pedido | Qué se deduce, sin preguntar |
| --- | --- |
| «Hacé una mesa de expertos en `<dominio>`» | Núcleo permanente siempre; comisiones de ese dominio como catálogo variable, cada una con su señal. Si el dominio no está en el catálogo, **ad hoc con carta de mandato** |
| «Presentales como caso `<X>`» | `<X>` es el objeto y **la presentación literal del pedido es la primera pieza del expediente**. Las comisiones la reciben textual, no parafraseada |
| «Que busquen `<Z>`» / «en base a los estándares de la industria y la academia» | Mandato de investigación: fuentes externas citables por comisión (§2.2, diseño de una norma) |
| «Que vuelquen sus informes en `<ruta>`» | Los informes van verbatim a esa ruta. Si el caso cumple la condición de `Expediente-Rules.md` §1, la ruta es la del expediente y la forma, la de esa regla |
| «Que lleguen a una conclusión cerrada» | Dictamen pregunta por pregunta. Lo que no se pueda cerrar se declara con su motivo y su default |
| «Que evalúe si me necesita» | La lista cerrada de `Mesa-Rules.md` §7, con el origen del hecho calculado antes |
| El pedido llega **en medio de otro trabajo**, ante un problema | La mesa reemplaza la detención: se convoca, se resuelve, se registra, y **sólo sale al humano lo que después de la mesa sigue sin respuesta en el árbol** |
| **Todo pedido que plantea un problema** —una pregunta, una corrección, un defecto—, haya mesa o no | **El enunciado, antes del primer despacho** (`ENUNCIADO`, §5.1). Cada frase de quien pidió, literal, como **incógnita, dato, requisito, deseable o exclusión**: una preferencia de quien decide es requisito; un «estaría bueno», deseable. **El sujeto** de cada pregunta —qué emisor, entorno o versión—: medir otro no la contesta, a lo sumo la acota, y se dice. **El origen de cada condición**: el pedido o una regla con E2; lo que el producto hace hoy no es condición (§3.3, «Comportamiento no es restricción»). **El caso que funciona**, si lo hay, con su tabla diferencial (§3.3). Una frase con dos lecturas se escribe con las dos y se toma la que menos agrega, declarada: la que suma menos trabajo, entregas o condiciones que el pedido no nombra; ante una frase restrictiva, la que restringe sólo lo que nombra. Una cláusula que no sale del pedido ni de una regla es un **agregado**: no se despacha, o va marcada y sale a quien pidió (`Mesa-Rules.md` §7, disparadores 1 y 3) |
| **Falla un paso que quien pidió prescribió** —una credencial, una URL, un 401, un build que el pedido usa como medio; un 401 que es el objeto de la investigación es el defecto, no un bloqueo— | Es un **bloqueo**, no un «no verificado» ni «otro problema». Primero, la prueba de una variable con la forma que el propio pedido muestra (§3.3, «El peritaje cambia una sola variable»); si no cierra, **sale a quien pidió en el mismo turno**, en una línea, aunque el resto siga: es un obstáculo, no una escalada de lote (`Conocimiento/Knowledge-Cadena-De-Consecuencias.md` §3). No se rodea por otro camino que mide otra cosa. Todo despacho lleva esta cláusula (§5.2) |
| El pedido es **diseñar lo que el producto no prometía** —una capacidad, una pantalla, una regla nueva— | Es un **cambio de alcance** pedido por quien decide: el pedido foliado es el arbitraje y el ciclo no se bloquea (`Mesa-Rules.md` §7, disparador 3). La resolución declara la clase `compromiso` y la fila de alcance propuesta al Product Owner (`Root-Rules.md` §14.2), que no se asienta por silencio |

**Cuándo no hace falta una mesa**, aunque el reflejo la pida: cuando la pregunta la contesta **un comando
o una lectura**, o cuando no hay ninguna decisión que tomar. Una mesa para eso es teatro deliberativo con
acta (§7).

### 3.2 Convenciones que no se rompen

| Convención | Qué se rompe si se ignora |
| --- | --- |
| **Comisiones a ciegas y en paralelo; el refutador, último** | El segundo repite al primero, y la coincidencia se lee como verificación sin serlo |
| **Cada dato del despacho lleva su comando** | La mesa hereda los errores de quien la convoca. Medido: en una mesa sobre una afirmación sin verificar, **el despacho llevaba cuatro datos y tres estaban mal**; dos comisiones los corrigieron por separado |
| **Todo hallazgo declara su clase de ancla**; un `C` sólo funda una pregunta | Correcciones fundadas en opinión (`Mesa-Rules.md` §6.1) |
| **Una afirmación de colisión o no colisión de un término, sólo con E1** | Una cita muestra dónde está una palabra, no dónde no está (`Mesa-Rules.md` §6.1). Medido: un refutador contó líneas donde había que contar ocurrencias |
| **La fuente declarativa se contrasta antes de fundar un `P0`** | Una fila de plan, una casilla o un recuento en prosa son afirmaciones sobre el trabajo y no el trabajo (`Mesa-Rules.md` §6.1) |
| **Un hallazgo heredado de un informe anterior entra como `C`** | Conocimiento reenviado que nunca se verifica |
| **El testimonio de quien pidió se asienta con su literal, canal, fecha-hora y huella**, y se clasifica por contenido (`Expediente-Rules.md` §3.3). La huella es el SHA-256 del texto del pedido tal cual llegó —sin el marcado de cita (`> `), sin comillas agregadas y, si va en un bloque cercado, sin las líneas del cerco—, con líneas terminadas en LF y el salto final (`Expediente-Rules.md` §3.3, punto 2: «del bloque tal como lo extrae A8»). En el folio la comprueba A8 (`Expediente-Rules.md` §6); en la pieza de `evidencia/` que guarda ese texto, se comprueba sin sus tres líneas de cabecera (`Expediente-Rules.md` §3.4): `tail -n +4 <pieza> | sha256sum`, con el texto desde la cuarta línea, tal cual y con su salto final. El pedido es fuente de intención y pasa a E4 cuando queda como restricción del contrato; la aprobación es evidencia `humano` de D9 | Una decisión humana parafraseada deja de ser citable, y un testimonio no es E4 por sí mismo: E4 es regla declarada (`Mesa-Rules.md` §6.1) |
| **Cada folio vale por sí solo; la evidencia cruda queda local** cuando el destino no tiene almacén (§2.3): cifras, comando, extracto mínimo, ruta local y huella SHA-256 de la pieza que lo respalda | El caso posterior retoma un folio que remite a una captura que no viajó y no lo puede releer; o el repositorio carga lo que nadie retoma. Medido en un destino privado, no reproducible desde esta copia: en un caso, la evidencia de los agentes sumaba ~150 MB (126,9 MB de capturas crudas de las herramientas del navegador y 23,6 MB de png) frente a 11,9 MB del texto versionado del caso |
| **Los informes van verbatim** | El expediente deja de ser auditable: nadie puede distinguir lo que dijo la comisión de lo que entendió el presidente |
| **Cada comisión escribe su folio; el presidente los cuenta antes de cerrar** | Medido: una mesa cerró con «la transcripción de la mesa no está versionada (vive en la sesión del coordinador)» y nada lo detectó; después no se pudo contestar por qué no se eligió la alternativa de la norma |
| **Niveles P0–P3**, nunca una segunda escala | Dos conjuntos cerrados para la misma pregunta (`Coherencia-Mesa-De-Evaluacion.md` §6) |
| **Quien diseña un parche no lo vota; quien lo aplica lo verifica** | Se elimina el único control que no es de quien escribió |

### 3.3 Filtros de juicio que el uso dejó

| Filtro | La pregunta | De dónde sale |
| --- | --- | --- |
| **Descripción o control** | Antes de corregir un documento contra el producto: ¿lo que el documento afirma **describe** el producto, o **declara un control** que el producto no ejerce? Una descripción se corrige contra el producto. Un control no ejercido no se reescribe: reescribirlo **lo absuelve** sin que nadie vote la derogación, y va a deuda declarada | Una mesa sobre la documentación de un destino: de 71 hallazgos, **55 eran descripción y 16 controles** |
| **Descripción, control o decisión** | La pregunta anterior tiene una tercera respuesta: ¿lo que el documento afirma es **una decisión de diseño** (un ADR `Aceptado`, un render mode, un stack, una capa) que el producto no cumple? Entonces **no se corrige el documento**: es deriva mayor de `SDD/Devs/Rules/Deriva-Rules.md` §3 y se resuelve corrigiendo el código o con un ADR nuevo que supere al anterior, con aprobación del Product Owner (`Mesa-Rules.md` §6.1) | Una mesa de un destino que «corrigió» la arquitectura para describir un panel construido en otro modo de render que el decidido, y fundó un ADR en el desvío; el Product Owner lo destapó con una pregunta (`Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/actuaciones/019-resolucion-consolidacion-veredicto-dictamen-y-plan.md`) |
| **La unidad de aplicación es el documento** | ¿Esta corrección deja el documento mitad corregido y mitad viejo? Un documento mezclado es peor que uno uniformemente viejo | La misma mesa |
| **Qué dice el sistema cuando no pudo** | Además de si el producto hace lo que promete: ¿qué le dice a la persona cuando no pudo hacerlo? | Una mesa de interfaz: tres observadores se contradecían y **ninguna comisión podía verlo sola** |
| **El peritaje cambia una sola variable** | Ante una contradicción entre observadores, **o entre un caso que funciona y otro que no**, ¿qué experimento mínimo la resuelve? Dos corridas que difieren en **una** cosa, con evidencia de las dos. Antes, se identifica el camino real de cada caso —quién emite, qué transforma, qué recibe—, leído o medido, y se declaran los ejes que el experimento deja fijos. **Con una hipótesis nombrada y la prueba al alcance, se corre antes de rodear el paso o de rotularlo «no verificado»** | La misma mesa: dos envíos iguales salvo las claves del texto resolvieron la contradicción. Y una retrospectiva en un destino privado: un paso prescripto dio 401; la reproducción puso «un esquema de autorización» entre sus hipótesis, no corrió la prueba de una variable y rodeó el paso; dos sondas que sólo diferían en el prefijo del valor lo cerraron después. Medido en ese destino, no reproducible desde esta copia |
| **Una prueba que no se vio fallar no cierra** | ¿La prueba que cubre el defecto se corrió en rojo contra el estado anterior? | La misma mesa: las afirmaciones nuevas se probaron en rojo antes del arreglo |
| **Caso que funciona antes que diseño** | Si un camino funciona y otro no, con el mismo receptor o el mismo valor, ¿se armó la **tabla diferencial** antes de proponer? Una fila por camino y una columna por cada cosa que pasa entre la entrada y el resultado, con ancla por celda; los ejes que fijó quien pidió no se mueven, salvo el que obliga a mover §4, «Datos reales», que se declara. Se marca **la columna que cambia**, y **la primera salida es igualarla a la del caso que funciona**; cualquier otra dice, con E1 o E2, por qué la referencia no sirve. Antes de tratar una línea como invariante se mira su historia (`git log -S`, `git blame`): si antes tenía la forma del caso que funciona, volver a ella es una alternativa obligatoria. **Si la tabla da el cambio de una variable que cumple el pedido, no se enumeran caminos**: se propone ese cambio (§3.1, «Cuándo no hace falta una mesa»). La corrección se compara con la referencia entrada por entrada: la diferencia es vacía o cada divergencia se declara; lo que agrega para otras entradas —un default, una lista de formas reconocidas— es un **agregado** y sale marcado a quien pidió (§3.1) | La misma retrospectiva. El mismo receptor y la misma credencial: por el camino cuyo emisor dejaba el valor tal cual, funcionaba; por el que le anteponía un prefijo de esquema, daba 401; con el valor sin esquema era al revés. La columna que cambiaba era lo que el segundo emisor le hacía al valor, y se escribieron tres «salidas» que movían también el valor y el primer camino, en lugar de recomendar sólo igualar el emisor; el encargo después conservó el prefijo como default y sumó una lista de esquemas reconocidos. El prefijo tenía seis días de historia: `git log -S` mostraba que antes el emisor mandaba la forma del caso que funcionaba |
| **Comportamiento no es restricción** | Al armar las alternativas, ¿cada cosa que se trata como fija es **un requisito de quien pidió**, con su literal, o **una regla o decisión aceptada que manda eso para ese componente**, con E2? Lo que el producto hace hoy es variable, aunque un comentario del código cite una decisión: se lee la decisión y se verifica que mande eso y no algo contiguo —la que fija lo que **acepta** un receptor no fija lo que **manda** un emisor—. «Mantener compatibilidad», «como hoy» o «se decidió en el expediente N» sin una frase de quien pidió no entran al objetivo. Es «un precedente del producto no es una regla» (`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §3) en la otra dirección: **para conservar** | La misma retrospectiva: el prefijo del emisor se presentó como decisión de un expediente anterior, que sólo fijaba lo que acepta el receptor; después de que quien pidió dijo qué valor quería guardar, el encargo fijó «antepone el prefijo, como hoy» y sumó «mantené compatibilidad», que nadie había pedido, y a quien pidió se le contestó que con el valor que quería guardar «eso choca» |
| **Origen del hecho antes de escalar** | ¿El hecho que se quiere escalar lo produjo la misma corrida? Entonces no se evalúa contra la lista de escaladas sino contra la autocorrección, que va primero, y **sólo sale** si la autocorrección no alcanza y la salida **declara por qué** (`Master-Prompt.md` §8.1). **«De la corrida» no suprime la pregunta: decide qué se prueba primero.** En una mesa, la base de la corrida es el commit base que declara la carátula del expediente, y lo calcula la presidencia, no la comisión que tropezó; el pedido (folio de presentación) y lo que la mesa mide nunca están en esa base, así que un hecho que se apoya en ellos es de la corrida por la letra, y así se rotula: no se reclasifica «por contenido». Una excepción a un conocimiento sale siempre: la autocorrección no la alcanza (`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §4) | `Mesa-Rules.md` §7 y §8: «sólo sale si esa cláusula la deja salir»; «ninguna cuyo origen del hecho sea de la corrida salió sin declarar por qué la autocorrección no alcanzaba» |

### 3.4 Las convenciones que rigen, medidas

El presidente barre el índice de conocimiento —toda fila cuyo `Tema` toca el objeto, haya disparado o no su
condición de carga— y lista en el contrato de entrada el alias, la versión y las secciones que rigen, **con el
comando del barrido y su salida**: es un dato del despacho (§3.2), no una lectura de memoria. El comando
(esqueleto en §5.1) lista alias, `Tema` y `Estado` de todas las filas; se leen los `Tema` contra el objeto y
se toma la versión de la cabecera de cada documento que queda. Descartar una fila lleva motivo, como un
descarte del panel. **Lo listado se asienta además en el campo `decisiones_cerradas` del contrato**
(`Mesa-Rules.md` §4): así no se reabre salvo contradicción con E1 o E2, y la fuerza la pone la regla y no este
documento. Una decisión que el pedido pone en revisión es el objeto y no entra en ese campo; si dos decisiones
cerradas se contradicen, la mesa no elige: es el disparador 7 de `Mesa-Rules.md` §7. **El índice que se
barre** es el del framework que corre, el único que abre el orquestador (`Master-Prompt.md` §6), o el de un
fork, en la misma ruta: el intake cita alias y no registra una base del destino
(`Conocimiento/Index-Knowledge.md` §4). La base de conocimiento de un destino es un fork sólo si el
orquestador la abre en esa ruta. Una «convención de la casa» fuera de ese índice entra al contrato como regla
o decisión del producto, con su fuente, en `decisiones_cerradas`, y no pasa por
`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md`: no hay documento de la base al que exceptuar. Lo
que la contradice es un hallazgo, y sostener que ella es la contradictoria es el disparador 7. **Una fila
cuyo `Tema` toca el objeto sólo con cierto stack** se lista condicional, con el supuesto y el dato del intake
que lo verifica; si el intake no lo trae, ése es el primer hallazgo. En el contrato basta recortar la salida
a alias y `Estado` si el comando queda escrito.

## 4. Decisiones ya tomadas

| Bifurcación | Decisión | Criterio |
| --- | --- | --- |
| Escala de severidad | **P0–P3** de `Master-Prompt.md` §10; se rechazan las S1–S4 del marco de origen | Dos escalas para la misma pregunta son dos conjuntos cerrados en conflicto |
| Formato de informes | **Documentos con tablas**; se rechazan los esquemas JSON del marco de origen | Un formato paralelo obligaría a auditar dos |
| Criterio de corte | **El de `Mesa-Rules.md` §6.7**: por criterio sólo con dos rondas seguidas sin hallazgos interpretativos; si no, por decisión, y se dice. **Una ronda es un ciclo completo**: base mecánica, panel, comisiones, refutación y veredicto del jurado (§2.1, pasos 3 a 8), como el ciclo de esa regla desde su base mecánica (`Mesa-Rules.md` §6.2). Con una sola ronda el criterio no se alcanza: la mesa cierra **por decisión**, sin que eso sea una falta, y lo escribe. **Ni la regla de cierre propia de la clase (§2.2) ni el presupuesto del pedido son criterio de corte**: se suman a él; cumplirlos permite cerrar, y el rótulo sigue siendo `por decisión` mientras no haya dos rondas seguidas limpias. Con cuatro rondas sin alcanzarlo, la decisión sube a quien pidió, en el lote del cierre. El rendimiento por especialista se **mide y declara** en cada ciclo: hallazgos procedentes sobre especialistas convocados al panel, las comisiones y el refutador, que es del núcleo permanente (`Mesa-Rules.md` §5.1, y «por especialista» de §6.7). El análisis de decisiones y el jurado no emiten hallazgos y no entran en el denominador. **Procedente** es el hallazgo que el jurado votó que procede (`PROCEDE` de `Mesa-Rules.md` §6.4), tenga parche o no: uno que se decide no corregir y va a deuda declarada también cuenta. Uno descartado, archivado o anclado sólo en `C`, no | En las dos primeras corridas reales el rendimiento no cayó entre ciclos (4,9 y 5,8 hallazgos procedentes por especialista): un umbral de rendimientos decrecientes no se adopta sin una medición que lo sostenga, y cerrar por decisión es legítimo si se declara |
| Quién aplica | **Quien convocó o quien el pedido designe, nunca un rol del panel ni el jurado**: «la mesa no aplica» (`Mesa-Rules.md` §6.6), «aplicar es del orquestador» (§1.2) y la reintegración la ejecuta quien el pedido designe, «nunca la mesa» (`Root-Rules.md` §14.1). «Hacé una mesa que lo corrija» autoriza a aplicar y no designa a la mesa: aplica quien la convocó —el presidente, que recibe el pedido (§1), en el lugar del orquestador; no quien la pidió—, o el aplicador que `QUIÉN APLICA` nombra fuera del panel, que aplica y verifica (§3.2). Si el pedido no autoriza aplicar, la mesa entrega el plan | Lo que no cambia es la separación entre diseñar, aprobar y verificar; ante contradicción manda la regla (§8) |
| Escalada en una interfaz | Cambiar paleta, marca o familia tipográfica **es cambio de alcance** y se escala; cambiar la escala de tamaños dentro de la misma familia no, y la mesa lo resuelve | Lo primero redefine la identidad del producto; lo segundo es el ajuste que se pidió |
| Datos reales | Toda acción de una comisión sobre un sistema vivo se limita a **datos que la propia comisión sembró**. Si el caso que funciona está atado a una cuenta real, la medición con esa cuenta la hace quien tiene el acceso y se le pide (un obstáculo, `Conocimiento/Knowledge-Cadena-De-Consecuencias.md` §3); la comisión reproduce con una cuenta sembrada con los mismos atributos y declara el eje que no quedó fijo | Actuar sobre datos de personas reales es irreversible con impacto material (`Mesa-Rules.md` §7, disparador 5) |
| Composición | La vota el jurado; **empate convoca**; techo de cinco variables | `Mesa-Rules.md` §5.5: un especialista de más es un informe descartable, uno de menos es un punto ciego |
| No seguir un conocimiento que rige | **Sólo por contradicción**, con ficha, refutación, análisis del camino de compromiso y veredicto foliados; **la mesa no se detiene**, y la excepción sale en el cierre con uno o dos caminos y su default (`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §4). Por conveniencia no se deja de seguir: se propone el cambio | Un sí o no con default «cumplir» ante una imposibilidad detenía el trabajo sin que nadie eligiera (`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §5.3, «Por qué así») |

## 5. Esqueletos de referencia

### 5.1 Contrato de entrada

```text
PEDIDO (literal): «{{texto exacto, con fecha y quién lo hizo}}»
ENUNCIADO (§3.1): {{frase → incógnita | dato | requisito | deseable | exclusión; sujeto; origen; caso que funciona}}
CLASE DE OBJETO: corpus documental | interfaz en ejecución | diseño de norma | investigación de defecto
OBJETO: {{qué se evalúa, con ruta y versión o commit}}
OBJETIVO: {{qué debe lograr, en una oración; cada cláusula cita su frase del pedido o su regla, o va «agregado»}}
PREGUNTAS DEL CASO: {{una por línea; el dictamen responde cada una}}
LECTURA P0–P3: {{qué es P0, P1, P2 y P3 para este caso, en una línea cada uno}}
RESTRICCIONES DURAS: {{lo no negociable}}
DECISIONES CERRADAS: {{lo que no se reabre salvo contradicción con ancla E1 o E2; incluye CONVENCIONES QUE RIGEN}}
CONVENCIONES QUE RIGEN: {{por cada fila del índice cuyo Tema toca el objeto: alias, versión, secciones;
                        con el comando del barrido y su salida (§3.4)}}
                        Índice:   Conocimiento/Index-Knowledge.md del framework que corre; en un fork, el suyo (§3.4)
                        Barrido:  grep '^| `Knowledge-' {{índice}} | cut -d'|' -f3,5,11   # el campo 1 es vacío: 3 alias, 5 Tema, 11 Estado
                        Versión:  grep -m1 '^\*\*Versión' {{carpeta del índice}}/Knowledge-<alias>.md
                        Descartes: {{alias: por qué su Tema no toca el objeto}}
FUERA DE ALCANCE: {{lo que la mesa no toca}}
MEDIOS: {{con qué se observa, y qué queda sin observar}}
EXPEDIENTE: {{ruta}}
QUIÉN APLICA: {{quien convoca | quien el pedido designe, fuera del panel | nadie: sólo plan}} (§4)
PRESUPUESTO: {{tope de hallazgos por comisión; rondas}}
DESPACHO VERIFICADO: {{cada dato con su comando y salida}}
```

Los campos son los de `Mesa-Rules.md` §4, en mayúsculas; `estado`, `diff_normativo` y `pendientes_declarados`
se llenan si la mesa cumple §0.0 (§1), y si no llevan «no aplica» y su motivo.

**`LECTURA P0–P3`.** Una mesa a pedido no audita una fase, así que **la presidencia declara la lectura de
los cuatro niveles de `Master-Prompt.md` §10 para el caso**, en el contrato de entrada y en cada carta: la
misma escala leída para el objeto, no una segunda (§3.2). Sirve de forma esta, que usó una carta de
comisión en un destino: **P0**, lo que viola una restricción dura del contrato de entrada o hace imposible
el objetivo; **P1**, lo que haría salir el plan con retrabajo o con interpretación divergente entre
implementadores; **P2**, una pérdida acotada; **P3**, claridad.

### 5.2 Despacho de una comisión

```text
Sos {{COMISIÓN}} en una mesa de expertos sobre {{OBJETO}}. Tu encargo es refutar, no verificar.
Trabajás a ciegas: no vas a ver el informe de ninguna otra comisión.
Clase de objeto: {{CLASE DE OBJETO}}.

Caso, tal como lo presentó quien pidió la mesa: «{{PEDIDO LITERAL}}»
Objetivo, con el origen de cada cláusula: {{OBJETIVO}}. Lo que da por fijo sin origen es tu primer hallazgo.
Si falla un paso que el pedido prescribe, no lo rodeás: devolvés «BLOQUEO: paso — salida — prueba de una variable».

Tu competencia es {{COMPETENCIA}}. No te corresponde {{NO_COMPETENCIA}}: si encontrás algo ahí,
emitís una solicitud de convocatoria con la señal y su ubicación, no un hallazgo.

Por cada hallazgo: nivel P0–P3 (con la lectura para este caso: {{LECTURA P0–P3}}), clase de ancla E1–E4 o C
con su cita o su comando y salida (la escala está en SDD/Devs/Rules/Mesa-Rules.md §6.1),
impacto si no se corrige y dirección de la corrección, no su redacción.
{{Si la clase es diseño de norma: toda afirmación sobre la industria o la academia, con su fuente —norma
con su número, publicación con su autor—; sin cláusulas inventadas: si no estás seguro del apartado, citás la norma sin apartado.}}

Rigen estas convenciones: {{CONVENCIONES QUE RIGEN}}. Si proponés no seguir alguna, cargás entero
Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md y escribís su ficha, con la alternativa de cumplir,
una por decisión, en {{CARPETA DE FICHAS}}: quien preside la incorpora como folio propio.
«Más simple» o «no aplica del todo» no es motivo. Antes de recomendar entre opciones, corrés
Conocimiento/Knowledge-Cadena-De-Consecuencias.md §2.

Norma: {{RUTA DE ESTE DOCUMENTO}} {{VERSIÓN}}. Leé primero las líneas 1 a {{FIN DE §0}} y después sólo lo que
su «Mapa de carga» da para tu situación; una remisión a algo que no cargaste, en el texto de tu acto, la cargás.
En la cabecera de tu folio declarás la fila «Secciones de Mesa-De-Expertos-A-Pedido {{VERSIÓN}} leídas» y, si cargaste los otros dos documentos, su alias y su versión.
Tope: {{N}} hallazgos. Declarás hasta tres ítems de «lo que revisé y está bien».
Escribís tu informe, verbatim, en {{RUTA DEL FOLIO}}; quien preside cuenta los folios, no los transcribe.
```

`{{FIN DE §0}}` es la línea anterior a `## 1.` (`grep -n '^## 1\.'` menos uno), y
`{{RUTA DE ESTE DOCUMENTO}}`, la ruta con la que lo abre el orquestador que corre (`Master-Prompt.md` §6),
relativa al destino. **La carta de otro rol** —refutador, análisis, jurado, perito, roles de la clase
«interfaz en ejecución», cuerpo de parches, quien aplica— sale de este esqueleto: conserva objeto, clase,
pedido literal, objetivo con origen, `BLOQUEO`, lectura de P0–P3, norma, secciones leídas y ruta del folio;
cambia la primera línea y el mandato por los de su fila en §1, §2.1 o §2.2; y quien no emite hallazgos quita
el tope y las líneas de hallazgo.

### 5.3 Carpeta del expediente

La del árbol de `Expediente-Rules.md` §3, con la correspondencia de §2.3. No se repite acá para no
mantener dos copias del mismo árbol.

Lo que sí se fija acá es el **`.gitignore` de la carpeta del caso** cuando la evidencia cruda queda local
(§2.3), en su raíz. Forma de referencia:

```gitignore
# Evidencia del caso: el texto se versiona; las capturas y los volcados crudos quedan locales.
# Sin almacén de evidencia, lo que se retoma en un caso posterior es el expediente procesado.
**/evidencia*/**/*.png
**/evidencia*/**/*.jpg
**/evidencia*/**/*.ndjson
```

Se suma una línea por extensión por cada otro medio crudo —video, volcado binario—; lo crudo en texto (un
log, un export) y el archivo con credenciales, una línea por su ruta; la captura que se versiona (§2.3),
una `!` por su ruta. Lo que el repositorio ya ignora no se repite. No se excluye `evidencia/` entera ni
las extensiones de lo que se versiona (`.md`, `.txt`). Comprobación, desde la raíz del repositorio y sobre
la carpeta **del caso**: `git ls-files -ci --exclude-standard <carpeta-del-caso>` → vacío. Lo ya
versionado en expedientes anteriores no se retira —lo escrito no se reescribe—: el `.gitignore` rige desde
el caso que lo trae.

### 5.4 Campos de cierre que suma la clase «interfaz en ejecución»

Al bloque de `Mesa-Rules.md` §6.7:

```text
  MEDIOS
    Usados:        {{medio: qué observó}}
    Sin observar:  {{qué quedó fuera del alcance de los medios, y por qué}}
```

**`Por criterio` exige dos rondas.** La fila `CIERRE` de ese bloque elige el rótulo con el criterio de corte
de `Mesa-Rules.md` §6.7, nunca con la regla propia de la clase (§2.2) ni con el presupuesto: **una sola
ronda** —o varias sin dos seguidas limpias— cierra **por decisión y no por criterio**, y lista lo abierto.
«Por criterio: una ronda, presupuesto agotado» es un rótulo que esa regla no admite: «Una fase que cierra por
decisión y no lo dice se lee después como una fase que cerró por criterio» (`Master-Prompt.md` §10.1).

## 6. Criterios de aceptación

- [ ] `[enumerable]` Si la mesa abrió expediente, cumple los criterios de `Expediente-Rules.md` §6; si no,
      su carpeta tiene un informe por comisión convocada, el del refutador y el plan con su cierre.
- [ ] `[enumerable]` El contrato de entrada transcribe el pedido literal con su fecha.
- [ ] `[enumerable]` Todo dato numérico o de sección que el despacho pasó al panel tiene su comando y su
      salida en el contrato.
- [ ] `[enumerable]` El registro de convocatoria enumera convocados con su señal y **descartados con su
      motivo**.
- [ ] `[enumerable]` Todo hallazgo declara nivel P0–P3 y clase de ancla, y ningún `C` fundó un parche.
- [ ] `[enumerable]` En la clase «diseño de norma», toda afirmación sobre la industria o la academia lleva
      fuente.
- [ ] `[enumerable]` En la clase «interfaz en ejecución», todo parche declarado aplicado tiene captura
      anterior y posterior con el mismo medio y encuadre, versionadas.
- [ ] `[enumerable]` Las preguntas a quien pidió salieron en un solo lote, cada una con `SI NO RESPONDÉS`
      y su origen del hecho, y ninguna cuyo origen sea de la corrida salió sin declarar por qué la
      autocorrección no alcanza (§3.3).
- [ ] `[enumerable]` La fila `CIERRE` dice `Por criterio` sólo si el registro trae dos rondas seguidas sin
      hallazgos interpretativos, con los enumerables en cero; con menos, dice `por decisión y no por
      criterio` y lista lo abierto (§4, §5.4).
- [ ] `[enumerable]` Los informes versionados son tantos como comisiones convocadas más el refutador, el
      análisis de decisiones si se convocó, el perito si lo hubo, cada rol convocado de la clase «interfaz en
      ejecución» y los dos del jurado, y el cierre los cuenta sin sumar las fichas (§2.1, paso 10).
- [ ] `[enumerable]` El contrato de entrada lista las convenciones que rigen con el comando del barrido y
      su salida, y las asienta en `DECISIONES CERRADAS` (§3.4).
- [ ] `[enumerable]` El contrato de entrada trae el `ENUNCIADO` (§3.1) —cada frase de quien pidió con su
      función, el sujeto de cada pregunta y el caso que funciona con su tabla diferencial, o «ninguno»—, y
      cada cláusula del `OBJETIVO` y de cada despacho cita su origen o está marcada «agregado».
- [ ] `[enumerable]` El contrato de entrada y cada carta traen la `LECTURA P0–P3` del caso (§5.1).
- [ ] `[enumerable]` Cada folio declara en su cabecera las secciones de este documento que leyó, con su
      versión (§5.2).
- [ ] `[enumerable]` Cada carta despachada está archivada y versionada en `evidencia/` (§2.1, paso 2):
      `git ls-files` la lista.
- [ ] `[enumerable]` Si la evidencia cruda quedó local, la carpeta del caso tiene su `.gitignore` (§5.3) y
      `git ls-files -ci --exclude-standard <carpeta-del-caso>` da vacío: ninguna pieza cruda está
      versionada.
- [ ] `[enumerable]` Todo folio que se apoya en una pieza no versionada trae la cifra, el comando o medio
      que la produjo, el extracto mínimo, la ruta local y la huella SHA-256 de esa pieza (§2.3).
- [ ] `[enumerable]` El cierre declara el barrido de secretos y datos personales con su comando y su
      resultado, y lo que se redactó o quedó sin versionar, con el aviso a quien pidió (§2.3).
- [ ] `[interpretativo]` Ninguna alternativa ni cláusula del objetivo trata como fijo lo que el producto
      hace hoy sin un requisito de quien pidió o una regla que lo mande, y, si hubo caso que funciona, la
      primera salida evaluada iguala la columna que cambia (§3.3).
- [ ] `[interpretativo]` Los informes de comisión son verbatim y ninguno cita a otro del mismo ciclo,
      salvo el refutador.
- [ ] `[interpretativo]` Ninguna pregunta que salió a quien pidió tenía respuesta en el pedido o en el
      árbol.
- [ ] `[interpretativo]` El `README.md` permite a alguien que no siguió la mesa saber qué se decidió y
      dónde está parada.

Los criterios de una excepción a un conocimiento: `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §6.

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
| **Tratar el comportamiento actual como dato** | Lo que quien pidió fijó termina siendo lo que se mueve, aparece un «conflicto» que el pedido no tenía y se resuelve agregando lo que nadie pidió —conservar el default de hoy, una lista de formas reconocidas, un menú que mueve también lo que quien pidió fijó— en lugar de recomendar el cambio que iguala la pieza que difiere del caso que funciona; un default para otras entradas se ofrece marcado como agregado (§3.3) |
| **Rodear en silencio un paso prescripto que falló** | Cambia lo que se prueba, y el bloqueo le llega tarde, como «otro problema», a quien tenía la respuesta en una línea (§3.1) |
| **Versionar la evidencia cruda** sin almacén declarado | El repositorio carga lo que nadie retoma —~150 MB en un solo caso medido— y con ella viajan secretos y datos personales sin barrer. Lo que se retoma es el expediente (§2.3) |
| **Folio que remite a una captura que no viaja** | «Ver captura» sin cifra, comando, extracto, ruta y huella: en el caso posterior la captura no está y el hallazgo no se puede releer ni contrastar (§2.3) |
| **Cerrar con los informes en la sesión** | Lo que no está foliado no existe para el expediente: después no se puede contestar por qué se decidió lo que se decidió |

Los anti-patrones de una excepción: `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §7.

## 8. Frontera con las reglas

**Todo lo normativo de la mesa vive en `Mesa-Rules.md`**, y este documento **no redefine ninguna de sus
piezas**: la condición de convocatoria (§0.0), el registro (§2), los principios (§3), el contrato de entrada
(§4), la composición (§5), el ciclo (§6) y la escalada (§7) se citan. Cuando una mesa a pedido cumple §0.0,
**esa regla manda en lo que regula**, y este documento aporta lo que §1 enumera. El análisis de decisiones es
un rol que este documento suma y que no vota ni emite hallazgos: no cambia la composición de §5.

**No sustituye nada.** Ningún ítem de `Mesa-Rules.md` está rotulado como decisión de stack, de modo que lo que
§2.2 declara para las clases que esa regla no mira **no es sustitución: es la extensión de una forma a objetos
que la regla no alcanza**. Si una mesa normativa encontrara contradicción entre este documento y
`Mesa-Rules.md`, **manda la regla** (`SDD/Devs/Rules/Rules-Base-Conocimiento.md` §0.4).

**No define criterios de aceptación de ningún artefacto que el framework genere.** Los de §6 se verifican
sobre el expediente de la mesa, que no es un entregable de categoría.

**Los campos `ENUNCIADO`, `LECTURA P0–P3` y `CONVENCIONES QUE RIGEN` extienden el contrato de entrada** de
`Mesa-Rules.md` §4 sin redefinirlo, igual que el apartado de cierre de
`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §5.2 extiende el de §6.7: no agregan un disparador
de escalada sino un registro del contrato y del cierre.

**En un fork cuya norma mande conservar verbatim lo importado**, editar este documento es una desviación
de esa norma, y se declara ahí; la alternativa de cumplir es un hijo `propio` con `Hereda-de:
Mesa-De-Expertos-A-Pedido` que lleve sólo el delta (`Rules-Base-Conocimiento.md` §0.4, modo
*Especializar*). En este framework la premisa no aplica: acá el documento es la fuente.

**Dónde resuelven las citas.** Las reglas que este documento cita viajan en el mismo árbol, y la tabla
«Dependencias» de §9 dice cómo resuelve cada una. No se copian acá: una copia fija una versión que la
siguiente edición de la regla desmiente (`Rules-Base-Conocimiento.md` §4.4, «Un hecho, un lugar»). Quien lleve
este documento a un catálogo sin esas reglas trae su cierre (`Rules-Base-Conocimiento.md` §2.2).

## 9. Trazabilidad

| | |
| --- | --- |
| **Índice** | [`Index-Knowledge.md`](Index-Knowledge.md) |
| **Hermanos** | [`Knowledge-Excepcion-A-Un-Conocimiento.md`](Knowledge-Excepcion-A-Un-Conocimiento.md): los dos salen de partir este conocimiento en la 2.0, y éste es la puerta (§0, renglón 6) |
| **Consumidor** | `transversal`. Sin condición de carga: se aplica cuando alguien pide una mesa por nombre, o cuando un trabajo en curso tropieza con un problema que se resuelve convocando en lugar de detener. Un encargo a agentes sin mesa puede cargarlo (§0); que el orquestador lo haga depende de su propia regla de carga |
| **Artefacto de referencia** | Ninguno. Lo caracterizado es una convención de proceso. Ejemplares a la vista: los expedientes `Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/` y `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`, que corre esta convención en su forma del fork |
| **Origen de lo caracterizado** | `Mesa-Rules.md` 1.3; `SDD/Devs/Guides/Coherencia-Mesa-De-Evaluacion.md` §6 (qué se importó del marco de origen y qué se rechazó); `SDD/Devs/Guides/Coherencia-Condicion-De-Convocatoria.md`; y las mesas a pedido corridas entre el 2026-09-01 y el 2026-09-13 sobre destinos del framework, declaradas en `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` §3 |
| **Origen de la 2.0** | Un fork de este documento en un destino privado, que lo llevó de la 1.2 a su 1.15 con mesas, reproducciones a ciegas y pedidos de su Product Owner. Incorporado por el expediente `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`. En ese destino el documento era un cuerpo importado y editado, con la desviación declarada contra la regla de importación de ese destino y la decisión de su Product Owner de que fuera el lugar de la regla de excepciones: aquí se partió, y el padre quedó como la puerta. La nota `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` §3 lleva una fila por versión del fork, sin rutas del destino |

**Dependencias:**

| Qué cita | Cómo resuelve | Ancla |
| --- | --- | --- |
| `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §3 a §7 | traída a `Excepcion-A-Un-Conocimiento` | — |
| `Conocimiento/Knowledge-Cadena-De-Consecuencias.md` §2, §3 | traída a `Cadena-De-Consecuencias` §2 y §3 | — |
| `SDD/Devs/Rules/Mesa-Rules.md` §0.0, §2, §2.1, §2.2, §3, §4, §5, §5.1, §5.2, §5.3, §5.5, §6, §6.1, §6.2, §6.4 a §6.7, §7 y §8 | en el árbol | — |
| `SDD/Devs/Orchestrator/Master-Prompt.md` §6, §7.0, §8.1, §10, §10.0, §10.1 | en el árbol | — |
| `SDD/Devs/Rules/Expediente-Rules.md` §1, §3, §3.1, §3.3, §3.4, §6 | en el árbol | — |
| `SDD/Devs/Rules/Root-Rules.md` §11, §14, §14.1, §14.2 y `SDD/Devs/Rules/Deriva-Rules.md` §3 | en el árbol | — |
| La regla base del catálogo que aloja el documento | manda `SDD/Devs/Rules/Rules-Base-Conocimiento.md` §0.4, §2.2, §4.4 y §6.2 | — |
| El índice de conocimiento del barrido | equiparada: `Conocimiento/Index-Knowledge.md` §3 del framework que corre, o el de un fork en la misma ruta; §4: el intake no registra una base del destino | `Conocimiento/Index-Knowledge.md:34` (las diez columnas) |
| Las convenciones que rigen como decisión cerrada | manda `SDD/Devs/Rules/Mesa-Rules.md` §4 | `SDD/Devs/Rules/Mesa-Rules.md:245` y `:249-251` |
| Las copias de la escala, el jurado, el criterio de corte, la escalada, los niveles y el origen del hecho que llevaba el fork | equiparada: cita por sección de la regla vigente, tras el cotejo de `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/evidencia/ev-06-cotejo-de-las-copias-del-fork.diff` | `SDD/Devs/Rules/Mesa-Rules.md:365-371`, `:454-465`, `:507-512`, `:570-578`; `SDD/Devs/Orchestrator/Master-Prompt.md:983-988`, `:1001-1004`, `:1486-1489` |
| `SDD/Devs/Guides/Coherencia-Mesa-De-Evaluacion.md` §6, `SDD/Devs/Guides/Coherencia-Condicion-De-Convocatoria.md`, `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` §3 | en el árbol | — |
| `Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/actuaciones/019-resolucion-consolidacion-veredicto-dictamen-y-plan.md` y `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/` | en el árbol: un caso de §3.3, los ejemplares y el origen. Ninguna hace falta para aplicar el documento: un fork que no traiga `Expedientes/` pierde trazabilidad, no una cláusula | — |

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-09-13 | Emisión inicial. Cataloga la mesa de expertos convocada por pedido explícito: la lectura del pedido, las cuatro clases de objeto con su variante, el despacho verificado, el expediente de la mesa y los filtros de juicio que dejaron las mesas corridas, sin redefinir ninguna pieza de `Mesa-Rules.md`. |
| 1.1 | 2026-09-13 | **Se alinea con `Expediente-Rules.md` por remisión** (framework 13.18, reporte `31`), y cierra la deuda que declaraba §8. **§0** nombra la regla; **§2.3** y **§5.3** remiten a su forma y dejan sólo la correspondencia de las piezas de una mesa con los tipos de actuación, para no mantener dos copias del árbol; **§3.1** remite la ruta al expediente; **§3.2** corrige «el testimonio es evidencia E4», que confundía un testimonio con una regla declarada; **§5.2** deja de fijar el nombre del archivo del informe; **§6** remite su primer criterio a A1–A12. |
| 1.2 | 2026-09-16 | **§2.1 pasos 9 y 10 remiten a la reintegración** de `Root-Rules.md` §14 (framework 13.20, expediente `0003` del framework): la aplicación termina con la vuelta a la especificación y el cierre lleva la fila `Reintegra`; una fila de alcance no se asienta por silencio. **§3.3 suma la tercera clase del filtro**, «decisión»: un documento que registra una decisión de diseño no se corrige contra el producto. Sigue sin definir nada normativo: cita. |
| 2.0 | 2026-10-23 | **Incorpora la sustancia de un fork de este documento en un destino privado, que llegó a su 1.15**, re-redactada contra este framework y sin ser el texto de ninguna de esas versiones (framework 13.22, expediente `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`). **Se parte**: la excepción a un conocimiento que rige pasa a `Knowledge-Excepcion-A-Un-Conocimiento.md`, hermano, y la cadena de consecuencias que el fork citaba de su destino entra como `Knowledge-Cadena-De-Consecuencias.md`; este documento queda como la puerta y conserva archivo, alias y numeración. **§0**: «Lo que no se omite al aplicar este documento», cinco renglones y un sexto que nombra los otros dos; el mapa de carga de siete filas con la columna «además»; la mecánica le sirve a un encargo sin mesa que cargue el documento. **§1**: el análisis de decisiones; el supuesto de la evidencia, condicional. **§2.1**: el enunciado antes de despachar, el objetivo con origen y su corrección mientras el encargo corre, la carta con su lectura y archivada, la refutación del objetivo, el paso 6 bis y la cuenta de folios. **§2.2**: la medición del caso que funciona y la regla de cierre que se suma al criterio de corte; la subsección, sin número. **§2.3**: la ficha como folio propio, cada comisión escribe su folio, el ciclo de vida de la evidencia, el folio que vale por sí solo y el barrido. **§3.1**: el enunciado y el bloqueo. **§3.2**: el testimonio con su huella, el folio autosuficiente y el folio de cada comisión. **§3.3**: tres filtros nuevos con sus casos descriptos sin nombres, y «Origen del hecho antes de escalar» **con su salida entera**, que la 1.2 había perdido. **§3.4**: el barrido de las convenciones que rigen, asentado en `decisiones_cerradas`. **§4**: el criterio de corte aplicado a la mesa a pedido. **§5.1**: `ENUNCIADO`, `LECTURA P0–P3` y `CONVENCIONES QUE RIGEN`, con la ruta del índice como parámetro. **§5.2**: la carta con el objetivo, el bloqueo y los dos documentos. **§5.3**: el `.gitignore`. **§6** y **§7**: los criterios y anti-patrones nuevos. **§8**: las copias de las reglas que el fork llevaba se cotejaron con su fuente y pasan a cita por sección; la condicional para un fork que importe verbatim; dónde resuelven las citas. **§9**: hermano, origen de la 2.0 y la tabla «Dependencias». Tras la prueba del expediente (folio 018): §1 dice cuándo una mesa a pedido cumple `Mesa-Rules.md` §0.0 y qué de este documento se toma entonces; §2.3, dónde escribe cada rol y en qué folio entra lo que quien pidió escribe a mitad del caso; §3.1, el cambio de alcance que cita `Mesa-Rules.md` §7; §4, quién aplica: quien convocó o quien el pedido designe, nunca un rol del panel. Tras la segunda reproducción (folio 021): §1, qué se toma por exclusión y la cláusula del estado; §2.3, informes y fichas son secciones del registro sólo si la mesa cumple §0.0; §3.2, la huella sin las tres líneas de la pieza; §3.4, la convención fuera del índice y la fila condicional; §5.2, `{{FIN DE §0}}`, la ruta y la carta de los otros roles; la lista de fases irreversibles, una sola con la del hermano. El techo de 700 líneas y la medida en bytes del destino no se traen: rige el techo de `Rules-Base-Conocimiento.md` §6.2. Sube mayor: el documento se parte y una cita a una sección que se mudó deja de caer donde caía. |
