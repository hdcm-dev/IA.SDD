# Reglas constructivas — Mesa de evaluación

**Carpeta target:** `SDD/Docs/Audit/` del repositorio destino
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Framework
**Agente target:** los orquestadores de reanudación y de migración, y AG-00970 (Presidente de mesa) en tiempo de ejecución
**Versión de las reglas:** 1.1

---

## 0. Qué gobierna este archivo, y qué no

Este archivo regula **la mesa de evaluación**: el mecanismo por el que un corpus documental ya
existente se analiza, se refuta y se convierte en un plan de cambios **antes** de que ese plan se
apruebe y se aplique.

**No es un orquestador y no tiene fases propias del método.** Es un mecanismo, como la auditoría entre
fases de `Master-Prompt.md` §10: lo invocan los orquestadores en un punto declarado, produce un
artefacto y devuelve el control. Este archivo declara **qué es correcto y cuándo hace falta**; el
orquestador que la invoca declara **desde dónde**.

### 0.0 La condición que la convoca, y por qué no es una lista de puntos

**La mesa se convoca cuando se cumplen las tres:**

1. **Hay corpus previo** que no fue producido en esta corrida.
2. **El estado ya está leído** y disponible con la forma del contrato de entrada de §4.
3. **Hay un plan por aprobar o una decisión de alcance por tomar** sobre ese corpus.

**Los puntos de invocación que declaran los orquestadores son casos de esta condición, y no su
definición.** Hoy son dos —`Master-Prompt-Reanudacion.md` §3.1 y `Master-Prompt-Migracion.md` M1—, y
enumerarlos no agota la condición: **un caso que la cumple y no tiene orquestador que la convoque se
convoca igual**, y el registro de §2.2 declara desde dónde en su punto 1.

**Por qué la condición y no la lista, que es lo que este archivo hacía.** La versión 1.0 declaraba los
puntos y no la condición, y las dos cosas producían la misma lista el día que se escribió: en agosto de
2026 los únicos dos prompts que leían estado y aprobaban plan eran ésos. La diferencia se vuelve visible
con el primer caso que satisface la condición desde otro lugar, y **apareció ocho días después**: un
destino con un `P0` que ocho rondas de auditoría no lograron cerrar, sin ninguna reanudación en curso ni
ninguna migración que se invocara directa. El mecanismo existía, el caso lo pedía, y no había quién lo
llamara. Cuando se convocó fuera de norma, encontró en una corrida lo que las ocho rondas no habían
visto, porque miró **las ocho como corpus** en lugar de cada una por separado.

**Y agregar el punto que faltó habría dejado el defecto donde estaba**: la lista y la condición vuelven a
coincidir hasta el siguiente caso no previsto. Es por eso que lo que se declara es la condición.

### 0.1 El hueco que existe, medido

**El método lee el estado y no lee el contenido, y entre esas dos cosas se toma la decisión más
cara.** `Master-Prompt-Reanudacion.md` §2 lo declara por escrito: *«No se abre ninguna categoría
documental para juzgar su contenido. La reanudación reconstruye dónde está el trabajo, no si está bien
hecho: eso es del audit»*. Y el audit de `Master-Prompt.md` §10 corre **al cerrar una fase**, es decir
**después** de haber producido algo.

**La consecuencia es que nadie mira el corpus antes de decidir qué hacer con él.** Entre las dos hay un
punto ciego con forma de intervalo: el orquestador de migración compone su plan en M1 con el **diff
normativo** —qué cambió en el framework entre dos versiones—, que es ciego a lo que el destino dice de
sí mismo. Las contradicciones internas del destino aparecen recién en M4, documento por documento, y
cada una es una detención.

**Tres mediciones del framework sostienen que el hueco existe y que su costo se paga en detenciones:**

| Evidencia | Dónde está registrada | Qué muestra |
| --- | --- | --- |
| De **cinco detenciones** presentadas al Product Owner en una corrida real, **tres no eran del Product Owner**: dos filas de registro fuera de su tabla, trece encabezados verificables contra su origen y el orden de consolidar dos categorías | `Master-Prompt.md` §8.1 y `Coherencia-La-Pregunta-Previa.md` §2 | El 60 % de las consultas tenían respuesta en el árbol. No era criterio de producto: era análisis que nadie había hecho |
| **Diez hallazgos abiertos repartidos en cinco informes de migración**, que hubo que abrir y cruzar a mano; al abrirlos, **tres no eran lo que declaraban ser** —cuatro «enlaces rotos» que no lo eran, cuatro citas «a documentos inexistentes» que existían renumerados, y una propagación declarada pendiente que ya había ocurrido— | `IA.SDD.Documentacion/Informes/Memoria-De-Antecedentes-Casos-Resueltos.md` §2.2 | Un hallazgo copiado de un informe al siguiente **no es conocimiento recuperado, es conocimiento reenviado**, y el segundo nunca se verifica |
| Los cuatro falsos enlaces rotos **viajaron tres informes** antes de que alguien los abriera | mismo informe, §2.2 | El defecto no se corrige con más rondas del mismo mecanismo: hace falta un acto que **abra y refute**, no que herede |

**La mesa no agrega una mirada más: agrega la única que faltaba.** El audit pregunta *«¿lo que
acabo de producir cumple la normativa?»*. La mesa pregunta *«¿lo que ya existe se sostiene, y qué hay
que hacer con eso?»*. Son dos preguntas distintas, en dos momentos distintos, con dos salidas
distintas —el audit emite un **veredicto**, la mesa emite un **plan**—.

### 0.2 La frontera con el audit, que es lo que impide que se dupliquen

| | Auditoría entre fases (`Master-Prompt.md` §10) | Mesa de evaluación (este archivo) |
| --- | --- | --- |
| **Qué mira** | Lo que la fase acaba de producir | El corpus que ya existía antes de la corrida |
| **Contra qué** | La normativa vigente y los criterios de aceptación de su regla | La normativa vigente **y el propio corpus contra sí mismo** |
| **Cuándo** | Al cerrar una fase | **Antes de que exista el plan** de la intervención |
| **Quién** | Un auditor independiente, invocado desde cero | Un panel compuesto por caso, un jurado y un cuerpo de parches |
| **Qué produce** | Un veredicto: APROBADO / CON OBSERVACIONES / RECHAZADO | Un **plan de cambios** con sus parches, su deuda declarada y sus escaladas agrupadas |
| **Qué hace con un hallazgo** | Lo reporta con su nivel | Lo **juzga**: decide si corregirlo vale la pena, y quién lo aprueba no es quien lo diseñó |

