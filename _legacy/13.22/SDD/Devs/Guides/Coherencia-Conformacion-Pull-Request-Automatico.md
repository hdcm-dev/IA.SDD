# Nota de coherencia — La conformación automática del pull request, catalogada como conocimiento

**Framework:** SDD
**Documento:** Coherencia-Conformacion-Pull-Request-Automatico.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-09-19
**Versión del conjunto resultante:** SDD 13.21
**Origen:** tool-prompt `IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/03-Extraccion-Extension-Conformacion-PR-Automatico/`,
y pedido posterior del Product Owner, 2026-09-19 — *«actualiza `/IA/SDD/IA.SDD/Conocimiento/Index-Knowledge.md`
según todos los conocimientos ubicados en `/IA/SDD/IA.SDD/Conocimiento`»*, con el documento ya copiado por él a
`Conocimiento/`, y su «si» a completar la publicación

---

## 1. Alcance

Alta de un documento en `Conocimiento/`: `Knowledge-Conformacion-Pull-Request-Automatico.md`, alias
`Conformacion-Pull-Request-Automatico`, con su fila en `Index-Knowledge.md`. Entra además la
**conciliación 1.5 del índice**, que estaba en el árbol sin publicar. **No se toca ninguna regla, ningún
orquestador ni ninguna plantilla.** Es el eje de extensión de `SDD-Development-Guide.md` §III.11, con el
precedente de la 13.17 y de la 13.19.

## 2. Por qué entra al framework, si el tool-prompt pedía lo contrario

El tool-prompt pidió dejar el documento en su `OUTPUTs/` para **no acoplar el framework**, y así se
entregó. Es la misma consigna que en el expediente `0002` llevó a retirar sin commitear una copia de
`Knowledge-Bundle-JS.md`. **Acá la decisión es la inversa, y es del Product Owner**: copió él mismo el
documento a `Conocimiento/`, pidió que el índice reflejara todos los documentos de la carpeta y aceptó
completar la publicación. Es el camino que el propio tool-prompt preveía («el cliente que use `Framework
SDD` sume dicho documento en su fork»), con este repositorio como fork. La copia es **idéntica byte a
byte** a la de `OUTPUTs/` (`cmp`).

## 3. La decisión de fondo: desviación declarada, no sustitución

El documento contradice `Master-Prompt.md` §12.1 **T1** —el agente no fusiona—. Ningún ítem de §12.1
está rotulado como decisión de stack, así que por `Rules-Base-Conocimiento.md` §0.4 **no puede
sustituirlo**: su §8 lo declara como **desviación justificada**, y manda la regla salvo que el
responsable de un destino asiente la delegación del merge. Es exactamente lo que el §8 del padre,
`Conformacion-Pull-Request-Manual`, anticipó para una variante que cambiara quién fusiona.

**Queda anotado y no se resuelve**: mientras T1 no se rotule como decisión de stack, esta variante será
siempre desviación. Rotularlo es un cambio de norma y no entra en esta intervención.

## 4. La fuente de cada afirmación

El documento no lleva nombres; acá se declara de dónde sale, sin nombrar lo privado.

| Afirmación del documento | Fuente |
| --- | --- |
| La delegación es del proyecto, se asienta con fecha y responsable, y se compensa devolviendo el merge ante una duda de fondo | Las convenciones comunes de un proyecto privado del taller, §8.5 «Delegación del merge al agente — sólo por decisión explícita del responsable» |
| El informe se escribe fuera de un bloque cercado para que el enlace quede clicable | Las mismas convenciones, §8.2 |
| El ciclo por API con la credencial de `git`, sin cliente de la plataforma; «bloqueó durante semanas» | Registro de corridas del agente, 2026-08-31 |
| La guarda explícita en su propia línea; el merge que salió con controles en rojo | Registro de corridas, 2026-09-14 |
| `unstable` significa controles fallando; seis fusiones encadenadas | Registro de corridas, 2026-09-13, sobre un destino público |
| La credencial elegida por cuenta y no la primera guardada | Registro de corridas, 2026-09-08 |
| Una corrida paralela por `git worktree` | Registro de corridas, 2026-09-13 |
| `merged_by` es la cuenta dueña de la credencial; una rama borrada da 404; `permissions.push` legible; corridas con `status` y `conclusion`; `curl -H @<(…)` | Medido contra la API de la plataforma el 2026-09-19, sólo lectura, sobre tres repositorios |
| Commit de merge como método observado | `git log --merges` de dos repositorios: 68 y 170 commits «Merge pull request» |

**Lo que no se ejecutó.** El merge y el borrado del esqueleto de §5 no se corrieron contra la
plataforma: se probaron contra una API simulada en nueve escenarios —siete que deben detenerse, uno de
rama viva, el camino feliz— y dieron nueve de nueve. El documento lo declara en su §9.

## 5. Cómo se construyó

Con la mesa evaluadora del taller: siete especialistas a ciegas —requisitos, verificación, implementador
ingenuo, abogado del diablo, seguridad, operación y entrega, y un ad hoc de conformidad con
`Rules-Base-Conocimiento.md`—, 43 hallazgos consolidados en 18 ítems, y un jurado de cinco funciones que
hizo proceder 14 y archivó 4. El registro completo vive en el `OUTPUTs/` del tool-prompt, fuera de este
repositorio.

## 6. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Conocimiento/Knowledge-Conformacion-Pull-Request-Automatico.md` | **1.0** | Nuevo. `canonico`, `transversal`, sin condición de carga, `Hereda-de: Conformacion-Pull-Request-Manual` |
| `Conocimiento/Index-Knowledge.md` | 1.4 → **1.6** | 1.5: conciliación con las cabeceras, sin altas. 1.6: la fila del alta. El catálogo pasa de seis a **siete** documentos |
| `SDD/Devs/Guides/Coherencia-Conformacion-Pull-Request-Automatico.md` | **1.0** | Esta nota |
| `CHANGELOG.md` | — | Entrada `[13.21]` |
| `_legacy/13.20/` | — | **El conjunto entero, 138 archivos**, tomado de `main` con `git archive` antes de editar, sin `Expedientes/`, con cero diferencias contra `main` |

## 7. Verificación contra `Rules-Base-Conocimiento.md` §6.1

La lista completa, ítem por ítem y con su comando, está en la entrada `[13.21]` del `CHANGELOG.md`.

## 8. Veredicto

**APROBADO.** El conjunto 13.21 es el 13.20 más un documento de catálogo y la conciliación de su índice:
ninguna regla, orquestador ni plantilla cambió; el documento cita `Master-Prompt.md` §12.1 y
`Expediente-Rules.md` §4 sin redefinirlos y declara su desviación; y la propiedad de
`Rules-Base-Conocimiento.md` §0.2 se conserva —con `Conocimiento/` vacía el framework corre igual, y sin
delegación asentada el documento no cambia nada—.

---

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-09-19 | Emisión inicial. Documenta el alta de `Conformacion-Pull-Request-Automatico`, por qué entra al framework aunque el tool-prompt lo dejaba afuera, la desviación declarada de T1 y la fuente de cada afirmación, con lo no ejecutado declarado. |
