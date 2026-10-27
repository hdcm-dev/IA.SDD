# Excepción a un conocimiento — cómo se deja de seguir un documento de la base que rige, y cómo se eleva

**Alias:** Excepcion-A-Un-Conocimiento
**Naturaleza:** propio
**Tema:** Excepción a un conocimiento que rige: se deja de seguir un documento de la base sólo por contradicción y no por conveniencia, con una ficha que trae la alternativa de cumplir y su costo, un análisis del camino de compromiso con criterios citados y uno o dos caminos, el default mientras quien pidió decide y el apartado de cierre; se carga al proponer, juzgar, analizar, votar o aplicar una excepción
**Consumidor:** transversal
**Condicion-de-carga:** —
**Hereda-de:** —
**Sustituye:** —
**Compatible-con:** Rules-Base-Conocimiento.md 2.3
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-10-23

---

## 0. Propósito y alcance

Caracteriza **la convención con la que se deja de seguir un documento de conocimiento que rige el
objeto**: cuándo se admite, qué se escribe, quién lo juzga, cómo se elige el camino de compromiso, qué se
hace mientras quien pidió decide y cómo queda en el cierre. Se carga entero al actuar sobre una excepción:
- quien propone no seguir un conocimiento que rige: en una mesa, la comisión; fuera de ella, el agente que
  aplica;
- el refutador que juzga la ficha;
- el análisis de decisiones que escribe el camino de compromiso;
- el jurado que la vota;
- quien aplica el camino provisorio.

**Terminología.** Cuatro figuras que no se confunden:

| Término | Qué designa | Dónde vive |
| --- | --- | --- |
| **Excepción a un conocimiento** | La decisión de no seguir un documento de esta base que rige el objeto. En su origen se llamaba «apartamiento» | Este documento |
| **Apartamiento declarado** | El ADR por un artefacto obligatorio del método que no se emite | `SDD/Devs/Rules/Root-Rules.md` §11 |
| **Desviación** | Un documento de conocimiento que contradice una regla y lo declara con su justificación | `SDD/Devs/Rules/Rules-Base-Conocimiento.md` §0.4 y §6.1 |
| **Desvío** | El código que se aparta de una decisión cerrada | `SDD/Devs/Rules/Mesa-Rules.md` §6.1 |

**La ficha de una excepción no entra en `restricciones_duras`** del contrato de entrada de una mesa
(`Mesa-Rules.md` §4): ese campo lleva los apartamientos declarados de `Root-Rules.md` §11, que son otra
cosa. Una excepción a un documento consultivo no se vuelve no negociable por llamarse parecido.

**Qué queda explícitamente afuera:**