**El audit no decide si un hallazgo vale la pena, y es correcto que no lo decida**: su valor es la
mirada externa sobre un entregable acotado. Aplicado a un corpus entero, un mecanismo que reporta todo
sin priorizar produce lo que el framework ya nombró dos veces —*«un verificador que sobre-reporta
entrena a ignorarlo»*—. La mesa existe para el corpus, y por eso tiene jurado.

### 0.3 Qué NO hace la mesa

- **No audita una fase.** Si lo que hay que evaluar es un entregable recién producido, el que
  corresponde es §10 y no este archivo.
- **No corre sobre un destino vacío.** Sin corpus previo no hay nada que refutar. **Y eso no es lo
  mismo que «no corre en la generación»**, que es la derivación que la 1.0 dejó escrita: un destino
  deja de estar vacío apenas la primera fase produce algo, y a partir de ahí la generación **tiene
  corpus previo y nadie lo mira como conjunto** —el audit de `Master-Prompt.md` §10 corre fase por
  fase, sobre lo que se acaba de producir—. Lo que decide es la condición 1 de §0.0 y no el
  orquestador que esté corriendo.

  **Con su límite, o esto duplica el audit:** la mesa mira **lo que ya existía al abrir la corrida**,
  nunca lo que la fase acaba de producir. Es la frontera de §0.2, y sigue valiendo dentro de una
  generación.
- **No decide el alcance del producto.** Toda decisión de intención, autoridad o preferencia sale por
  la escalada de §7 y la toma el humano.
- **No aplica los parches que diseña.** Los aplica el orquestador que la invocó, con la confirmación
  que su propia fase ya exige. La mesa produce el plan; no lo ejecuta.
- **No inventa el estado.** Su contrato de entrada (§4) lo alimenta el orquestador con lo que ya leyó.
  Una mesa que releva el estado por su cuenta duplica R0 y puede contradecirlo.

---

## 1. Especialidad asignada

### 1.1 Especialidad base — AG-00970, Presidente de mesa

Arquitecto de Soluciones Senior con perfil de coordinación de revisión técnica. **No emite hallazgos,
no vota y no diseña parches.** Su función es exactamente tres cosas: convocar el panel según §5,
consolidar sin juzgar según §6.3, y garantizar que ninguna de las separaciones de §3 se rompa.

El identificador se acuña en el bloque `009xx` de `Root-Rules.md` §9.2, que reserva `009N0`
descendiendo desde `00990` para los roles que no son de categoría. `AG-00970` es el mayor libre.

**Por qué el presidente no vota.** Quien arma el panel elige, sin proponérselo, qué hallazgos son
posibles. Si además vota, la composición deja de ser auditable: no se puede distinguir un panel bien
armado de uno armado para llegar a la conclusión que su presidente ya tenía. Es la misma asimetría por
la que `Master-Prompt.md` §10 invoca al auditor desde cero.

### 1.2 Las cuatro funciones, y por qué son cuatro roles y no uno

**Detectar, juzgar, diseñar la corrección y aprobarla son cuatro actos distintos, y el método los
tenía fundidos en dos.** Hoy el subagente que encuentra el defecto es el que lo corrige, y el humano
aprueba. La consecuencia es que **el costo de corregir nunca se pesa**: todo hallazgo detectado se
convierte en trabajo, y la única pregunta que se hace es si el humano lo autoriza.

| Función | Quién | Qué tiene prohibido |
| --- | --- | --- |
| **Detectar** | Panel de especialistas (§5) | Juzgar si su hallazgo procede; opinar fuera de su mandato |
| **Juzgar** | Jurado de cinco funciones objetivo (§6.4) | Diseñar la corrección que aprueba |
| **Diseñar el parche** | Cuerpo de parches (§6.5) | Votar la aprobación de sus propios parches |
| **Aprobar** | El jurado sobre el parche, o el humano si §7 dispara | Aplicar: aplicar es del orquestador |

### 1.3 Lo que esta regla no asigna

No asigna especialidades de categoría. Los titulares `AG-00000` a `AG-00110` siguen siendo los de
`Root-Rules.md`; la mesa **los convoca como especialistas del panel cuando la señal corresponde a su
categoría**, y no crea roles paralelos para lo que ya tiene dueño.

---

## 2. Artefactos que produce

### 2.1 Tabla maestra de artefactos

| Artefacto | Path | Cuándo | Quién lo escribe |
| --- | --- | --- | --- |
| Registro de mesa | `SDD/Docs/Audit/Mesa-<AAAA-MM-DD>[-ciclo-<N>].md` | Siempre que la mesa se convoca, aunque no encuentre nada | AG-00970 |

**El sufijo de ciclo entra cuando hay más de uno en la misma fecha**, y no es hipotético: un destino corrió
**tres ciclos el 2026-08-27** y el tercero tuvo que apartarse de la forma. Con la condición de §0.0, que
vuelve la convocatoria más frecuente, el caso deja de ser excepcional. Con un solo ciclo en el día el
sufijo se omite.
| Plan de cambios | Sección del registro, **no artefacto aparte** | Siempre | AG-00970, desde los parches aprobados |

**El plan de cambios no es un artefacto propio, y es deliberado.** El método ya tiene dos contenedores
de plan —`Plan-Migracion-<origen>-a-<vigente>.md` y el bloque de cierre de unidad de
`Master-Prompt.md` §8.1— y un tercero obligaría a mantener sincronizados tres. El plan de la mesa
**alimenta** al que corresponda: sus filas entran al plan de migración cuando la salida es migrar, y
al bloque de decisiones pendientes cuando no.

### 2.2 Estructura obligatoria del registro

