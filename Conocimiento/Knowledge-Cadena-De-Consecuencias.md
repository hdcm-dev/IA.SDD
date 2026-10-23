# Cadena de consecuencias — antes de recomendar, seguir cada opción hasta donde cae

**Alias:** Cadena-De-Consecuencias
**Naturaleza:** propio
**Tema:** Cómo se razona antes de recomendar, dictaminar o elegir entre opciones: cada opción se sigue hasta el lugar donde cae su costo, se mide ahí, se dice qué pierde la alternativa y se prefiere la reversible; un obstáculo no es una decisión, una acción denegada no se le pide a otro agente y la restricción también es una opción
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

Caracteriza **una forma de razonar**: la que sigue cada opción hasta su consecuencia antes de escribir
«conviene X». Sirve a quien recomiende, dictamine o elija entre opciones y cargue este documento, en
cualquier rol: un agente que conduce una fase, un orquestador, una comisión, un refutador, un análisis de
decisiones o un jurado. No es un formato: §5 da un esqueleto para cuando la cadena se asienta en un folio,
pero la cadena se corre aunque no se escriba.

**Qué queda explícitamente afuera:**

| Qué | Dónde vive |
| --- | --- |
| La lista cerrada de lo que sale al humano desde una mesa, y su forma | `SDD/Devs/Rules/Mesa-Rules.md` §7 y §7.1 |
| La forma de toda detención del orquestador, con su análisis y su propuesta | `SDD/Devs/Orchestrator/Master-Prompt.md` §8.1 |
| La precedencia entre un documento de conocimiento y la regla de la categoría que lo consume | `SDD/Devs/Orchestrator/Master-Prompt.md` §6 y `SDD/Devs/Rules/Rules-Base-Conocimiento.md` §0.4 |
| Cómo se usa esta cadena dentro de un procedimiento concreto —una mesa, una excepción a un conocimiento— | En el documento de ese procedimiento, que la cita. Éste no cita a ninguno: es una hoja del grafo de citas, y un fork lo puede traer solo (§9) |

## 1. Identidad del artefacto

| | |
| --- | --- |
| **Qué es** | Una convención de razonamiento: cuatro pasos que se corren por cada opción, y cuatro cláusulas que dicen qué hacer cuando lo que frena no es una decisión |
| **Quién la usa** | Cualquier rol que recomiende, dictamine o elija y cargue este documento. No depende de que haya mesa |
| **Cuándo** | Antes de recomendar o descartar una opción, **y otra vez al ejecutar**: los obstáculos que obligan a decidir aparecen cuando se construye, no antes (§3) |
| **Supuestos** | Hay un medio de medir donde cae cada costo —un comando, una lectura del árbol, una pregunta a quien tiene el acceso—, y hay alguien con la pluma sobre las reglas a quien se le puede proponer un cambio |

## 2. Estructura

**La regla.** Ninguna opción se recomienda ni se descarta por lo que es: se recomienda o se descarta por
**lo que produce en el lugar donde cae**, medido ahí. Antes de escribir «conviene X», se sigue X hasta su
consecuencia y se la pesa contra las otras. Cuatro pasos, siempre los cuatro:

1. **¿Dónde cae?** Cada opción tiene un lugar donde su costo se paga: un agente que carga más contexto,
   una persona que pierde una capacidad, un documento que deja de decir la verdad, un release que vuelve a
   publicar un defecto. Nombrarlo.
2. **¿Cuánto pesa ahí?** Medirlo en ese lugar, con comando. «Un montón» y «apenas» no son medidas.
3. **¿Qué pierde la alternativa?** Lo que una opción evita, otra lo paga. Recortar un documento no cuesta
   líneas: cuesta la habilidad que el agente no va a tener cuando la necesite. Subir un techo no cuesta el
   techo: cuesta el contexto del que carga. Decir qué se pierde en cada rama.
4. **¿Es reversible?** Una decisión barata y reversible frente a una cara e irreversible **no es un empate
   que resolver por preferencia**: se toma la reversible y se anota la condición para revisarla.

## 3. Contrato de uso

