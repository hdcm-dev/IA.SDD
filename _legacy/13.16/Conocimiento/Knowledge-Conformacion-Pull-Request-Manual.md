# Conformación manual del pull request — el traspaso de una unidad de trabajo al agente humano

**Alias:** Conformacion-Pull-Request-Manual
**Naturaleza:** canonico
**Tema:** Ciclo de entrega de una unidad de trabajo entre un agente orquestador y un agente humano: compuerta, rama, informe con el enlace del pull request, merge y borrado del humano, acuse y reanudación verificada
**Consumidor:** transversal
**Condicion-de-carga:** —
**Hereda-de:** —
**Sustituye:** —
**Compatible-con:** Rules-Base-Conocimiento.md 2.2
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-29

---

## 0. Propósito y alcance

Caracteriza **el protocolo de colaboración con el que una unidad de trabajo sale de un agente
orquestador y llega al agente humano**, en su variante vigente por defecto en el framework: el agente
escribe en una rama y entrega un pull request; **el merge y el borrado de la rama son del humano**; el
humano acusa recibo y el agente verifica antes de seguir.

**Es `canonico`.** El canon es el flujo de rama corta con pull request, y no se reexplica. Lo que este
documento escribe es **el delta**: quiénes son los dos actores, en qué turnos se alternan, qué produce
cada turno, qué está prohibido y con qué criterio se cierra el ciclo.

**Qué designa «manual» en el alias.** Que la conformación final del pull request —el merge y el
borrado de la rama— la ejecuta **el agente humano en la plataforma**, y nunca el agente que escribió
el cambio. Es el punto donde esta variante se separa de cualquier otra.

**Existe para ser citable.** El procedimiento ya está reglado —§8 dice dónde— y este documento no lo
reemplaza: le da **un alias** con el que un intake puede nombrarlo, y una caracterización contra la
cual una **variante hermana** pueda declararse por diferencia en lugar de reescribir el ciclo entero.

**Qué queda explícitamente afuera:**

| Qué | Dónde vive |
| --- | --- |
| La norma misma del traspaso —T0 a T6— y la forma de las detenciones | `Master-Prompt.md` §12.1 y §8.1, conjunto normativo del framework |
| Si el trabajo entregado está bien | El audit de cada orquestador, y `Master-Prompt.md` §10 |
| Las detenciones que cada orquestador declara por su cuenta | Cada orquestador. `Master-Prompt.md` §12.1 T6 lo declara como límite del protocolo |
| Configuración de la plataforma: protección de rama, revisores obligatorios, controles automáticos, convención de nombre de rama y de mensaje de commit | **Nada de esto está declarado en el framework**, y no se inventa acá. Un producto que las fije lo hace en su categoría 09 |

**§5 se escribe como secuencia de turnos y no como esqueleto de archivo**, porque lo caracterizado es
una convención de proceso y no un artefacto con layout.

## 1. Identidad del artefacto

| | |
| --- | --- |
| **Qué es** | Una convención de proceso entre dos actores, sobre un repositorio con remoto y una plataforma que provee pull requests |
| **Actor A** | **Agente orquestador.** Cualquiera de los tres: generación, migración normativa, reanudación. Los tres leen la misma norma y no la redefinen |
| **Actor B** | **Agente humano.** Es quien revisa, fusiona y borra la rama en la plataforma, y quien decide lo que el cierre le presenta |
| **Unidad de intercambio** | La **unidad de trabajo**: una fase de generación, una fase de migración, una consolidación o una reparación |
| **Supuestos** | Hay rama principal y remoto; el historial del repositorio es el observable con el que se contrasta el estado; el humano tiene el permiso de merge y el agente no |

**La propiedad que sostiene todo el resto:** el merge es **el punto donde alguien que no escribió el
cambio lo mira**. Un agente que fusiona su propio trabajo no se ahorra un paso: elimina el único
control que no es suyo.

## 2. Estructura

El ciclo son ocho turnos, y cada uno tiene su norma:

| # | Quién | Qué produce | Normado en |
| --- | --- | --- | --- |
| 1 | Orquestador | **Compuerta de arranque**: contrasta el local contra el remoto —árbol limpio, rama principal, al día, sin entregas vivas, sin ramas fusionadas colgando— y **publica su salida siempre**, también cuando está todo en orden | `Master-Prompt.md` §12.1 **T0** |
| 2 | Orquestador | **Declara la unidad antes de empezar**, y es una sola | §12.1 **T3** |
| 3 | Orquestador | Crea la rama, escribe, commitea y empuja. Sobre árbol sucio no escribe nada | §12.1 **T1** y **T2** |
| 4 | Orquestador | **Cierre de unidad**: entrega y decisiones en un solo bloque, con la rama, el **enlace del pull request**, el alcance, lo corregido por autocorrección, las decisiones pendientes con su contexto, y **qué sigue después del merge** | `Master-Prompt.md` §8.1, y §12.1 **T4** |
| 5 | Humano | **Fusiona y borra la rama**, en la plataforma | §12.1 **T1** |
| 6 | Humano | **Acusa**: «listo el merge y borrada la rama» | §12.1 **T5** |
| 7 | Orquestador | **Verifica y prepara**: vuelve a la principal, la actualiza, poda referencias, borra la rama local, comprueba que el commit entregado es **alcanzable** desde la principal, declara si la principal trajo trabajo ajeno, y **republica el estado con el formato del turno 1** | §12.1 **T5** |
| 8 | Orquestador | Continúa con **lo que el turno 4 declaró como paso siguiente** | §12.1 **T5** |