1. Cabecera: destino, fecha, **desde dónde se convocó** —el orquestador y su fase, o la condición de §0.0
   con el caso que la cumple cuando no hay orquestador—, y contrato de entrada de §4 transcripto.
   **Y el prefijo de familia que el ciclo usa para sus hallazgos**, que es propio del ciclo y **no reusa
   ninguna familia ya presente en la carpeta de auditoría del destino**. Medido: un ciclo tomó la familia
   `M`, que ya nombraba los hallazgos de dos informes de migración, y el identificador `M-01` quedó con
   **cuatro significados distintos** en la misma carpeta. La comprobación mecánica no puede verlo —las
   familias de hallazgo están exentas del ancho y `Audit/` suele quedar fuera del anclaje—, de modo que
   la única defensa es declararlo al abrir.
2. **Registro de convocatoria**: convocados con su señal y su ubicación, **descartados con su motivo**,
   postergados por cupo, y agentes ad hoc con su carta de mandato.
3. Resultado de la compuerta mecánica (§6.2), con el alcance que ella misma declaró no haber mirado.
4. Informes del panel, uno por especialista, con sus hallazgos y su bloque «lo que revisé y está bien».
5. Tabla de veredictos, un hallazgo por fila, con el reparto de votos y el fundamento de cada uno.
6. Parches aprobados, con texto exacto, capa de origen, derivados a revalidar y criterio de
   verificación.
7. **Deuda declarada**: los hallazgos reales que se decidió no corregir, con su motivo.
8. **Escaladas**, agrupadas, con el formato de §7.
9. Bloque de cierre (§6.7).

**Se escribe siempre, aunque la mesa no encuentre nada.** Una mesa que no deja rastro obliga a la
siguiente a rehacer el mismo análisis, y **dos análisis del mismo corpus hechos por paneles distintos
no tienen por qué coincidir**. Es el mismo motivo por el que el informe de estado de
`Master-Prompt-Reanudacion.md` §5 se escribe cualquiera sea la salida elegida.

---

## 3. Principios

De estos cuatro se derivan todas las reglas de §5 y §6.

**P1 · La refutación es el producto, no el consenso.** Un panel que coincide temprano no está de
acuerdo: está anclado. Por eso los especialistas trabajan **a ciegas** (§5.3) y por eso el encargo es
refutar y no verificar, exactamente como `Master-Prompt.md` §10 ya lo declara para el auditor: *«Un
auditor que busca confirmación la encuentra»*.

**P2 · Nada se afirma sin ancla, y el ancla se gradúa.** El framework ya exige cita literal con archivo
y línea. La mesa agrega **de qué clase es esa ancla** (§6.1), porque de ahí sale mecánicamente quién
resuelve el hallazgo: con ancla, lo cierra el agente; sin ancla posible, es del humano. Es la
**pregunta previa** de `Master-Prompt.md` §8.1 contestada por construcción.

**P3 · Se repara en la capa de origen.** Un defecto nacido en la especificación no se parchea aguas
abajo. El método ya lo tiene con nombre: son los **hallazgos aguas arriba** de `Master-Prompt.md` §10,
punto 6.1 de la estructura del informe, que se listan aparte con su artefacto de origen. La mesa
agrega la compuerta: **un parche que no se aplica en la capa donde nació el defecto se rechaza y se
reformula**, antes de aprobarse.

**P4 · La composición del panel es una decisión del caso, y se registra con sus descartes.** Un panel
fijo sobra para un corpus y falta para otro. Lo que hace auditable a un panel variable no es la lista
de convocados: es **la lista de descartados con su motivo**, porque es lo único que permite corregir el
criterio cuando después aparece un defecto en el área descartada.

**Lo que estos principios no son.** No son una invitación a planificar sobre lo que se supone.
`Migracion-Rules.md` §3 rechazó los playbooks por salto de versión con cinco fundamentos, y
`Master-Prompt.md` §8.1 lo generaliza: *«un plan escrito antes de tener el estado a la vista planifica
sobre lo que se supone»*. **La mesa cumple esa condición y no la viola**: corre con el estado ya leído
por el orquestador, y su contrato de entrada (§4) es la salida de esa lectura. Una mesa convocada
antes de leer el árbol sería el playbook que la regla prohíbe.

---

## 4. Contrato de entrada

**La mesa no arranca sin esto, y no lo releva ella.** Lo aporta el orquestador que la convoca. Si un
campo falta, **ése es el primer hallazgo del registro** y la mesa lo resuelve con un supuesto
declarado, no preguntando.

| Campo | Qué lleva | De dónde sale |
| --- | --- | --- |
| `objeto` | Qué corpus se evalúa, con su path y su volumen | R0 de `Master-Prompt-Reanudacion.md`, o M0 de `Master-Prompt-Migracion.md` |
| `estado` | Las seis dimensiones resueltas, con sus divergencias declaradas | Informe de estado, `Master-Prompt-Reanudacion.md` §1 |
| `diff_normativo` | Qué cambió en el framework entre la procedencia y la vigente, artefacto por artefacto | `Master-Prompt.md` §2.1, o el informe de estado si ya lo trae |
| `restricciones_duras` | Lo no negociable del destino: `RN-*` del intake, apartamientos vigentes | Intake y ADR de apartamiento de `Root-Rules.md` §11 |
| `decisiones_cerradas` | Lo ya decidido que **no se reabre** salvo contradicción demostrada | Registro de cambios del producto, ADR vigentes, informes de audit cerrados |
| `fuera_de_alcance` | Lo que la mesa no toca | `Migracion-Rules.md` §2.2 y lo que el humano declare |
| `pendientes_declarados` | Hallazgos abiertos, filas de plan sin resolver, ítems diferidos de `Root-Rules.md` §12.2 con su evento contrastado | R0 paso 4 |

**`decisiones_cerradas` es el campo que evita el defecto más caro de estos ciclos**: que cada corrida
redescubra y rediscuta lo mismo. Una decisión cerrada **sólo se reabre si un hallazgo con ancla E1 o
E2 demuestra que es contradictoria**, no que es mejorable. Sin ese campo, la mesa reproduce exactamente
lo que vino a corregir: consultar sobre temas que ya estaban resueltos.

**Y `pendientes_declarados` entra con una advertencia que el método midió**: un hallazgo heredado de un
informe anterior **no es evidencia, es una afirmación de segunda mano**. La mesa lo trata como
hallazgo de nivel `C` (§6.1) hasta que un especialista lo abre y lo ancla. Es la regla que los cuatro
falsos enlaces rotos de §0.1 no tenían.

