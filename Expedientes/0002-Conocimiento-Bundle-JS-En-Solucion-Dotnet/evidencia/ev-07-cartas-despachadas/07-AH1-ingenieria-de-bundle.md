# Carta — Agente ad hoc AH-1, Ingeniería del bundle (TypeScript, empaquetado, pruebas sin anfitrión)

Informe: `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/actuaciones/009-informe-ingenieria-del-bundle.md` · Actuación 009.

```yaml
agente_ad_hoc:
  id: AH-1
  nombre: Ingeniería del bundle JavaScript/TypeScript
  señal_que_lo_justifica: { descripción: "el original pide «crear el proyecto bundle javascript, en typescript, javascript, etc» que «arrojará dos artefactos: main.js y el bundle javascript, respetando métodos, clases y objetivos de cada elemento»", ubicación: "ev-05, sección Solicitudes, primer ítem" }
  pregunta_que_responde: ¿Cómo se estructura el proyecto del bundle —fuentes, punto de entrada, qué es main.js y qué es el bundle, superficies de salida (módulo ES y global), estilos, pruebas sin DOM ni Blazor— y qué convenciones de código hay que respetar para que el mismo código sirva a la PoC HTML y a Blazor?
  competencia: layout del proyecto JS/TS, empaquetador, formatos de salida, gestión de instancias por contenedor, ciclo de vida montar/render/destruir, pruebas con el runner del runtime. NO le corresponde el contrato de datos en sí (V2), la cadena MSBuild (V3) ni la API de interoperabilidad de Blazor (AH-2).
  evidencia_admisible: [E1, E2, E3, E4]
  tope_hallazgos: 5
  se_disuelve_cuando: el dictamen del expediente 0002 quede asentado
```

Apoyate en el precedente (`ts/<componente>.ts`, `package.json`, ADR-00043 «dos superficies de consumo desde un mismo código»). **Aclará qué designa «main.js» en el pedido del Product Owner** frente a lo que el precedente llama punto de entrada y módulo: si son dos artefactos distintos o un solo módulo con dos superficies, y qué conviene que el documento fije como vocabulario.
