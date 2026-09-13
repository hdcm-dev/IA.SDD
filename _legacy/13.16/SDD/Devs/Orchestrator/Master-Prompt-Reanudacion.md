# Master prompt SDD — Orquestador de reanudación

**Archivo:** `Master-Prompt-Reanudacion.md`
**Versión:** 1.13
**Idioma:** Español rioplatense neutro técnico
**Modo:** lectura, diagnóstico y **entrega de contexto**, con detención obligatoria. **No escribe nada del destino salvo su propio informe**, y no ejecuta el trabajo que despacha
**Prerequisitos:** un repositorio destino con `SDD/` poblado. No exige memoria de ninguna sesión anterior
**Salida:** `SDD/Docs/Audit/Estado-Del-Destino-<AAAA-MM-DD>.md`, el registro de la mesa de evaluación en `SDD/Docs/Audit/Mesa-<AAAA-MM-DD>.md`, la decisión del humano, y **la continuación efectiva en la misma sesión** con el contexto ya reconstruido

---

## §0 Cómo usar este prompt

**Este prompt existe para retomar un destino desde una sesión limpia.** Reconstruye en qué estado
está leyendo el árbol, lo presenta, y **le devuelve al humano la decisión** de migrar a la normativa
vigente, seguir en la versión declarada, o continuar un trabajo que no depende de ninguna de las dos.

**Por qué hace falta, y no es una comodidad.** El framework apoya toda su continuidad en que **el
estado vive en el árbol y no en la conversación**: es lo que hace que un agente distinto pueda seguir
donde otro dejó. Esa propiedad **es cierta y nunca estuvo escrita**, de modo que nadie la verificaba
—ni al terminar una sesión, ni al empezar la siguiente—. En una corrida real, un destino quedó con su
registro de cambios declarando la etapa `b` y su código en la `e`: **tres etapas fusionadas que nunca
actualizaron el único documento que declara el avance**, con la regla de actualizarlo escrita en el
propio documento que quedó atrás. Una sesión limpia habría concluido que faltaba arrancar la `c`.

**Cardinalidad.** Se ejecuta **cada vez que alguien retoma**, cuantas veces haga falta. Es la tercera
cardinalidad del método: el orquestador de generación corre una vez por producto, el de migración una
vez por salto de versión, y éste una vez por reanudación.

**Lo que este prompt NO hace:**

- **No decide.** Presenta el estado y las salidas; la elección es del humano. Un prompt que decide
  por su cuenta si migrar convierte una decisión de alcance en un efecto colateral de haber abierto
  una sesión.
- **No obliga a abrir otra sesión.** Una vez elegida la salida, **continúa en la misma**, con el
  contexto que acaba de reconstruir. Un prompt de reanudación que termina diciendo «ahora ejecutá tal
  otro» deja al siguiente volviendo a deducir lo que éste ya dedujo, que es exactamente el trabajo
  que vino a evitar.
- **No repara lo que encuentra.** Si el árbol se contradice, **lo declara y se detiene**. Reparar es
  trabajo del orquestador que corresponda, con su propia confirmación.
- **No reemplaza a los otros dos.** Los invoca. Es un despachador, no un ejecutor.
- **No escribe en el repositorio fuente**, ni en ninguna categoría del destino. Su única escritura es
  el informe de estado en `SDD/Docs/Audit/`.

---

## §1 El principio: una dimensión, una fuente, y contraste contra lo observable

**El estado de un destino tiene seis dimensiones, y cada una tiene un documento que la declara.** La
tabla es el corazón de este prompt: sin ella, reconstruir el estado es interpretar, y dos agentes
interpretan distinto.

| # | Dimensión | Fuente declarativa | Quién la mantiene | Contraste observable |
| --- | --- | --- | --- | --- |
| 1 | ¿Hay documentación generada? | — | — | **`SDD/Docs/` tiene contenido** |
| 2 | ¿Contra qué versión del framework? | `PRODUCT-MANIFEST` §1.1, bloque de procedencia | La generación y la migración | Versiones vigentes en el repositorio fuente |
| 3 | ¿La migración terminó? | El informe de migración más reciente de `SDD/Docs/Audit/` | La migración | **Presencia de carpetas `_fusion/`**: si existe alguna, la fusión no terminó |
| 4 | ¿Qué quedó abierto? | Los hallazgos del último informe, con su estado | Quien cierra cada hallazgo, **nombrado en el hallazgo** | Enlaces rotos, identificadores de forma anterior, referencias sin anclar |
| 5 | ¿En qué etapa de construcción va? | El registro de cambios del producto | **El ciclo de construcción**, que el método no gobierna: el responsable se nombra en el propio registro | **El historial del repositorio de código** |
| 6 | ¿Qué falta para la siguiente? | El roadmap del producto, sus puertas de etapa | Quien cierra cada etapa | — |

**La columna de contraste es lo que distingue este prompt de leer los documentos.** Una fuente
declarativa **puede quedar atrás**, y cuando queda atrás no lo dice: sigue afirmando lo último que
alguien escribió. Las tres dimensiones que tienen contraste observable lo tienen porque **en una
corrida real las tres divergieron**:

- La **3** divergió durante tres rondas de auditoría: el informe declaraba la migración completa y
  había 146 documentos esperando en `_fusion/`, que es la señal que la propia regla define como
  fusión sin terminar.
- La **5** divergió en tres etapas seguidas: el registro decía `b`, el código estaba en `e`.
- La **2** diverge por diseño cada vez que el framework publica una versión, y es la única de las
  tres donde la divergencia **no es un defecto**.

## §1.1 Toda fuente declarativa tiene un responsable, y conviene que sea un subproducto

**La columna «quién la mantiene» es nueva, y nació de una dimensión que no tenía nadie.** En la corrida
que originó este prompt, el registro de cambios de un producto quedó **tres etapas atrás**. La regla de
actualizarlo estaba escrita en la segunda línea de ese mismo documento:

> *Se actualiza en la rama de la etapa, no después de la fusión.*

**Declara el cuándo y no declara el quién.** Es una oración sin sujeto, y una obligación sin sujeto no
la incumple nadie en particular: se incumplió tres veces seguidas sin que nada chirriara.

