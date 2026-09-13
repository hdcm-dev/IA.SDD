# Actuación 001 — Presentación del caso

| Campo | Valor |
|---|---|
| Tipo | `presentacion` |
| Fecha | 2026-09-13 |
| Autor | Product Owner del `Framework SDD`, por tool-prompt; asienta el presidente de mesa |
| Corrige | — |

## 1. Qué se presenta

El Product Owner invoca el tool-prompt
`IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/02-Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS/Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS.md`
en la sesión del 2026-09-13. **El original se preserva byte a byte** en
[`evidencia/ev-05-presentacion-original.md`](../evidencia/ev-05-presentacion-original.md), con su huella en
`evidencia/SHA256SUMS`. Este folio no lo transcribe: lo resume, y ante diferencia rige el original.

## 2. Lo que pide, en los términos del original

1. **Un documento de conocimiento** con la forma que fija `Rules-Base-Conocimiento.md`, catalogado con el alias
   **`Bundle-JS`**, que capture cómo se diseñan, estructuran, codifican, contratan, integran, diagnostican y
   evalúan los **proyectos ajenos a .NET —el caso concreto, un bundle JavaScript— dentro del árbol de una
   solución .NET**, para que agentes de IA con especialidades y tareas asignadas ejecuten esos casos como lo
   haría un agente humano bajo el `Framework SDD`.
2. Los agentes que lo lean tienen que poder: **crear el proyecto del bundle** (TypeScript o JavaScript) que
   emite **dos artefactos, `main.js` y el bundle**; **crear la PoC HTML** que invoca esos artefactos como lo
   haría Blazor y sirve a quien después integra y a quien diagnostica; **crear la biblioteca de clases Blazor**
   que integra los dos artefactos —convertirla en NuGet queda fuera de alcance—; y **crear la PoC Blazor** que
   integra esa biblioteca con la misma finalidad de diagnóstico y diseño de la integración.
3. **Restricción de fondo**: el documento **no dicta cómo se estructura la solución .NET** ni condiciona al
   framework destino en eso. Ejemplo dado por el Product Owner: si otro framework ubica sus PoC en `/demos`, el
   documento no debe obligarlo a usar `/samples`.
4. **Ubicación**: el documento **no se incorpora al repositorio del framework**. Va a `OUTPUTs/` de la carpeta
   del tool-prompt, para que quien use el framework lo sume a su fork o a su propio framework.
5. **Procedimiento**: una mesa evaluadora y planificadora organizada según `IA/PROMPTs/IA.Prompts/Base/Mesa-Evaluadora.md`,
   con los especialistas necesarios y autoridad para decidir, que **levante un expediente** en
   `IA.SDD/Expedientes/` siguiendo la nomenclatura de los existentes.
6. **Reglas**: no inventar; toda afirmación con evidencia verificable; **no modificar el `Framework SDD`**.

## 3. Insumos que el original manda leer

| Insumo | Qué es | Dónde |
|---|---|---|
| `IA.SDD/README.md` | Superficie de entrada del framework | Conjunto normativo 13.17 |
| `IA.SDD/Conocimiento/README.md` | Modelo de la base de conocimiento anexa | Carpeta anexa |
| `INPUTs/Bundle-JS-En-Solucion-Blazor.md` | Análisis previo del caso: clasificación del bundle como proyecto de código, dos casos de composición, las dos PoC y su encaje como samples | `ev-04-input.out` fija su huella y su índice |

Sigue: providencia de convocatoria · presidente de mesa