---

## 5. Composición del panel

### 5.1 Núcleo permanente

Se convoca siempre, cualquiera sea el corpus, porque su función no depende del dominio:

| Rol | La pregunta que responde |
| --- | --- |
| **Requisitos** | ¿Cada afirmación del corpus es unívoca, atómica y verificable? ¿Qué falta? |
| **Verificación** | ¿Cómo se prueba cada afirmación? ¿Qué quedó declarado sin criterio de aceptación posible? |
| **Lector sin contexto** | ¿Alguien que no participó puede trabajar con esto sin preguntar nada? **Cada pregunta que necesita hacer es un hallazgo** |
| **Refutador** | Mandato explícito de atacar la lectura dominante del corpus. **Entra último**, después de leer al resto |

**El «lector sin contexto» es el rol que mide el defecto que originó la mesa.** Cada consulta que ese
lector necesita hacer y que **tiene respuesta en el árbol** es exactamente una de las detenciones
espurias que §0.1 midió. Que las produzca un especialista con mandato, en lote y antes del plan, es lo
contrario de que las produzca el orquestador de a una y a mitad de la migración.

**El refutador es la única excepción a la ceguera de §5.3**, y por eso entra último: su mandato es
atacar lo que los demás sostienen, y para eso tiene que haberlo leído.

### 5.2 Catálogo variable y señales de convocatoria

Cada especialidad se activa por una **señal observable en el corpus, citada con su ubicación**. Sin
ubicación no hay convocatoria: la señal es evidencia y se ancla como cualquier otra.

| Rol | Se convoca cuando el corpus contiene… | Titular natural |
| --- | --- | --- |
| Arquitectura | Más de una unidad de entrega, integración entre sistemas, o una restricción dura de stack | AG-00050 |
| Formal | Umbrales numéricos, pesos, prioridades calculadas, cuantificadores —«todos», «siempre», «ninguno»— | — |
| Datos y dominio | Entidades, estados, ciclos de vida, persistencia, migraciones de datos | AG-00020 |
| Seguridad | Autenticación, permisos, datos personales, exposición pública, secretos | AG-00050 |
| Operación y entrega | Despliegue, ambientes, disponibilidad, observabilidad, versionado | AG-00090 |
| Concurrencia y tiempo | Procesos simultáneos, colas, reintentos, idempotencia, orden de eventos | AG-00050 |
| Rendimiento y costo | Volumen declarado, latencia prometida, límites de consumo | AG-00080 |
| Interfaz externa | API pública, contrato con terceros, retrocompatibilidad | AG-00020 |
| Cumplimiento | Obligaciones legales, auditoría, retención de datos | AG-00010 |
| Uso y accesibilidad | Interfaz de usuario, flujos con personas | AG-00030 |
| Trazabilidad documental | Identificadores, enlaces internos, citas entre documentos del corpus | AG-00110 |

**El rol formal es de convocatoria automática**: si su señal aparece, entra sin votación. Es el único,
y el motivo es que su defecto característico —un umbral que ninguna otra especialidad sabe leer— no lo
cubre el núcleo.

**La columna de titular natural existe para no duplicar roles.** Cuando la señal cae dentro de una
categoría del método, el especialista **es su titular**, con su regla como insumo. Instanciar un
«especialista de datos» ad hoc teniendo `AG-00020` y `Rules-Especificacion-Funcional.md` sería crear
una segunda fuente para la misma competencia, que `Rules-Base-Conocimiento.md` §6 prohíbe por nombre.

### 5.3 Cómo trabaja el panel

- **A ciegas y en paralelo.** Ningún especialista ve el informe de otro hasta la consolidación. Si
  trabajan en secuencia con contexto compartido, el segundo repite al primero, y **una confirmación
  correlacionada se lee como verificación sin serlo** — que es literalmente lo que `Master-Prompt.md`
  §10 declara que la independencia **no** compra.
- **Con tope de hallazgos**, declarado en el contrato de entrada. Sin tope, cada agente justifica su
  existencia inflando hallazgos.
- **Declarando qué revisó y está bien**, hasta tres ítems. Sirve para distinguir «no lo miró» de «lo
  miró y no hay problema», que es la distinción que un informe vacío no permite hacer.
- **Sin opinar fuera de mandato.** Un especialista que detecta algo ajeno a su competencia **no emite
  hallazgo: emite una solicitud de convocatoria**, con la señal y su ubicación, y con una línea que
  diga qué no puede afirmar sin esa especialidad.

**Una sola ronda de convocatoria en caliente por ciclo.** Las solicitudes se resuelven juntas al cerrar
el panel; el especialista que entra trabaja **a ciegas sobre el corpus**, no sobre los informes ya
emitidos. Lo que aparezca después entra en el ciclo siguiente.

### 5.4 Agentes ad hoc

Si el caso exige una competencia que ni el núcleo ni el catálogo cubren, la mesa instancia un agente
con **carta de mandato**, que declara su señal con ubicación, la única pregunta que responde, su
competencia **y su no-competencia**, su tope de hallazgos y su condición de disolución.

**Un agente sin carta de mandato no emite hallazgos válidos**: sus salidas se descartan en la
consolidación. La carta es lo que impide que un agente «de dominio X» termine opinando de todo, que es
el modo de falla característico del panel armado a ojo.

### 5.5 Techo, descarte y no reconvocatoria

- **Techo**: núcleo más **cinco** variables o ad hoc por ciclo. Si hay más señales que cupo, se
  prioriza por severidad esperada y **las postergadas se registran**; entran en el ciclo siguiente.
- **Empate en la convocatoria: se convoca.** El costo de un especialista de más es un informe
  descartable; el de uno de menos es un punto ciego.
- **No reconvocatoria**: un especialista variable que en dos ciclos consecutivos no produjo ningún
  hallazgo con veredicto `PROCEDE` no se reconvoca, y se registra como «señal presente, aporte nulo».
  Sigue disponible si aparece una señal nueva.

**El registro de convocatoria se contrasta al cierre contra los hallazgos reales**, y ése es el
mecanismo con el que el criterio de señales se corrige solo: si una especialidad se convoca cinco
veces y nunca aporta un `PROCEDE`, **su señal está mal definida**, y eso es un hallazgo sobre esta
regla y no sobre el destino.