**R1 · Toda fuente declarativa de estado nombra a su responsable, en el propio documento.** No en un
plan, no en una regla del framework: en el documento que la persona abre cuando va a escribirla.

**R2 · Cuando ningún rol del producto corresponde, el responsable es genérico y sigue siendo
obligatorio.** El orden de resolución es: el rol que la documentación del producto asigne; si no hay,
el perfil de convención del intake y su organización; si tampoco, **la organización dueña del
repositorio**. Un responsable genérico es peor que uno preciso y **muchísimo mejor que ninguno**,
porque un campo vacío se lee como que la pregunta no se hizo, y un campo con la organización se lee
como que nadie más específico se hizo cargo todavía —que es una afirmación verdadera y accionable—.

**R3 · Entre dos fuentes posibles, gana la que es subproducto del acto.** Una fuente que alguien tiene
que acordarse de actualizar se degrada; una que el acto produce por sí solo, no. En esa misma corrida
la dimensión 5 tenía **dos** fuentes declarativas y **las dos se degradaron**: el registro quedó en la
etapa `b`, y las etiquetas por etapa cerrada que el pipeline del producto declaraba como instrumento
de versionado **nunca se crearon, ni una**. Lo único que sobrevivió intacto fue el **nombre de la rama
en cada confirmación de fusión**, que nadie tuvo que acordarse de escribir porque fusionar lo escribe.

**La consecuencia de R3 sobre el diseño de este prompt.** Cuando la fuente declarativa de una dimensión
no es un subproducto, **la columna de contraste observable deja de ser opcional**: es la única defensa
contra una fuente que se degrada en silencio. Las tres dimensiones que tienen contraste son
exactamente las tres cuya fuente hay que acordarse de mantener.

---

**Regla de resolución.** Cuando la fuente declarativa y el contraste no coinciden, **gana el
observable y se declara la divergencia**. Nunca al revés: un documento que dice que algo está hecho
no lo hace.

---

## §2 R0 — Reconocimiento

Sin despachar ningún subagente. **No escribe nada del destino**: la única escritura admitida es la del
paso 0, que **no produce contenido** —pone a salvo lo que ya estaba— y que además detiene la corrida.

0. **Normalizar el repositorio, antes que nada.** Correr la **compuerta de arranque** de
   `Master-Prompt.md` §12.1 **T0**, con sus cinco comprobaciones, y **publicar su salida**. Dos de sus
   resultados detienen la reanudación en lugar de continuarla: un **árbol sucio**, que se pone a salvo
   con T2 y se retoma después del merge; y una **entrega viva** —una rama empujada esperando
   fusión—, porque diagnosticar mientras una unidad anterior no cerró produce un informe sobre un
   estado que está por cambiar.

   **No es higiene, y por eso va antes que las dimensiones.** El historial del repositorio es el
   contraste observable de las dimensiones 3 y 5, y **no incluye lo que no está commiteado**. Sobre un
   árbol sucio, las dos se leen contra un observable incompleto y el informe declara «coincide» o
   «diverge» sin base. Observado: un destino con **452 cambios sin commitear, 428 de ellos borrados**,
   con una migración estructural a mitad de camino que el historial no mostraba.

1. **Verificar que hay algo que retomar.** Si `SDD/` no existe o `SDD/Docs/` está vacía, no hay
   destino que reanudar: el que corresponde es el prompt de bootstrap, y este prompt lo dice y
   termina.
2. **Resolver las seis dimensiones** de §1, cada una por su fuente y su contraste.
3. **Registrar cada divergencia** con las dos lecturas, la declarativa y la observable, y con la
   evidencia de cada una. No se resuelve acá: se declara.
4. **Leer los pendientes declarados**: los hallazgos abiertos del último informe de auditoría, las
   filas sin resolver de un plan de migración, las carpetas `_fusion/` que existan con su inventario,
   y **los ítems diferidos de `Root-Rules.md` §12.2, con su evento de cierre contrastado**: el que
   nombre un evento **ya ocurrido** se declara vencido.

   **Es la comprobación más barata de todo el método y por eso vive acá.** La reanudación ya lee el
   árbol entero sin memoria; preguntarle además «¿qué se difirió y ya venció?» no cuesta una pasada
   nueva. Observado: un destino pasó **ocho etapas** con un ítem obligatorio diferido a un punto de
   control que había cerrado sin registrarlo, y lo que finalmente lo destapó fue **el síntoma** —cero
   etiquetas en el repositorio— y no el diferimiento.
5. **Determinar si hay una migración en curso**, que es un estado distinto de «migró» y de «no
   migró». Sus tres señales, y basta con dos: **existe un plan de migración** en `SDD/Docs/Audit/`,
   **hay carpetas `_fusion/` con contenido**, y **no hay informe de migración con veredicto**. Si la
   hay, se declara con la fase en la que quedó, porque **la salida que corresponde no es empezar de
   nuevo**: es la E de §4.

**Lo que no se hace en R0.** No se abre ninguna categoría documental para juzgar su contenido. La
reanudación reconstruye **dónde está el trabajo**, no si está bien hecho: eso es del audit, que tiene
su propio prompt y su propio auditor.

---

## §3 R1 — Presentación del estado

Detención obligatoria. Formato literal:

