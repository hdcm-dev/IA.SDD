# Nota de coherencia — La compuerta de arranque

**Framework:** SDD
**Documento:** Coherencia-Compuerta-De-Arranque.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-17
**Versión del conjunto resultante:** SDD 9.3
**Emitida:** con retraso, en la 9.9. Ver §7.

---

## 1. Alcance

`Master-Prompt.md` §12.1 suma **T0, la compuerta de arranque**, y **T5** pasa de verificar a verificar
y preparar. Los otros dos orquestadores la adoptan como prerrequisito.

## 2. El problema: T3 prohibía lo que nadie podía comprobar

La 9.2 declaró **T3 — una unidad de trabajo, un pull request** y dejó anotado que no tenía
comprobación mecánica. **La mitad que sí se podía comprobar es la que producía daño**: que no haya
**dos unidades vivas a la vez**.

Empezar una segunda unidad mientras la primera espera merge produce **dos ramas que se pisan sobre los
mismos documentos**, y el humano **no puede aceptar una y rechazar la otra** — que es exactamente lo
que T3 existe para preservar.

## 3. Las decisiones

**T0 corre y publica siempre, también cuando está todo en orden.** No es ceremonia: es lo único que
distingue **«no había nada que arreglar»** de **«no se miró»**. Un control que sólo habla cuando falla
no deja evidencia de haber corrido.

**T5 pasa de verificar a preparar.** Suma la poda de referencias remotas y, sobre todo, **comprobar si
la principal trajo algo más**: si avanzó por encima de lo entregado, hay trabajo de otra sesión y **lo
que se midió antes del merge quedó viejo**. Con dos sesiones trabajando sobre los mismos repositorios
—que es el caso real que lo motivó— arrancar sobre un local a medio actualizar produce la unidad
siguiente **sobre un estado que ya no existe**.

## 4. Inventario

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.1 → **8.2** | **T0** con sus cinco comprobaciones y su bloque de salida; **T5** verifica y prepara |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.3 → **1.4** | El paso 0 de R0 **corre T0**; los dos resultados que la detienen |
| `SDD/Devs/Orchestrator/Master-Prompt-Migracion.md` | 2.4 → **2.5** | El prerrequisito de M0 pasa de T2 a **T0** |

## 5. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D5** | Conforme | Idioma, nombres y registro; los tres archivos subieron versión y registraron su fila |
| **D6** Trazabilidad | Conforme | Los dos orquestadores **citan** §12.1 y no la redefinen |
| **D7** Neutralidad | Conforme | El destino con 452 cambios sin commitear se cita por su magnitud |
| **D8**, **D9** | Conforme | No se toca D8; la ausencia del protocolo se midió sobre los tres orquestadores |

## 6. Lo que deja anotado

Que una rama lleve **dos unidades adentro** sigue sin comprobación. **La 9.4 dejó de prohibirlo y pasó
a exigir declararlo**, que es lo único que queda cuando el control no puede existir.

## 7. Por qué esta nota se emitió tarde

**§VI.3 exige nota de coherencia a toda intervención que toque más de un archivo, y la 9.3 tocó tres.**
Se emitió en la 9.9, al verificar la cobertura de notas de las siete intervenciones de la serie 9.x.
La comprobación que lo encontró **no existe en §VI.3**: se corrió a mano. Queda anotado en la nota de
la 9.9.

## 8. Veredicto

**APROBADO**, con la salvedad de §7.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-17 | Emisión inicial, **con retraso**: la intervención es de la 9.3 y la nota se emitió en la 9.9. |
