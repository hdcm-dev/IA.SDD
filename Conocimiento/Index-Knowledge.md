# Índice — Base de conocimiento

**Documento:** Conocimiento/Index-Knowledge.md
**Compatible con:** Rules-Base-Conocimiento.md 2.3
**Fecha:** 2026-10-23

---

## 1. Qué es esta base

El catálogo de oficio: cómo se construyen y se estructuran las cosas que el método deliberadamente no
gobierna. El propósito de la carpeta y su modelo de extensión están en su [`README.md`](README.md).

**Este índice es el único lugar donde se declara qué existe y cuándo se carga**, y es lo que el
orquestador abre para resolver un alias citado en el intake. Su formato lo fija
`Rules-Base-Conocimiento.md` §7.

**Con el catálogo vacío el framework corre exactamente como si esta carpeta no existiera.**

## 2. Cómo se agrega un documento

Con un prompt de relevamiento que cita literalmente el bloque de `Rules-Base-Conocimiento.md` §8: releva
el artefacto contra esa regla y deja acá el documento más su fila en §3. A mano también se puede, pero
hay que cumplir el mismo formato: lo verifica la lista de §6.1 del archivo de reglas. **Un documento que
se suma desde otro repositorio llega con su cierre**: toda referencia resuelve en este árbol
(`Rules-Base-Conocimiento.md` §2.2).

**Un alta acá es una intervención sobre el framework**, porque escribe en su repositorio: lleva entrada
en el `CHANGELOG.md`, copia del conjunto superado a `_legacy/` y, si alcanza a varios archivos, nota de
coherencia. Y la verificación de ofuscación es previa y bloqueante.

## 3. Catálogo

| Documento | Alias | Naturaleza | Tema | Consumidor | Condicion-de-carga | Hereda-de | Sustituye | Compatible-con | Estado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `Knowledge-Clean-Architecture-DataManager.md` | `Clean-Architecture-DataManager` | canonico | Arquitectura interna en cuatro capas con acceso a datos por DataManager sobre ADO.NET, sin ORM | 05 | proyectos de código `rest-api` o `web-monolith` sobre stack .NET con persistencia SQL Server | — | — | 2.0 | Vigente |
| `Knowledge-Conformacion-Pull-Request-Manual.md` | `Conformacion-Pull-Request-Manual` | canonico | Ciclo de entrega de una unidad de trabajo entre un agente orquestador y un agente humano: compuerta, rama, informe con el enlace del pull request, merge y borrado del humano, acuse y reanudación verificada | transversal | — | — | — | 2.2 | Vigente |
| `Knowledge-Conformacion-Pull-Request-Automatico.md` | `Conformacion-Pull-Request-Automatico` | canonico | Ciclo de entrega de una unidad de trabajo cerrado por el propio agente orquestador: compuerta, rama, pull request abierto por API, informe con el enlace, guarda de merge sobre los controles, merge y borrado de la rama remota por el agente, preparación del repositorio local y continuación sin acuse humano, con retorno al ciclo manual ante una reserva | transversal | — | `Conformacion-Pull-Request-Manual` | — | 2.2 | Vigente |
| `Knowledge-Logica-De-Decision.md` | `Logica-De-Decision` | propio | Análisis previo a elevar: prueba de materialidad (aditivo/estructural, reversible, riesgo al objetivo, dueño de la norma, efecto externo), cinco salidas, ADR consecuente sobre un ADR propio, consulta con propuesta y default, carta con intención y lección por decisión; se carga antes de detener, escalar o armar un lote | transversal | — | — | — | 2.3 | Vigente |
| `Knowledge-Template-HTML-SDD-Default.md` | `Template-HTML-SDD-Default` | propio | Forma constructiva de una maqueta HTML/CSS/JS sin proceso de build: layout de archivos, tokens, conmutador declarativo de estados, y los cuatro tipos de diálogo (ABM clásico, asistente de varios niveles, ventana modal y presentación de datos) | 03, AG-00031 | proyectos de código con `requiere_maqueta == true` que construyan la maqueta con HTML, CSS y JavaScript planos | — | — | 2.2 | Vigente |
| `Knowledge-Template-Blazor-Interactive-Server-SDD-Default.md` | `Template-Blazor-Interactive-Server-SDD-Default` | propio | Realización del template HTML de maqueta como proyecto .NET Blazor Web App con render mode Interactive Server y sin librería de componentes: estructura, componentes propios por patrón, formularios, diálogos, asistentes y superficies de identidad fuera del circuito | 03, 05 | proyectos de código `web-monolith` sobre stack .NET con interfaz Blazor Web App en render mode Interactive Server, sin librería de componentes de terceros | `Template-HTML-SDD-Default` | — | 2.2 | Vigente |
| `Knowledge-Mesa-De-Expertos-A-Pedido.md` | `Mesa-De-Expertos-A-Pedido` | propio | Mesa de expertos convocada por un pedido explícito y no por la condición de un orquestador: lectura del pedido como enunciado del problema, clase de objeto y variante del panel, convenciones que rigen medidas, despacho verificado, expediente de la mesa con el ciclo de vida de su evidencia y filtros de juicio medidos en su uso | transversal | — | — | — | 2.3 | Vigente |
| `Knowledge-Excepcion-A-Un-Conocimiento.md` | `Excepcion-A-Un-Conocimiento` | propio | Excepción a un conocimiento que rige: se deja de seguir un documento de la base sólo por contradicción y no por conveniencia, con una ficha que trae la alternativa de cumplir y su costo, un análisis del camino de compromiso con criterios citados y uno o dos caminos, el default mientras quien pidió decide y el apartado de cierre; se carga al proponer, juzgar, analizar, votar o aplicar una excepción | transversal | — | — | — | 2.3 | Vigente |
| `Knowledge-Cadena-De-Consecuencias.md` | `Cadena-De-Consecuencias` | propio | Cómo se razona antes de recomendar, dictaminar o elegir entre opciones: cada opción se sigue hasta el lugar donde cae su costo, se mide ahí, se dice qué pierde la alternativa y se prefiere la reversible; un obstáculo no es una decisión, una acción denegada no se le pide a otro agente y la restricción también es una opción | transversal | — | — | — | 2.3 | Vigente |
| `Knowledge-Entorno-De-Ejecucion-Del-Agente.md` | `Entorno-De-Ejecucion-Del-Agente` | propio | Clasificación verificada del origen de un texto que aparece en la conversación de un agente —pedido, framework, destino, entorno de ejecución, herramienta o subagente— y qué hacer con cada clase: obedecer, callar, relayar o registrar una preferencia, sin corregir el framework por lo que el framework no produce | transversal | — | — | — | 2.2 | Vigente |

