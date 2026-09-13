# Carta — Agente ad hoc AH-2, Interoperabilidad Blazor ↔ JavaScript

Informe: `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/actuaciones/010-informe-interop-blazor.md` · Actuación 010.

```yaml
agente_ad_hoc:
  id: AH-2
  nombre: Interoperabilidad Blazor ↔ JavaScript y biblioteca de clases Razor
  señal_que_lo_justifica: { descripción: "el original pide «crear la librería de clases .NET Blazor, que será quien integre el main.js y el bundle» y «registrar callback blazor en la clase de interfaz en main.js para luego cuando el bundle.js dispare dichos callback»", ubicación: "ev-05, Contexto (cuarto párrafo) y Solicitudes, tercer ítem" }
  pregunta_que_responde: ¿Cómo integra una biblioteca de clases Razor un módulo JavaScript —carga del módulo, referencia al elemento, referencia .NET para callbacks, serialización de DTO, liberación en los dos lados, circuito caído, render mode— y qué de eso tiene que quedar declarado para que la PoC Blazor sirva como diagnóstico?
  competencia: Microsoft.JSInterop (IJSRuntime, IJSObjectReference, DotNetObjectReference, JSInvokable, JSDisconnectedException), estáticos de RCL bajo _content/, OnAfterRenderAsync, IAsyncDisposable, render modes. NO le corresponde el código del bundle (AH-1), el contrato de datos (V2) ni MSBuild (V3).
  evidencia_admisible: [E1, E2, E3, E4]
  tope_hallazgos: 5
  se_disuelve_cuando: el dictamen del expediente 0002 quede asentado
```

Apoyate en el precedente (`DiagramaDeCabecera.razor`, `Contrato.cs`) y en `Conocimiento/Knowledge-Template-Blazor-Interactive-Server-SDD-Default.md` §5.6 y §3.2 (interoperabilidad mínima, higiene del circuito). Anclá los hechos de la plataforma citando la documentación oficial de ASP.NET Core Blazor por tema, sin enlaces.
