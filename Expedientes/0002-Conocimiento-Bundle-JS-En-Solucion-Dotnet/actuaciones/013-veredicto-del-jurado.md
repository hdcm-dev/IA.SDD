# Actuación 013 — Veredicto del jurado

| Campo | Valor |
|---|---|
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Jurado de cinco funciones |
| Corrige | — |

Base: `IA.SDD` `a501857` (13.17) · `<F1>` `9aabe5c` (`evidencia/ev-01-base.out`). Un solo subagente con cinco mandatos, limitación declarada en 002 §6. Abreviaturas: `RBC` = `SDD/Devs/Rules/Rules-Base-Conocimiento.md`; `REx` = `SDD/Devs/Rules/Rules-Examples.md`; `MESA` = `IA/PROMPTs/IA.Prompts/Base/Mesa-Evaluadora.md`; `ev-05` = `evidencia/ev-05-presentacion-original.md`. Jueces: **Ev** (evidencia), **Im** (impacto), **CB** (costo/beneficio), **Co** (coherencia), **Ri** (riesgo e irreversibilidad).

---

## 1. Mandato y método

**Mandato** (`ev-07/10-jurado.md`): votar, en este orden, los 16 ataques de 012 §3; la fidelidad de la consolidación (012 §2); las contradicciones X-1 a X-5; los tres defaults de 012 §3.1; las 18 decisiones del plan de 011 §5; la forma mínima de 012 §5. Mayoría simple; empate o 2-2-1 → `INSUFICIENTE`; salvaguarda del 80 % de votos 5-0.

**Qué leí, completo y en orden:** `ev-07/00-encargo-comun.md`; `ev-07/10-jurado.md`; actuaciones 001 a 012; `MESA` §3 a §6 (y §7 y §10 punto 8, porque 012 R-05 los cita). **Dato nuevo del Product Owner**, recibido con el despacho y que este veredicto usa sólo en R-16: `Lab-Geometria` tiene repositorio público y el PO acepta que quede como referencia pública; `<F1>` es privado (la API de GitHub devuelve 404 sin autenticación) y sobre su exposición el PO **no decidió**.

**Anclas verificadas por el jurado (E1/E2), sin ejecutar nada sobre el precedente:**