| Qué | Dónde vive |
| --- | --- |
| La mesa a pedido entera —lectura del pedido, panel, despacho, expediente, criterio de corte— | `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md`. Este documento la cita sólo para los roles |
| La forma de razonar antes de recomendar: dónde cae cada opción, el obstáculo, la reversibilidad | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md` |
| Un artefacto obligatorio del método que no se emite | `Root-Rules.md` §11, apartamiento declarado |
| Un documento de conocimiento que contradice una regla | `Rules-Base-Conocimiento.md` §0.4: manda la regla, salvo la desviación justificada |
| La forma de una detención del orquestador | `SDD/Devs/Orchestrator/Master-Prompt.md` §8.1 |
| Los disparadores de escalada de una mesa | `Mesa-Rules.md` §7 |

## 1. Identidad del artefacto

| | |
| --- | --- |
| **Qué es** | Una convención de proceso: una ficha, una refutación, un análisis del camino de compromiso, un veredicto y una pregunta en el cierre, cada uno en su folio |
| **Quien propone** | En una mesa, la comisión que sostiene que una convención que rige no se puede cumplir; fuera de una mesa, el agente que aplica. Escribe la ficha (§5.1) |
| **Refutador** | Juzga la admisibilidad de la ficha y ataca la premisa con **«¿cuánto cuesta realmente cumplir?»**. Una ficha sin refutación foliada no llega al jurado |
| **Análisis de decisiones** | Entra sólo cuando el refutador admitió una ficha. Escribe el análisis del camino de compromiso (§5.3) en **un solo folio**, con una sección por ficha. **No ataca ni vota**. Fuera de una mesa, lo hace quien propone la excepción |
| **Jurado** | Vota la ficha y si el camino recomendado está fundado, con las reglas de `Mesa-Rules.md` §6.4 |
| **Quien pidió** | Elige entre dos caminos, **valida** el único o pide otro. Es el único que aprueba |
| **Quien aplica** | Sigue el camino provisorio, si lo hay, sin apoyar en él nada irreversible (§4) |
| **Supuestos** | Hay un documento de esta base que rige el objeto —una fila del índice que se barre: el del framework que corre o el de un fork en su ruta—, y su sección se puede citar literal. Una «convención de la casa» fuera de ese índice es una regla o decisión del producto y no pasa por este documento (`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §3.4). En una mesa, los roles son los de `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §1 |

## 2. Estructura

| # | Acto | Quién | Folio |
| --- | --- | --- | --- |
| 1 | **Ficha** | Quien propone | Un folio `informe` propio, con el siguiente número libre (§5.1). Una ficha por decisión |
| 2 | **Refutación** | Refutador | Su informe juzga la admisibilidad de cada ficha y la ataca. Una ficha **inadmisible no va al jurado**: se cumple la convención, y la ficha figura en el cierre como «no admitida», con la propuesta de cambio si la hubo |
| 3 | **Análisis del camino de compromiso** | Análisis de decisiones | Un folio, con una sección por ficha admitida (§5.3). Sin ficha admitida, no se convoca |
| 4 | **Veredicto** | Jurado | Su folio de veredicto vota la ficha y si el camino recomendado está fundado |
| 5 | **Cierre** | Quien preside | El apartado «Excepciones a conocimientos» (§5.2), con la pregunta a quien pidió y el default. **La excepción no se asienta por silencio** |
| 6 | **Respuesta** | Quien pidió | Su folio cita la ficha por `XC-<n>` y dice qué camino eligió o validó. Hasta entonces, rige el default de §4 |

**Lo publicado no se reescribe.** Lo que pasa después de la ficha —la refutación, el análisis, el
veredicto, el estado y la aprobación— no se escribe sobre la ficha: lo asientan los folios que actúan y la
citan por `XC-<n>`, y el apartado de cierre da el estado vigente de cada una.

## 3. Contrato de uso

**La regla general.** Rige para quien aplica este documento:

| Cláusula | Qué dice |
| --- | --- |
| **Un precedente del producto no es una regla** | Un patrón que ya está en el repositorio —una clave de configuración, una tabla, una forma de resolver algo parecido— no desplaza a un documento de la lista de los que rigen (`Master-Prompt.md` §6; en una mesa, el barrido de `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §3.4) que trata la misma materia. Frente a una **regla** sigue mandando la regla (§4); esto sólo dice que un **precedente** no es una regla |
| **Contradicción, no conveniencia** | Dejar de seguir un documento que rige se hace por contradicción, y deja la ficha de §5.1: el documento y la sección, la alternativa de cumplir, lo que costaría, la contradicción que lo impide, el análisis del camino de compromiso, su estado y quién lo aprobó. «Es más simple», «no aplica del todo» o «ya había un patrón parecido» no son contradicciones: en ese caso **se cumple**, y si el documento parece mal calibrado se propone cambiarlo (`Conocimiento/Knowledge-Cadena-De-Consecuencias.md` §3, «La restricción también es una opción»), y la propuesta rige recién cuando se apruebe |
| **Con caminos, no con un sí o no** | La excepción sale con un análisis del camino de compromiso de cuatro pasos (§5.3): **(1) alternativas**, con la más cercana a cumplir siempre entre ellas; **(2) criterios con peso**, tomados de estándares citados, con dos fijos —cercanía a cumplir y reversibilidad— y los pesos escritos antes de puntuar; **(3) uno o dos caminos** fundamentados, con una recomendación y la reversibilidad de cada uno; **(4) quien pidió elige** entre dos caminos, valida el único o pide otro |
| **Qué admite una ficha** | Mostrar la contradicción con **E1** (se midió: comando y salida) o con **E2** (se cita: archivo y línea donde la regla o el ADR lo dice), en la escala de `Mesa-Rules.md` §6.1. La restricción dura, la regla o el ADR que impide cumplir **es** E4; lo que admite la excepción es mostrar que choca. Una ficha cuyo «Por qué no se cumple» sólo trae E3, E4 o C **no se admite** |

**El filtro «¿Contradicción o conveniencia?»**, antes de proponer una excepción:

| La pregunta | Si la respuesta es sí | De dónde sale |
| --- | --- | --- |
| ¿Cumplir el documento es **imposible o contradictorio** con una restricción dura, una regla o un ADR `Aceptado`, con ancla E1 o E2? | Se escribe la ficha (§5.1) y la excepción se eleva en el cierre con el análisis del camino de compromiso (§5.3): uno o dos caminos fundamentados, no una pregunta de sí o no | Dos mesas de un destino privado, con cinco días de diferencia, dejaron de lado una tabla de parámetros que la convención de la casa mandaba usar. Una planeó una configuración propia porque «la tabla no existe» y llevó a quien pidió la falta de la tabla como obstáculo, no la opción de crearla. La otra nombró la tabla como polo de la tensión y la descartó por el aislamiento por aplicación y por un precedente del repositorio, sin el costo de cumplir y sin elevarlo: quien pidió se enteró preguntando. **Nombrar la alternativa no alcanza**: hace falta su costo y la elevación. Medido en un destino privado, no reproducible desde esta copia |
| ¿Cumplir es **posible pero peor** —más caro, menos simple, «no aplica del todo», «ya había un patrón parecido en el repositorio»—? | **Se cumple.** Si se sostiene que la convención está mal calibrada, se escribe una propuesta de cambio, que rige recién cuando se apruebe | El mismo caso: el precedente del repositorio pasó por norma |

**Si la excepción ya se ejecutó sin ficha**, el filtro no lleva a escribirla ahora: es un hallazgo (§4, «Una
excepción ya ejecutada sin ficha»), y la ficha nace sólo si alguien sostiene hoy que cumplir es imposible.

## 4. Decisiones ya tomadas

**Mientras quien pidió decide, el default depende de qué impide cumplir y de si el camino es reversible.**
Cada rama es una salida distinta:

| Qué impide cumplir | Default | Qué dice el registro |
| --- | --- | --- |
| **Rama de la regla**: una regla del framework o del destino, o una decisión aceptada del producto —un ADR `Aceptado` o la fuente de verdad que el producto declare—, **que manda otra cosa para la misma materia** | **Rige ella**, que ya manda: frente a un documento de conocimiento manda la regla (`Master-Prompt.md` §6; `Rules-Base-Conocimiento.md` §0.4), y un ADR `Aceptado` sólo lo supera otro ADR aprobado (`SDD/Devs/Rules/Rules-Arquitectura-Tecnica.md` §3.3). La pregunta es «¿cuál cede?» | La excepción queda como **deuda con su evento de cierre**: el ADR que la supere o el cambio de la convención |
| **Una imposibilidad sin medir**: quien la sostiene no puede medirla porque le falta el acceso | Es **un obstáculo y no una decisión** (`Conocimiento/Knowledge-Cadena-De-Consecuencias.md` §3): la medición se pide en el momento a quien tiene el acceso | La ficha queda **«sin admitir»**. No hay camino provisorio y no avanza nada que dependa de la excepción. El análisis puede adelantarse. Una ficha condicionada a una medición que no se hizo no es una imposibilidad medida |
| **Rama de la reversibilidad, camino reversible**: una restricción dura, una imposibilidad medida o citada, o una regla o decisión que **sólo prohíbe el medio** que el documento exige —la prohibición rige igual, pero no dice qué hacer en su lugar— | **Se avanza con el camino recomendado, marcado como provisorio** | «Provisorio, sin aprobar». El ADR que lo escriba queda `Propuesto`, y el camino es deuda cuyo evento de cierre es la respuesta de quien pidió. Ningún paso irreversible se apoya en él hasta esa respuesta: el merge, una etiqueta o una publicación (`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §0, renglón 2), borrar o migrar datos con pérdida, publicar un contrato o desplegar a producción. Es la misma lista en los dos documentos |
| **Rama de la reversibilidad, camino no reversible** | **Se espera** | «En espera, sin aprobar». El ADR igual se escribe `Propuesto`. No avanza lo que depende de la excepción; el resto del trabajo sigue |

En las dos ramas de la reversibilidad, el ADR pasa a `Aceptado` cuando quien pidió elige o valida un
camino. **En la rama de la regla el análisis se escribe igual**, porque toda ficha admitida lo lleva (§2): sus
caminos dicen qué se haría si cede la regla, y el cierre pregunta «¿cuál cede?» con ellos a la vista.

| Bifurcación | Decisión | Criterio |
| --- | --- | --- |
| Default ante una imposibilidad | **«Cumplir» no es default** | Una excepción se admite sólo si cumplir es imposible o contradictorio (§3): «se cumple» elegiría justo lo que se demostró que no se puede |
| Silencio de quien pidió | **No asienta nada**: la excepción queda «sin aprobar» y rige el default de la tabla de arriba | Un provisorio no es un aprobado |
| Autocorrección | **Una excepción no se autocorrige, y la pregunta sale igual** | La convención que rige entró como decisión cerrada (`Mesa-Rules.md` §4, `decisiones_cerradas`); no seguirla es reabrir una decisión cerrada, que es arbitraje y no autocorrección (`Mesa-Rules.md` §7, disparador 7), y sólo lo aprueba quien pidió. Si su origen es de la corrida, el cierre lo dice así: «la autocorrección no alcanza porque reabre una decisión cerrada (la convención que rige); es arbitraje de quien pidió». No hace falta una pregunta aparte sobre el método |
| Una excepción ya ejecutada sin ficha, que encuentra otra mesa | **Es un hallazgo, no una ficha retroactiva**: la comisión que la encuentra lo emite con E1 o E2 —el documento que rige y lo que se hizo en su lugar—, y el jurado decide cumplir con un parche. Si alguien sostiene que cumplir es imposible, escribe la ficha ahora, a su nombre, y sigue el ciclo de §2. La decisión que la ejecutó, si el pedido la pone en revisión, es el objeto y no una decisión cerrada (`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §3.4): no la ampara y no hay disparador 7. Si no está en revisión y entró como decisión cerrada, son dos decisiones cerradas en conflicto: el disparador 7 de `Mesa-Rules.md` §7 | Nadie escribe una ficha en nombre de quien no la escribió: lo publicado no se reescribe, y una ficha tardía fingiría una elevación que no ocurrió |
| La mesa ante una excepción | **No se detiene**: la excepción sale en el cierre, en el lote de las preguntas, con uno o dos caminos y el default | Es el mismo umbral que reabre una decisión cerrada. Convive con una delegación de quien pidió del tipo «la mesa decide»: la mesa no se frena, pero una excepción nunca se asienta por silencio |

