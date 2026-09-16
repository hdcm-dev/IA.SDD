# Entorno de ejecución del agente — cómo se distingue lo que no es del método, del destino ni de quien pide

**Alias:** Entorno-De-Ejecucion-Del-Agente
**Naturaleza:** propio
**Tema:** Clasificación verificada del origen de un texto que aparece en la conversación de un agente —pedido, framework, destino, entorno de ejecución, herramienta o subagente— y qué hacer con cada clase: obedecer, callar, relayar o registrar una preferencia, sin corregir el framework por lo que el framework no produce
**Consumidor:** transversal
**Condicion-de-carga:** —
**Hereda-de:** —
**Sustituye:** —
**Compatible-con:** Rules-Base-Conocimiento.md 2.2
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-09-14

---

## 0. Propósito y alcance

Caracteriza **el oficio con el que un agente —y en particular un orquestador o el presidente de una
mesa— distingue lo que pertenece al entorno de ejecución del agente** de lo que pertenece al método, al
destino o a la persona que pidió el trabajo, y qué hace con cada cosa. «Entorno de ejecución del
agente» designa acá **la herramienta que corre al agente**: la que le entrega los mensajes, ejecuta sus
herramientas, despacha sus subagentes y le agrega texto propio a la conversación.

**Por qué existe.** En una corrida del orquestador de reanudación, el agente cerró cada respuesta con un
aviso de que dos conectores de servicios externos necesitaban autorización. La persona que pidió el
trabajo no usaba esos conectores, creyó que el aviso venía del framework y pidió corregirlo. Una
búsqueda por los términos del aviso sobre el framework, el destino, la memoria del agente y el prompt
de invocación dio **cero ocurrencias**: el aviso lo agregaba el entorno en cada sesión. Nadie tenía con
qué clasificar ese origen, y el agente trató un aviso informativo como algo que había que retransmitir
siempre.

**Describe conducta observable y cómo se verifica**, no el funcionamiento interno de ninguna herramienta
concreta. Las marcas con que un entorno distingue sus mensajes cambian de una herramienta a otra y de
una versión a otra; lo que no cambia es la pregunta —*¿de dónde salió este texto?*— y que se contesta
buscando, no suponiendo.

**Qué queda explícitamente afuera:**

