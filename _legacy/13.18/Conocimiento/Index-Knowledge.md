# Índice — Base de conocimiento

**Documento:** Conocimiento/Index-Knowledge.md
**Compatible con:** Rules-Base-Conocimiento.md 2.0
**Fecha:** 2026-09-13

---

## 1. Qué es esta base

El catálogo de oficio: cómo se construyen y se estructuran las cosas que el método deliberadamente no
gobierna. El propósito de la carpeta y su modelo de extensión están en su [`README.md`](README.md).

**Este índice es el único lugar donde se declara qué existe y cuándo se carga**, y es lo que el
orquestador abre para resolver un alias citado en el intake. Su formato lo fija
`Rules-Base-Conocimiento.md` §7.

**Con el catálogo vacío el framework corre exactamente como si esta carpeta no existiera.**

## 2. Cómo se agrega un documento

Ejecutando el tool-prompt `Relevar-Conocimiento.md`, que releva el artefacto contra
`Rules-Base-Conocimiento.md` y deja acá el documento más su fila en §3. A mano también se puede, pero
hay que cumplir el mismo formato: lo verifica la lista de §6.1 del archivo de reglas.

**Un alta acá es una intervención sobre el framework**, porque escribe en su repositorio: lleva entrada
en el `CHANGELOG.md`, copia del conjunto superado a `_legacy/` y, si alcanza a varios archivos, nota de
coherencia. Y la verificación de ofuscación es previa y bloqueante.

## 3. Catálogo

| Documento | Alias | Naturaleza | Tema | Consumidor | Condicion-de-carga | Hereda-de | Sustituye | Compatible-con | Estado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `Knowledge-Clean-Architecture-DataManager.md` | `Clean-Architecture-DataManager` | canonico | Arquitectura interna en cuatro capas con acceso a datos por DataManager sobre ADO.NET, sin ORM | 05 | proyectos de código `rest-api` o `web-monolith` sobre stack .NET con persistencia SQL Server | — | — | 1.1 | Vigente |
| `Knowledge-Conformacion-Pull-Request-Manual.md` | `Conformacion-Pull-Request-Manual` | canonico | Ciclo de entrega de una unidad de trabajo entre un agente orquestador y un agente humano: compuerta, rama, informe con el enlace del pull request, merge y borrado del humano, acuse y reanudación verificada | transversal | — | — | — | 2.2 | Vigente |
| `Knowledge-Template-HTML-SDD-Default.md` | `Template-HTML-SDD-Default` | propio | Forma constructiva de una maqueta HTML/CSS/JS sin proceso de build: layout de archivos, tokens, conmutador declarativo de estados y los cuatro tipos de diálogo | 03, AG-00031 | proyectos de código con `requiere_maqueta == true` que construyan la maqueta con HTML, CSS y JavaScript planos | — | — | 2.2 | Vigente |
| `Knowledge-Template-Blazor-Interactive-Server-SDD-Default.md` | `Template-Blazor-Interactive-Server-SDD-Default` | propio | Realización del template HTML como proyecto .NET Blazor Web App con render mode Interactive Server y sin librería de componentes: estructura, componentes propios por patrón, formularios, diálogos, asistentes e identidad fuera del circuito | 03, 05 | proyectos de código `web-monolith` sobre stack .NET con interfaz Blazor Web App en render mode Interactive Server, sin librería de componentes de terceros | `Template-HTML-SDD-Default` | — | 2.2 | Vigente |
| `Knowledge-Mesa-De-Expertos-A-Pedido.md` | `Mesa-De-Expertos-A-Pedido` | propio | Mesa de expertos convocada por un pedido explícito y no por la condición de un orquestador: lectura del pedido, clase de objeto y variante del panel, despacho verificado, expediente de la mesa y filtros de juicio medidos en su uso | transversal | — | — | — | 2.2 | Vigente |

## 4. Identidad de versión

**No tiene una propia: es la del framework.** Al vivir esta carpeta en el repositorio y entrar en el
snapshot de `_legacy/`, un destino que declara con qué versión del framework se generó **ya declara con
qué conocimiento se generó**. El intake no registra ninguna raíz ni ninguna versión de base: cita alias,
y nada más.

## 5. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.3 | 2026-09-13 | Alta de `Mesa-De-Expertos-A-Pedido`: la mesa de expertos que se pide por nombre, sobre objetos que la condición de `Mesa-Rules.md` §0.0 no alcanza —una interfaz en ejecución, una norma por diseñar, una contradicción entre observadores—, catalogada sin redefinir la norma. El catálogo pasa de cuatro a **cinco** documentos. |
| 1.2 | 2026-09-01 | Alta de `Template-HTML-SDD-Default` y de `Template-Blazor-Interactive-Server-SDD-Default`: la forma constructiva de la maqueta y su realización sobre Blazor Interactive Server sin librería de componentes. Primer par del catálogo con herencia declarada, y primeros documentos de naturaleza `propio`. |
| 1.1 | 2026-08-29 | Alta de `Conformacion-Pull-Request-Manual`: el procedimiento de traspaso de una unidad de trabajo al agente humano, vigente por defecto y hasta ahora sin alias con el que citarlo desde un intake. |
| 1.0 | 2026-08-23 | Emisión inicial, con el alta de `Clean-Architecture-DataManager`. |
