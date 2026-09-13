# Actuación 003 — Constancia: dos convocatorias del mismo panel, y un dato nuevo del orquestador de la sesión

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 003 |
| Tipo | `constancia` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa |
| Corrige o completa | README (punto de continuación del commit `e8c84d9`); actuación 002 §4 y §5 |

> Se asienta **antes** que los informes porque explica por qué el expediente tiene dos paneles.

---

## 1. Qué pasó

1. **Primera convocatoria.** Las ocho comisiones de 002 §3 se despacharon en segundo plano entre
   12:14:25 y 12:17:06 (-03:00). El commit `e8c84d9` dejó el punto de continuación en «panel despachado».
2. **Error del presidente.** Al retomar, el orquestador de la sesión informó que no quedaban
   subagentes vivos y pidió volver a despachar. **Se tomó la ausencia de archivos en `actuaciones/`
   como prueba de que los informes faltaban**, sin comprobar el estado de los despachos. Una comisión de
   sólo lectura no escribe en disco, así que esa ausencia no probaba nada. Es el anti-patrón que
   `Mesa-Rules.md` §6.1 nombra primero: la fuente declarativa leída sin contrastar.
3. **Segunda convocatoria.** Las ocho comisiones se despacharon de nuevo, a ciegas y en paralelo,
   entre 12:20:50 y 12:22:40, con la misma carta en forma abreviada.
4. **Las dos terminaron.** La primera entregó entre 12:20:05 y 12:23:52 y la segunda entre 12:26:37 y
   12:28:56. **Ninguna comisión de la segunda vio un informe de la primera**, porque ninguno estaba
   escrito en disco. Después, el orquestador de la sesión corrigió su propio aviso.

## 2. Qué se decide y por qué

- **Los informes de la primera convocatoria son los del expediente**, folios 004 a 011, en el orden en
  que se entregaron (V3-04: el folio se asigna al incorporar, no al despachar). Motivo: responden a la
  convocatoria que 002 declaró.
- **Los de la segunda no se descartan ni se folian como informes.** Se preservan verbatim como
  evidencia `ev-06`: una **réplica independiente** del mismo panel sobre el mismo corpus. La
  consolidación los usa para medir qué hallazgos se repiten entre dos paneles a ciegas, y no como
  votos adicionales.
- **La carta despachada no quedó asentada antes de despachar.** Se declara acá; lo señalan N2 y N3 de
  las dos convocatorias. Las cartas están en la transcripción de la sesión, que no está en el
  repositorio. El expediente no las reconstruye de memoria.

## 3. Dato nuevo aportado por el orquestador de la sesión

> *«en paralelo se preparó en otra rama del framework la **13.17**, que no está fusionada. Es un alta de
> `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` y describe la práctica del expediente de mesa en
> su §2.3. Declara que si el framework adopta una norma de expedientes, esa norma gobierna. Tu
> intervención numerala como **la siguiente a la vigente cuando se aplique** (probablemente 13.18), y
> nombrá ese §2.3 entre los alcances a alinear.»*

**Verificado** en la rama `conocimiento/mesa-de-expertos-a-pedido`, commit `cab03ed`:

- `CHANGELOG.md` l.6 dice `## [13.17] - 2026-09-13`.
- §2.3 fija la carpeta `00-Contrato-De-Entrada.md`, `NN-Informe-<Comision>.md` y `NN-Plan-Y-Cierre.md`,
  y dice: «Los documentos de un expediente no se reescriben».
- §8 dice: *«La práctica de expedientes de §2.3 precede a cualquier norma: si el framework adopta una,
  §2.3 se reescribe contra ella.»*
- §3.2 declara *«El testimonio de quien pidió es evidencia E4»*. En la primera convocatoria, **V5-01 lo
  objeta de forma expresa**: E4 es «regla declarada», y `Lab-Geometria` ya lo usó así. **V1-06 y V2-04
  sostienen, cada una por su lado, que el testimonio no tiene tipo** en la norma. En la réplica
  (`ev-06`), V3-03 y V5-03 hacen la misma objeción. Queda para el dictamen como alcance a alinear.

Esta rama no está en `main` (`git -C IA.SDD log --oneline -1 main` → `8c55a1e`). El expediente sigue
evaluando contra **13.16**.
