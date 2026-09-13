# Actuación 019 — Constancia: redacción S2 de un destino privado y del host, después de la fusión

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 019 |
| Tipo | `constancia` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa de la intervención `09` (orquestador de la intervención) |
| Corrige | 005 (y piezas de `evidencia/`, que no son folios) |

> **Por qué este folio existe, y por qué va antes de la resolución.** Este expediente se fusionó en `main`
> (`650053e`) con dos piezas que nombran un repositorio privado y describen dónde está su infraestructura, y
> con cuatro piezas que conservan el usuario del host dentro de rutas de trabajo de la sesión. La regla que
> la intervención `09` publica (`Expediente-Rules.md` 1.0, §4 S1 y S2) prohíbe editar lo publicado **salvo
> la redacción S2**, con un folio como éste. Se asienta a pedido del coordinador de la sesión, con la forma
> del folio 018.

---

## 1. Qué se redactó

Redacción S2: actuaciones/005-informe-evidencia-digital.md, evidencia/ev-06-segunda-convocatoria/V2.md, evidencia/ev-06-segunda-convocatoria/N2.md, evidencia/ev-06-segunda-convocatoria/SHA256SUMS, evidencia/ev-08-cartas-despachadas/08-Núcleo--comisión-de-verificación.md, evidencia/ev-08-cartas-despachadas/16-Núcleo--comisión-de-verificación.md, evidencia/ev-08-cartas-despachadas/18-Refutador-del-plan-compuesto.md, evidencia/ev-08-cartas-despachadas/SHA256SUMS

| Pieza | Clase S2 | Qué se reemplazó | Por qué |
|---|---|---|---|
| `actuaciones/005-informe-evidencia-digital.md` l.212 | Dato de un repositorio privado | La organización y el nombre del repositorio privado, en la salida de una sonda de visibilidad → «un destino privado» | Nombre y organización de un repositorio privado no se publican |
| `evidencia/ev-06-segunda-convocatoria/V2.md` l.161 y l.167 | Dato de un repositorio privado | El nombre del repositorio → «un destino privado»; la ubicación de su evidencia y la descripción de direcciones y puerto → «detalles de infraestructura, no transcriptos» | La pieza no transcribía ninguna dirección, pero señalaba dónde buscarlas |
| `evidencia/ev-06-segunda-convocatoria/N2.md` | Dato del entorno | Ruta de trabajo de la sesión con el usuario del host → `<scratchpad>` | La ruta del host se redacta siempre |
| `evidencia/ev-08-cartas-despachadas/08-…`, `16-…` y `18-…` | Dato del entorno | Ídem | Ídem |
| `evidencia/ev-06-segunda-convocatoria/SHA256SUMS` y `evidencia/ev-08-cartas-despachadas/SHA256SUMS` | — | Se regeneraron las líneas de las piezas redactadas | Sin eso el manifiesto dejaba de verificar |

**Visibilidad, observada y no supuesta** (`Expediente-Rules.md` §4, S2), el 2026-09-13 con
`env -u GIT_ASKPASS GIT_TERMINAL_PROMPT=0 git -c credential.helper= ls-remote <url-sin-credenciales> HEAD`:
el repositorio del framework y `Lab-Geometria` responden sin credenciales (públicos); el destino que las
dos piezas nombraban no responde sin credenciales (privado). **`Lab-Geometria` es además público de
consulta por declaración de su dueño** del 2026-09-13, asentada como testimonio en la mesa de la
intervención `09` (`IA.SDD.Documentacion/PROMPTs/Fixs/09-Fix-Reporte-31/OUTPUTs/Mesa-2026-09-13-Intervencion-09/09-Dictamen-Del-Ciclo.md` §4):
lo que proviene de él **no se redacta**.

## 2. Huellas antes y después (SHA-256)

| Pieza | Antes | Después |
|---|---|---|
| `actuaciones/005-informe-evidencia-digital.md` | `82467ed396da398ea2c7c623f120269b38f05e261786c3cf84c3130d161c3d76` | `2e863c4d8e9392d2814b643d3377dbf07a7bbf5362c1ff6b49c49e7fe975dc55` |
| `evidencia/ev-06-segunda-convocatoria/V2.md` | `f599317ed7724f46e9f92d8eb27330bbe5262a8ba61083044e5e5a2dc03879e7` | `11b71e851325244de23c0089c08424aadc6f0765fb961e3dd7eef8d7c7995bc2` |
| `evidencia/ev-06-segunda-convocatoria/N2.md` | `e61be803282b434f89404e7a73752a481bef42a28fb01795a345995121978969` | `bcc97dc20c46bc6e0c4cfe5c6ae7b48bb33b0446e00d1d4ad7dfed900f9150f8` |
| `evidencia/ev-08-cartas-despachadas/08-Núcleo--comisión-de-verificación.md` | `554b44dfccd224709f11ae0dcbe6df70adc324f0ce94aee6596191619f031b18` | `9c654230cea43c96becebbfeaed2d763d485e4576c3f2ec4ee070b055b148a61` |
| `evidencia/ev-08-cartas-despachadas/16-Núcleo--comisión-de-verificación.md` | `4d3e9eacb003a10de618b3af42c051cf8d6f47fc40cff1368c795de276ea20ab` | `ded362383e8b085c4eeba0295a5d322c15cbadbb4653f79d74520fccf16eb585` |
| `evidencia/ev-08-cartas-despachadas/18-Refutador-del-plan-compuesto.md` | `5579ad95f2b1ee12d2d0d9a7449a7c4321824ec1294c54b1d736f10484322b7d` | `315e2277dbe43c81a02e4b95987b32be66516d9a055d5033ff9673d086ba8a7b` |
| `evidencia/ev-06-segunda-convocatoria/SHA256SUMS` | `eeabeaea52e72d5c660b24d198f5c6df744e07e770ab53348573a822714c5b34` | `6c797cef9b20da4e0df5ad449928538908622453d6d3560d0c7b098ef77f843e` |
| `evidencia/ev-08-cartas-despachadas/SHA256SUMS` | la del commit `650053e` | `3e4b4ad92da7acbfdcd281210cda2d11c1d8138aa64a428ff4d5b019e248d8c8` |

`sha256sum -c` corrido en `evidencia/`, en `ev-06-segunda-convocatoria/` y en `ev-08-cartas-despachadas/`
después de regenerar: los tres manifiestos verifican.

**Las cabeceras de los folios redactados siguen mostrando la huella de su cuerpo original**, como ya
declaró el folio 018 §3: la cabecera es parte del folio. La huella vigente de cada pieza es la de esta tabla.

## 3. Lo que la redacción no hace

- **Lo empujado no se retira.** El commit de la fusión (`650053e`) y los commits de la rama que la
  alimentó siguen conteniendo las piezas originales y siguen accesibles por su identificador. Esta
  constancia no afirma lo contrario. **El pedido de retirarlos al proveedor se evaluó y no se hace**: la
  información sobre la cuenta que motivó el folio 018 es pública en su fuente desde el 2026-09-02, y la
  del destino privado se limita a su nombre y a una descripción sin direcciones.
- **Los originales no están en este repositorio.** Quedaron en la custodia de sesión del orquestador de la
  intervención `09`, que **no es durable** y no se puede verificar después de la sesión. Queda como deuda
  **D9-1** del dictamen de esa mesa, con el Product Owner como custodio y el evento de cierre «una
  constancia en este expediente que nombre el lugar durable y verifique las huellas de §2 contra él».

Sigue: resolución del expediente por la intervención `09` · presidente de mesa de la intervención `09`