**El turno 7 es el que distingue este protocolo de un intercambio informal.** El aviso del humano se
verifica y no se cree: son dos sesiones distintas, y un aviso puede llegar antes de que la plataforma
termine o referirse a otro pull request.

## 3. Contrato de uso

**Obligaciones del orquestador**

- Publicar la compuerta del turno 1 **antes de la primera escritura** de cada unidad, y publicarla
  también cuando no hay nada que arreglar: es lo único que distingue «no había nada» de «no se miró».
- Declarar la unidad antes de empezar, y **una sola por rama**.
- Terminar el cierre del turno 4 con **el enlace del pull request** y con **qué sigue después del
  merge**, que no es opcional.
- Pedir lo que necesita de vuelta —las decisiones y, si corresponde, **el merge**— en una línea, de
  forma que responder sea elegir y no redactar.
- Verificar el merge por alcanzabilidad antes de apoyarse en él.

**Prohibiciones del orquestador**

| Prohibido | Qué pasa si se hace |
| --- | --- |
| Fusionar o borrar la rama en la plataforma | Se elimina la revisión, que es lo único que el agente no controla |
| Escribir sobre un árbol sucio | El estado se lee sobre algo que nadie eligió: el historial no incluye lo que no está commiteado, y el diagnóstico declara «coincide» o «diverge» sin base |
| Empezar una unidad con otra esperando merge | Dos ramas que se pisan sobre los mismos documentos, y el humano **no puede aceptar una y rechazar la otra** |
| Meter dos unidades en una rama **y declarar una** | No hay comprobación que lo detecte: la única señal es el tamaño del pull request |
| Seguir sin verificar el aviso | La unidad siguiente se construye encima de un estado que no existe, y se descubre tarde |

**Cuando igual entran dos unidades en una rama** —una reparación que aparece a mitad de una fase, dos
pasos que resultaron inseparables— **se declara en vez de disimularse**: el cierre nombra las dos, en
su orden, y dice **cuál se puede revertir sin la otra**.

**Obligaciones del humano**

- Fusionar o rechazar en la plataforma, y borrar la rama.
- **Acusar el cierre**, que es lo que habilita el turno 7. Sin acuse el ciclo queda detenido, que es
  el comportamiento correcto y no una falla.

## 4. Decisiones ya tomadas

| Bifurcación | Cómo se resolvió | Criterio |
| --- | --- | --- |
| ¿Quién fusiona? | **El humano, sin excepción** | El merge es el único control que no es del agente |
| ¿La compuerta se publica siempre o sólo cuando encuentra algo? | **Siempre** | Es lo que permite saber **contra qué estado** se hizo lo que sigue |
| ¿Se cree el aviso del humano? | **Se verifica** | Dos sesiones distintas; el aviso puede llegar antes que la plataforma o referirse a otro pull request |
| ¿La unidad se declara antes o se describe al final? | **Antes** | Declarada después, la rama se acomoda a lo que salió y el humano pierde la decisión por separado |
| ¿La entrega y las decisiones van juntas o separadas? | **Juntas, en un solo bloque** | Separarlas obliga al humano a reconstruir el contexto dos veces |
| ¿Un defecto propio se ofrece como opción? | **No: se corrige en la misma unidad y se declara** | El agente **termina su trabajo, no rehace el del humano**. Si corregirlo cambia una decisión ya tomada por el humano, se detiene |
| ¿Hace falta un plan aparte? | **No** | El cierre de cada unidad —qué se hizo, qué queda abierto, qué caminos había, cuál se recomienda— ya es el plan, hecho cuando se tiene la información |

**Lo que esta variante fija, y que una variante hermana tendría que redeclarar.** Sirve para catalogar
otro procedimiento por diferencia, sin tocar éste:

| Punto de variación | Valor en esta variante |
| --- | --- |
| Quién fusiona | El humano |
| Quién borra la rama | El humano, en la plataforma |
| Granularidad de la unidad | Una fase, una consolidación o una reparación, declarada antes |
| Concurrencia | Una unidad viva por vez |
| Reanudación | Por acuse del humano, verificado por alcanzabilidad |
| Publicación del estado | Al abrir la unidad y al reanudar, con el mismo formato |

## 5. Esqueletos de referencia

La secuencia mínima de turnos. **Los formatos literales de los tres bloques no se copian acá**: los
fija `Master-Prompt.md` §12.1 T0, §8.1 y §12.1 T4, y duplicarlos garantizaría que las dos copias
diverjan.