```text
Estado del destino: {{NOMBRE_PRODUCTO}}
Leído el {{FECHA}} desde el árbol, sin memoria de sesiones anteriores.

DOCUMENTACIÓN
  Procedencia declarada:   SDD {{VERSION_ORIGEN}}
  Framework vigente:       SDD {{VERSION_VIGENTE}}
  Estado:                  {{al día | desfasado en N versiones | sin procedencia}}

REPOSITORIO  (compuerta T0)
  Rama:                    {{nombre}}   {{al día | N detrás | N adelante}}
  Árbol de trabajo:        {{limpio | N cambios, de los cuales M borrados y K sin seguir}}
  Base de la corrida:      {{commit sobre el que corrió T0}}
  Entregas vivas:          {{ninguna | rama {{nombre}}, esperando merge}}
  Veredicto de arranque:   {{EN ORDEN | SE DETUVO: {{motivo}}}}

MIGRACIÓN
  En curso:                {{no | sí, plan {{archivo}}, {{N}} documentos en {{M}} carpetas _fusion/}}
  Último informe:          {{archivo, versión, veredicto}}
  Fases:                   {{completas | las que faltan}}
  Carpetas _fusion/:       {{0 | N, y la fusión no terminó}}
  Hallazgos abiertos:      {{ninguno | lista con su nivel}}

ÍTEMS DIFERIDOS  (`Root-Rules.md` §12.2)
  Declarados:              {{0 | N, con su evento de cierre}}
  **Vencidos**:            {{ninguno | N, y su evento ya ocurrió}}
  Sin forma:               {{ninguno | N promesas en prosa, no contables}}

CONSTRUCCIÓN
  Registro del producto:   {{última etapa declarada}}
  Historial de código:     {{última etapa con commits}}
  Estado:                  {{coinciden | DIVERGEN}}

DIVERGENCIAS ENCONTRADAS
  {{para cada una: dimensión, lectura declarativa, lectura observable, evidencia}}
  {{o: ninguna}}

LO QUE SIGUE, SEGÚN EL ROADMAP
  {{etapa siguiente y su puerta de entrada}}
```

**Las divergencias van antes que las salidas, y es deliberado.** Si el árbol se contradice, la
decisión de qué orquestador correr **es la segunda pregunta**: la primera es si lo que el árbol dice
es cierto. Presentar las salidas sin las divergencias invita a elegir sobre un estado falso.

---

## §3.1 R1.5 — La mesa de evaluación, que es la preplanificación

**Detención: ninguna.** Esta fase no pregunta: analiza. Su mecánica no se define acá — vive en
`Mesa-Rules.md`, y este prompt declara **cuándo se convoca y qué se hace con lo que devuelve**.

### §3.1.0 Por qué existe, y por qué va exactamente acá

**R0 lee dónde está el trabajo y declara explícitamente que no juzga su contenido** (§2, «Lo que no se
hace en R0»). El audit de `Master-Prompt.md` §10 sí lo juzga, pero corre **al cerrar una fase**, es
decir sobre lo que se acaba de producir. **Entre las dos hay un intervalo en el que se toma la
decisión más cara del método —qué hacer con el destino— sin que nadie haya leído el destino.**

**El costo de ese intervalo está medido dos veces en el propio framework:**

- De **cinco detenciones** presentadas al Product Owner en una corrida real, **tres no eran suyas**:
  tenían respuesta en el árbol y las produjo el orquestador de a una, a mitad del trabajo
  (`Master-Prompt.md` §8.1).
- **Diez hallazgos abiertos repartidos en cinco informes**, que hubo que cruzar a mano, y **tres no
  eran lo que declaraban ser** (`IA.SDD.Documentacion/Informes/Memoria-De-Antecedentes-Casos-Resueltos.md`
  §2.2). Cuatro falsos enlaces rotos **viajaron tres informes** antes de que alguien los abriera.

**Va entre R1 y R2 y no en otro lado, por tres motivos que se sostienen contra el árbol:**

1. **Antes no puede.** El contrato de entrada de `Mesa-Rules.md` §4 es la salida de R0: las seis
   dimensiones, las divergencias, los pendientes y el diff normativo. Convocarla antes sería
   planificar sobre lo que se supone, que es lo que `Migracion-Rules.md` §3 rechazó al descartar los
   playbooks por salto y lo que `Master-Prompt.md` §8.1 generaliza.
2. **Después es tarde.** R2 es donde el humano elige la salida. Elegir entre reparar, migrar, seguir o
   continuar **sin saber si el corpus se sostiene** es elegir sobre la mitad de la información: es el
   mismo argumento por el que §3 presenta las divergencias **antes** que las salidas.
3. **Es el único punto donde la mesa corre una vez y sirve a las cinco salidas.** Su plan de cambios
   **es** la lista de trabajo de la salida A, **entra** al plan de migración de la B y la E, **funda**
   la verificación artefacto por artefacto que la C exige, y **es** el punto de continuación de la D.

### §3.1.1 Cuándo se convoca y cuándo no

| Estado que R0 devolvió | La mesa |
| --- | --- |
| `SDD/Docs/` con contenido | **Se convoca.** Es el caso de este prompt |
| Divergencias declaradas en R1 | **Se convoca**, y las divergencias entran a su contrato de entrada como hallazgos con ancla E1 |
| Migración en curso detectada (§2 paso 5) | **Se convoca**, y su objeto es el corpus **más el plan a medias**: una migración en vuelo tiene un plan que nadie refutó |
| `SDD/Docs/` vacía | **No se convoca.** No hay corpus que evaluar y el que corresponde es el prompt de bootstrap |
| El humano pide sólo el diagnóstico | **Se ofrece y se puede declinar**, y el informe declara que no corrió. Lo que no es válido es correrla y no registrarla |

**La mesa no se convoca sobre un destino vacío, y conviene decirlo acá porque es la pregunta
inmediata.** Sin corpus previo no hay nada que refutar, y lo que se va a producir lo audita §10 fase por
fase: convocarla ahí duplicaría el audit sobre el mismo material.

**Lo que no vale es leer eso como «nunca en la generación».** Es la corrección de `Mesa-Rules.md` §0.3:
un destino deja de estar vacío apenas la primera fase produce algo, y desde ahí la generación **tiene
corpus previo que nadie mira como conjunto**. Lo que decide es la condición de `Mesa-Rules.md` §0.0 —hay
corpus previo, el estado está leído, hay un plan o una decisión de alcance por tomar— y no qué
orquestador esté corriendo. **Con su límite:** la mesa mira lo que ya existía al abrir la corrida, nunca
lo que la fase acaba de producir.

### §3.1.2 Qué recibe R2 de la mesa

La mesa devuelve cuatro cosas, y las cuatro cambian lo que R2 presenta:

| Lo que devuelve | Qué hace R2 con eso |
| --- | --- |
| **Plan de cambios** con sus parches, texto exacto y criterio de verificación | Es la lista de trabajo de la salida **A**, cuantificada. Deja de acordarse en el momento |
| **Deuda declarada**, como ítems diferidos de `Root-Rules.md` §12.2 con su evento de cierre | Entra al informe de R3 y al bloque de ítems diferidos de R1 de la próxima reanudación |
| **Escaladas agrupadas**, con su default declarado | **Son las únicas consultas que R2 le hace al humano.** Todo lo demás lo resolvió la mesa |
| **Capas a revalidar** | Son los hallazgos aguas arriba de `Master-Prompt.md` §10, y condicionan la recomendación |