| Cláusula | Qué dice | Qué hace quien la aplica |
| --- | --- | --- |
| **Un obstáculo no es una decisión, y confundirlos cuesta caro** | Cuando algo frena la ejecución —una escritura que el entorno deniega, un permiso que falta, una herramienta que no está—, antes de elevarlo hay que preguntar: **¿la decisión está tomada y fundada, y lo único que falta es quién tiene la llave?** Una escalada es cuando falta **decidir**; un obstáculo es cuando falta **poder** | Si la respuesta es sí, **no es una escalada: es una pregunta de una línea a quien tiene el permiso, y se hace en el momento**. Archivar un obstáculo como escalada entierra en un informe largo algo que se resolvía preguntando, y le entrega al responsable una pregunta que no necesitaba hacerle |
| **A un agente al que le deniegan una acción no se la pide a otro agente** | Pedírsela a otro convierte a la segunda sesión en la puerta trasera de una decisión de permisos, y el control deja de valer para los dos | Se devuelve a quien puede autorizarlo, con la cadena ya corrida: qué cambia, dónde cae el costo, si es reversible |
| **La restricción también es una opción** | Una regla del framework o del destino es objeto de propuesta: cuando el costo de cumplirla supera el daño que evita, la salida correcta puede ser **proponer cambiarla**, y proponer no es tocar | Lo escribe como propuesta, con el mismo peso medido que cualquier otra opción, y quien la escribe es quien tiene la pluma sobre esa regla. Lo que no vale es leer «la regla es intocable» como «la regla no se discute»: son dos cosas distintas, y confundirlas deja a quien decide buscando caminos adentro de una restricción mal calibrada |
| **La cadena no se corre sólo al planificar** | Los obstáculos que obligan a decidir aparecen **al ejecutar**, no antes: es ahí donde hace falta | Quien la corrió para armar el plan la vuelve a correr al construir. Un agente que la apaga al empezar se queda sin ella justo cuando aparecen las decisiones reales |

## 4. Decisiones ya tomadas

| Bifurcación | Decisión | Criterio |
| --- | --- | --- |
| Reversible frente a irreversible | **No hay empate**: se toma la reversible y se anota la condición para revisarla (§2, paso 4) | La distinción entre decisiones que se pueden deshacer y las que no: Jeff Bezos, carta a los accionistas de Amazon de 2015, decisiones de «tipo 1» y de «tipo 2» |
| Cuántos pasos | **Los cuatro, siempre**, aunque uno parezca obvio | El paso que se salta es el que la mesa no había visto: en el caso de origen (§9) apareció en la segunda vuelta |
| Forma | **Una forma de razonar, no un formato** | Un formato obligatorio se llena sin correr la cadena; la cadena corrida se nota en el folio aunque no tenga plantilla |

## 5. Esqueletos de referencia

Para cuando la cadena se asienta en un folio, una fila por opción:

```text
CADENA DE CONSECUENCIAS — {{decisión}}
  Opción {{n}}: {{qué es}}
    Dónde cae:        {{el lugar donde se paga su costo}}
    Cuánto pesa ahí:  {{la medida}} — comando: {{comando}} — salida: {{salida}}
    Qué pierde la otra: {{lo que paga la alternativa si se elige ésta}}
    Reversible:       {{sí: qué cuesta volver | no: por qué}}
  Recomendación:      {{opción}} — {{si hay una reversible frente a una irreversible: la reversible, con la condición para revisarla}}
  Obstáculos:         {{lo que falta poder, no decidir: a quién se le preguntó, en una línea, y cuándo}}
```

## 6. Criterios de aceptación

Se verifican sobre el folio o el informe donde se recomendó, no sobre un artefacto del framework.

- [ ] `[enumerable]` Toda recomendación o descarte asentado nombra, por opción, dónde cae su costo y
      cuánto pesa ahí, con el comando o la lectura que lo midió.
- [ ] `[enumerable]` Ante una opción reversible y otra irreversible, la recomendada es la reversible, con
      su condición de revisión escrita, o el folio dice qué medida invirtió el orden.
- [ ] `[enumerable]` Todo obstáculo asentado tiene la pregunta de una línea que se le hizo a quien tiene
      el acceso, con su momento.
- [ ] `[interpretativo]` Ninguna acción denegada a un agente se le pidió a otro.
- [ ] `[interpretativo]` Ninguna regla se trató como intocable cuando cumplirla costaba más que el daño
      que evita: o se propuso cambiarla, o el folio dice por qué no.

## 7. Anti-patrones

| Anti-patrón | Por qué |
| --- | --- |
| **«Conviene X» sin seguir X** | La opción se elige por lo que es y no por lo que produce donde cae |
| **«Un montón», «apenas»** | No son medidas: el paso 2 pide comando |
| **Recortar materia para entrar en un techo** | No cuesta líneas: cuesta la habilidad que el agente no va a tener cuando la necesite (§2, paso 3) |
| **Resolver por preferencia un empate entre reversible e irreversible** | No es un empate (§4) |
| **Elevar un obstáculo como escalada** | Entierra en un informe largo lo que se resolvía con una pregunta de una línea, y llega tarde |
| **Pedirle a otro agente la acción que el entorno le denegó a uno** | Vuelve a la segunda sesión la puerta trasera de una decisión de permisos |
| **Buscar caminos adentro de una restricción mal calibrada** | La restricción también es una opción: proponer cambiarla no es tocarla |
| **Correr la cadena al planificar y apagarla al construir** | Las decisiones reales aparecen al ejecutar |

