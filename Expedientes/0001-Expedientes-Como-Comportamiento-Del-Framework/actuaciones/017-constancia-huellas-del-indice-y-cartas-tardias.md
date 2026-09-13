# Actuación 017 — Constancia: huellas mal transcriptas en el índice, y cartas asentadas tarde

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 017 |
| Tipo | `constancia` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa |
| Corrige | El **índice de evidencia del `README.md`**, versión del commit `e8c84d9`, filas `ev-02` y `ev-05`. **No es un folio.** El folio 002 §4 dice que cada comisión «recibe … su carta», y esas cartas no se asentaron antes de despachar |

---

## 1. Las dos huellas

El `README.md` transcribió a mano una versión abreviada de las huellas de `SHA256SUMS`. **Dos de las cinco estaban mal.**

| Evidencia | El índice decía | La huella real (`evidencia/SHA256SUMS`) |
|---|---|---|
| `ev-02` | `dcf82b62…2fdd3` | `dcf82b62238a8dfd6f6e583e3b9fe01f155f0d3a018ad642f8f6f05d904a2b7a` |
| `ev-05` | `29417eca…4d34042` | `29417eca3919c658d7fe22c6ea38262fb0363cacb4cf3628b709cc6901d34042` |

**La evidencia está íntegra.** `sha256sum -c SHA256SUMS`, corrido desde `evidencia/`, da coincidencia en los diez archivos. El error estaba en la copia. **Lo detectó el presidente** apenas publicó, y lo midieron de forma independiente V1-01, V2-01 y N2-01 en la primera convocatoria, y N2-01, V2-03 y V4-01 en la réplica.

**Qué se hace.** La columna de huella del índice deja de transcribir: **remite al manifiesto**, como aprobó el jurado (015, J-02 y Q3). El `README.md` se actualiza en el mismo commit que este folio.

**Por qué no se corrigió en el momento.** El panel ya estaba leyendo el `README.md`, y cambiarlo durante la lectura habría modificado el objeto que evaluaba. Además, la forma provisoria prometía que las correcciones entraban como folio nuevo.

## 2. Las cartas

- Las cartas de despacho **no se asentaron antes de despachar**. Eso lo señalan N2-06 y N3-01, en las dos convocatorias, y R-13 punto 7.
- **Se asentaron después, en `ev-08`**, junto con el encargo a la corrida (fila 01), la carta del refutador y las 16 de comisión. Se sacaron de la transcripción por extracción mecánica y no se reconstruyeron.
- La carta del jurado **no está en `ev-08`**: se despachó después de extraerlo. Consta en la transcripción del presidente y queda **sin asentar**.

Sigue: reporte `31` y prompt `09` en `IA.SDD.Documentacion` · presidente de mesa