**Y una consecuencia sobre la recomendación de §4.0 que hay que declarar**: sus seis factores se
calculaban contra el estado. **Con la mesa, dos de ellos dejan de ser una impresión** — «divergencias
abiertas» pasa a ser el recuento de hallazgos procedentes con su nivel, y «costo de no hacerlo hoy»
pasa a ser la deuda declarada con su evento de cierre.

### §3.1.3 Lo que esta fase no hace

- **No aplica ningún parche.** La mesa entrega el plan; aplicarlo es de la salida que el humano elija,
  con la confirmación que esa salida ya exige. Es la misma frontera que §0 declara para todo este
  prompt: no repara lo que encuentra.
- **No audita.** No emite veredicto, no aprueba ni rechaza nada, y no tiene niveles propios: usa
  P0-P3 de `Master-Prompt.md` §10.
- **No releva el estado por su cuenta.** Consume el de R0. Una mesa que vuelve a leer el árbol puede
  contradecir a R0, y entonces hay dos lecturas del mismo estado sin regla de precedencia.

---

## §4 R2 — Las salidas, la recomendación, y qué implica cada una

Detención obligatoria. **El humano elige; este prompt no decide, pero sí recomienda.**

**El informe de R3 y la continuación de R4 adoptan el cierre de unidad** de `Master-Prompt.md` §8.1: lo entregado y lo que queda por decidir van juntos, y cada decisión lleva su contexto para quien no siguió la corrida.

### §4.0 La recomendación, y por qué el prompt dejó de ser neutral

**Esta sección es el caso particular de `Master-Prompt.md` §8.1**, que generaliza a toda detención del método lo que acá se resolvió primero: el bloque de recomendación de abajo **es** la propuesta que §8.1 exige, con sus factores adaptados a la reanudación.

**Enumerar cinco salidas sin pesarlas le devuelve al humano el trabajo que el orquestador acaba de
hacer.** R0 midió las seis dimensiones, el diff normativo artefacto por artefacto y el estado del
repositorio; presentarlas y callarse la conclusión es guardarse la parte útil. La neutralidad correcta
es **no decidir**; recomendar con el fundamento a la vista no es decidir, es lo que hace que la
decisión sea informada.

**Se publica antes de la tabla, con este formato:**

```text
RECOMENDACIÓN — {{salida}}, y por qué
  Continuidad del origen: {{sostenible | comprometida: {{qué major la rompe}}}}
  Alcance real del salto: {{N artefactos del destino, de M cambios del framework}}
  Volumen alcanzado:      {{N documentos}}
  Estado del repositorio: {{lo que T0 devolvió}}
  Divergencias abiertas:  {{ninguna | N, y por eso la recomendación es A}}
  Costo de no hacerlo hoy:{{qué crece si se posterga}}
  Alternativa razonable:  {{la segunda mejor, y en qué caso ganaría}}

  DE LA MESA (§3.1)     {{o: "no corrió, y por qué"}}
  Hallazgos procedentes:  {{N, con su reparto por nivel P0 a P3}}
  Parches listos:         {{N, en {{capas}}}}
  Deuda declarada:        {{N, con su evento de cierre}}
  Escaladas al humano:    {{N, agrupadas}}
```

**Los cuatro renglones de la mesa son los que vuelven cuantificable lo que antes se adjetivaba.**
«Divergencias abiertas» y «costo de no hacerlo hoy» se estimaban leyendo el estado; ahora salen del
registro de la mesa, con su nivel y su evento de cierre.

**La «alternativa razonable» no es cortesía.** Una recomendación sin segunda opción se lee como un
único camino, y el humano deja de mirar. Nombrarla obliga a que la primera se sostenga contra algo.

### §4.0.1 El umbral de continuidad: cuándo «seguir en la versión declarada» deja de ser barato

**No todas las procedencias se continúan igual, y ésta es la evaluación que más cambia la
recomendación.** La salida C parece siempre disponible —el destino sigue como está y el desfase queda
declarado— y no lo es.

**El umbral es mecánico y ya existe en el framework**: si entre el origen y la vigente hay **un major
cuyo bloque «Impacto sobre destinos existentes» no está vacío** (`SDD-Development-Guide.md` §VI.4),
ese salto **alcanza artefactos del destino**. Y entonces:

| Cuántos major con impacto atraviesa el salto | Qué significa para C | Recomendación |
| --- | --- | --- |
| **Ninguno** | El desfase es de proceso. C es correcta y barata | **C**, y actualizar la procedencia si se verificó artefacto por artefacto |
| **Uno** | Hay deuda, acotada y conocida | C es viable; **B** si ese major toca lo que se está por construir |
| **Dos o más** | **Ninguna regla vigente puede auditar ni extender ese corpus**: el destino quedó fuera del alcance del método que dice usar | **B**, y decirlo con esas palabras |

**Por qué dos o más es cualitativamente distinto.** Un major con impacto deja un destino que las reglas
vigentes leen mal en un punto. Dos dejan un destino cuyas **estructuras** —dónde vive cada categoría,
cómo se numeran los identificadores, de qué nivel cuelga cada artefacto— ya no son las que ninguna
regla actual describe. Seguir construyendo ahí **produce documentación nueva con la forma vieja**, y
cada documento agregado agranda la migración futura en lugar de acercarla.

**Y hay un caso que el método vivió y conviene nombrar: las procedencias tempranas.** Los conjuntos
anteriores al que introdujo el ámbito de unicidad en el producto para las familias del producto y el nivel de unidad de entrega no
tienen un historial que permita continuar sin ambigüedad: sus identificadores no son direcciones
válidas y su layout no existe. Sobre esas procedencias, **C no se recomienda nunca**, y la
recomendación lo dice con su motivo en lugar de ofrecerla como si fuera equivalente.

### §4.0.2 El encadenamiento después de reparar