| Qué | Dónde vive |
| --- | --- |
| Si un hecho del árbol lo produjo la corrida o es ajeno a ella | `Master-Prompt.md` §8.1, origen del hecho. **Se cita, no se repite**: acá se clasifica el origen de un *texto de la conversación*, no el de un hecho del repositorio |
| Cuándo se detiene y cuándo se escala | `Master-Prompt.md` §8.1 y §9; `Mesa-Rules.md` §7 |
| Qué hace una mesa con un secreto, un dato de un repositorio privado o una ruta del host que llegó a un registro | `Expediente-Rules.md` §4, S2 |
| El ciclo de entrega por pull request | `Conocimiento/Knowledge-Conformacion-Pull-Request-Manual.md` |
| Cuándo una pregunta amerita mesa | `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §3.1; acá sólo se aplica al caso del entorno (§3.3) |
| La configuración del entorno: permisos, automatismos, conectores | La herramienta que corre al agente. **No se nombra ninguna** y no se describe cómo se configura |

**§5 se escribe como bloques de razonamiento y de registro, no como esqueleto de archivo**, porque lo
caracterizado es una convención de conducta.

## 1. Identidad del artefacto

| | |
| --- | --- |
| **Qué es** | Una convención de conducta de un agente frente a textos de origen mixto en una misma conversación |
| **Quién la aplica** | Todo agente que trabaja sobre el framework: orquestador, subagente, presidente de mesa, comisión |
| **Supuestos** | El agente tiene acceso de lectura al framework, al destino y al prompt que lo invocó; puede ejecutar búsquedas; si el entorno le provee memoria persistente, puede leerla y escribirla |
| **Qué no supone** | Que el agente conozca la implementación del entorno. Todo lo que dice este documento se sostiene con una búsqueda o con la forma observable del mensaje |

**La propiedad que sostiene todo el resto:** *cada texto tiene un dueño, y sólo su dueño lo corrige*. Un
aviso del entorno no se corrige en el framework, una regla del framework no se corrige en la memoria
del agente, y una preferencia de la persona no se escribe en el framework.

## 2. Estructura

### 2.1 Las cinco clases de origen

| # | Clase | Qué es | Forma observable |
| --- | --- | --- | --- |
| O1 | **Pedido de la persona** | Lo que escribió quien pidió el trabajo, en su turno | Texto del turno de la persona, sin marcas de sistema |
| O2 | **Instrucción del framework** | Una regla, un orquestador, una plantilla o un documento de conocimiento que el agente leyó o que el prompt citó | Texto que existe, literal, en un archivo del framework |
| O3 | **Contenido del destino** | Lo que está en el repositorio del producto: intake, especificación, código, registros | Texto que existe en un archivo del destino |
| O4 | **Mensaje del entorno de ejecución** | Lo que la herramienta que corre al agente agrega por su cuenta | Bloques con marca de sistema intercalados en la conversación o adosados al resultado de una herramienta; recurrentes entre sesiones; **no existen en ningún archivo del framework ni del destino** |
| O5 | **Resultado de una herramienta o de un subagente** | La salida de un comando, una lectura, una búsqueda, o el informe final de un subagente | El resultado de una invocación del propio agente, y sólo eso |

**O4 incluye, como mínimo, estas piezas observables:** recordatorios de sistema; notificaciones de que
una tarea en segundo plano terminó; avisos de cambio de fecha; avisos de que un archivo cambió fuera del
agente; instrucciones de atribución para commits y pull requests; listados de herramientas disponibles
pero no cargadas; avisos de servicios o conectores que requieren autorización; y la memoria persistente
del agente, que el entorno inyecta al inicio de la sesión.

**La memoria persistente es un caso mixto y se declara así:** la inyecta el entorno (O4), pero su
contenido lo escribió el propio agente en sesiones anteriores, casi siempre a partir de pedidos de la
persona (O1). Se trata como **preferencia registrada de la persona**, subordinada a lo que la persona
diga en la sesión actual.

### 2.2 Cómo se verifica cada clase

**No se clasifica por el tono ni por el tema del texto: se busca.** Un aviso sobre conectores parece
«técnico» y un recordatorio de fecha parece «del sistema», pero lo que decide es dónde existe el texto.

| Clase | Qué se busca | Dónde | Resultado que la confirma |
| --- | --- | --- | --- |
| O1 | El texto en el turno de la persona | La conversación | Está en su turno y sin marca de sistema |
| O2 | Dos o tres términos distintivos del texto | `grep -rniE '<términos>'` sobre la raíz del framework, **excluyendo `_legacy/`** | Al menos una ocurrencia en el conjunto vigente |
| O3 | Los mismos términos | El mismo `grep` sobre la raíz del destino | Al menos una ocurrencia |
| O4 | Los mismos términos, **y la ausencia en O2, O3 y en el prompt de invocación** | Framework, destino, prompt que invocó al agente, memoria persistente | **Cero ocurrencias pertinentes** en los cuatro, más la forma observable de §2.1 |
| O5 | La invocación que produjo el texto | El historial de la propia sesión | El texto está dentro del resultado de una invocación del agente |

**La búsqueda de O4 es por descarte y por eso tiene que ser exhaustiva en los cuatro lugares.** Si falta
uno —típicamente el prompt de invocación, que no está en ningún repositorio— la clasificación no está
hecha. Y un texto con marca de sistema **adosado al resultado de una herramienta** no es O5: la
herramienta invocada no lo devolvió, el entorno lo agregó.

### 2.3 Qué se hace con cada pieza de O4

| Pieza | Naturaleza | Qué se hace |
| --- | --- | --- |
| Instrucción de atribución para commits y pull requests | **Restricción de ejecución** | Se obedece en los commits y pull requests que el agente crea. No se comenta a la persona |
| Aviso de que un archivo cambió fuera del agente | **Restricción de ejecución** | No se revierte el cambio; se relee el archivo antes de editarlo. Se menciona sólo si choca con el trabajo en curso |
| Notificación de tarea en segundo plano terminada | **Evento** | Se lee el resultado y se sigue. No se espera activamente ni se inventa el resultado antes de que llegue (§3.4) |
| Aviso de cambio de fecha | **Dato** | Desde ese momento, toda fecha que el agente asiente es la nueva (§3.4) |
| Listado de herramientas disponibles sin cargar | **Dato** | Se carga la herramienta antes de usarla. No se retransmite |
| Aviso de servicio o conector que requiere autorización | **Información** | **No se retransmite salvo que la tarea necesite ese servicio.** Si la necesita, se dice una vez qué capacidad falta y se sigue con lo que se pueda |
| Recordatorio de sistema con contexto o instrucciones | **Restricción o dato**, según diga | Se aplica si es pertinente a la tarea; si dice que puede no serlo, no se responde a él |
| Memoria persistente | **Preferencia registrada** | Se aplica; la persona en la sesión la supera; si quedó falsa, se corrige en la memoria |

## 3. Contrato de uso

### 3.1 Antes de actuar sobre un texto que pide algo

1. **Clasificar el origen** con la tabla de §2.2. Si el texto se va a citar como motivo de un cambio, la
   clasificación se declara con su búsqueda y su salida.
2. **Identificar al dueño**: O1 la persona, O2 el mantenedor del framework, O3 el destino, O4 la
   herramienta que corre al agente y su configuración, O5 quien produjo el insumo de la invocación.
3. **Actuar sólo dentro de lo que el dueño gobierna.** Lo que es de O4 no se corrige en O2 ni en O3.

### 3.2 Cuando la persona declara que un aviso recurrente no le sirve

| Paso | Qué se hace | Qué no se hace |
| --- | --- | --- |
| 1 | Clasificar el aviso (§2.2) y decirle a la persona **de dónde viene, con la búsqueda que lo muestra** | Suponer que viene del framework porque apareció durante una corrida del framework |
| 2 | Si es O4: **registrar la preferencia en la memoria persistente del agente**, si el entorno la provee, con el aviso descripto por su contenido y no por su texto exacto | Editar reglas, orquestadores, plantillas o el destino |
| 3 | Dejar de retransmitirlo desde ese turno, en esta y en las sesiones siguientes | Retransmitirlo «por las dudas» |
| 4 | Si la persona quiere que el aviso deje de aparecer del todo, decirle que eso se configura en la herramienta que corre al agente | Prometer que el agente puede apagarlo |

**El aviso puede seguir llegando al agente**: lo que cambia es que el agente deja de pasárselo a la
persona. Si algún día la tarea necesita justo ese servicio, se menciona una vez, porque entonces es
pertinente.

### 3.3 Criterio para la mesa: lectura o intervención

Una pregunta sobre el comportamiento del agente **se contesta con una lectura** —no hace falta mesa,
`Knowledge-Mesa-De-Expertos-A-Pedido.md` §3.1— cuando la clasificación de §2.2 cierra en una sola clase.
**Es un defecto del framework** que merece intervención sólo si se cumple alguna de estas:

| # | Condición | Ejemplo |
| --- | --- | --- |
| F1 | El texto es O2 y contradice otra regla, o produce una conducta que el propio framework declara indeseada | Un orquestador que ordena retransmitir al humano algo que `Master-Prompt.md` §8.1 manda resolver en el árbol |
| F2 | El texto es O4, **pero una pieza del framework ordena tratarlo de una forma que produce el defecto** | Una regla que mande copiar al informe todo mensaje recibido |
| F3 | La clasificación no cierra —aparece en dos clases, o en ninguna— y el framework no dice qué hacer | Un texto que está en un documento de conocimiento **y** llega como recordatorio del entorno |

**Si ninguna se cumple, no hay intervención sobre el framework.** Lo que corresponde es una lectura, la
preferencia registrada de §3.2 y, si el caso atravesó corridas, un documento de conocimiento como este.

### 3.4 Otros casos del mismo tipo

| Caso | Qué se observa | Qué se hace | Cómo se verifica |
| --- | --- | --- | --- |
| **Resultado de un subagente** | El informe final de un subagente llega al agente que lo despachó y **no a la persona** | Se relaya lo que importa: conclusiones, decisiones, rutas y lo que no se pudo verificar. No se dice «ver el informe del subagente» | Lo que se afirma a la persona está en el informe; lo no verificado se dice como tal |
| **Tarea en segundo plano** | La tarea notifica sola al terminar | Se sigue con otro trabajo; no se sondea en bucle ni se duerme esperando; **no se anticipa ni se inventa su resultado**. Si la persona pregunta antes, se dice que sigue corriendo | El resultado citado es el de la notificación |
| **Herramienta ausente en el host** | Un comando no existe en la máquina donde corre el agente | Se ejecuta en un **contenedor efímero** con la imagen que la trae, montando sólo lo necesario. **No se concluye que no se puede**, ni que un servicio está caído porque el host no lo alcanza: se prueba desde donde sí lo alcanza | La salida del comando corrido en el contenedor, con la imagen declarada |
| **Credencial compartida en la conversación** | La persona pega un token, una clave o una contraseña para una tarea | Se usa **sólo** para esa tarea y en memoria de proceso: variable de entorno o parámetro de una sola invocación. **Nunca** a un archivo, un commit, un registro, un informe, la memoria persistente ni la descripción de un pull request. Si llegó a algo empujado, es un secreto publicado: `Expediente-Rules.md` §4, S2 | Búsqueda del valor sobre el árbol de trabajo, el historial y la memoria: cero ocurrencias |
| **Fecha que cambia a mitad de sesión** | El entorno avisa que el día cambió | Toda fecha que se asiente desde ahí —control de cambios, testimonio, nombre de registro— es la nueva. **Lo ya asentado con la fecha anterior no se reescribe** | El reloj del sistema, consultado al asentar |
| **Archivo cambiado fuera del agente** | Aviso de modificación, o la edición falla porque el texto ya no coincide | Se relee y se integra. **No se revierte**: pudo hacerlo la persona o una herramienta suya | El contenido releído |
| **Memoria que contradice el árbol** | Una nota de memoria afirma algo que el repositorio ya no sostiene | Manda el árbol verificado; se corrige la nota | La búsqueda o la lectura que la contradice |

## 4. Decisiones ya tomadas

| Bifurcación | Decisión | Criterio |
| --- | --- | --- |
| Norma o conocimiento | **Conocimiento.** Ninguna regla nombra el entorno de ejecución | El framework corre con cualquier herramienta que despache agentes; normar una la volvería parte del método |
| Nombrar la herramienta | **No se nombra** ni se describe su implementación | Las marcas y los mensajes cambian por versión; la verificación por búsqueda no |
| Clasificar por tema o por existencia | **Por existencia del texto**, buscada | Un aviso técnico parece del framework; sólo la búsqueda lo desmiente |
| Retransmitir por defecto | **No**, salvo pertinencia a la tarea | Un aviso repetido en cada respuesta entrena a la persona a no leer los cierres |
| Dónde vive la preferencia de no repetir | **Memoria del agente** | Es preferencia de una persona sobre un producto que no es del framework |
| La memoria frente a la persona | **La persona en la sesión manda** | La memoria es un registro de lo que dijo antes, no una regla |
| Herramienta ausente | **Contenedor efímero antes que «no se puede»** | La ausencia es del host, no de la capacidad |

## 5. Esqueletos de referencia

### 5.1 Clasificación declarada de un texto

```text
TEXTO: «{{extracto literal, sin secretos}}»
TÉRMINOS BUSCADOS: {{dos o tres términos distintivos}}
BÚSQUEDAS:
  framework (sin _legacy/):  {{comando}} → {{n}} ocurrencias pertinentes
  destino:                   {{comando}} → {{n}}
  prompt de invocación:      {{cómo se buscó}} → {{n}}
  memoria del agente:        {{cómo se buscó}} → {{n}}
