# Master prompt SDD — Orquestador de reanudación

**Archivo:** `Master-Prompt-Reanudacion.md`
**Versión:** 1.5
**Idioma:** Español rioplatense neutro técnico
**Modo:** lectura, diagnóstico y **entrega de contexto**, con detención obligatoria. **No escribe nada del destino salvo su propio informe**, y no ejecuta el trabajo que despacha
**Prerequisitos:** un repositorio destino con `SDD/` poblado. No exige memoria de ninguna sesión anterior
**Salida:** `SDD/Docs/Audit/Estado-Del-Destino-<AAAA-MM-DD>.md`, la decisión del humano, y **la continuación efectiva en la misma sesión** con el contexto ya reconstruido

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
   filas sin resolver de un plan de migración, y las carpetas `_fusion/` que existan, con su
   inventario.
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
  Entregas vivas:          {{ninguna | rama {{nombre}}, esperando merge}}
  Veredicto de arranque:   {{EN ORDEN | SE DETUVO: {{motivo}}}}

MIGRACIÓN
  En curso:                {{no | sí, plan {{archivo}}, {{N}} documentos en {{M}} carpetas _fusion/}}
  Último informe:          {{archivo, versión, veredicto}}
  Fases:                   {{completas | las que faltan}}
  Carpetas _fusion/:       {{0 | N, y la fusión no terminó}}
  Hallazgos abiertos:      {{ninguno | lista con su nivel}}

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

## §4 R2 — Las salidas, la recomendación, y qué implica cada una

Detención obligatoria. **El humano elige; este prompt no decide, pero sí recomienda.**

### §4.0 La recomendación, y por qué el prompt dejó de ser neutral

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
```

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
anteriores al que introdujo el ámbito de unicidad en el producto y el nivel de unidad de entrega no
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
| **A** | Acuerda con el humano cómo se repara cada divergencia, **la repara**, y **vuelve a R0** sobre el árbol reparado. La segunda pasada es barata: el informe ya está |
| **B** | Invoca `Master-Prompt-Migracion.md` **entregándole el diff normativo del informe**. Su fase M1 lo verifica en lugar de construirlo desde cero |
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