**La salida A vuelve a R0 y la pregunta reaparece, y eso hay que decirlo antes y después.** Al volver,
la recomendación **se recalcula** —la reparación cambió las dimensiones— y R2 declara explícitamente
cuál era la pregunta que quedó pendiente:

> Reparadas las divergencias, lo que sigue decidiendo es **migrar o seguir en la versión declarada**.
> La recomendación recalculada es {{salida}}, por {{motivo}}.

Sin esa frase, el humano que eligió A dos pasos atrás llega a la segunda vuelta **sin saber que es la
segunda vuelta**, y la lee como si fuera una pregunta nueva.



| Salida | Cuándo tiene sentido | Qué continúa, en esta misma sesión | En qué estado te deja | ¿Vuelve a preguntar? | Qué **no** resuelve |
| --- | --- | --- | --- | --- | --- |
| **A · Reparar primero** | Hay divergencias declaradas en R1 | La reparación se acuerda y se ejecuta acá mismo, y después se vuelve a R0 sobre el árbol reparado | El árbol reparado y **el estado vuelto a leer**: la reparación cambia lo que R0 midió | **Sí.** Vuelve a R0 y esta misma pregunta se hace de nuevo, ahora sobre el árbol reparado | Nada del desfase de versión ni del avance de construcción: sólo las divergencias declaradas |
| **B · Migrar a la vigente** | La procedencia está desfasada y el salto alcanza artefactos del destino | `Master-Prompt-Migracion.md`, **con el diff normativo de R0 ya hecho**: su fase M1 lo recibe en lugar de rehacerlo | Procedencia actualizada a la vigente y los artefactos alcanzados por el salto, reescritos | No. La decisión viaja y M1 no la revisa | Las divergencias que no sean del salto, y el avance de construcción |
| **C · Seguir en la versión declarada** | El salto no alcanza al destino, o alcanzarlo no es prioridad hoy | `Master-Prompt.md`, **con la decisión ya tomada**: su reconciliación normativa la recibe y **no vuelve a preguntar** | Igual que ahora, con el desfase **declarado** en el informe. La procedencia **no** se toca | No, hasta que cambie la procedencia o la versión vigente | El desfase, que sigue existiendo; sólo queda dicho |
| **D · Continuar la construcción** | La documentación está al día para lo que hace falta y lo pendiente es código | **Nada que invocar: se sigue trabajando.** El informe de R3 es lo único que hace falta, y por eso lleva la etapa, su puerta de entrada y los documentos que la gobiernan | El trabajo de construcción avanzado, y la documentación como está | No | El desfase de versión y toda divergencia declarada, que quedan abiertas |
| **E · Retomar la migración en curso** | R0 detectó una migración **en vuelo**: hay plan, hay `_fusion/` con contenido y no hay informe con veredicto | `Master-Prompt-Migracion.md`, **desde la fase en la que quedó**, con el plan existente como insumo | La migración terminada desde la fase en que quedó, sin repetir lo hecho | No | Lo mismo que B: nada que no sea del salto |

**La salida D existe porque la pregunta «cuál de los dos orquestadores corro» tiene con frecuencia la
respuesta «ninguno».** Un destino con su documentación generada y su código a mitad de camino no
necesita ni generar ni migrar: necesita construir. Que las otras tres tengan prompt y ésta no las
vuelve más visibles, no más correctas.

**Lo que hay que saber antes de elegir cada una**, que la tabla no puede llevar sin volverse ilegible:

- **A** es **la única salida que las demás dan por hecha.** Elegir B, C, D o E con una divergencia
  abierta significa trabajar sobre un estado que el árbol declara mal.
- **B** exige saber **cuánto del salto realmente alcanza al destino**. Un salto de varias versiones
  que sólo cambió reglas de proceso —cómo migrar, cómo auditar, cómo barrer— **no toca ningún
  artefacto**, y migrar por el número es trabajo sin resultado.
- **C** deja la procedencia **diciendo la verdad**: el destino se generó contra esa versión. Lo que no
  se puede es actualizarla sin migrar, porque eso sí sería falso.
- **D** se apoya en que **el avance del código no depende de la versión del framework**. Es la salida
  más frecuente y la que más se pasa por alto, porque las otras son las que tienen prompt.
  **Y su punto de continuación puede no estar en el roadmap** (reporte `25`): cuando el Product Owner
  decidió un cambio de alcance posterior al handoff y todavía no lo asentó, «lo que sigue» no es una
  etapa que el roadmap declare. R4 no lo infiere ni continúa igual: lo trata como la divergencia que es
  y lo lleva a la mesa de §3.1, que convoca el evento de `Rules-Backlog-Tecnico.md` §3.6
  (`Master-Prompt.md` §13.1). Elegir D con esa divergencia sin declarar es el mismo error que elegir
  cualquier otra salida con una divergencia abierta: se construye sobre un estado que el árbol no
  sostiene.
- **E** exige que R0 haya declarado la fase en la que quedó la migración. Sin eso no se retoma: se
  vuelve a R0.

**Por qué la salida E existe y no es un caso de B.** Elegir B sobre una migración en vuelo **la
reempieza**: el orquestador de migración arranca en M0 y vuelve a construir un plan que ya está
escrito, sobre un árbol que ya pasó por las fases estructurales. Se observó en un destino con **170
documentos en diez carpetas `_fusion/`** y su plan de migración emitido, donde las cuatro salidas
disponibles no incluían la única correcta —**terminar lo que estaba a medias**— y la más parecida era
la que lo destruía.

**Por qué las tres columnas nuevas.** Las salidas describían **qué invocan**, y quien elige necesita
saber **qué le pasa a él**: en qué estado queda, si la pregunta vuelve, y qué sigue sin resolverse. La
salida A es el caso claro: vuelve a R0 y **repite esta misma pregunta**, lo cual es correcto por
diseño —reparar cambia el estado sobre el que se decide— y no se deducía de su texto. Elegir sin esas
tres cosas es elegir el nombre de un prompt, no un resultado.

**Actualizar la procedencia sin migrar.** Es un caso de la salida C que merece nombre propio, y sólo
procede cuando **se verificó artefacto por artefacto que el salto no alcanza al destino**. La
verificación se declara en el informe de estado, con la lista de qué cambió en el framework y por qué
cada cosa no lo toca. Sin esa lista, actualizar la procedencia es afirmar algo que nadie comprobó, y
eso es lo que la fase M5 del orquestador de migración existe para impedir.

