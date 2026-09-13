# Carta — Comisión V1, Arquitectura de integración (catálogo, señal: integración entre sistemas y más de un componente)

Informe: `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/actuaciones/006-informe-arquitectura-integracion.md` · Actuación 006.

**Señal que te convoca:** el documento de entrada §2.3, §4 obs. 2 y §8.4 (dos soluciones de código, grafo de compilación contra consumo de artefacto publicado, RCL entre el bundle y la app); el precedente resuelve la misma pregunta de otra forma (ADR-00042: el TypeScript vive **dentro** del proyecto Razor y se construye en el `dotnet build`).

**Pregunta que respondés:** ¿Cuáles son las **formas de composición** posibles entre el bundle, la biblioteca de clases Razor y la app —dónde vive el bundle, cuántas soluciones de código hay, qué es arista de compilación y qué es consumo de artefacto—, con qué criterio se elige cada una, y cómo se describen **sin imponer una estructura de solución .NET**? ¿Qué frontera tiene que respetar el bundle hacia adentro (sin red, sin dominio) para que la PoC HTML sea representativa?
**No te corresponde:** la forma del contrato de datos (V2), la cadena de construcción y publicación (V3), ni el detalle de la interoperabilidad de Blazor (AH-2).