---

## 6. El ciclo

### 6.1 Escala de ancla y nivel de hallazgo

**El nivel de hallazgo no se inventa: es el de `Master-Prompt.md` §10.** P0 a P3, con su significado y
sus consecuencias intactas. Introducir una segunda escala de severidad crearía dos conjuntos cerrados
para la misma pregunta, que es el conflicto que §7.0 existe para arbitrar.

**Lo que la mesa sí agrega es la clase del ancla**, porque el framework exige cita y no la gradúa:

| Ancla | Qué es | Qué puede fundar |
| --- | --- | --- |
| **E1** | Resultado ejecutable y reproducible: la compuerta que falla, un enlace que no resuelve, un comando con su salida | Un parche directo |
| **E2** | Cita literal del corpus, con archivo y línea, que muestra contradicción, ambigüedad u omisión | Un parche directo |
| **E3** | Contraejemplo construido: un caso concreto que el corpus no resuelve | Un parche directo |
| **E4** | Regla declarada: una obligación del conjunto normativo vigente o una restricción dura del contrato de entrada | Un parche directo |
| **C** | Conjetura, experiencia general, «suele ser mejor», o un hallazgo heredado de un informe anterior sin abrir | **Sólo una pregunta.** Nunca un parche |

**Un hallazgo `P0` anclado en una fuente declarativa exige contrastarla contra su observable antes de
proceder.** Una fila de plan, una casilla de checklist, un campo de estado o un recuento en prosa son
**afirmaciones sobre el trabajo y no el trabajo**. La mesa no releva el estado —§4 se lo prohíbe, y el
fundamento sigue en pie— pero **sí abre la fuente que va a citar**, y si el contraste no se puede hacer,
el hallazgo no llega a `P0`.

**Es el anti-patrón que el método nombra primero** —`Master-Prompt-Reanudacion.md` §7, «confiar en la
fuente declarativa sin contrastarla»— y la mesa lo cometió **dos veces en su primera corrida real**, las
dos en la misma dirección. Una: elevó como `P0` cuatro filas de un plan que declaraban «pendiente de
respuesta humana», que es la columna de **fuente de contenido** de `Migracion-Rules.md` §2.1 escrita al
planificar, y **no un campo de estado**; la fase que las gobernaba las había resuelto tres días antes.
Otra: dio por buena la declaración de un documento que afirmaba que cierta cifra «no existe en ninguna
parte del árbol», sobre cuatro planes que la tenían completa. **Las dos las destapó el humano con una
pregunta**, que es la forma más cara de encontrarlas.

**El corte entre E y C es la pregunta previa de `Master-Prompt.md` §8.1, resuelta antes de detener.**
Un hallazgo con ancla se sostiene contra el árbol y lo cierra el agente; uno de nivel `C` sólo se
sostiene opinando, y por eso no funda un parche. **Un `C` que sobrevive dos ciclos sin ascender de
nivel se descarta y se registra como descartado.**

### 6.2 P0 — Base mecánica y convocatoria

1. **Correr la compuerta mecánica de `Master-Prompt.md` §10.0 sobre el corpus**, con su declaración de
   alcance. Lo que falle entra como hallazgo con ancla **E1**, antes de convocar a nadie. **No se
   redefine ninguna comprobación acá**: es la compuerta que el destino ya escribió, aplicada al corpus
   en lugar de a una fase, y su banco de casos es el que §10.0 ya exige.
2. **Barrido de señales.** Un relevador **sin voto y sin capacidad de emitir hallazgos** recorre el
   corpus y lista las señales de §5.2 que aparecen, cada una con su ubicación. Su salida es un
   inventario, no un juicio.
3. **Mesa de convocatoria.** Los cinco jueces de §6.4 votan por especialidad propuesta: `CONVOCAR`,
   `NO_CONVOCAR` con su motivo, o `INSTANCIAR_AD_HOC` sobre la carta de mandato redactada. Mayoría
   simple; empate convoca; techo de cinco.

**La composición nunca es motivo de escalada al humano.** Es una decisión de la mesa, y elevarla
devuelve al humano exactamente la clase de consulta que este mecanismo existe para eliminar.

### 6.3 P1 — Panel y consolidación

El panel trabaja según §5.3. Después, **AG-00970 consolida sin juzgar**: deduplica, agrupa por raíz
común y **eleva como ítem separado toda contradicción entre dos especialistas**. No emite juicio propio
ni edita el contenido de un hallazgo.

**Una contradicción entre especialistas es un ítem del jurado, no un empate a resolver por el
presidente.** Que dos miradas independientes lleguen a lecturas incompatibles del mismo texto es, por
sí solo, evidencia E2 de que el texto admite dos lecturas.

### 6.4 P2 — Jurado y veredicto

Cinco jueces con **funciones objetivo diferenciadas**, para que la diversidad sea estructural y no de
personalidad. El jurado es fijo en función y **no cambia según el dominio**:

| Juez | Qué pregunta |
| --- | --- |
| **Evidencia** | ¿El hallazgo está anclado al nivel que declara? |
| **Impacto** | Si no se corrige, ¿qué pasa concretamente, y sobre qué artefacto? |
| **Costo y beneficio** | ¿El costo de corregir es menor que el daño de no hacerlo? |
| **Coherencia histórica** | ¿Esto reabre una decisión cerrada del contrato de entrada? ¿Contradice un veredicto previo del mismo ciclo? |
| **Riesgo e irreversibilidad** | ¿La corrección es reversible? ¿Qué se rompe si sale mal? |

**Cuando un hallazgo exige conocimiento que ningún juez tiene, se convoca perito**: el especialista que
lo emitió responde preguntas **y no vota**. Así el quórum queda impar y quien detecta no se juzga a sí
mismo.

Reglas de votación:

- **Quórum de cinco.** Con menos, no hay veredicto.
- **Mayoría simple** decide entre `PROCEDE`, `NO_PROCEDE` con su motivo, e `INSUFICIENTE`.
- **`INSUFICIENTE`** vuelve al especialista con un pedido concreto, **una sola vez**; a la segunda se
  archiva.