---

## §5 R3 — El informe de estado, que es el instrumento de entrega

**Se escribe siempre**, cualquiera sea la salida elegida, en
`SDD/Docs/Audit/Estado-Del-Destino-<AAAA-MM-DD>.md`. Es la única escritura de este prompt sobre el
destino.

**No es un diagnóstico que se archiva: es lo que el trabajo siguiente consume.** Por eso su contenido
no se agota en las seis dimensiones —eso responde «dónde estoy»— sino que incluye **lo que hace falta
para seguir sin volver a deducirlo**:

| Bloque | Qué lleva | Para quién |
| --- | --- | --- |
| **Estado** | Las seis dimensiones con su fuente y su contraste | Todos |
| **Divergencias** | Las dos lecturas y la evidencia de cada una | Todos, y la salida A las toma como su lista de trabajo |
| **Pendientes declarados** | Los hallazgos abiertos, con su nivel y su documento | Todos |
| **Diff normativo** | Qué cambió del framework entre la procedencia y la vigente, **artefacto por artefacto y con su severidad** | La salida B lo consume en M1; la C lo usa para justificar por qué no migra |
| **Decisión** | La salida elegida, quién la eligió y la fecha | El orquestador que continúa, **para no volver a preguntar** |
| **Recomendación y su fundamento** | La salida recomendada, sus seis factores, la alternativa razonable y —si el salto atraviesa dos o más major con impacto— **por qué C no se ofrece como equivalente** | Es lo que permite auditar la decisión después: sin el fundamento escrito, una decisión correcta y una arbitraria se ven igual |
| **Punto de continuación** | La etapa o fase concreta que sigue, su puerta de entrada y los documentos que la gobiernan | **La salida D, que no tiene prompt y sólo tiene esto** |
| **Resultado de la mesa** | El bloque de cierre de `Mesa-Rules.md` §6.7, y **el enlace al registro** `Mesa-<AAAA-MM-DD>.md`. Si la mesa no corrió, por qué | Todas. La salida A lo toma como lista de trabajo y la B lo lleva a M1, que **verifica en lugar de reconvocarla** |

**El bloque de continuación es el que hace que la reanudación sirva.** Sin él, este prompt le dice al
humano dónde está y lo deja abriendo otra sesión para averiguar qué hacer: **el diagnóstico se
recupera y el contexto no**. Con él, el que sigue —sea un orquestador o una persona construyendo—
arranca con lo que hace falta y sin releer el árbol entero.

**Por qué se escribe aunque no se haga nada.** Una reanudación que no deja rastro obliga a la
siguiente a rehacer el mismo diagnóstico, y **dos diagnósticos del mismo estado hechos por agentes
distintos no tienen por qué coincidir**. El informe es lo que hace que la reanudación sea barata la
segunda vez.

**No reemplaza al informe de migración ni al de audit.** Declara estado, no veredicto: no aprueba ni
rechaza nada, y no tiene niveles de hallazgo.

---

## §5.1 R4 — La continuación

**Escrito el informe, se continúa en la misma sesión.** Esta fase existe porque una reanudación que
termina en un informe **no reanudó nada**: dejó un diagnóstico.

| Salida | Qué hace R4 |
| --- | --- |
| **A** | **Aplica los parches que la mesa ya diseñó** —con su texto exacto y su criterio de verificación—, acuerda con el humano sólo lo que la mesa escaló, y **vuelve a R0** sobre el árbol reparado. La segunda pasada es barata: el informe y el registro de mesa ya están |
| **B** | Invoca `Master-Prompt-Migracion.md` **entregándole el diff normativo y el registro de la mesa**. Su fase M1 los verifica en lugar de construirlos desde cero, y **no reconvoca la mesa** |
| **C** | Invoca `Master-Prompt.md` **entregándole la decisión**. Su reconciliación normativa la lee, informa el desfase **como decidido** y continúa sin volver a detenerse |
| **D** | **No invoca nada: sigue.** El punto de continuación del informe dice qué etapa toca, cuál es su puerta de entrada y qué documentos la gobiernan |

**La decisión viaja, y por eso no se vuelve a preguntar.** Es la diferencia entre despachar y
reenviar: si el humano ya eligió seguir en la versión declarada, que el orquestador siguiente vuelva
a detenerse en lo mismo **le enseña a contestar sin leer**, que es peor que no haber preguntado.

**Lo que R4 no hace.** No convierte a este prompt en el que ejecuta: la migración la conduce su
orquestador con sus fases y sus detenciones, y la generación el suyo. R4 **entrega el contexto y se
corre**; lo único que ejecuta por sí mismo es la reparación de la salida A, porque no es de ninguno
de los dos.

**Y una salida que conviene nombrar: cortar acá también es válido.** Si el humano quiere el
diagnóstico y nada más, R4 no se ejecuta y el informe queda. La próxima reanudación lo encuentra y
arranca desde ahí. Lo que no es válido es lo inverso: continuar **sin** escribir el informe, porque
entonces el contexto vuelve a vivir sólo en la sesión.

## §6 Criterios de aceptación

- [ ] [enumerable] Las **seis dimensiones** de §1 están resueltas, cada una con su fuente citada.
- [ ] [enumerable] Las tres dimensiones con contraste observable **se contrastaron**, y el resultado
      está declarado aunque coincidan.
- [ ] [enumerable] Toda divergencia está declarada con **las dos lecturas y la evidencia de cada
      una**, y ninguna se resolvió en este prompt.
- [ ] [enumerable] El informe de estado existe y declara la salida elegida, **con su bloque de punto
      de continuación completo**.
- [ ] [enumerable] Si la salida fue **B** o **C**, el informe lleva el **diff normativo** que el
      orquestador siguiente consume, y la decisión viajó con él.
- [ ] [enumerable] La **mesa de evaluación corrió** y su registro existe, o el informe declara por qué
      no corrió con el motivo de §3.1.1.
- [ ] [enumerable] **Toda consulta que R2 le hizo al humano es una escalada de `Mesa-Rules.md` §7**, y
      ninguna se elevó fuera de esa lista cerrada.