| # | Qué | Comando o cita | Resultado |
|---|---|---|---|
| V-1 | La regla que 011 §1 se dio | 011 l.18 «La severidad es la mayor declarada» contra 011 R7 (S2) con H-N3-02 (S1, 005) y R10 (S3) con H-N2-03 (S2, 004) | Las dos rebajas de 012 §2 son reales (E2) |
| V-2 | Figura del anfitrión mínimo | `REx` l.210-223 | «nunca una copia» está escrito para **el sample**; admite «sin servidor» o «servido» y exige declarar uno |
| V-3 | Conocimiento disfrazado de regla | `RBC` l.289 y l.363; `Master-Prompt.md` l.574 | Criterios de aceptación de un entregable del framework = anti-patrón `[enumerable]` |
| V-4 | Escaladas y default | `MESA` l.290-300, l.304-323, l.334, l.426; `ev-05` l.45 («dales toda la autoridad») | Sin `recomendación` ni `si_no_respondés` la escalada no tiene forma; «si dudás si escalar, no escales» |
| V-5 | ¿El intake tiene render mode? | `grep -n -i render SDD/Devs/Intake/PRODUCT-INTAKE-template.md` | Cero campos de render mode (la única coincidencia, l.291, es «aprender»); el render mode por defecto del framework es Interactive Server (`Design-Rules-Blazor-Mudblazor.md` l.82) |
| V-6 | Estado de publicación del expediente | `git status --short Expedientes` en `IA.SDD` | `?? Expedientes/0002-…/`: **no confirmado ni publicado** |
| V-7 | Exposición ya existente del producto de origen | `grep -io <f1>` | `CHANGELOG.md` (público, en `main`): 5; expediente `0001` (fusionado, PR #66): 83 |
| V-8 | Exposición que agrega este expediente | `grep -rioE '<f1>\|<componente>\|<componente>' actuaciones \| wc -l`; `grep -rn -i 'E-PIN\|AlActivarPunto\|DiagramaDeCabecera' actuaciones \| wc -l`; `grep -rioE 'lab-geometria\|geometriafactory' Expedientes/0002*/ \| wc -l` | 549 ocurrencias (012 contó 203 **líneas**); 55 líneas con identificadores internos del código; 15 de `Lab-Geometria` |
| V-9 | Origen de las reglas 13.16 | `CHANGELOG.md` l.47 y l.109-110 | `Lab-Geometria` es F2 y el caso de origen; `<F1>` es F1 |
| V-10 | El pedido separa los proyectos | `ev-05` l.36-38 | «crear el proyecto bundle… arrojará dos artefactos: main.js y el bundle»; «crear la librería de clases .NET Blazor, que integra main.js y bundle» |

**Vetos.** El juez de riesgo no vetó ningún `PROCEDE`: todas las correcciones caen sobre un documento que todavía no existe, en `OUTPUTs/`, y son reversibles. La única acción irreversible del caso —publicar el expediente en un repositorio público— se trata como escalada en R-16, no como veto.

---

## 2. Los 16 ataques del refutador (012 §3)

| Ataque | Ev | Im | CB | Co | Ri | Resultado | Conteo | Qué P-n cambia y cómo |
|---|---|---|---|---|---|---|---|---|
| **R-01** R7 rebajada; copia por generador | PROCEDE: V-1, E2 directo contra la regla de 011 l.18; la mitad amputada de H-N3-02 está en 005 | PROCEDE: sin la frontera, §7 prohíbe lo que §3 enseña y el agente elige al azar entre P-9 y P-10 | PROCEDE: dos filas de §7 y una oración en §3; cero retrabajo | PROCEDE: `REx` l.213-215 nombra el sample; `Intake-Rules.md` l.127-129 admite al generador; no reabre nada | PROCEDE: reversible, y reduce el riesgo de que el documento se contradiga | **PROCEDE** | 5-0 | R7 → S1; 011 §2 suma X-5; P-15 §7 con dos filas (anti-patrón: copia mantenida a mano o versionada; forma válida: salida del único generador en el mismo comando, ignorada por el control de versiones); P-9 y P-10 citan esa frontera |
| **R-02** R10 rebajada; método contra artefacto | PROCEDE: V-1 prueba la rebaja; `ev-05` l.25/l.33 contra `RBC` l.47-49 es E2 en los dos lados; `grep autoajust` = 0 en 011 es E1 | PROCEDE: el PO recibe un documento de artefacto sin saber que pidió metodología y por qué no la recibe | PROCEDE: una oración en el dictamen y una fila de §3 (≈ 15 líneas) contra un malentendido que invalida la entrega | PROCEDE: informar no es escalar; `RBC` l.251 admite el procedimiento de cambio como convención de uso | PROCEDE: agregar una fila de procedimiento es reversible | **PROCEDE** | 5-0 | R10 → S2; P-2 suma la oración método/artefacto, informada al PO como decisión de la mesa; P-6 suma **procedimiento de cambio coordinado del contrato**; P-16 recupera la comprobación de H-N2-03 para la 015 |
| **R-03** HV2-06 amputada | PROCEDE: 007 HV2-06 tiene tres partes y 011 R1 dice «(parte ii)»; E2 | PROCEDE: un agente `web-monolith` no produce contrato porque su D8 no lo exige y nadie se lo advirtió | PROCEDE: dos filas de §8 | PROCEDE: citar el gating de `Rules-Arquitectura-Tecnica.md` §2.2 en §8 es frontera, no redefinición | PROCEDE: S3, reversible, sin veto | **PROCEDE** | 5-0 | P-15 §8 suma: «clase de compilación por el grafo, verificada en ejecución (hueco declarado)» y «en `web-monolith` la 05 no obliga a documentar esta costura; §3 la describe y el destino decide dónde la archiva» |
| **R-04** Consumidor sin 09 | PROCEDE: 003 RN1-04 lista 09 con motivo; 011 P-14 lo omite; E2 | PROCEDE: el agente de `Pipeline-Producto.md` no recibe P-9 y repite «insumo omitido en silencio» (`Rules-Devops.md` l.274) | PROCEDE: un token en la cabecera y una mención en §3 | PROCEDE: `RBC` §7.3 l.415-419 admite lista con motivo; cuatro consumidores con sección propia no es inflación | PROCEDE: reversible | **PROCEDE** | 5-0 | P-14: `Consumidor: 05, 08, 09, 10`, cada uno con la sección que lo nombra |
| **R-05** Escaladas sin default | PROCEDE: V-4; `grep default` de 012 §1 es E1; 011 §4 dice «con default» tres veces y no declara ninguno | PROCEDE: por `MESA` l.334 el ciclo cerraría sin documento con tres escaladas bloqueantes | PROCEDE: fijar tres defaults cuesta tres filas de §4; no fijarlos cuesta el ciclo | PROCEDE: `ev-05` l.45 dio autoridad; `MESA` l.426 manda aplicar el default y registrarlo | PROCEDE: un default registrado en deuda se revierte con una fila si el PO responde otra cosa | **PROCEDE** | 5-0 | Q-A, Q-B y Q-C dejan de ser escaladas: decisiones de la mesa con default (§5 de este informe), registradas en `deuda_declarada` y asentadas en §4 del documento como bifurcación resuelta con la alternativa nombrada |
| **R-06** Reescribir el `INPUT` | PROCEDE: `ev-05` l.43 autoriza sólo `OUTPUTs/`; encargo común regla 5; E2 | PROCEDE: el autor del `INPUT` lo reescribe y el dictamen se apoya en eso sin auditoría: el sesgo de 002 §2 queda estructural | PROCEDE: una observación con la lista de secciones cuesta menos que una versión 0.3 que nadie audita | NO_PROCEDE: 002 §2 `objeto` lista el `INPUT` como insumo y `MESA` §5.5 manda corregir en la capa de origen; retirarlo modifica el objeto sin E1/E2 que lo contradiga | PROCEDE: no escribir fuera de lo autorizado es lo reversible; una reescritura sobre `PROMPTs/` del PO no lo es en la práctica | **PROCEDE** | 4-1 | P-1: no se reescribe el `INPUT`; se retira como insumo del dictamen y lo que 13.17 contradice (§2.3, §4 obs. 2 y 3, §5, §6, §8.2 a §8.4, PA-01, PA-02, PA-04) va como observación al PO junto con P-18 |
| **R-07** P-5 contra P-14; F3 | PROCEDE: RV1-03 (F1 «ninguna arista nueva») contra P-14 (condición por la marca) es contradicción E2; F3 contra RN1-28 también | PROCEDE: el producto de origen, F1, nunca cargaría el documento escrito con él | PROCEDE: F2 por defecto con F1 como delta ahorra un `.csproj` de §5 (≈ 60 líneas) | INSUFICIENTE: la contradicción está probada, pero «X-1 se cierra por P-3» no: P-3 pone **afuera** nombres de proyecto y agrupador, y F1/F2 cambian cuántos proyectos de código hay | PROCEDE: F1 queda como variante declarada; nada se pierde si un destino la elige | **PROCEDE** | 4-1 | P-5: F2 se presenta primero (es la forma que 13.16 modela, V-9, y la que describe `ev-05` l.36-38, V-10); F1 como variante con su delta; F3 sale a §0 como afuera. P-14: la `Condicion-de-carga` se escribe para que **dispare con F1 y con F2** (proyecto de ecosistema JavaScript cuyo artefacto carga un proyecto Blazor, por insumo de construcción o dentro del mismo proyecto), no sólo por la marca. X-1 lo resuelve el jurado (§4), no P-3 |
| **R-08** Aserción de la PoC Blazor; criterios de sample | PROCEDE: 200 en `_content/` prueba servicio de estáticos, no `JSInvokable` ni serialización (010 HAH2-02, E1 C3); V-3 prueba (b) | PROCEDE: el S1 de R5 queda sin instrumento obligatorio y la 015 marca el documento por l.363 | INSUFICIENTE: el viaje de ida y vuelta automatizado en Interactive Server necesita un navegador que ningún precedente tiene; el ataque no pone su costo | PROCEDE: coherente con R-01 y R-03 (el documento describe la costura, el destino pone la forma del sample) | PROCEDE: reformular §6 sobre la costura es reversible | **PROCEDE** | 4-1 | P-13: los criterios se formulan **sobre la costura** («el acuse llega con el DTO íntegro»), no como `comando`/`criterio_aceptacion`/`VER-` de un sample, que quedan en §8 como del destino; la aserción mínima de la PoC Blazor es el viaje de ida y vuelta, sin nivel opcional; la 015 corre el grep de H-N2-03 |
| **R-09** Fixture de P-7 | INSUFICIENTE: el diagnóstico es E2, pero el remedio falla: un JSON importado con `resolveJsonModule` se tipa con cadenas **ensanchadas** a `string`, que no son asignables a uniones de literales; la compuerta rechazaría un fixture válido (E3 sobre comportamiento documentado de TypeScript, tema «JSON modules») | PROCEDE: sin decir quién produce el fixture, P-7 no se puede escribir y P-10/P-13 quedan con dos instrumentos | PROCEDE: unificar P-7, P-10 y P-13 en un instrumento ahorra líneas de §5 y §6 | PROCEDE: coherente con R-08 (la PoC Blazor captura) y con RV2-32 (sin tercera declaración) | INSUFICIENTE: el flujo invertido depende de una captura en navegador que R-08 dejó sin costo | **PROCEDE** | 3-2 | P-7 → `MEJORAR_PLAN`: la PoC Blazor captura el JSON que el JS recibe y la PoC HTML lo consume (se adopta); la validación del lado JS **no** es la asignación del JSON importado bajo `tsc` (objeción de Ev) y el auditor tiene que elegir un instrumento que no ensanche literales, no cree una tercera declaración de la política de nombres y corra sin navegador |
| **R-10** Render mode en la condición | NO_PROCEDE: V-5, el intake no tiene campo de render mode; una condición contra un campo inexistente viola `RBC` l.397 y nunca evalúa | NO_PROCEDE: el render mode por defecto del framework es Interactive Server (V-5); P-8 ya declara el supuesto; un producto WebAssembly es una desviación de stack que el destino declara | PROCEDE: una línea en §0 que declare WebAssembly y Auto afuera es barata y evita instrucciones de circuito donde no hay circuito | NO_PROCEDE: el hermano `Template-Blazor-Interactive-Server-SDD-Default` acota por nombre y tema, no por un campo que el intake no tiene | PROCEDE: excluir es reversible y protege al lector WebAssembly | **NO_PROCEDE** | 3-2 | Ninguno. P-8 conserva «supuesto Interactive Server declarado; WebAssembly y Auto no verificados». Motivo del archivo: el remedio no es expresable contra el intake |
| **R-11** `version` leído; `enum` | PROCEDE: bajo «se versiona con el anfitrión» ninguna entrada de los tres instrumentos dispara la rama «desconocida» (E3 de 012); `System.Text.Json` serializa enumeraciones como cadenas (hecho de stack nombrado) | PROCEDE: §6 exigiría código muerto y presentaría una elección como la única forma | PROCEDE: se sacan ≈ 10 líneas | PROCEDE: `RBC` §0.3 l.87-88 separa método de decisión de stack | PROCEDE: S3, reversible | **PROCEDE** | 5-0 | P-6: `version` existe y se compara (criterio en P-13); el comportamiento ante versión desconocida se declara sólo con el disparador (publicar RCL o bundle aparte) y no es criterio de §6; «cadenas de conjunto cerrado» va a §4 como bifurcación con criterio y la alternativa nombrada |
| **R-12** Variante JavaScript plano | PROCEDE: sin fuente tipada no hay de dónde generar declaraciones salvo anotaciones más el compilador de TypeScript (hecho de stack nombrado), que reintroduce la cadena | PROCEDE: la variante como está escrita lleva al `.d.ts` a mano que P-6 prohíbe | PROCEDE: una fila de §4 en lugar de variante desarrollada | PROCEDE: coherente con RAH1-06 y RV2-32 | PROCEDE: S3, reversible | **PROCEDE** | 5-0 | P-11: la variante va en una fila de §4 con su costo real («sin tipo del lado JS, el fixture es la única guardia; no hay `.d.ts`»), sin esqueleto |
| **R-13** R8 como receta de un SDK | PROCEDE: la medición de 008 E1-b es sobre `obj/Release/net10.0/`; la receta tiene E2 sólo en el segundo precedente | PROCEDE: la causa escrita puede dejar de ser cierta con otro SDK y nadie lo nota porque §6 sigue verde | PROCEDE: separar propiedad, síntoma y receta no suma líneas; la reproducción en la 015 es una corrida | PROCEDE: coherente con 012 §4 punto 3, que sostiene R8 | PROCEDE: la reproducción sobre una copia en el scratchpad no toca el precedente | **PROCEDE** | 5-0 | P-9: §1 declara la versión del SDK como supuesto; §3 escribe la propiedad («el artefacto generado entra al manifiesto de estáticos en la primera construcción desde limpio») y el síntoma (404 con build verde); la receta va a §5 rotulada con el SDK medido; la 015 reproduce defecto y corrección sobre una copia de P1 |
| **R-14** Dos canales de salida | PROCEDE: 007 RV2-09 lo anota; P-10 exige el doble con `invokeMethodAsync` y P-12 no dice qué canal usa la PoC HTML; E2 | PROCEDE: con canales distintos las dos PoC dejan de probar lo mismo | PROCEDE: el `CustomEvent` pasa a una fila de §4 (≈ 15 líneas menos) | PROCEDE: coherente con `REx` §3.6 (doble del consumidor) y con E-1 (la PoC HTML usa la capa de interop) | PROCEDE: S3, reversible | **PROCEDE** | 5-0 | P-10: la PoC HTML usa el doble por el canal del callback, obligatorio. P-12: el `CustomEvent` es salida adicional declarada en §4; ninguna PoC lo toma como aserción |
| **R-15** Accesibilidad | PROCEDE: el bundle pinta interfaz; `RBC` l.87 pone WCAG 2.2 AA como método no desplazable; `TECLAS` entre las exportaciones (009 HAH1-04); E2 | PROCEDE: sin remisión, el DOM del bundle esquiva el piso por la vía de otro lenguaje | PROCEDE, en la forma mínima: una fila de §8 cuesta tres líneas; reconvocar consume el segundo ciclo del presupuesto | INSUFICIENTE: volver obligatorios los textos accesibles del contrato es fijar contenido de producto (RV2-17) sin especialista; la remisión en §8 sí es coherente | PROCEDE: la remisión es reversible | **PROCEDE** | 4-1 | P-15 §8: el DOM que genera el bundle está sujeto al método de accesibilidad del destino, que se cita y no se redefine. No se reconvoca Accesibilidad en este ciclo; la 015 verifica que el documento no fije foco ni teclado, y si lo fija se cumple la condición de 002 §4.2 y entra en el ciclo 2. Los textos accesibles quedan como opción de montaje |
| **R-16** Exposición del producto de origen | PROCEDE: V-8 prueba el volumen y el detalle (identificadores internos, lista de defectos de P-17); con el dato del PO, `<F1>` es privado y `IA.SDD` público (`git remote`, E1 de 012) | PROCEDE: publicar el expediente pone en un repositorio público el interior de un producto privado —rutas, ADR, siete afirmaciones incumplidas— sin decisión del PO | PROCEDE: no publicar hasta que el PO decida cuesta cero hoy (V-6: el expediente no está confirmado); ofuscar 549 ocurrencias después cuesta una reescritura | NO_PROCEDE: 002 §2 R4 dice «**el documento** no lleva nombres»; el encargo autorizó citar por ruta en los informes, y el nombre ya es público en `CHANGELOG.md` y en el expediente `0001` fusionado (V-7): extender R4 al expediente no tiene ancla | PROCEDE: publicar es irreversible (historia de un repositorio público); el default que no publica es el único reversible | **PROCEDE** | 4-1 | Acotado por el dato del PO: `Lab-Geometria` **no** requiere nada en el expediente (público y aceptado). `<F1>`: escalada `ESC-001` (§8), disparador 5, con default «el expediente no se confirma ni se publica hasta que el PO decida». P-17 se entrega al PO **fuera del expediente**. R4 no se reabre: el documento sigue ofuscando los dos precedentes |

---

## 3. Fidelidad de la consolidación (012 §2)

| Ítem | Ev | Im | CB | Co | Ri | Resultado | Conteo |
|---|---|---|---|---|---|---|---|
| **R7 vuelve a S1** | V-1: H-N3-02 es S1 y 011 l.18 manda la mayor | Con S2, la raíz no bloquea el cierre (`umbral_de_calidad`) y el choque de R-01 pasa sin corregirse | Cambiar una celda | Consistente con R-01 votado 5-0 | Sin riesgo: sube un umbral | **Sí, S1** | 5-0 |
| **R10 vuelve a S2** | V-1: H-N2-03 es S2 | Con S3 la raíz no bloquea y el anti-patrón l.363 llega a la 015 sin comprobación previa | Cambiar una celda | Consistente con R-02 votado 5-0 | Sin riesgo | **Sí, S2** | 5-0 |
| **Se agrega X-5** | 005 H-N3-02 y 008 RV3-02 b/RV3-07 b son incompatibles tal como están escritos; E2 | Sin X-5, P-9 y P-10 adoptan las dos lecturas | Una fila | La regla del relator (`MESA` §4.2) manda elevar contradicciones entre especialistas | Sin riesgo | **Sí** | 5-0 |

**Sobre la asimetría que 012 §2 señala.** El jurado constata que las dos rebajas y las tres amputaciones recaen sobre hallazgos contra el documento de entrada o contra el método de la mesa, y ninguna sobre el precedente. No afirma intención. Deja registrado que el sesgo declarado en 002 §2 se manifestó en la consolidación y que R-06 (retirar el `INPUT`) es la corrección estructural.

---

## 4. Contradicciones: cuál lectura rige

| Id | Ev | Im | CB | Co | Ri | Lectura que rige | Conteo |
|---|---|---|---|---|---|---|---|
| **X-1** F1 por defecto (N3) contra no elegir (V1) | `ev-05` l.36-38 describe dos proyectos (V-10) y `CHANGELOG.md` l.47 fija F2 como caso de origen (V-9): la evidencia desempata hacia F2, no hacia F1 | Sin orden de presentación, el lector sin contexto (N3) pregunta cuál construir | Un solo esqueleto de `.csproj` más delta | Elegir el orden de presentación no dicta la estructura del destino **si** §4 lo rotula como decisión con criterio y la condición de carga cubre las dos (R-07) | Reversible: F1 queda desarrollada como delta | **Ninguna de las dos literal: F2 primero, F1 variante declarada con delta, criterio en §4; la condición de carga dispara con ambas** | 4-1 (Co disiente: sostiene la lectura de V1, sin orden, porque la cantidad de proyectos de código es de la solución) |
| **X-2** dos superficies obligatorias contra PoC servida | 004 H-N2-02 (E3): el módulo ES carga servido; la global sale de la misma cadena | Con «servida», la PoC carga el mismo archivo que la RCL | Una fila de §4 para la global | Consistente con E-2 | Reversible | **Rige V2/N2: módulo ES único; la global es opción declarada** | 5-0 |
| **X-3** «un documento» contra partir | 012 §5 estima resto sin §5 ≈ 300-395 | Partir obliga a cargar dos documentos para cualquier pieza | La excepción de §5 no cuesta líneas | `RBC` l.375-376 la admite; los dos `propio` publicados la usan | Reversible | **Un documento con la excepción de §5 declarada en §0; se parte sólo si el resto supera 600** | 5-0 |
| **X-4** composición independiente de PA-04 (V1) contra PoC condicionadas a PA-04 (N3) | Las dos son ciertas y hablan de cosas distintas: V1 de la norma (`REx` §3.6 no exige `library`), N3 de lo que hace el `INPUT` | Con el `INPUT` retirado (R-06) la contradicción deja de alimentar el documento | Cero | Consistente con R-06 | Sin riesgo | **Rige V1 para el documento; lo de N3 va como observación al PO sobre el `INPUT`** | 5-0 |
| **X-5** copia en el sample contra copia por el generador | V-2: la prohibición nombra el sample; `Intake-Rules.md` l.127-129 y 008 RV3-07 b sostienen al generador | Sin frontera, el documento se contradice (R-01) | Dos filas | Consistente con R-01 | Reversible | **La prohibición rige para el anfitrión mínimo y para toda copia mantenida a mano o versionada; la salida que el único generador emite o copia en el mismo comando, ignorada por el control de versiones, es forma válida** | 5-0 |

---

## 5. Los tres defaults (012 §3.1)

Los tres votos deciden a la vez **la modalidad** (escalada con default o decisión de la mesa registrada como deuda) y **el default**.

| Escalada | Ev | Im | CB | Co | Ri | Resultado | Conteo |
|---|---|---|---|---|---|---|---|
| **E-1** `main.js` | `ev-05` lo dice cuatro veces (l.17, l.36, l.37, l.38): la intención tiene evidencia, no es ambigüedad irresoluble; no aplica el disparador 1 | Tomar la forma del precedente por sobre el texto del pedido reescribe lo que el PO pidió; con dos artefactos la PoC HTML invoca literalmente «como lo haría Blazor» | Disiente: un solo módulo con `montarConInterop` ahorra un esqueleto y una entrada del empaquetador (≈ 30 líneas); el precedente ya lo prueba así | `MESA` l.426 y `ev-05` l.45: decide la mesa y registra | Revertir a un módulo quita una fila de §2 y fusiona dos esqueletos: más barato que el camino inverso (012 §3.1) | **Decisión de la mesa, en `deuda_declarada`. Default: dos artefactos de la misma construcción**: el bundle, agnóstico del anfitrión, y `main.js` como capa de interop, único archivo que conoce `invokeMethodAsync`. Alternativa nombrada en §4: un solo módulo con dos funciones de montaje | 4-1 |
| **E-2** apertura de la PoC HTML | `REx` l.218-219 admite las dos y exige declarar una: es elección técnica dentro de las restricciones (`MESA` l.300), no ambigüedad de intención | Con «servida» la huella del archivo cargado es la de la salida que carga la RCL (criterio de P-13) | La global cuesta una fila de §4 si el PO la pide | §4 tiene que citar que el producto de origen decidió lo contrario para su maqueta (evidencia de intención), ofuscado | Reversible con una fila | **Decisión de la mesa, en `deuda_declarada`. Default: servida, módulo ES único**; la superficie global, opción declarada con su comando; §4 cita la decisión contraria del origen | 5-0 |
| **E-3** API de terceros con clave | Todo el contenido sería `C`: no hay precedente (`ADR-00042` §2 «sin ningún recurso remoto»); el encargo regla 3 impide fundar contenido | Afuera con destino no deja hueco: el hermano futuro lo cubre | Cero líneas contra una sección sin anclas y la convocatoria de Seguridad | El pedido nombra la API como ejemplo de contexto (`ev-05` l.17), no en «Solicitudes»: declararla afuera no quita nada prometido, no aplica el disparador 3 | Reversible | **Decisión de la mesa, en `deuda_declarada`. Default: afuera**, en §0 con destino «documento hermano»; Seguridad no se convoca; §8 cita `REx` l.218-219 para la PoC servida | 5-0 |

---

## 6. Las 18 decisiones del plan, tal como quedan

| P-n | Ev | Im | CB | Co | Ri | Resultado | Conteo | Objeción concreta o deuda |
|---|---|---|---|---|---|---|---|---|
| **P-1** | Sin autorización de escritura (R-06) | La reescritura no auditada es el sesgo | La observación es más barata | Disiente: `MEJORAR_PLAN`, reescribir con auditor distinto, por `MESA` §5.5 | Escribir en `PROMPTs/` del PO no se deshace | **NO_APLICAR** | 4-1 | Deuda: el `INPUT` queda en 0.2, superado por 13.16; la lista de secciones va al PO con P-18 |
| **P-2** | Oración de alcance anclada en `RBC` l.292 | Falta decirle al PO que recibe artefacto (R-02) | Una oración | Consistente con R-02 | Reversible | **MEJORAR_PLAN** | 5-0 | Sumar la oración método/artefacto (R-02); API de terceros afuera por E-3; F3 afuera por R-07 |
| **P-3** | 012 §4 punto 1 la sostiene; HN1-04 | Única vía de verificar R2 | Tabla ya relevada | No reabre nada | Reversible | **APLICAR** | 5-0 | — |
| **P-4** | Vocabulario anclado en `ev-05` y 009 RAH1-02 | Sin default, §1 no se podía escribir | Sin costo adicional | Consistente con E-1 | Reversible | **MEJORAR_PLAN** | 5-0 | Reescribir sobre E-1: *bundle* (artefacto agnóstico), *`main.js`* o capa de interop (segundo artefacto de la misma construcción), *punto de entrada* (uno por artefacto), *guion anfitrión* (script de cada PoC, no es artefacto) |
| **P-5** | R-07 E2 | El producto F1 no cargaría el documento | Ahorra ≈ 60 líneas | Disiente: sostiene no ordenar (X-1) | F1 queda como delta | **MEJORAR_PLAN** | 4-1 | F2 primero, F1 variante, F3 a §0; criterio en §4 |
| **P-6** | Filas ancladas en 007 | Sin procedimiento de cambio no hay «autoajuste» | +15 por R-02, −10 por R-11 | Consistente con R-02 y R-11 | Reversible | **MEJORAR_PLAN** | 5-0 | Sumar procedimiento de cambio coordinado; `version` sólo comparado; cadenas contra `enum` a §4 como bifurcación |
| **P-7** | El remedio de 012 R-09 falla por literales ensanchados | Sin instrumento definido, R5 queda sin cubrir | Un instrumento en vez de tres | Consistente con R-08 | El auditor elige el instrumento | **MEJORAR_PLAN** | 5-0 | Flujo: la PoC Blazor captura, la PoC HTML consume. Instrumento del lado JS: no ensancha, no crea tercera declaración, corre sin navegador |
| **P-8** | Anclas de 010 contra documentación oficial nombrada | Coincide con lo verificado en 010 §4 | Sin cambios | Consistente con R-10 archivado | Disiente: `MEJORAR_PLAN`, sacar WebAssembly y Auto a §0 como afuera | **APLICAR** | 4-1 | — |
| **P-9** | R8 es E1; la receta no | Causa atada a un SDK envejece en silencio | Sin líneas extra | Consistente con R-13 y R-01 | Reproducción sobre copia | **MEJORAR_PLAN** | 5-0 | Propiedad y síntoma en §3, receta en §5 con el SDK; frontera de X-5; consumidor 09 (R-04) |
| **P-10** | `REx` §3.6 | Sin canal único, las PoC prueban cosas distintas | Menos contenido | Consistente con R-14, E-2, X-5 | Reversible | **MEJORAR_PLAN** | 5-0 | Doble obligatorio por el callback; PoC servida; viaje de ida y vuelta (R-08); frontera de copia (X-5) |
| **P-11** | R-12 | Disiente: `NO_APLICAR`, retirar la variante e informar al PO que «etc» se leyó como enumeración abierta | Una fila | Consistente con R-12 | Reversible | **MEJORAR_PLAN** | 4-1 | Una fila de §4 con su costo, sin `.d.ts` ni esqueleto |
| **P-12** | 009 E1 | El doble canal confunde qué prueba cada PoC | −15 líneas | Consistente con R-14 | Reversible | **MEJORAR_PLAN** | 5-0 | `CustomEvent` a §4 como salida adicional; el resto se aplica |
| **P-13** | V-3 | El S1 de R5 sin instrumento obligatorio | Disiente: `NO_APLICAR` del viaje obligatorio hasta costear el navegador | Consistente con R-08 | Reversible | **MEJORAR_PLAN** | 4-1 | Criterios sobre la costura, no sobre el sample; viaje de ida y vuelta obligatorio; grep de H-N2-03 en la 015 |
| **P-14** | R-04, R-07 | Con F1 o sin 09 el documento no llega a quien lo necesita | Dos tokens | `RBC` l.397: nada contra campos que el intake no tiene (R-10) | Reversible | **MEJORAR_PLAN** | 5-0 | `Consumidor: 05, 08, 09, 10`; condición que dispara con F1 y F2; sin render mode |
| **P-15** | R-01, R-03, R-15 | §7/§8 incompletos dejan contradicción y fuga del piso | ≈ 10 líneas | Consistente con los tres | Reversible | **MEJORAR_PLAN** | 5-0 | Dos filas de §7 (X-5), dos de §8 (R-03), remisión de accesibilidad en §8 (R-15), lista de términos barridos que incluya los identificadores de V-8 |
| **P-16** | 012 §5: primer escalón inalcanzable | Un objetivo imposible hace fallar la 015 por diseño | Sin costo | Consistente con X-3 | Reversible | **MEJORAR_PLAN** | 5-0 | Objetivo: `total − §5 ≤ 600` con excepción declarada en §0; forma mínima de §7; comprobación de H-N2-03 en la 015 |
| **P-17** | R-16 | Asentarlo en un expediente público expone el producto | Entregarlo aparte cuesta cero | Disiente: `APLICAR` como está, por su voto en R-16 | Irreversible si se publica | **MEJORAR_PLAN** | 4-1 | Se entrega al PO fuera del expediente e incluye HV3-05 con su nombre |
| **P-18** | 004 H-N2-04 y H-N2-06 son E1/E2 | Observaciones sin corregir, como manda R1 | Una actuación | Consistente con 002 §2 R1 | Sin nombres de cliente | **APLICAR** | 5-0 | Suma la observación sobre el `INPUT` que deja P-1 |

**Recuento:** `APLICAR` 3 (P-3, P-8, P-18) · `MEJORAR_PLAN` 14 · `NO_APLICAR` 1 (P-1) · `ESCALAR` 0. La única escalada del ciclo (`ESC-001`) no recae sobre ninguna P-n sino sobre la publicación del expediente.

---

## 7. La forma mínima (012 §5)

| # | Qué propone sacar | Ev | Im | CB | Co | Ri | Resultado | Conteo |
|---|---|---|---|---|---|---|---|---|
| 1 | F3 de §2/§4 | R-07 | No es el artefacto | −15 | Consistente con R-07 | Una fila en §0 | **Se saca** | 5-0 |
| 2 | Segundo `.csproj` de §5 | F1 como delta es suficiente (R-07) | Disiente: los targets de F1 difieren en rutas y generador; un comentario de diez líneas no los transmite | −60 | Consistente con X-1 | Reversible | **Se saca** | 4-1 |
| 3 | Página anfitriona de la PoC Blazor | La lista de obligaciones (RAH2-15/16) sí reemplaza la parte de anfitrión | R-08 exige que la PoC capture el viaje: sin página no hay dónde capturar | Disiente: sacarla ahorra 40 | Disiente: el hermano Template cubre `EventCallback`; no hace falta repetir | Sin página, la aserción de P-13 queda sin forma | **No se saca: se reduce a lo que captura el viaje** | 3-2 |
| 4 | Variante JavaScript desarrollada | R-12 | Sin pérdida | −20 | Consistente con R-12 | Reversible | **Se saca** | 5-0 |
| 5 | Comportamiento ante versión desconocida | R-11 | Código muerto | −10 | Consistente con R-11 | Reversible | **Se saca** | 5-0 |
| 6 | WebAssembly y Auto a §0 como afuera | R-10 archivado | El supuesto en §1 alcanza | Disiente: una línea en §0 es igual de barata y más clara | Consistente con R-10 | Disiente: excluir protege mejor | **No se saca: queda como supuesto no verificado en una línea de §1** | 3-2 |
| 7 | §7 sólo con síntoma observable, el resto en una fila «otros» | Los anti-patrones se deduplican con E2 de seis comisiones | Disiente: `RBC` l.330-331 los pone entre lo más valioso; el bundle versionado no tiene síntoma y es el más frecuente | −20 | Consistente con el pedido de diagnóstico (`ev-05` l.25) | Reversible | **Se saca** | 4-1 |
| 8 | `CustomEvent` en §3 y §5 | R-14 | Sin pérdida | −15 | Consistente con R-14 | Reversible | **Se saca** | 5-0 |

**Lo que no se saca**, por votos anteriores: el documento no se parte (X-3, 5-0); el viaje de ida y vuelta de la PoC Blazor (R-08); la remisión de accesibilidad de §8 (R-15); la fila de procedimiento de cambio (R-02). Ahorro neto estimado sobre 012 §5, restando las filas 3 y 6 y sumando R-02, R-03 y R-15: ≈ 120 líneas; el segundo escalón de P-16 sigue cumpliéndose con margen.

---

## 8. Escalada que queda

```yaml
escalada:
  id: ESC-001
  disparador: 5 (dominio con consecuencia externa: el interior de un producto privado de un cliente en un repositorio público), con efecto irreversible (4) si se publica
  pregunta: ¿El expediente 0002 puede publicarse en IA.SDD con las referencias a <F1> tal como están?
  contexto: |
    IA.SDD es público; <F1> es privado (404 sin autenticación). Las actuaciones 003 a 012 lo nombran 549 veces,
    con 55 líneas de identificadores internos de su código y la lista de siete afirmaciones incumplidas (R4 de 011).
    El nombre ya es público en CHANGELOG.md (5) y en el expediente 0001 fusionado (83). Lab-Geometria no entra: el PO lo aceptó público.
    El expediente 0002 no está confirmado (git status: sin seguimiento).
  opciones:
    - id: A
      descripción: Publicar el expediente como está
      consecuencia: el interior del producto y sus defectos quedan en la historia pública; irreversible
    - id: B
      descripción: Ofuscar <F1> en el expediente antes de publicar (barrido de R-N2-03, marcador por ruta y nombre, huellas nuevas en SHA256SUMS)
      consecuencia: una actuación de ofuscación y reescritura de nueve folios; las citas pierden verificabilidad directa para un tercero
    - id: C
      descripción: No publicar el expediente 0002 con el repositorio; el presidente asienta una constancia que lo declara y por qué
      consecuencia: el registro de la mesa queda local; el documento de OUTPUTs/ no se ve afectado
  recomendación_de_la_mesa: B, por 4-1 en R-16 (Co disiente por la exposición ya existente en 0001 y CHANGELOG); preserva el registro público y saca el interior del producto
  si_no_respondés: |
    La mesa sigue: dictamen (014) y verificación (015) se escriben en el expediente local; el expediente no se confirma, no se fusiona
    y no se publica. P-17 se entrega al PO fuera del expediente. Queda bloqueada sólo la publicación. La exposición ya existente en 0001
    y CHANGELOG.md se informa y no se toca (fuera de alcance).
```

Se entrega junta con el cierre del ciclo (`MESA` l.323): no es de tipo 2 ni 3.

---

## 9. Deuda declarada que nace de este veredicto

| Ítem | Qué se acepta | Motivo |
|---|---|---|
| E-1 | Dos artefactos de la misma construcción; un solo módulo queda como alternativa | Evidencia del pedido; revertir cuesta dos secciones |
| E-2 | PoC HTML servida; la global es opción | Elección técnica dentro de `REx` §3.6 |
| E-3 | API de terceros con clave afuera | Sin anclas; hermano futuro |
| P-1 | El `INPUT` queda en 0.2 superado | Sin autorización de escritura; decide el PO |
| R-10 | WebAssembly y Auto como supuesto no verificado, no como afuera | El intake no tiene el campo |

---

## 10. Salvaguarda de homogeneidad

| Bloque | Ítems | 5-0 |
|---|---|---|
| Ataques (§2) | 16 | 9 |
| Fidelidad (§3) | 3 | 3 |
| Contradicciones (§4) | 5 | 4 |
| Defaults (§5) | 3 | 2 |
| Decisiones del plan (§6) | 18 | 12 |
| Forma mínima (§7) | 8 | 4 |
| **Total** | **53** | **34 (64,2 %)** |

**No supera el 80 %: el ciclo no se marca como sospechoso.** Dos observaciones igual: (1) quince de dieciséis ataques proceden, una tasa alta que se explica porque el refutador leyó todo el expediente y anclaba en E2 ya levantado; la diferencia está en las direcciones, que el jurado corrigió en R-07, R-09, R-15 y R-16. (2) El único `NO_PROCEDE` que se revisaría primero es **R-10** (3-2): si el destino que adopte el documento tiene un campo de render mode en su intake, el remedio pasa a ser expresable y el voto de Ev y Co cambia.

---

## 11. Tabla resumen

| Ítem | Resultado | Conteo |
|---|---|---|
| R-01 | PROCEDE | 5-0 |
| R-02 | PROCEDE | 5-0 |
| R-03 | PROCEDE | 5-0 |
| R-04 | PROCEDE | 5-0 |
| R-05 | PROCEDE | 5-0 |
| R-06 | PROCEDE | 4-1 |
| R-07 | PROCEDE | 4-1 |
| R-08 | PROCEDE | 4-1 |
| R-09 | PROCEDE | 3-2 |
| R-10 | NO_PROCEDE | 3-2 |
| R-11 | PROCEDE | 5-0 |
| R-12 | PROCEDE | 5-0 |
| R-13 | PROCEDE | 5-0 |
| R-14 | PROCEDE | 5-0 |
| R-15 | PROCEDE | 4-1 |
| R-16 | PROCEDE (escalada `ESC-001` sólo por `<F1>`) | 4-1 |
| R7 → S1 | Sí | 5-0 |
| R10 → S2 | Sí | 5-0 |
| X-5 se agrega | Sí | 5-0 |
| X-1 | F2 primero, F1 variante, condición para las dos | 4-1 |
| X-2 | Módulo ES único; global opcional | 5-0 |
| X-3 | Un documento con excepción de §5 | 5-0 |
| X-4 | Rige V1; N3 como observación del `INPUT` | 5-0 |
| X-5 | Prohibida la copia en el sample o a mano; válida la salida del generador | 5-0 |
| E-1 | Decisión de la mesa en deuda; dos artefactos | 4-1 |
| E-2 | Decisión de la mesa en deuda; servida | 5-0 |
| E-3 | Decisión de la mesa en deuda; afuera | 5-0 |
| P-1 | NO_APLICAR | 4-1 |
| P-2 | MEJORAR_PLAN | 5-0 |
| P-3 | APLICAR | 5-0 |
| P-4 | MEJORAR_PLAN | 5-0 |
| P-5 | MEJORAR_PLAN | 4-1 |
| P-6 | MEJORAR_PLAN | 5-0 |
| P-7 | MEJORAR_PLAN | 5-0 |
| P-8 | APLICAR | 4-1 |
| P-9 | MEJORAR_PLAN | 5-0 |
| P-10 | MEJORAR_PLAN | 5-0 |
| P-11 | MEJORAR_PLAN | 4-1 |
| P-12 | MEJORAR_PLAN | 5-0 |
| P-13 | MEJORAR_PLAN | 4-1 |
| P-14 | MEJORAR_PLAN | 5-0 |
| P-15 | MEJORAR_PLAN | 5-0 |
| P-16 | MEJORAR_PLAN | 5-0 |
| P-17 | MEJORAR_PLAN | 4-1 |
| P-18 | APLICAR | 5-0 |
| Forma mínima 1 (F3) | Se saca | 5-0 |
| Forma mínima 2 (segundo `.csproj`) | Se saca | 4-1 |
| Forma mínima 3 (página PoC Blazor) | No se saca; se reduce | 3-2 |
| Forma mínima 4 (variante JS) | Se saca | 5-0 |
| Forma mínima 5 (versión desconocida) | Se saca | 5-0 |
| Forma mínima 6 (WebAssembly/Auto) | No se saca; supuesto en §1 | 3-2 |
| Forma mínima 7 (§7 deduplicado) | Se saca | 4-1 |
| Forma mínima 8 (`CustomEvent`) | Se saca | 5-0 |

Sigue: dictamen · presidente de mesa
