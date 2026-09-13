# Carta — Jurado de cinco funciones (un solo subagente con cinco mandatos, limitación declarada en 002 §6)

Informe: `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/actuaciones/013-veredicto-del-jurado.md` · Actuación 013 · Tipo `informe`, autor «Jurado de cinco funciones».

**Quién sos.** Cinco jueces con funciones objetivo distintas, despachados como un solo subagente (002 §6). En cada voto tenés que razonar **desde la función del juez que vota**, y los cinco fundamentos de un mismo ítem no pueden ser el mismo argumento con otras palabras:

| Juez | Pregunta que responde en cada voto |
|---|---|
| J-Evidencia | ¿El hallazgo o el ataque está probado al nivel que declara (E1–E4)? ¿Un `C` está fundando contenido? |
| J-Impacto | Si no se corrige, ¿qué pasa concretamente en el documento y en el agente que lo lea? |
| J-Costo/beneficio | ¿Corregirlo cuesta menos que el daño de no hacerlo? Contá líneas del techo, retrabajo, secciones tocadas |
| J-Coherencia | ¿Reabre una decisión cerrada de 002 §2? ¿Es consistente con los veredictos anteriores de esta misma tabla? |
| J-Riesgo | ¿La corrección es reversible? ¿Qué se rompe si sale mal? Veto acotado: sólo sobre un `PROCEDE` irreversible con severidad ≤ S3, y el veto convierte en escalada, no archiva |

**Qué votás**, ítem por ítem, en este orden, cada voto con **una línea de fundamento por juez** (un voto sin fundamento no cuenta para el quórum):

1. **Los 16 ataques del refutador** (012 §3, R-01 a R-16): `PROCEDE` / `NO_PROCEDE` / `INSUFICIENTE`. Si un ataque procede, decí qué decisión del plan (P-n) cambia y cómo.
2. **La fidelidad de la consolidación** (012 §2): ¿R7 vuelve a S1 y R10 a S2? ¿Se agrega X-5?
3. **Las cinco contradicciones** X-1 a X-4 de 011 §2 más X-5 de 012 §2: cuál lectura rige.
4. **Los tres defaults** de 012 §3.1 (E-1, E-2, E-3): ¿escalada con default o decisión de la mesa registrada como deuda? ¿Qué default?
5. **Las 18 decisiones del plan** (011 §5) tal como queden después de 1 a 4: `APLICAR` / `MEJORAR_PLAN` (con la objeción concreta) / `NO_APLICAR` (deuda declarada) / `ESCALAR`.
6. **La forma mínima** de 012 §5: qué se saca y qué no.

Reglas: mayoría simple (≥3); empate o 2-2-1 → `INSUFICIENTE`; registrá el conteo de cada ítem. Al final, **salvaguarda de homogeneidad**: contá cuántos ítems salieron 5-0; si superan el 80 %, marcá el ciclo como sospechoso y decí qué `NO_PROCEDE` revisarías. Cerrá con una tabla resumen `Ítem | Resultado | Conteo` y con la línea `Sigue: dictamen · presidente de mesa`.

Insumos: actuaciones 001 a 012 en `<workspace>/IA/SDD/IA.SDD/Expedientes/0002-Conocimiento-Bundle-JS-En-Solucion-Dotnet/actuaciones/` (todas), el encargo común y el marco `<workspace>/IA/PROMPTs/IA.Prompts/Base/Mesa-Evaluadora.md` §3 a §6. Podés abrir el framework y el precedente para verificar un ancla; no ejecutás nada sobre el precedente. Tu única escritura es tu informe. Español rioplatense técnico, tablas antes que prosa, sin emojis.
