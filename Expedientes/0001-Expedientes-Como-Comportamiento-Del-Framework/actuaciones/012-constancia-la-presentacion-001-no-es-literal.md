# Actuación 012 — Constancia: la presentación del folio 001 no es literal

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 012 |
| Tipo | `constancia` (corrección) |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa |
| Corrige | **Folio 001**, cabecera («por transcripción literal») y §1 («Se transcriben sin editar, incluidas las marcas de formato del original», «en el orden en que el Product Owner los formuló»). **El folio 001 no se modifica** |
| Evidencia | `evidencia/ev-07-presentacion-original.txt`, con su metadato `.meta.txt` y el manifiesto `SHA256SUMS-ev-07` |
| Detectó | La réplica V2-01, P0, E1 (`ev-06/V2.md`). En la primera convocatoria ninguna comisión lo detectó: V1-06, V2-04 y V5-01 señalaron la **falta de fuente primaria**, pero no la divergencia |

---

## 1. Qué se contrastó

`Mesa-Rules.md` §6.1 exige contrastar un P0 contra su observable antes de usarlo. Se contrastó el folio
001 contra el mensaje original del Product Owner:

- Fuente: la transcripción local de la sesión del orquestador.
- Hora: 2026-09-13T12:03:02-03:00.
- Tamaño: 1486 bytes.
- SHA-256: `cb39bbd64dd919e3bb7ad484779c4215af473892cf02de5b797c76046f63dd1c`.

El original queda preservado byte a byte como `ev-07`. **Es la fuente primaria. El folio 001 es una
derivación de ella, y no dice qué transformó.**

## 2. Qué difiere

| # | Diferencia | Afecta el sentido |
|---|---|---|
| D1 | **Ortografía y signos normalizados.** Por ejemplo, «sistematica» pasa a «sistemática», «aporse» a «aporte», «prte» a «parte», «etandares» a «estándares», «arregla» a «arreglá», «igualmanera» a «igual manera»; los guiones « - » pasan a rayas « — », y `<repo>/SDD/Expedientes` aparece con marca de código | No |
| D2 | **Orden invertido.** El original dice primero «cuando te encuentres con un problema…», después «acordate en saber donde estas parada…» y al final «Vamos a adoptar…». El folio 001 numera 1.1 el último de los tres | No cambia qué se pide. **Sí contradice** la afirmación del folio 001 sobre el orden |
| D3 | **Falta un párrafo.** El original abre con: «tenes el ok de la fase K, y todo lo demas hace lo vos, pero con una excepción, me centraria primero en migrar Lab-Geometria - cuando termines con este luego podes seguir migrando con RPI.VideoControl-» | **Sí para la corrida del workspace.** Fija el OK de la fase `k` y la prioridad de migrar `Lab-Geometria` y después `RPI.VideoControl`. **No para el objeto de este expediente**: ese párrafo lo tramita `Lab-Geometria-mig1316/SDD/Expedientes/0001-Migracion-Normativa-A-13.16`, que lo asienta como su folio 002, «testimonio OK fase k». El folio 001 no declaró que recortaba |

## 3. Origen del hecho

**Del lado de esta corrida:** el folio 001 transcribió **el texto del encargo** que recibió este
presidente. Ese texto ya venía normalizado, reordenado y sin el primer párrafo. **La afirmación «sin
editar, en el orden en que se formuló» sí es de esta corrida**: se escribió sin tener el original a la
vista, y es exactamente la fuente declarativa sin contraste que `Mesa-Rules.md` §6.1 prohíbe. Se
autocorrige con esta constancia, porque no toca ninguna decisión del Product Owner.

**Lo que no se sabe:** si la normalización la hizo el orquestador de la sesión al redactar el encargo o
el resumen de compactación de su propia sesión (réplica V2-01, parte `C`). Queda sin determinar.

## 4. Qué rige desde ahora

- **La presentación del caso es `ev-07`.** Toda cita literal del Product Owner en actuaciones
  posteriores se toma de ahí.
- El folio 001 **conserva su valor como interpretación ordenada del pedido** (§3, P1 a P7): ninguna
  diferencia de §2 cambia qué se pide. **Pierde el valor de transcripción literal.**
- **Esto es evidencia para el dictamen, no sólo una corrección.** El primer ejemplar vivo de la forma
  cometió en su primer folio el defecto que la forma existe para impedir. La regla tiene que exigir el
  original con su huella antes de cualquier versión legible.