- **Empate**: pasa a `INSUFICIENTE` en la primera ronda. Si vuelve a empatar, **es escalada** (§7).
- **Veto acotado**: el juez de riesgo puede vetar un `PROCEDE` sólo si la corrección es **irreversible
  y** el hallazgo es P2 o P3. El veto no archiva: **convierte el ítem en escalada**.
- **Todo voto lleva una línea de fundamento.** Un voto sin fundamento no cuenta para el quórum.

**Si el jurado vota cinco a cero en más del 80 % de los ítems**, el ciclo se marca como sospechoso de
homogeneidad y el refutador revisa los `NO_PROCEDE`. Es la salvaguarda contra el consenso vacío, y es
el mismo riesgo que `Master-Prompt.md` §10 declara: dos agentes del mismo modelo tienden a coincidir.

### 6.5 P3 — Diseño de parches

Por cada hallazgo `PROCEDE`, el cuerpo de parches produce **texto exacto, no consejo**: qué se
reemplaza y por qué texto, en qué capa se aplica, qué artefactos derivados quedan **a revalidar**, cuál
es su criterio de verificación y cuál su plan de reversión.

- **Dos parches que tocan la misma sección se fusionan en uno antes de aprobarse.** Parches solapados
  aplicados en secuencia son la causa más común de que un ciclo automatizado rompa el artefacto.
- **Compuerta de capa de origen (P3 de §3), obligatoria antes de aprobar**: si el parche no se aplica
  en la capa donde nació el defecto, **se rechaza y se reformula**. Un defecto de especificación
  parcheado en el backlog produce deuda invisible.
- **El cuerpo que diseña no vota su parche.** Puede argumentar ante la mesa; no puntúa.

Cuatro resultados posibles por parche: `APLICAR`, `MEJORAR_PLAN` —el hallazgo es válido y el parche no;
vuelve con la objeción concreta, máximo dos vueltas—, `NO_APLICAR` —el costo o el riesgo supera al del
defecto, y **el defecto se registra como deuda declarada, no se ignora**— y `ESCALAR` (§7).

### 6.6 P4 — Entrega del plan

**La mesa no aplica.** Cierra entregando al orquestador que la convocó:

- Los parches `APLICAR`, con su texto exacto y su criterio de verificación.
- La **deuda declarada**, que entra como **ítem diferido de `Root-Rules.md` §12.2 con sus cuatro
  campos**, incluido su evento de cierre. No se inventa un registro nuevo: el método ya tiene el suyo,
  y la reanudación ya lo contrasta en su R0 paso 4.
- Las **escaladas agrupadas** (§7), que entran a `SDD/Docs/Producto/Decisiones-Pendientes.md` por
  `Master-Prompt.md` §7.0.
- Las **capas a revalidar**, que son los **hallazgos aguas arriba** de `Master-Prompt.md` §10 punto
  6.1, con su artefacto de origen.

**La verificación de cada parche la corre quien lo aplica**, y ante regresión **se revierte ese parche**
y su hallazgo vuelve al cuerpo de parches marcado como regresión. La mesa declara el criterio; el
orquestador lo ejecuta con la confirmación humana que su propia fase ya exige.

### 6.7 P5 — Cierre

**El criterio de corte no se inventa: es el de `Master-Prompt.md` §10.1.** El ciclo cierra cuando **dos
rondas seguidas no encuentran ningún hallazgo de la clase interpretativa**, con los enumerables en cero
por la compuerta. Si no se alcanza en **cuatro rondas**, la decisión sube al humano y el registro
declara que **cerró por decisión y no por criterio**, con la lista de lo que quedó abierto.

También cierra si aparece una escalada bloqueante sin responder (§7, disparadores 2 y 3).

**El contador de este ciclo es propio y no acumula con el de las rondas de audit**, aunque los dos usen
§10.1. Son dos cuentas sobre dos cosas distintas —las rondas internas de **este** ciclo de mesa, y las
rondas de auditoría que cierran una fase— y el registro **nombra cuál declara** al cerrar. Medido: un
destino quedó con los dos contadores vivos a la vez —ocho rondas de migración y un ciclo de mesa— y un
panel independiente leyó el registro de mesa como si estuviera certificando la migración. **Que un panel
independiente lo lea mal es la medición del defecto**, y hubo que abrir esta sección para dirimirlo.

**Y una advertencia que sale de las primeras corridas reales.** El rendimiento por especialista **no cayó
entre ciclos** —4,9 y 5,8 hallazgos procedentes por especialista en dos corridas consecutivas sobre el
mismo destino—. Si no cae, este criterio va a cerrar **por decisión y no por criterio de forma
sistemática**, que es exactamente lo que le pasó al audit por rondas y lo que §10.1 anticipa con su
válvula de las cuatro rondas. **Cerrar por decisión es una salida legítima y no un fracaso**; lo que no
es legítimo es cerrar por decisión sin declararlo.

Bloque de cierre obligatorio:

```text
CIERRE DE MESA — {{destino}}, {{fecha}}

  PANEL
    Convocados:     {{rol: hallazgos procedentes}}
    Descartados:    {{rol: motivo}}
    Ad hoc:         {{id: qué pregunta respondió y qué aportó}}
    Postergados:    {{rol, por cupo}}
    Aporte nulo:    {{roles a no reconvocar}}

  HALLAZGOS
    Detectados: {{n}}   Procedentes: {{n}}   Con parche: {{n}}   Descartados por C: {{n}}

  COMPUERTA (§10.0)
    Resultado:      {{salida}}
    No mirado:      {{recortes declarados}}

  ENTREGA AL ORQUESTADOR
    Parches:            {{n}}, en {{lista de capas}}
    Deuda declarada:    {{n}}, con su evento de cierre
    Capas a revalidar:  {{artefactos derivados}}
    Escaladas:          {{n}}, agrupadas

  CIERRE
    Por criterio {{§10.1}} | por decisión, con lo que quedó abierto: {{lista}}
```

**La deuda declarada y las capas a revalidar son la salida más valiosa del ciclo**, y la que estos
mecanismos suelen perder: son lo único que distingue un defecto asumido a conciencia de uno que se
olvidó.

---

## 7. Escalada: la lista cerrada de lo que no tiene respuesta en el árbol

