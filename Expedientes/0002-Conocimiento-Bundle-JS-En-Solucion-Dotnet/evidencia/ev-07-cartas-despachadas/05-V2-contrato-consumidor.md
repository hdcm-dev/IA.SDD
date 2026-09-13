# Carta — Comisión V2, Interfaz y contrato con el consumidor (catálogo, señal: contrato entre dos entornos, retrocompatibilidad)

Informe: `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/actuaciones/007-informe-contrato-js-dotnet.md` · Actuación 007.

**Señal que te convoca:** el original pide «cómo se genera la base contractual entre los diferentes artefactos» y habla de DTO en JSON, métodos de un `main.js` y callbacks registrados desde Blazor; el documento de entrada §8.3 dice que el contrato JS es «la pieza central»; el precedente declara el contrato **una vez de cada lado** (`Contrato.cs` y `ts/contrato.ts`) y lo documenta en la 05 (`Contratos-Abstractions-*.md`).

**Pregunta que respondés:** ¿Qué es exactamente **el contrato** entre el bundle y .NET —operaciones de entrada, eventos de salida, esquemas de datos, errores, versionado, identidad de instancia—, cómo se declara de los dos lados sin depender un archivo del otro, cómo se detecta que se rompió, y qué de todo eso es lo que las dos PoC tienen que ejercitar? Distinguí el contrato de **compilación** (bundle↔RCL) del de **integración** (RCL↔app), con el vocabulario de `PRODUCT-INTAKE-template.md` §14.
**No te corresponde:** dónde viven los archivos (V1), cómo se construye (V3), ni el ciclo de vida del circuito de Blazor (AH-2), salvo en lo que el contrato tenga que declarar.