## 5. Esqueletos de referencia

### 5.1 La ficha

```text
EXCEPCIÓN XC-{{n}}
  Conocimiento:           {{alias}} {{versión}} §{{sección}} — «{{texto literal del ítem}}»
  Alternativa de cumplir: {{qué habría que hacer para cumplirlo, concreto: tabla, migración, código}}
  Costo de cumplir:       {{medido donde cae: comando y salida}}
  Por qué no se cumple:   {{la contradicción, con ancla E1 o E2; la conveniencia no es motivo admisible}}
  Reversibilidad:         {{qué cuesta volver a cumplir después}}
  Sostiene:               {{quien propone; en una mesa, la comisión y el folio de su informe}}
  Aprobó:                 pendiente — sale en el cierre (§5.2)
```

- **Es un folio propio**: `actuaciones/NNN-informe-ficha-de-excepcion-<n>.md`, de tipo `informe`, con el
  siguiente número libre de la serie al incorporarse (`SDD/Devs/Rules/Expediente-Rules.md` §3.1), y autor
  quien propone. `<n>` numera las fichas del expediente desde 1 y da el identificador `XC-<n>`. No comparte
  número con el informe de la comisión: la foliatura es contigua, un número por archivo (`Expediente-Rules.md`
  §6, A3). Ninguna ruta de ficha se asigna de antemano: quien propone la deja en su ruta de trabajo,
  `<rol>-ficha-<n>.md` junto a su informe, y quien preside la incorpora sin editarla
  (`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §2.3, «Dónde escribe cada rol»). Donde los informes
  son secciones del registro de la mesa (ese §2.3: en un destino, si la mesa cumple `Mesa-Rules.md` §0.0), la
  ficha es una sección más, y donde el cierre pide `{{folio}}` va esa sección.
- **Una ficha por decisión**, aunque toque varias secciones del documento: van todas en «Conocimiento».
- **«Costo de cumplir» mide la alternativa más barata** que ve quien propone; las otras las mide o las
  descarta el refutador.
- **«Aprobó» es un campo de la ficha y nace `pendiente`**, porque la pregunta sale recién en el cierre. Lo
  completa la respuesta de quien pidió, en su propio folio —«eligió o validó C-n», o «pidió otro camino»,
  con fecha y folio—, o el cierre con «sin respuesta: rige el default de §4, sin aprobar». **Nunca lo
  llena quien propone ni la mesa.**
- **Una ficha sin «Alternativa de cumplir» concreta, o con un «Por qué» que no es una contradicción, no se
  admite** (§3).

### 5.2 El apartado de cierre

Al bloque de cierre de `Mesa-Rules.md` §6.7, siempre, aunque esté vacío. Fuera de una mesa, al informe con
que se entrega el trabajo:

```text
  FOLIOS
    Informes (convocados + refutador + análisis y perito, si los hubo + roles de interfaz + 2 del jurado): {{n}} — Escritos: {{n}} — {{rutas}}
    Además foliados, fuera de la cuenta: {{presentación, providencia, fichas, plan, cierre}}
  EXCEPCIONES A CONOCIMIENTOS
    XC-{{n}}: {{alias §}} → {{qué se hizo en su lugar}} — ficha {{folio}} — contradicción: {{ancla}}
      Refuta: {{folio}} — Analiza: {{folio}} — Veredicto: {{folio}}
      Estado: {{provisorio: se sigue C-1, reversible | en espera: C-1 no es reversible | rige {{regla / ADR}}: deuda
              | sin admitir: falta la medición {{comando}}, pedida a {{quién tiene el acceso}}}}
      Caminos (análisis {{folio}}): C-1 {{recomendado: qué es, total ponderado, reversible o no}}
        — {{C-2: cuándo convendría más | sin C-2: qué alternativa quedó segunda y qué peso la pondría primera}}
        — criterios: {{estándares citados}}
      {{rama de la reversibilidad (§4): restricción dura, imposibilidad medida o prohibición del medio:}}
      {{con dos caminos: ¿Elegís C-1, C-2 u otro camino? | con uno: ¿Validás C-1 o pedís otro camino?}}
      SI NO RESPONDÉS: {{C-1 reversible: se sigue con C-1, provisorio y sin aprobar, hasta tu respuesta; nada
      irreversible se apoya en él | C-1 no reversible: se espera; no avanza {{lo que depende de la excepción}}}};
      el ADR queda `Propuesto` hasta tu respuesta
      {{rama de la regla (§4): regla o decisión aceptada que manda otra cosa en la materia:}}
      ¿Cuál cede: {{alias §}} o {{regla / ADR}}? SI NO RESPONDÉS: rige {{regla / ADR}}, y la excepción
      queda como deuda con su evento de cierre: {{el ADR que la supere | el cambio de la convención}}
      Origen del hecho: {{de la corrida | ajeno a la corrida}} — {{cómo se calculó, o por qué no se pudo}}
        {{si es de la corrida:}} La autocorrección no alcanza porque {{por qué; en una excepción, el de §4}}
      Aprobó: {{pendiente | quien pidió eligió o validó C-n: folio | pidió otro camino: folio | sin respuesta: rige el default}}
    No admitidas: {{ficha: motivo}} — se cumple la convención
    Propuestas de cambio de convención: {{cada una, con SI NO RESPONDÉS: rige la convención vigente}}
    (ninguna) — si no hubo
```

**La cuenta compara informes**, o sus secciones donde lo son: comisiones convocadas, refutador, análisis de
decisiones si se convocó, perito si lo hubo, cada rol convocado de la clase «interfaz en ejecución» y los dos
del jurado, el de composición y el de veredicto (`Mesa-Rules.md` §2.2, ítems 2 y 5). Con seis comisiones,
6 + 1 + 2 = 9; con una ficha admitida, el análisis suma uno: 10. **Las fichas no cuentan**: se folian y se
listan aparte, como la presentación, la providencia, el plan y el cierre. Las preguntas de este apartado van
en el mismo lote que las demás del cierre.

### 5.3 El análisis del camino de compromiso

Lo escribe el análisis de decisiones, en un folio, con una sección por ficha admitida:

```text
ANÁLISIS DEL CAMINO DE COMPROMISO — XC-{{n}} (ficha {{folio}})
  Sigue rigiendo:          {{lo del documento que se puede cumplir, por sección: se cumple}}
  Fuera del documento:     {{la materia que la imposibilidad deja sin cubrir; ahí la referencia es el estándar citado}}
  Alternativas:            Alt-1 {{la más cercana a cumplir}} — Alt-2 … Alt-n {{las otras}}
    Descartadas antes de ponderar: {{alt: la contradicción que la hace imposible, con ancla E1 o E2}}
  Criterios y pesos (fijados antes de puntuar):
    K-1 Cercanía a cumplir — peso {{w}} — fuente: el documento que rige, {{alias §}}
    K-2 Reversibilidad     — peso {{w}} — fuente: `Cadena-De-Consecuencias` §2, paso 4
    K-3 {{criterio}}       — peso {{w}} — fuente: {{estándar, con apartado sólo si se verificó}} — por qué pesa así: {{una línea}}
  Ponderación:             {{tabla alternativa × criterio, puntaje 0 a 3 con una línea de evidencia por celda; total ponderado}}
  Caminos:
    C-1 (recomendado) {{alt}}: {{fundamento}} — reversible | no reversible: {{qué cuesta volver a cumplir}}
    C-2 {{si lo hay}} {{alt}}: {{qué peso, cambiado, lo pone primero, o por qué es el más cercano a cumplir;
      si las dos condiciones señalan otra alternativa, C-2 es la más cercana y se nombra la otra con su peso}}
    Sin C-2 {{si no lo hay}}: {{la alternativa que quedó segunda}} — {{qué peso tendría que tener qué criterio
      para ponerla primera, y por qué ese cambio no es razonable}}
  Mientras se decide:      {{provisorio: se sigue C-1 | en espera: no avanza {{qué}} | rige {{regla / ADR}}}}
```

- **La alternativa más cercana a cumplir siempre se enumera**, aunque pierda: es la que deja regir todo lo
  del documento que sí se puede cumplir. Si quien propone no la vio, la agrega el análisis. Es la que
  pierde menos convención, y quien pidió tiene que verla para poder elegirla. Las alternativas imposibles
  se descartan con su ancla.
- **Los criterios salen de estándares de la industria y se citan** con su fuente: por ejemplo, ISO/IEC
  25010 para las características de calidad, The Twelve-Factor App para la configuración, OWASP para la
  seguridad, la documentación oficial de la plataforma que se usa o una RFC para un protocolo. **No se
  inventan cláusulas**: si no se verificó el apartado, se cita la norma sin apartado. Un criterio que sólo
  se apoya en un precedente del producto no entra (§3). **Los dos fijos son del método**: K-1 mide cuánto
  del documento sigue rigiendo, y K-2, qué cuesta volver.
- **Lo que el documento cubre y se puede cumplir sigue rigiendo.** En la materia que la imposibilidad deja
  fuera del documento, la referencia es el estándar citado, nunca un precedente del producto ni la
  preferencia de quien analiza, y el análisis dice qué materia quedó afuera.
- **Los pesos se escriben antes de puntuar**, con una línea de fundamento, y cada celda lleva su
  evidencia. Un puntaje que sólo se apoya en `C` se marca y no desempata.
- **Uno o dos caminos, nunca más**, con la ponderación a la vista y una recomendación. El segundo va sólo
  si un cambio razonable de pesos invierte el orden, o si es el más cercano a cumplir y no ganó. **Si las
  dos condiciones señalan alternativas distintas, C-2 es la más cercana a cumplir**, y la que un cambio de
  pesos pondría primera se nombra en la línea de caminos con el peso que la pondría primera, como en «Sin
  C-2». **Sin segundo camino, el análisis igual dice qué alternativa quedó segunda y qué peso la pondría
  primera**: «razonable» lo juzga quien analiza, y quien pidió tiene que ver ese juicio para validar el
  único camino, o pedir el otro.
- **Reversible** es un camino del que se vuelve a cumplir con un cambio acotado, sin pérdida de datos, sin
  romper un contrato publicado y sin efecto en terceros. Lo mide el análisis con la «Reversibilidad» de la
  ficha.
- **Mientras se decide** rige la tabla de §4. Sin la medición de la imposibilidad no hay «mientras se
  decide»: la ficha está «sin admitir».
- **Quién sigue el provisorio y dónde vive el ADR.** Lo sigue quien aplica el plan; si el pedido no
  designa a nadie, el plan lo marca provisorio y el cierre lo lista como deuda. El ADR va al registro de
  decisiones del producto (`Rules-Arquitectura-Tecnica.md` §3.3); si no hay árbol del producto, va en la
  resolución como parche del plan, con su texto exacto y marcado como propio de la presidencia.

**Por qué así.** Un sí o no con default «cumplir» ante una imposibilidad detenía el trabajo sin que nadie
eligiera nada: en el caso de origen, el servicio no salía. Tomar lo reversible y anotar la condición para
revisarlo es la cadena de consecuencias (`Conocimiento/Knowledge-Cadena-De-Consecuencias.md` §2, paso 4) y
la distinción entre decisiones que se pueden deshacer y las que no (Jeff Bezos, carta a los accionistas de
Amazon de 2015, «tipo 1» y «tipo 2»). El provisorio como ADR `Propuesto` es el uso de sus estados (Michael
Nygard, «Documenting Architecture Decisions», 2011).

## 6. Criterios de aceptación

Se verifican sobre el expediente o el informe donde se asentó la excepción, no sobre un artefacto del
framework.

- [ ] `[enumerable]` Cada excepción a un documento que rige tiene su ficha como folio `informe` propio,
      con la alternativa de cumplir, su refutación, su veredicto y el campo «Aprobó» (§5.1).
- [ ] `[enumerable]` El cierre trae el apartado «Excepciones a conocimientos», y cada excepción salió con
      su pregunta, su origen del hecho y el default de §4.
- [ ] `[enumerable]` Cada ficha admitida tiene su análisis del camino de compromiso (§5.3) con la
      alternativa más cercana a cumplir, criterios con su fuente y pesos, la ponderación, uno o dos
      caminos con recomendación y la reversibilidad de cada uno; y el cierre declara su estado.
- [ ] `[enumerable]` Ninguna ficha figura en `restricciones_duras` de un contrato de entrada.
- [ ] `[enumerable]` La cuenta de folios del cierre no suma las fichas (§5.2).
- [ ] `[interpretativo]` Ningún criterio del análisis se apoya en un precedente del producto ni en una
      cláusula de un estándar que no se pudo verificar.
- [ ] `[interpretativo]` Ninguna excepción se admitió por conveniencia, y ninguna salió como un «¿lo
      aprobás?».

## 7. Anti-patrones

| Anti-patrón | Por qué |
| --- | --- |
| **Elevar una excepción como «¿lo aprobás?»** | Quien pidió recibe un sí o no sin caminos, y el default lo detiene o lo aprueba sin elegir. Sale con uno o dos caminos fundamentados (§5.3) |
| **Ponderar con criterios sin fuente, o fijar los pesos después de puntuar** | La ponderación confirma la preferencia de quien analiza. Los criterios salen de estándares citados y los pesos se escriben antes (§5.3) |
| **Dejar de seguir un documento sin la alternativa de cumplir, su costo y su elevación** | La excepción queda «declarada» pero nadie eligió entre alternativas: nombrar la alternativa y descartarla no alcanza; un precedente del repositorio pasa por norma y quien pidió se entera preguntando (§3) |
| **Escribir la refutación, el veredicto o la aprobación sobre la ficha** | Reescribe lo publicado. Cada acto tiene su folio y cita la ficha por `XC-<n>` (§2) |
| **Cargar la ficha como restricción dura** | Una excepción a un documento consultivo termina no negociable (§0) |
| **Autocorregir una excepción** | Reabre una decisión cerrada sin quien la aprueba (§4) |

## 8. Frontera con las reglas

**En su origen era una regla de un destino, de alcance general.** Valía para todo agente y toda mesa de
ese destino, con una guarda que la encendía cuando su índice de conocimiento tenía filas, y exigía el
campo «quién lo aprobó». **En este framework ninguna regla la impone: es consultiva**
(`Rules-Base-Conocimiento.md` §0.4; `Master-Prompt.md` §6, precedencia del conocimiento), y rige para
quien aplica este documento. La guarda no se trajo: acá estaría siempre encendida, y llenar
`Conocimiento/` cambiaría el comportamiento base del framework (`Rules-Base-Conocimiento.md` §0.2).
«Aprobó» es un campo de la ficha (§5.1).

**Dentro de una mesa, la fuerza la da `Mesa-Rules.md`** por el campo `decisiones_cerradas` del contrato de
entrada (§4), cuando el presidente lista ahí las convenciones que rigen el objeto: una decisión cerrada
sólo se reabre con ancla E1 o E2 de contradicción, que es lo que exige §3.

**No es el apartamiento declarado de `Root-Rules.md` §11, ni la detención de `Master-Prompt.md` §8.1**, y
no agrega disparadores a `Mesa-Rules.md` §7: el apartado de §5.2 es un registro del cierre. Ante
conflicto, mandan ellas. **Si un fork tiene una precedencia más estricta** —por ejemplo, que una
desviación en materia sin regla detenga al agente—, **rige la del fork en ese fork**.

**No define criterios de aceptación de ningún artefacto que el framework genere.** Los de §6 se verifican
sobre el expediente.

## 9. Trazabilidad

| | |
| --- | --- |
| **Índice** | [`Index-Knowledge.md`](Index-Knowledge.md) |
| **Hermanos** | [`Knowledge-Mesa-De-Expertos-A-Pedido.md`](Knowledge-Mesa-De-Expertos-A-Pedido.md): los dos salen de partir el mismo conocimiento, y el padre es la puerta |
| **Consumidor** | `transversal`. Sin condición de carga: se carga al proponer, juzgar, analizar, votar o aplicar una excepción. El padre lo nombra en el renglón 6 de §0, en su mapa de carga y en la carta de §5.2 |
| **Artefacto de referencia** | Ninguno. Lo caracterizado es una convención de proceso. Ejemplares a la vista: los expedientes `Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/` y `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/` |
| **Origen** | Un fork de `Mesa-De-Expertos-A-Pedido` en un destino privado, versiones 1.3 a 1.12 (sus secciones de ficha, cierre y análisis), y la regla general de las convenciones comunes de ese destino sobre cómo dejar de seguir un documento aplicable. Incorporados por el expediente `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`, que coteja cada cláusula de esa regla con su lugar acá (`SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` §3) |

**Dependencias:**

| Qué cita | Cómo resuelve | Ancla |
| --- | --- | --- |
| `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §0, §1, §2.3, §3.4 | en el árbol | — |
| `Conocimiento/Knowledge-Cadena-De-Consecuencias.md` §2, §3 | traída a `Cadena-De-Consecuencias` §2 y §3 | — |
| La precedencia del conocimiento frente a la regla | equiparada: `SDD/Devs/Orchestrator/Master-Prompt.md` §6 y `SDD/Devs/Rules/Rules-Base-Conocimiento.md` §0.4 | `SDD/Devs/Orchestrator/Master-Prompt.md:577` (8.21 §6) y `SDD/Devs/Rules/Rules-Base-Conocimiento.md:98-103` (2.3 §0.4) |
| La lista de documentos que rigen | equiparada: `SDD/Devs/Orchestrator/Master-Prompt.md` §6 | `SDD/Devs/Orchestrator/Master-Prompt.md:576` (8.21 §6) |
| «Desvío» | equiparada: `SDD/Devs/Rules/Mesa-Rules.md` §6.1 | `SDD/Devs/Rules/Mesa-Rules.md:384-387` (1.5 §6.1) |
| La fuerza dentro de una mesa | manda `SDD/Devs/Rules/Mesa-Rules.md` §4 | `SDD/Devs/Rules/Mesa-Rules.md:245` y `:249-251` (1.5 §4) |
| ADR `Propuesto` y `Aceptado`, registro de decisiones | equiparada: `SDD/Devs/Rules/Rules-Arquitectura-Tecnica.md` §3.3 y §4.1 | `SDD/Devs/Rules/Rules-Arquitectura-Tecnica.md:130-132` y `:170` |
| La foliatura de la ficha | equiparada: `SDD/Devs/Rules/Expediente-Rules.md` §3.1 y §6 | `SDD/Devs/Rules/Expediente-Rules.md:367-369` (1.1 §6, A3) |
| La escala de ancla, la escalada, el jurado y el cierre | en el árbol: `SDD/Devs/Rules/Mesa-Rules.md` §0.0, §2.2, §4, §6.1, §6.4, §6.7 y §7 | — |
| Apartamiento declarado, detención, desviación, la carpeta vaciable | manda `SDD/Devs/Rules/Root-Rules.md` §11, `Master-Prompt.md` §8.1 y `Rules-Base-Conocimiento.md` §0.2, §0.4 y §6.1 | — |
| `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` §3, `Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/` y `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/` | en el árbol: el cotejo de origen y los ejemplares. Ninguna hace falta para aplicar el documento | — |

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-10-23 | Emisión inicial (framework 13.22, expediente `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`). Sale de partir el conocimiento `Mesa-De-Expertos-A-Pedido` al incorporar la sustancia de su fork 1.15 de un destino privado: la regla general de excepción, cotejada cláusula por cláusula con la de las convenciones de ese destino y traída sin su guarda y con el alcance acotado a quien aplica este documento (§3, §4, §8); la ficha, el apartado de cierre y el análisis del camino de compromiso (§5). Cambia el término: en el origen era «apartamiento», que en este framework designa el ADR de `Root-Rules.md` §11 y entra en `restricciones_duras`. La ficha pasa de folio derivado que compartía el número de su comisión a folio propio de la serie, y lo que el origen completaba después sobre la ficha lo asientan los folios que actúan. Tras la prueba del expediente (folio 018): la ficha se deja en la ruta de trabajo del padre §2.3, la cuenta suma perito y roles de interfaz, y una excepción ya ejecutada sin ficha es un hallazgo (§4). Tras la segunda reproducción (folio 021): la convención fuera del índice no pasa por este documento (§1); la excepción ya ejecutada no se ficha desde el filtro (§3) y la decisión que la ejecutó, puesta en revisión, no es decisión cerrada (§4); la lista de pasos irreversibles es la del padre; la rama de la regla también lleva análisis (§4); la ficha es sección del registro sólo donde los informes lo son (§5.1). |