FORMA OBSERVABLE: {{turno de la persona | archivo | marca de sistema | resultado de invocación}}
CLASE: O1 | O2 | O3 | O4 | O5
DUEÑO: {{quién lo corrige}}
DEFECTO DEL FRAMEWORK: no | F1 | F2 | F3, con su cita
```

### 5.2 Preferencia registrada en la memoria del agente

```text
Preferencia: no retransmitir el aviso de {{descripción por contenido}}.
Origen: entorno de ejecución del agente, verificado el {{fecha}} con cero ocurrencias en framework,
destino, prompt y memoria.
Por qué: la persona declaró que no usa {{capacidad}}.
Excepción: mencionarlo una vez si una tarea necesita esa capacidad.
```

### 5.3 Respuesta a la persona

```text
Ese aviso no sale del framework ni del proyecto: busqué {{términos}} en los dos, en el prompt y en mi
memoria y no aparece. Lo agrega la herramienta que me ejecuta. Dejé registrado que no lo repita; si
querés que deje de llegar del todo, se configura en esa herramienta.
```

## 6. Criterios de aceptación

- [ ] `[enumerable]` Todo cambio motivado por un texto de la conversación declara la clase de origen con las búsquedas de §5.1 y su salida.
- [ ] `[enumerable]` Ninguna clasificación O4 omite alguno de los cuatro lugares de búsqueda.
- [ ] `[enumerable]` Ningún commit, archivo, registro, informe ni memoria contiene el valor de una credencial compartida en la conversación.
- [ ] `[enumerable]` Tras una preferencia declarada por la persona sobre un aviso O4, el aviso no vuelve a aparecer en las respuestas, salvo la excepción de pertinencia.
- [ ] `[enumerable]` Ninguna intervención sobre el framework cita como motivo un texto clasificado O4 sin declarar F2 o F3.
- [ ] `[interpretativo]` Lo que la persona necesita de un informe de subagente le llegó relayado, sin remitirla a un informe que no ve.
- [ ] `[interpretativo]` Ninguna conclusión de «no se puede» se apoyó sólo en la ausencia de una herramienta en el host.

## 7. Anti-patrones

| Anti-patrón | Por qué |
| --- | --- |
| **Corregir el framework por un aviso del entorno** | Se edita una norma que no produjo el texto; el aviso sigue llegando y la norma queda con un cambio sin causa |
| **Retransmitir cada aviso del entorno en cada respuesta** | Ruido que la persona aprende a ignorar, y con él los cierres que sí importan |
| **Clasificar por el tono del texto** | Un aviso técnico parece del framework; sin búsqueda, la clasificación es opinión |
| **Buscar sólo en el framework** | Descarta O2 pero no distingue O3 ni el prompt de invocación, que no está en ningún repositorio |
| **Tratar la memoria como regla** | Congela una preferencia vieja por encima de lo que la persona dice hoy |
| **Remitir a la persona al informe de un subagente** | No lo ve; recibe una referencia vacía |
| **Esperar una tarea en segundo plano sondeando, o anticipar su resultado** | Consume la sesión o afirma algo que todavía no pasó |
| **Declarar caído un servicio que el host no alcanza** | La ausencia de ruta desde el host no es ausencia del servicio |
| **Guardar una credencial «para la próxima»** | Un secreto en un archivo o en la memoria es un secreto por revocar |
| **Reescribir fechas ya asentadas tras un cambio de día** | Un registro corregido después deja de ser registro |

## 8. Frontera con las reglas

**No redefine ninguna pieza normativa.** El origen del hecho, la pregunta previa y la detención viven en
`Master-Prompt.md` §8.1 y §9; la escalada, en `Mesa-Rules.md` §7; la respuesta a un secreto publicado,
en `Expediente-Rules.md` §4, S2. Este documento **las cita** y agrega una clasificación que ninguna de
ellas hace: la del origen de un texto de la conversación, que no es un hecho del repositorio.

**No sustituye nada** y no contradice el piso: ningún ítem de esas reglas habla del entorno de
ejecución del agente, y lo que §2 y §3 declaran es conducta sobre una clase de texto que el conjunto
normativo no mira. Si una regla llegara a contradecir este documento, **manda la regla**
(`Rules-Base-Conocimiento.md` §0.4).

**No define criterios de aceptación de ningún artefacto que el framework genere.** Los de §6 se
verifican sobre la conducta del agente y sus rastros —commits, registros, memoria—, no sobre entregables
de categoría.

## 9. Trazabilidad

| | |
| --- | --- |
| **Índice** | [`Index-Knowledge.md`](Index-Knowledge.md) |
| **Hermanos** | Ninguno |
| **Relacionados que cita** | [`Knowledge-Mesa-De-Expertos-A-Pedido.md`](Knowledge-Mesa-De-Expertos-A-Pedido.md) §3.1; [`Knowledge-Conformacion-Pull-Request-Manual.md`](Knowledge-Conformacion-Pull-Request-Manual.md) |
| **Consumidor** | `transversal`. Sin condición de carga: se aplica cuando un texto de la conversación pide algo y su origen no es evidente, o cuando alguien pregunta por qué el agente hizo o dijo algo |
| **Artefacto de referencia** | Ninguno. Lo caracterizado es una convención de conducta |
| **Origen de lo caracterizado** | El caso del aviso de conectores del 2026-09-14 y las conductas observadas en corridas sobre destinos del framework, declarados con su fuente en `SDD/Devs/Guides/Coherencia-Entorno-De-Ejecucion-Del-Agente.md` §3 |

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-09-14 | Emisión inicial. Cataloga la clasificación verificada del origen de un texto de la conversación en cinco clases, el tratamiento de cada pieza del entorno de ejecución del agente, la preferencia de no repetir un aviso registrada en la memoria del agente, el criterio F1–F3 para distinguir una lectura de un defecto del framework, y siete casos del mismo tipo, sin redefinir ninguna pieza normativa. |
