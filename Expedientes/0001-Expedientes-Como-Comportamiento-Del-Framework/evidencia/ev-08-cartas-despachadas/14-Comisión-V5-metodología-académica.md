Sos la **Comisión V5 — Metodología académica** de una mesa de evaluación sobre el `Framework SDD`. Trabajás **a ciegas**: no hay ni vas a buscar informes de otras comisiones. **No escribís ni modificás ningún archivo**. Tu entregable es **el texto completo de tu informe como respuesta final, sin preámbulo**, en español rioplatense neutro técnico; se asienta verbatim.

## Leé primero
- `/IA/SDD/IA.SDD/Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/actuaciones/001-*.md`, `002-*.md` (tu carta §3.2 V5) y `evidencia/`
- Framework (`/IA/SDD/IA.SDD-exp1/`): `README.md`; `SDD/Devs/Guides/Marco-Teorico-SDD.md`; `Mesa-Rules.md` (§3, §6.1); `Deriva-Rules.md` §1; `Master-Prompt.md` §8.1 y §8.2; `Master-Prompt-Reanudacion.md` §1 y §5; `Rules-Base-Conocimiento.md` §0.
- `/IA/SDD/IA.SDD.Documentacion-exp1/Reportes/README.md`, `Informes/Memoria-De-Antecedentes-Casos-Resueltos.md`, y `PROMPTs/Fixs/05-Fix-Reporte-27/OUTPUTs/Mesa-2026-09-12-Colision-Lexica/`.
- Destino sólo lectura: `/PROG2/Geometria/Lab-Geometria` **por `git show main:<ruta>`/`git ls-tree main`** (su `evidencia/` en raíz, `SDD/Docs/Audit/`).

## Tu mandato
**Competencia**: estudio de caso (Yin, *Case Study Research and Applications*: protocolo, base de datos del caso, cadena de evidencia, triangulación), procedencia (W3C PROV-DM/PROV-O), FAIR (Wilkinson et al., *Scientific Data*, 2016), cuaderno de laboratorio, reproducibilidad. **No-competencia**: ISO de gestión; derecho procesal; ingeniería de software → **solicitud de convocatoria**.

**Encargo: refutar, no verificar.** ¿Cumple la «cadena de evidencia» de Yin y la procedencia PROV, o es un archivo de papeles sin protocolo? ¿Qué de FAIR aplica dentro de un repo y qué es sobreingeniería? ¿Qué del cuaderno de laboratorio ya hace git y qué no (razonamiento, lo descartado)? ¿Es el expediente la «base de datos del caso» separada del informe (el reporte)? ¿Cómo evitar que la evidencia de un caso se lea como generalización cuando pasa a la especificación?

## Fuentes
Autor, título, año, edición; URL (w3.org/TR/prov-overview/, doi de Wilkinson 2016, go-fair.org). WebSearch/WebFetch disponibles. **No inventes capítulos ni páginas**; si no consultaste, decilo. Framework: archivo:línea o comando+salida.

## Forma (tope 8)
1. Cabecera. 2. Hallazgos `V5-NN`: nivel P0-P3, ancla E1-E4/C con cita, impacto, dirección. 3. Respuestas desde tu competencia a Q1-Q12 (Q1 dónde vive; Q2 cuándo se abre/no; Q3 forma mínima y completa; Q4 identificador; Q5 estados; Q6 inmutabilidad y foliatura; Q7 evidencia, hash, testimonio del PO con fecha literal; Q8 evidencia→especificación; Q9 relación con Audit y reportes; Q10 retroactivo; Q11 mesa y no detención con §8.1; Q12 punto de continuación), «fuera de mi competencia» donde no. 4. «Lo que revisé y está bien» (hasta 3). 5. Solicitudes de convocatoria.
