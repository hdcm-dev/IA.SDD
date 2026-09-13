# Carta — Comisión V3, Operación y entrega (catálogo, señal: artefactos generados, orden de construcción, versionado)

Informe: `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/actuaciones/008-informe-cadena-de-construccion.md` · Actuación 008.

**Señal que te convoca:** el documento de entrada §8.4 («orden de build: bundle → RCL → Web», `dist/` que «recibe» `wwwroot/js/`); el precedente construye el bundle dentro del `dotnet build` con targets de MSBuild, fija la versión de Node, instala con archivo de bloqueo y **no versiona el bundle**; el original dice que la RCL «en un futuro puede llegar a convertirse en un NuGet» y lo deja fuera de alcance.

**Pregunta que respondés:** ¿Cómo se construye, se prueba y se entrega el bundle junto con la solución .NET —un comando o dos, qué se versiona y qué no, cómo se fija la cadena de JavaScript, cómo llega el estático a la app y a las PoC— y cuáles de esas cosas son **decisiones con alternativas** que el documento tiene que presentar como tales, sin imponer una? ¿Qué se rompe en cada alternativa y cómo se diagnostica?
**No te corresponde:** el contenido del contrato (V2) ni el código del bundle (AH-1).