## 8. Frontera con las reglas

**En su origen era una regla de un destino, de alcance general.** Valía para todo agente que recomendara,
dictaminara o eligiera en ese destino. **En este framework ninguna regla la impone: es consultiva**
(`SDD/Devs/Rules/Rules-Base-Conocimiento.md` §0.4; `SDD/Devs/Orchestrator/Master-Prompt.md` §6,
precedencia del conocimiento) y rige para quien carga este documento.

**Dentro de una mesa, la fuerza la da `SDD/Devs/Rules/Mesa-Rules.md`** por su campo `decisiones_cerradas`
(§4), cuando el presidente lista este documento entre las convenciones que rigen el objeto.

**No es la escalada de `Mesa-Rules.md` §7, ni la detención de `Master-Prompt.md` §8.1, ni la precedencia
de `Master-Prompt.md` §6.** Decir que un obstáculo no es una escalada no agrega ni quita disparadores:
dice qué pregunta se hace antes de llegar a ellos. Ante conflicto, mandan esas reglas.

**No define criterios de aceptación de ningún artefacto que el framework genere.** Los de §6 se verifican
sobre el folio donde se recomendó.

## 9. Trazabilidad

| | |
| --- | --- |
| **Índice** | [`Index-Knowledge.md`](Index-Knowledge.md) |
| **Hermanos** | Ninguno: no sale de partir ningún documento |
| **Consumidor** | `transversal`. Sin condición de carga. En este árbol lo citan, y por eso lo cargan quienes aplican esas secciones, `Mesa-De-Expertos-A-Pedido` §3.1 (el bloqueo de un paso prescripto) y `Excepcion-A-Un-Conocimiento` §3, §4 y §5.3 (la restricción como opción, la imposibilidad sin medir y el criterio fijo de reversibilidad) |
| **Artefacto de referencia** | Ninguno. Lo caracterizado es una forma de razonar |
| **Dependencias** | Ninguna en `Conocimiento/`: es la hoja del grafo de citas, y para aplicarlo no hace falta cargar otro documento de la base. Lo que cita fuera de la base es norma del framework, en la tabla de abajo |
| **Origen** | Las convenciones comunes de un destino privado, su sección sobre la cadena de consecuencias, traída íntegra por el expediente `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`. Se reescribió su alcance —en el origen nombraba a los agentes de ese destino— y «una regla del marco» pasó a «una regla del framework o del destino» |
| **De dónde sale** | De una mesa que, ante dos documentos 16 y 12 líneas arriba de su techo, comparó tres formas de acomodarse a él y nunca preguntó si el techo servía. Cuando se preguntó, la respuesta cabía en dos líneas: mover un número que la propia regla declara calibrable es barato y reversible; recortar materia es caro e irreversible. Y cuando se siguió la consecuencia una vez más —«¿y cuánto pesa el techo nuevo en el agente que carga?»— apareció que el techo **no era la palanca del contexto: lo era lo que se despacha** a cada agente. Dos vueltas de la misma cadena, dos decisiones que la mesa no había visto. Medido en un destino privado, no reproducible desde esta copia |

**Dependencias:**

| Qué cita | Cómo resuelve | Ancla |
| --- | --- | --- |
| `SDD/Devs/Rules/Mesa-Rules.md` §4 y §7, §7.1 | manda `Mesa-Rules.md`: la fuerza dentro de una mesa y la escalada | — |
| `SDD/Devs/Orchestrator/Master-Prompt.md` §6 y §8.1 | manda `Master-Prompt.md`: la precedencia del conocimiento y la detención | — |
| `SDD/Devs/Rules/Rules-Base-Conocimiento.md` §0.4 | manda `Rules-Base-Conocimiento.md`: el conocimiento es consultivo | — |
| `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/` | en el árbol: el origen. No hace falta para aplicar el documento | — |

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-10-23 | Emisión inicial (framework 13.22, expediente `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`). Trae íntegra la cadena de consecuencias de las convenciones comunes de un destino privado, que dos documentos de esta base citaban y el árbol no tenía: la regla y sus cuatro pasos (§2), el obstáculo, la acción denegada, la restricción como opción y la cadena al ejecutar (§3), con su caso de origen descripto sin apuntar (§9). El alcance pasa de los agentes de ese destino a quien cargue este documento, y la regla de alcance general pasa a convención consultiva (§8). |
