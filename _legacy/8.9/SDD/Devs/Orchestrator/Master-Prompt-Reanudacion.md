# Master prompt SDD — Orquestador de reanudación

**Archivo:** `Master-Prompt-Reanudacion.md`
**Versión:** 1.0
**Idioma:** Español rioplatense neutro técnico
**Modo:** lectura y diagnóstico, con detención obligatoria. **No escribe nada del destino salvo su propio informe**
**Prerequisitos:** un repositorio destino con `SDD/` poblado. No exige memoria de ninguna sesión anterior
**Salida:** `SDD/Docs/Audit/Estado-Del-Destino-<AAAA-MM-DD>.md`, y una decisión del humano sobre cuál de los otros dos orquestadores continúa

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

| # | Dimensión | Fuente declarativa | Contraste observable |
| --- | --- | --- | --- |
| 1 | ¿Hay documentación generada? | — | **`SDD/Docs/` tiene contenido** |
| 2 | ¿Contra qué versión del framework? | `PRODUCT-MANIFEST` §1.1, bloque de procedencia | Versiones vigentes en el repositorio fuente |
| 3 | ¿La migración terminó? | El informe de migración más reciente de `SDD/Docs/Audit/` | **Presencia de carpetas `_fusion/`**: si existe alguna, la fusión no terminó |
| 4 | ¿Qué quedó abierto? | Los hallazgos del último informe, con su estado | Enlaces rotos, identificadores de forma anterior, referencias sin anclar |
| 5 | ¿En qué etapa de construcción va? | El registro de cambios del producto | **El historial del repositorio de código** |
| 6 | ¿Qué falta para la siguiente? | El roadmap del producto, sus puertas de etapa | — |

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

**Regla de resolución.** Cuando la fuente declarativa y el contraste no coinciden, **gana el
observable y se declara la divergencia**. Nunca al revés: un documento que dice que algo está hecho
no lo hace.

---

## §2 R0 — Reconocimiento

Sin despachar ningún subagente, y sin escribir nada:

1. **Verificar que hay algo que retomar.** Si `SDD/` no existe o `SDD/Docs/` está vacía, no hay
   destino que reanudar: el que corresponde es el prompt de bootstrap, y este prompt lo dice y
   termina.
2. **Resolver las seis dimensiones** de §1, cada una por su fuente y su contraste.
3. **Registrar cada divergencia** con las dos lecturas, la declarativa y la observable, y con la
   evidencia de cada una. No se resuelve acá: se declara.
4. **Leer los pendientes declarados**: los hallazgos abiertos del último informe de auditoría, las
   filas sin resolver de un plan de migración, y las carpetas `_fusion/` que existan, con su
   inventario.

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

MIGRACIÓN
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

## §4 R2 — Las salidas, y qué implica cada una

Detención obligatoria. **El humano elige; este prompt no.**

| Salida | Cuándo tiene sentido | Qué invoca | Qué hay que saber antes de elegirla |
| --- | --- | --- | --- |
| **A · Reparar primero** | Hay divergencias declaradas en R1 | Ninguno todavía: la reparación se acuerda y se ejecuta, y después se vuelve a R0 | **Es la única salida que las demás dan por hecha.** Elegir B, C o D con una divergencia abierta significa trabajar sobre un estado que el árbol declara mal |
| **B · Migrar a la vigente** | La procedencia está desfasada y el salto alcanza artefactos del destino | `Master-Prompt-Migracion.md` | Cuánto del salto **realmente** alcanza al destino. Un salto de varias versiones que sólo cambió reglas de proceso —cómo migrar, cómo auditar— **no toca ningún artefacto**, y migrar por el número es trabajo sin resultado |
| **C · Seguir en la versión declarada** | El salto no alcanza al destino, o alcanzarlo no es prioridad hoy | `Master-Prompt.md`, que va a volver a detectar el desfase en su reconciliación | La procedencia **sigue diciendo la verdad**: el destino se generó contra esa versión. Lo que no se puede es actualizarla sin migrar, porque eso sí sería falso |
| **D · Continuar la construcción** | La documentación está al día para lo que hace falta y lo pendiente es código | Ninguno de los dos: el ciclo de construcción, con la etapa que el roadmap declara | **El avance del código no depende de la versión del framework.** Es la salida más frecuente y la que más se pasa por alto, porque las otras tres son las que tienen prompt |

**La salida D existe porque la pregunta «cuál de los dos orquestadores corro» tiene con frecuencia la
respuesta «ninguno».** Un destino con su documentación generada y su código a mitad de camino no
necesita ni generar ni migrar: necesita construir. Que las otras tres tengan prompt y ésta no las
vuelve más visibles, no más correctas.

**Actualizar la procedencia sin migrar.** Es un caso de la salida C que merece nombre propio, y sólo
procede cuando **se verificó artefacto por artefacto que el salto no alcanza al destino**. La
verificación se declara en el informe de estado, con la lista de qué cambió en el framework y por qué
cada cosa no lo toca. Sin esa lista, actualizar la procedencia es afirmar algo que nadie comprobó, y
eso es lo que la fase M5 del orquestador de migración existe para impedir.

---

## §5 R3 — El informe de estado

**Se escribe siempre**, cualquiera sea la salida elegida, en
`SDD/Docs/Audit/Estado-Del-Destino-<AAAA-MM-DD>.md`. Es la única escritura de este prompt.

Contiene: las seis dimensiones con su fuente y su contraste, las divergencias con su evidencia, los
pendientes declarados, la salida elegida y **quién la eligió**.

**Por qué se escribe aunque no se haga nada.** Una reanudación que no deja rastro obliga a la
siguiente a rehacer el mismo diagnóstico, y **dos diagnósticos del mismo estado hechos por agentes
distintos no tienen por qué coincidir**. El informe es lo que hace que la reanudación sea barata la
segunda vez.

**No reemplaza al informe de migración ni al de audit.** Declara estado, no veredicto: no aprueba ni
rechaza nada, y no tiene niveles de hallazgo.

---

## §6 Criterios de aceptación

- [ ] [enumerable] Las **seis dimensiones** de §1 están resueltas, cada una con su fuente citada.
- [ ] [enumerable] Las tres dimensiones con contraste observable **se contrastaron**, y el resultado
      está declarado aunque coincidan.
- [ ] [enumerable] Toda divergencia está declarada con **las dos lecturas y la evidencia de cada
      una**, y ninguna se resolvió en este prompt.
- [ ] [enumerable] El informe de estado existe y declara la salida elegida.
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

---

## §8 Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. Tercer orquestador del método, con la cardinalidad de **una vez por reanudación**. Nace de una corrida real donde retomar funcionó **porque el estado vivía en el árbol**, propiedad que el framework apoyaba sin declarar y que por eso nadie verificaba: el registro de cambios de ese destino quedó tres etapas atrás sin que nada lo señalara. Declara las **seis dimensiones del estado**, cada una con su fuente y —en las tres que en esa corrida divergieron— su **contraste observable**, con la regla de que gana el observable y la divergencia se declara. Cuatro salidas, incluida la que no tiene prompt: **continuar la construcción**. |