```text
Orquestador → COMPUERTA DE ARRANQUE — <repositorio>
                Veredicto: EN ORDEN, se puede empezar
Orquestador → Unidad declarada: <fase | consolidación | reparación>
              [rama, escritura, commits, push]
Orquestador → CIERRE DE UNIDAD — <qué se hizo>
                ENTREGADO             Rama, PR: <url>, Alcance, Verificado, Corregido
                DECISIONES PENDIENTES D1 … Dn, cada una con contexto, opciones y recomendación
                QUÉ NECESITO DE VOS   las decisiones, y el merge
                Qué sigue después del merge: <la fase o el paso concreto>
Humano       → [merge y borrado de la rama en la plataforma]
Humano       → «listo el merge y borrada la rama»
Orquestador → [principal actualizada, referencias podadas, rama local borrada,
               commit entregado alcanzable desde la principal]
              COMPUERTA DE ARRANQUE — <repositorio>   (el estado con que arranca la próxima)
Orquestador → continúa por el paso que el cierre declaró
```

## 6. Criterios de aceptación

Cómo se verifica que este conocimiento se aplicó, mirando la corrida y el repositorio:

- [ ] `[enumerable]` Hay una salida de compuerta publicada **antes** de la primera escritura de la unidad, y otra al reanudar.
- [ ] `[enumerable]` La unidad quedó declarada antes de la primera escritura.
- [ ] `[enumerable]` Ninguna fusión ni borrado de rama remota los hizo el agente.
- [ ] `[enumerable]` El cierre lleva el enlace del pull request y la línea «qué sigue después del merge».
- [ ] `[enumerable]` En el momento de abrir la unidad no había otra rama empujada sin fusionar.
- [ ] `[enumerable]` El commit de la rama entregada es alcanzable desde la principal antes de continuar.
- [ ] `[interpretativo]` La rama contiene la unidad declarada; si contiene dos, el cierre nombra las dos y cuál se puede revertir sin la otra.
- [ ] `[interpretativo]` Cada decisión pendiente lleva contexto suficiente para alguien que no siguió la corrida.

## 7. Anti-patrones

| Anti-patrón | Por qué |
| --- | --- |
| **El agente fusiona su propio trabajo** | Elimina la revisión. No es un atajo: es sacar el único control ajeno |
| **Empezar la unidad siguiente con una entrega viva** | Dos ramas sobre los mismos documentos; el humano pierde el poder de aceptar una y rechazar la otra |
| **Escribir sobre un árbol sucio** | El diagnóstico se hace contra un observable incompleto |
| **Informar completo y no pedir nada** | Ocurrió con la norma ya escrita: el humano tuvo que preguntar qué hacer. El cierre termina pidiendo la decisión y, si corresponde, el merge |
| **Reanudar sobre el aviso, sin verificar** | La unidad siguiente se apoya en un merge que puede no estar |
| **Rama que lleva dos unidades y declara una** | Es lo único del protocolo que no tiene comprobación mecánica: descansa entero en quien la escribe |
| **Terminar el merge y arrancar sobre un local a medio actualizar** | Produce la unidad siguiente sobre un estado que ya no existe |

## 8. Frontera con las reglas

**Todo lo normativo de este tema vive en el conjunto normativo del framework, no acá.** El protocolo
está declarado en `Master-Prompt.md` **§12.1** —T0 compuerta, T1 el agente no fusiona, T2 árbol
limpio, T3 una unidad un pull request, T4 la forma de la entrega, T5 la reanudación verificada, T6 su
límite— y la forma de las detenciones y del cierre de unidad en **§8.1**. `Master-Prompt-Migracion.md`
y `Master-Prompt-Reanudacion.md` los **citan y no los redefinen**, y este documento tampoco.

**Este documento no sustituye nada, y hoy no podría.** `Rules-Base-Conocimiento.md` §0.4 habilita la
sustitución sólo sobre ítems que el framework **rotuló como decisión de stack**, y ningún ítem de
§12.1 lleva ese rótulo. En consecuencia, una variante que cambie **quién fusiona**, **la granularidad
de la unidad** o **la verificación del acuse** no es una sustitución: es una **desviación**, manda la
regla del framework, y se declara con su justificación en el §8 del documento que la caracterice.

**Y no define criterios de aceptación de nada que el framework genere.** Los de §6 se verifican sobre
el repositorio y sobre el intercambio, no sobre un entregable documental.

## 9. Trazabilidad

| | |
| --- | --- |
| **Índice** | [`Index-Knowledge.md`](Index-Knowledge.md) |
| **Hermanos** | Ninguno |
| **Consumidor** | `transversal`. Se cita desde `§17.P.13` del `PRODUCT-INTAKE`, por proyecto de código |
| **Artefacto de referencia** | Ninguno. Lo caracterizado es una convención de proceso y no tiene artefacto ejecutable |
| **Origen de lo caracterizado** | `Master-Prompt.md` §12.1 y §8.1; notas `Coherencia-Traspaso-Por-Pull-Request.md`, `Coherencia-Compuerta-De-Arranque.md` y `Coherencia-Cierre-De-Unidad.md` |

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-29 | Emisión inicial. Cataloga el procedimiento de traspaso vigente por defecto para que pueda citarse por alias desde un intake y para que una variante hermana pueda declararse por diferencia. |