**Regla general: la mesa decide sola.** `Master-Prompt.md` §8.1 fija el criterio —*«¿esto tiene
respuesta en el árbol?»*— y esta sección lo completa con lo que faltaba: **la lista cerrada de los
casos en los que la respuesta es no**. Fuera de esta lista, la mesa resuelve y registra.

| # | Disparador | Familia de detención del método |
| --- | --- | --- |
| 1 | **Ambigüedad de intención irresoluble por evidencia**: el corpus admite dos lecturas legítimas y ninguna ancla desempata | `Master-Prompt.md` §9, ambigüedad |
| 2 | **Conflicto entre restricciones duras**: no hay solución que satisfaga todas las del contrato de entrada | §7.0, arbitraje. **Bloquea el ciclo** |
| 3 | **Cambio de alcance**: la corrección agrega, quita o redefine lo que el producto promete | §7.0, arbitraje. **Bloquea el ciclo** |
| 4 | **Irreversibilidad con impacto material**: migración de datos, contrato público, cualquier cosa cuya reversión cueste más que la corrección | §8.1, detención con propuesta |
| 5 | **Dominio con consecuencia externa**: dinero, datos personales, obligaciones legales o de terceros | §8.1, detención con propuesta |
| 6 | **Empate persistente del jurado** tras dos rondas | §8.1, detención con propuesta |
| 7 | **Reapertura de una decisión cerrada**: el panel sostiene con ancla E1 o E2 que una decisión del contrato de entrada es **contradictoria** —no que es mejorable— | §7.0, arbitraje |

**Todo lo demás se resuelve sin consultar**: redacción, estructura, trazabilidad faltante, criterios de
aceptación ausentes, nombres, orden de tareas y elección técnica dentro de las restricciones ya dadas.
Son exactamente las tres detenciones que §0.1 midió como no siendo del humano.

**Ante duda sobre si escalar, la mesa aplica el criterio por defecto y lo registra en la deuda
declarada.** Es la única inversión deliberada respecto de `Master-Prompt.md` §8.1, que ante la duda
detiene, y tiene fundamento: **la asimetría de costos se invierte cuando las consultas van en lote y
con default declarado**. En §8.1 detener cuesta una sección del informe y el humano paga reconstruir
contexto; acá la mesa ya reconstruyó el contexto para todos los ítems a la vez, y **una consulta de
más en un lote de veinte entrena a firmar el lote sin leerlo**, que es peor que un default registrado
y revisable.

### 7.1 Forma de la escalada

**Las escaladas se entregan agrupadas al cierre del ciclo, no de a una.** Las de tipo 2 y 3 son la
excepción: bloquean y salen en el momento.

Cada una adopta el formato de `Master-Prompt.md` §8.1 —qué pasó, opciones con su impacto, propuesta con
su alternativa razonable, y qué se necesita— **más un campo propio de la mesa**:

```text
  SI NO RESPONDÉS
    {{qué hace la mesa por defecto y qué queda bloqueado}}
```

**Ese campo es lo que hace que el lote sea contestable.** Sin él, veinte escaladas agrupadas obligan a
responder las veinte para que algo avance; con él, el humano contesta las que le importan y sabe qué
pasa con el resto.

---

## 8. Criterios de aceptación

- [ ] [enumerable] El registro de mesa existe en `SDD/Docs/Audit/Mesa-<AAAA-MM-DD>.md` y tiene las
      nueve secciones de §2.2.
- [ ] [enumerable] El **registro de convocatoria** enumera convocados, **descartados con su motivo** y
      postergados. Un panel sin descartes registrados no cumple.
- [ ] [enumerable] Todo agente ad hoc tiene **carta de mandato** con su no-competencia declarada.
- [ ] [enumerable] Todo hallazgo declara su **nivel P0-P3** y su **clase de ancla E1-E4 o C**, y ningún
      hallazgo `C` fundó un parche.
- [ ] [enumerable] Todo veredicto tiene **cinco votos con fundamento** y su reparto registrado.
- [ ] [enumerable] Ningún miembro del cuerpo de parches votó la aprobación de un parche propio.
- [ ] [enumerable] Todo parche declara texto exacto, capa, derivados a revalidar, criterio de
      verificación y plan de reversión.
- [ ] [enumerable] La **deuda declarada** entró como ítem diferido de `Root-Rules.md` §12.2 con sus
      cuatro campos, y su evento de cierre está nombrado.
- [ ] [enumerable] Las escaladas salieron **agrupadas** y cada una declara qué pasa si no se responde.
- [ ] [interpretativo] Ninguna escalada de la lista de §7 quedó sin salir, y **ninguna consulta fuera
      de esa lista se elevó al humano**.
- [ ] [interpretativo] Ningún parche corrige aguas abajo un defecto nacido aguas arriba.
- [ ] [interpretativo] Los especialistas trabajaron **a ciegas**: ningún informe cita a otro informe
      del mismo ciclo, salvo el del refutador.
- [ ] [interpretativo] El ciclo cerró **por el criterio de `Master-Prompt.md` §10.1**, o declaró
      explícitamente que cerró por decisión con la lista de lo abierto.
- [ ] [interpretativo] La mesa **no aplicó ningún parche**: los entregó.

---

## 9. Anti-patrones a evitar