- [ ] [enumerable] **Toda consulta que R2 le hizo al humano declara su origen del hecho**, calculado
      contra la base de la corrida que R0 publicó con T0, y **ninguna cuyo origen del hecho sea de la corrida
      salió sin declarar por qué la autocorrección no alcanzaba** (`Master-Prompt.md` §8.1).
- [ ] [interpretativo] **El orquestador invocado no volvió a preguntar lo que este prompt ya
      resolvió.**
- [ ] [interpretativo] **No se escribió nada del destino fuera del informe.**
- [ ] [interpretativo] La salida la eligió el humano, y el prompt no la anticipó presentando una sola.
- [ ] [interpretativo] Si se eligió actualizar la procedencia sin migrar, **la verificación
      artefacto por artefacto está en el informe**, y no la afirmación de que no hacía falta.

---

## §7 Anti-patrones

| Anti-patrón | Por qué falla |
| --- | --- |
| **Confiar en la fuente declarativa sin contrastarla** | Es el defecto que produjo este prompt. Un registro de cambios que quedó tres etapas atrás sigue afirmando lo último que alguien escribió, y no dice que está viejo |
| **Reparar la divergencia al pasar** | Retomar y corregir en el mismo acto mezcla diagnóstico con intervención, y deja al humano sin la foto de cómo estaba. La divergencia se declara y se acuerda |
| **Elegir la salida por el número de versión** | Un desfase de tres versiones puede no alcanzar ningún artefacto del destino. La pregunta no es cuántas versiones pasaron sino **qué cambió que lo toque** |
| **Presentar sólo las salidas que tienen prompt** | Deja afuera la más frecuente, que es continuar la construcción. Un método que sólo ofrece lo que sabe ejecutar sesga la decisión hacia lo ejecutable |
| **Actualizar la procedencia porque el delta parece chico** | «Parece» no es una verificación. Si no se listó qué cambió y por qué no toca, la procedencia pasa a afirmar algo que nadie comprobó |
| **Abrir las categorías para juzgar su contenido** | Es el trabajo del audit, con su auditor independiente. Una reanudación que audita de paso produce un veredicto sin la mecánica que lo hace confiable |
| **Terminar en el informe y mandar a abrir otra sesión** | El diagnóstico se recupera y el contexto no. Quien siga vuelve a deducir lo que este prompt acaba de deducir, que es el trabajo que vino a evitar |
| **Despachar sin entregar la decisión** | El orquestador siguiente vuelve a detenerse en lo que el humano ya resolvió. Preguntar dos veces lo mismo **enseña a contestar sin leer** |
| **Elegir la salida sin haber mirado el corpus** | R0 declara que no juzga contenido y el audit corre después de producir. Sin la mesa, la decisión más cara del método se toma sobre la mitad de la información, y lo que el corpus esconde aparece de a uno durante la ejecución |
| **Convocar la mesa y llevar sus hallazgos al humano de a uno** | Es el defecto que la mesa corrige, cometido con su propia salida. Las escaladas van agrupadas y con default; lo demás lo resolvió ella |
| **Continuar sin escribir el informe** | El contexto vuelve a vivir sólo en la sesión, que es la condición que hace falta reanudación |

---