## 4. Identidad de versión

**No tiene una propia: es la del framework.** Al vivir esta carpeta en el repositorio y entrar en el
snapshot de `_legacy/`, un destino que declara con qué versión del framework se generó **ya declara con
qué conocimiento se generó**. El intake no registra ninguna raíz ni ninguna versión de base: cita alias,
y nada más.

## 5. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.8 | 2026-10-27 | Alta de `Logica-De-Decision` (mesa de lógica de decisión, despacho X01). El catálogo pasa de nueve a **diez** documentos. |
| 1.7 | 2026-10-23 | **El conocimiento de la mesa a pedido se parte en tres y llega con su cierre** (expediente `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`). La fila de `Mesa-De-Expertos-A-Pedido` se reescribe desde su cabecera 2.0: `Tema` nuevo y `Compatible-con` 2.3. Altas de `Excepcion-A-Un-Conocimiento`, su hermano, y de `Cadena-De-Consecuencias`, la dependencia traída de un destino privado, a continuación de la fila del padre: los dos `propio`, `transversal`, sin condición de carga, y cada `Tema` dice en qué acto se carga. La cabecera del índice pasa a declararse compatible con la **2.3** de las reglas; las otras seis filas conservan su valor. **§2**: la remisión a un tool-prompt de relevamiento que no existe se reemplaza por el bloque de `Rules-Base-Conocimiento.md` §8, y una oración remite a §2.2, el cierre de un documento traído. El catálogo pasa de siete a **nueve** documentos. |
| 1.6 | 2026-09-19 | Alta de `Conformacion-Pull-Request-Automatico`, **especialización** de `Conformacion-Pull-Request-Manual` (`Hereda-de`): la variante del traspaso en la que el agente abre el pull request, publica el informe con el enlace, lo fusiona tras una guarda sobre los controles, borra la rama remota, prepara el repositorio local y sigue sin acuse, con retorno al ciclo manual ante una reserva. Declara la desviación de `Master-Prompt.md` §12.1 T1 y sólo vale con la delegación del merge asentada en el destino. El catálogo pasa de seis a **siete** documentos. |
| 1.5 | 2026-09-19 | **Conciliación del catálogo con las cabeceras**, sin altas ni bajas: sigue en **seis** documentos. La comprobación campo por campo de `Rules-Base-Conocimiento.md` §6.1 encontró tres filas desalineadas y se corrigen hacia el documento, que es la fuente: `Clean-Architecture-DataManager` declaraba `Compatible-con` 1.1 y su cabecera dice **2.0**; el `Tema` de `Template-HTML-SDD-Default` y el de `Template-Blazor-Interactive-Server-SDD-Default` estaban abreviados respecto de su cabecera y pasan a reproducirla. La cabecera de este índice pasa a declararse compatible con la **2.2** de las reglas, la versión vigente de su contrato. |
| 1.4 | 2026-09-14 | Alta de `Entorno-De-Ejecucion-Del-Agente`: cómo un agente clasifica, con una búsqueda y no por el tono, el origen de un texto de la conversación, y qué hace con lo que agrega el entorno que lo ejecuta —obedecer, callar, relayar o registrar una preferencia— sin corregir el framework por lo que el framework no produce. El catálogo pasa de cinco a **seis** documentos. |
| 1.3 | 2026-09-13 | Alta de `Mesa-De-Expertos-A-Pedido`: la mesa de expertos que se pide por nombre, sobre objetos que la condición de `Mesa-Rules.md` §0.0 no alcanza —una interfaz en ejecución, una norma por diseñar, una contradicción entre observadores—, catalogada sin redefinir la norma. El catálogo pasa de cuatro a **cinco** documentos. |
| 1.2 | 2026-09-01 | Alta de `Template-HTML-SDD-Default` y de `Template-Blazor-Interactive-Server-SDD-Default`: la forma constructiva de la maqueta y su realización sobre Blazor Interactive Server sin librería de componentes. Primer par del catálogo con herencia declarada, y primeros documentos de naturaleza `propio`. |
| 1.1 | 2026-08-29 | Alta de `Conformacion-Pull-Request-Manual`: el procedimiento de traspaso de una unidad de trabajo al agente humano, vigente por defecto y hasta ahora sin alias con el que citarlo desde un intake. |
| 1.0 | 2026-08-23 | Emisión inicial, con el alta de `Clean-Architecture-DataManager`. |