| Anti-patrón | Producto |
| --- | --- |
| **Convocar el panel completo «por las dudas»** `[enumerable]` | Toda convocatoria exige señal con ubicación, hay techo de cinco variables, y no hay reconvocatoria tras dos ciclos de aporte nulo |
| **Panel en secuencia con contexto compartido** `[interpretativo]` | El segundo especialista repite al primero y la coincidencia se lee como verificación. A ciegas y en paralelo, con el refutador como única excepción |
| **Heredar un hallazgo de un informe anterior y listarlo como propio** `[enumerable]` | Entra como `C` hasta que un especialista lo abre y lo ancla. Es el defecto medido: cuatro falsos enlaces rotos viajaron tres informes |
| **Emitir hallazgos fuera del mandato** `[interpretativo]` | Se emite **solicitud de convocatoria**, no hallazgo. Opinar fuera de mandato es la vía más común por la que un panel produce ruido con apariencia de rigor |
| **Deliberación sin cambio** `[enumerable]` | Todo voto exige fundamento y todo parche exige texto exacto. Un ciclo que produce actas y ningún parche se cierra como aporte nulo |
| **Parchear en la capa equivocada** `[interpretativo]` | Compuerta de capa de origen obligatoria antes de aprobar |
| **Elevar la composición del panel al humano** `[enumerable]` | La composición es de la mesa. Elevarla devuelve la clase de consulta que este mecanismo existe para eliminar |
| **Escalar de a una** `[enumerable]` | Agrupadas al cierre, con default declarado. Sólo los disparadores 2 y 3 salen en el momento |
| **Introducir una segunda escala de severidad** `[enumerable]` | Los niveles son P0-P3 de `Master-Prompt.md` §10. La mesa gradúa el **ancla**, no la severidad |
| **Convocar la mesa antes de leer el árbol** `[interpretativo]` | Sería el playbook que `Migracion-Rules.md` §3 rechaza: planificar sobre lo que se supone. El contrato de entrada de §4 es la salida de esa lectura |
| **Convocar la mesa sobre un corpus que se está por generar** `[enumerable]` | La mesa evalúa lo existente. Lo que se produce lo audita §10, que es su mecanismo |
| **Reabrir una decisión cerrada porque es mejorable** `[interpretativo]` | Sólo se reabre contra un ancla E1 o E2 que demuestre **contradicción**. Sin eso, cada ciclo redescubre lo mismo |

---

## 10. Prompt-snippet sugerido

Bloque que el orquestador inyecta al despachar cada especialista del panel, sobre el esqueleto de
`Master-Prompt.md` §8:

```text
## Mandato de mesa

Sos {{ROL}} en una mesa de evaluación sobre un corpus documental ya existente. Tu encargo es
**refutar, no verificar**: buscá dónde este corpus no se sostiene.

Trabajás **a ciegas**: no vas a ver el informe de ningún otro especialista.

Tu competencia es {{COMPETENCIA}}. **No te corresponde opinar sobre {{NO_COMPETENCIA}}**: si
encontrás algo ahí, emitís una solicitud de convocatoria con la señal y su ubicación, no un hallazgo.

Por cada hallazgo declarás: nivel P0 a P3 de `Master-Prompt.md` §10, clase de ancla E1 a E4 o C de
`Mesa-Rules.md` §6.1 con su cita literal —archivo y línea—, impacto concreto si no se corrige, y
**dirección de la corrección, no su redacción**. Un hallazgo de clase C no funda un parche: funda
una pregunta.

Tope: {{TOPE}} hallazgos. Declarás además hasta tres ítems de «lo que revisé y está bien».

Insumos: {{LISTA}}, `Vocabulario-Rules.md`, y el contrato de entrada de la mesa.
```

---

## 11. Control de cambios

| Versión | Fecha | Cambios | Autor |
| --- | --- | --- | --- |
| 1.0 | 2026-08-27 | Emisión inicial. Regula **la mesa de evaluación**, el mecanismo de preplanificación que convierte un corpus existente en un plan de cambios antes de que ese plan se apruebe. Declara el hueco con su medición —de cinco detenciones reales **tres tenían respuesta en el árbol**, y de diez hallazgos heredados en cinco informes **tres no eran lo que declaraban ser**— y **la frontera con el audit** de `Master-Prompt.md` §10, que es lo que impide que se dupliquen: el audit mira lo que se acaba de producir y emite un veredicto; la mesa mira lo que ya existía y emite un plan. Fija el rol **AG-00970** que preside y no vota, la **separación de las cuatro funciones** —detectar, juzgar, diseñar y aprobar—, el **contrato de entrada** alimentado por el orquestador, la **composición por señal observable** con su registro de descartes, el ciclo P0 a P5 con su **jurado de cinco funciones objetivo**, y la **lista cerrada de siete disparadores de escalada**, que completa la pregunta previa de `Master-Prompt.md` §8.1 nombrando los casos en que la respuesta no está en el árbol. **Reusa y no redefine**: los niveles de hallazgo son P0-P3 de §10, la base mecánica es la compuerta de §10.0, el criterio de corte es §10.1, la deuda va a los ítems diferidos de `Root-Rules.md` §12.2, las escaladas a `Decisiones-Pendientes.md` de §7.0 y las capas a revalidar son los hallazgos aguas arriba de §10. Lo único que agrega como escala propia es **la clase del ancla E1-E4/C**, porque el framework exigía cita y no la graduaba. | Framework SDD (mesa de evaluación) |
| 1.1 | 2026-08-29 | **La convocatoria pasa de una lista de puntos a una condición declarada, y §0.0 es nueva.** La 1.0 declaraba que «el orquestador que la invoca declara **cuándo**», y los puntos que los orquestadores enumeran **no agotaban** el momento que el mecanismo pide: los dos que existían y la condición producían la misma lista el día que se escribió, y la diferencia apareció con el primer caso que la cumplía desde otro lugar. Entran las **tres cláusulas** —corpus previo, estado leído, plan o decisión de alcance por tomar—, los puntos quedan como **casos y no como definición**, y se declara que un caso sin orquestador **se convoca igual**. **§0.3 corrige la otra cara**: «no corre sobre un destino vacío» **no es** «no corre en la generación», que es la derivación que la 1.0 dejó escrita — un destino deja de estar vacío apenas la primera fase produce algo, y desde ahí nadie mira el corpus como conjunto; con su límite escrito, para no duplicar el audit de fase. **§6.1 suma la obligación de contrastar la fuente** cuando un `P0` se ancla en una declaración —fila de plan, casilla, campo de estado— porque la mesa lo incumplió **dos veces en su primera corrida real**, en el anti-patrón que el método nombra primero. **§2.1** admite el sufijo de ciclo cuando hay más de uno por fecha; **§2.2** obliga a declarar el prefijo de familia del ciclo, que no reusa una familia ya presente en la carpeta; y **§6.7** declara que el contador del ciclo **es propio y no acumula** con el de las rondas de audit, con la advertencia de que el rendimiento por especialista no cayó entre las dos primeras corridas. **Sube minor**: agrega obligaciones y no deroga ninguna regla; un registro de mesa emitido bajo la 1.0 sigue cumpliendo. | Intervención de la condición de convocatoria |
