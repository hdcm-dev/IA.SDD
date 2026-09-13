# Encargo común a todas las comisiones — expediente 0002

Método: carta escrita por el presidente de mesa antes del despacho, el 2026-09-13; se entrega verbatim a cada comisión junto con su carta propia. Base: `IA.SDD` `a501857` (13.17). Quién: presidente de mesa.

## El caso

El Product Owner del `Framework SDD` pide **un documento de conocimiento** —formato de `Rules-Base-Conocimiento.md`, alias `Bundle-JS`, naturaleza `propio`— que enseñe a agentes de IA cómo **diseñar, estructurar, contratar, integrar, diagnosticar y evaluar un bundle JavaScript (proyecto de código no .NET) dentro del árbol de una solución .NET con Blazor**, incluidas **dos pruebas de concepto**: una **PoC HTML** (una página con un `main.js` que invoca el bundle como lo haría Blazor, sin .NET) y una **PoC Blazor** (una app mínima que consume la biblioteca de clases Razor que integra los dos artefactos JavaScript). El documento **no puede dictar cómo se estructura la solución .NET** ni dónde otro framework pone sus PoC (si usa `/demos`, no se le impone `/samples`). No se incorpora al framework: va a `OUTPUTs/` del tool-prompt.

**La mesa es evaluadora y planificadora.** No hay todavía documento que corregir: hay que **relevar qué tiene que decir**, con evidencia, y **qué de los insumos está mal, falta o contradice al framework**. Cada comisión entrega las dos cosas.

## Insumos (rutas absolutas)

| Insumo | Ruta |
|---|---|
| Presentación original (tool-prompt) | `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/evidencia/ev-05-presentacion-original.md` |
| Análisis previo del caso (documento de entrada) | `<workspace>/IA/SDD/IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/02-Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS/INPUTs/Bundle-JS-En-Solucion-Blazor.md` |
| Actuaciones 001 y 002 del expediente | `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/actuaciones/` |
| Evidencia ya levantada (leer `ev-02-citas.out`, `ev-03-precedente.out`) | `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/evidencia/` |
| Formato obligatorio del documento a producir | `<workspace>/IA/SDD/IA.SDD/SDD/Devs/Rules/Rules-Base-Conocimiento.md` |
| Modelo de la base de conocimiento | `<workspace>/IA/SDD/IA.SDD/Conocimiento/README.md` y `Index-Knowledge.md` |
| Dos documentos de conocimiento ya publicados, como referencia de forma | `<workspace>/IA/SDD/IA.SDD/Conocimiento/Knowledge-Template-Blazor-Interactive-Server-SDD-Default.md`, `Knowledge-Conformacion-Pull-Request-Manual.md` |
| Conjunto normativo del framework | `<workspace>/IA/SDD/IA.SDD/SDD/Devs/` (Rules, Intake, Orchestrator) y `README.md` |
| **Precedente real** de un bundle TypeScript dentro de una biblioteca de clases Razor, generado con el framework | `<repo-privado-F1>/src/<F1>.<Componente>/` (leer `Contrato.cs`, `ts/contrato.ts`, `ts/<componente>.ts`, `DiagramaDeCabecera.razor`, el `.csproj`, `package.json`) y sus decisiones `SDD/Docs/05-Arquitectura-Tecnica/Adrs/ADR-00042-*.md` y `ADR-00043-*.md`, más `SDD/Docs/05-Arquitectura-Tecnica/Contratos-Abstractions-<F1>-<Componente>.md` y `SDD/Maquetas/<F1>-Web/README.md` |

**Sobre el precedente:** es un producto de un cliente. En tu informe podés citarlo por ruta; el documento final lo va a citar ofuscado. No copies nombres de dominio de ese producto como si fueran parte del conocimiento a transmitir: extraé **la forma**, no el contenido.

## Reglas no negociables

1. **Trabajás a ciegas.** No leés informes de otras comisiones (no existen todavía en `actuaciones/`; si aparecen, no los abras).
2. **Nadie opina fuera de su mandato.** Si ves algo ajeno a tu carta, emitís una `solicitud_convocatoria` (rol faltante, señal con ubicación, qué no podés afirmar sin él). No lo resolvés vos.
3. **Nada se afirma sin ancla.** Cada ítem lleva nivel de evidencia: `E1` resultado ejecutable reproducible (comando y salida); `E2` cita literal con archivo y línea o sección; `E3` contraejemplo construido; `E4` regla del contrato de entrada (actuación 002 §2); `C` conjetura. **Un ítem `C` sólo puede fundar una pregunta, nunca contenido del documento.** Hechos del stack (Blazor, MSBuild, esbuild, npm) se anclan citando la documentación oficial por nombre de producto y tema —el framework manda «los estándares de industria se nombran, no se enlazan»— o, mejor, con `E2` sobre el precedente.
4. **No inventás.** Si el framework no dice algo, decís que no lo dice; eso es un hallazgo.
5. **No modificás nada** fuera del archivo de tu informe. Ni el framework, ni el documento de entrada, ni el precedente.
6. Español rioplatense neutro técnico, sin emojis, sin marketing. Tablas antes que prosa.
7. **Tope: 7 hallazgos y 3 «lo revisé y está bien».** Sin tope en la sección de relevamiento, pero cada fila con su ancla.

## Forma del informe

Escribilo **completo** con la herramienta Write en la ruta que tu carta indica. Cabecera obligatoria:

```
# Actuación NNN — Informe <comisión>

| Campo | Valor |
|---|---|
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Comisión <id>, <nombre> |
| Corrige | — |
```

Secciones, en este orden:

1. **Mandato y método**: qué leíste (rutas) y en qué orden; qué no leíste y por qué.
2. **Relevamiento para el documento `Bundle-JS`**: tabla `Id | Sección destino del documento (§0–§9 de Rules-Base-Conocimiento §4.2) | Qué tiene que decir | Ancla (nivel + cita) | Riesgo si falta`. Es la salida principal. Ids `R<id-comisión>-NN`.
3. **Hallazgos** sobre los insumos y sobre el encaje con el framework: tabla `Id | Ubicación | Afirmación | Evidencia (nivel + ancla) | Severidad S1–S4 | Confianza 0–1 | Impacto si no se corrige | Dirección propuesta`. Ids `H<id-comisión>-NN`.
4. **Lo que revisé y está bien** (máximo 3).
5. **Solicitudes de convocatoria**, si las hay.
6. **Preguntas al Product Owner** que sólo un `C` justifica, si las hay. Formuladas como pregunta cerrada con opciones.
7. Línea final: `Sigue: consolidación · presidente de mesa`.