## §8 Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. Tercer orquestador del método, con la cardinalidad de **una vez por reanudación**. Nace de una corrida real donde retomar funcionó **porque el estado vivía en el árbol**, propiedad que el framework apoyaba sin declarar y que por eso nadie verificaba: el registro de cambios de ese destino quedó tres etapas atrás sin que nada lo señalara. Declara las **seis dimensiones del estado**, cada una con su fuente y —en las tres que en esa corrida divergieron— su **contraste observable**, con la regla de que gana el observable y la divergencia se declara. Cuatro salidas, incluida la que no tiene prompt: **continuar la construcción**. |
| 1.1 | 2026-08-16 | **El informe deja de ser un diagnóstico y pasa a ser el instrumento de entrega**, y entra **R4, la continuación**: escrito el informe, se sigue en la misma sesión. §5 suma al informe el **diff normativo**, la **decisión** con su autor y su fecha, y el **punto de continuación**, que existe para la salida que no tiene prompt. §5.1 declara que **la decisión viaja** y que el orquestador siguiente no vuelve a preguntar lo mismo. Origen: la 1.0 cometía el defecto que corregía —un prompt contra la pérdida de contexto que no entregaba contexto—, señalado por el Product Owner el mismo día. |
| 1.2 | 2026-08-16 | §1 suma la columna **«quién la mantiene»** a las seis dimensiones, y **§1.1** es nueva con sus tres reglas: toda fuente declarativa **nombra a su responsable en el propio documento**; cuando ningún rol corresponde el responsable es **genérico y sigue siendo obligatorio**, hasta la organización dueña del repositorio; y entre dos fuentes posibles **gana la que es subproducto del acto**. Cierra el pendiente que `Coherencia-Orquestador-Reanudacion.md` §7 dejaba declarado —una dimensión del estado cuya fuente nadie tenía obligación de mantener—. Origen: el Product Owner, que pidió no dejar el dueño boyando. |
| 1.3 | 2026-08-17 | **R0 suma el paso 0, normalizar el repositorio**, que va antes que las dimensiones porque el historial es su contraste observable y **no incluye lo que no está commiteado**; aplica `Master-Prompt.md` §12.1 y detiene. **R0 suma el paso 5**, detectar una **migración en curso** por sus tres señales. **R1 suma el bloque REPOSITORIO** y la fila «En curso» de migración. **R2 suma la salida E, retomar la migración en vuelo** —elegir B sobre una migración a medias la reempieza— y **tres columnas**: en qué estado te deja, si vuelve a preguntar y qué **no** resuelve. Origen: dos destinos reales, uno con 452 cambios sin commitear y otro con 170 documentos en `_fusion/`, y la observación del Product Owner de que el cuestionario no dejaba entender la decisión. |
| 1.4 | 2026-08-17 | El paso 0 de R0 pasa a **correr la compuerta T0** de `Master-Prompt.md` §12.1 y publicar su salida, en lugar de describir sus comprobaciones por su cuenta. Declara los **dos resultados que detienen** la reanudación: árbol sucio y **entrega viva**, porque diagnosticar mientras una unidad anterior no cerró produce un informe sobre un estado que está por cambiar. El bloque `REPOSITORIO` de R1 adopta el formato de T0. |
| 1.5 | 2026-08-17 | **R2 deja de ser neutral y pasa a recomendar**, sin decidir. **§4.0** declara el formato de la recomendación con sus seis factores y su **alternativa razonable** obligatoria —una recomendación sin segunda opción se lee como un único camino—. **§4.0.1 fija el umbral de continuidad**, que es mecánico y ya existía: cuántos major con **bloque de impacto no vacío** atraviesa el salto. Con **dos o más**, ninguna regla vigente puede auditar ni extender ese corpus y **C deja de ofrecerse como equivalente**; sobre procedencias tempranas **no se recomienda nunca**, porque sus identificadores no son direcciones válidas y su layout no existe. **§4.0.2** declara el encadenamiento después de reparar: la recomendación **se recalcula** y R2 dice que la pregunta pendiente es migrar o seguir, para que quien eligió A sepa que está en la segunda vuelta. Origen: el Product Owner, sobre dos destinos reales con procedencias muy distintas. |
| 1.6 | 2026-08-17 | R1 y R2 se declaran como casos de `Master-Prompt.md` §8.1, que generaliza a toda detención lo que §4.0 había hecho para las salidas de R2. La recomendación de §4.0 **es** la propuesta que §8.1 exige. |
| 1.7 | 2026-08-18 | Adopta el **cierre de unidad** de `Master-Prompt.md` §8.1 —entrega y decisiones en un solo bloque, cada decisión con su contexto— y su regla de **autocorrección**. |
| 1.8 | 2026-08-19 | **R0 paso 4 suma los ítems diferidos** de `Root-Rules.md` §12.2 a los pendientes declarados, **con su evento de cierre contrastado**, y **R1 los publica** en un bloque propio con tres renglones: declarados, vencidos y sin forma. Va acá porque **es la comprobación más barata del método**: la reanudación ya lee el árbol entero sin memoria, y preguntarle «¿qué se difirió y ya venció?» no cuesta una pasada nueva. Origen: el reporte `14`, nacido de un destino donde el diferimiento se destapó **por el síntoma** —cero etiquetas en el repositorio— y no por el diferimiento, ocho etapas tarde. Sube **minor**: un insumo más en un paso existente y un bloque más en la presentación. |
| 1.9 | 2026-08-23 | La descripción del salto a la 7.0 decía «**el ámbito de unicidad en el producto**» a secas, y desde la 12.0 hay **dos ámbitos**. Queda acotado a las familias del producto. Lo levantó la cuarta ronda de auditoría: el patrón del barrido decía `ámbito de unicidad: producto` y **la preposición lo esquivaba**. Sube **minor**: precisa una descripción histórica. |
| 1.10 | 2026-08-27 | **Entra R1.5, la mesa de evaluación**, entre la presentación del estado y las salidas: es la etapa preplanificadora del método, y su mecánica vive en `Mesa-Rules.md`. Va exactamente ahí por tres motivos: **antes no puede** —su contrato de entrada es la salida de R0, y convocarla antes sería el playbook que `Migracion-Rules.md` §3 rechaza—, **después es tarde** —R2 elige la salida, y elegir sin saber si el corpus se sostiene es elegir sobre la mitad de la información—, y **es el único punto donde una sola corrida sirve a las cinco salidas**. §4.0 suma cuatro renglones a la recomendación, que vuelven cuantificable lo que antes se adjetivaba; §5 suma el bloque de resultado de la mesa al informe; R4 declara que la salida **A aplica los parches que la mesa ya diseñó** y que la **B los lleva a M1**, que verifica en lugar de reconvocarla. Origen: el Product Owner, sobre la observación de que el método entra en rondas de consultas que el agente debería poder resolver solo, y las dos mediciones del propio framework que la sostienen —**tres de cinco detenciones con respuesta en el árbol** (`Master-Prompt.md` §8.1) y **tres de diez hallazgos heredados que no eran lo que declaraban** (`Memoria-De-Antecedentes-Casos-Resueltos.md` §2.2)—. Sube **minor**: agrega una fase sin detención propia y no cambia ninguna de las existentes. |
| 1.11 | 2026-08-29 | **§3.1.1 deja de excluir a la generación por categoría y pasa a la condición.** Decía «la mesa no se convoca en la generación desde cero», que es una derivación de `Mesa-Rules.md` §0.3 —«no corre sobre un destino vacío»— y **no dice lo mismo**: un destino deja de estar vacío apenas la primera fase produce algo, y desde ahí hay corpus previo que ninguna auditoría de fase mira como conjunto. Lo que decide es la **condición de `Mesa-Rules.md` §0.0**, con el límite contra el audit escrito. Sube **minor**: precisa cuándo se convoca y no cambia ninguna fase. | Intervención de la condición de convocatoria |
| 1.12 | 2026-09-12 | **R1 publica la base de la corrida** en su bloque `REPOSITORIO`, que reproduce el formato de T0 y ahora su línea nueva de `Master-Prompt.md` §12.1; y **§6 suma el criterio enumerable del origen del hecho**: toda consulta de R2 lo declara calculado contra esa base, y ninguna de la corrida sale sin decir por qué la autocorrección no alcanzaba. Sube **minor**: una línea en un bloque y un criterio. |
| 1.13 | 2026-09-12 | **La salida D declara qué hace cuando su punto de continuación no está en el roadmap** (framework 13.14), por el reporte `25`. §4 no contemplaba el caso: si el Product Owner decidió un cambio de alcance posterior al handoff y no lo asentó, «lo que sigue» no es una etapa que el roadmap nombre, y D no puede inferirla ni continuar como si lo fuera. Pasa a tratarse como la divergencia que es, llevada a la mesa de §3.1, que convoca el evento de `Rules-Backlog-Tecnico.md` §3.6 (`Master-Prompt.md` §13.1). Sube **minor**: precisa qué hace una salida existente ante un caso que antes no declaraba, sin agregar ninguna salida nueva. | Intervención del disparador de alcance (reporte 25) |
