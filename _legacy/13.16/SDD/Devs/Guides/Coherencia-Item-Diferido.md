# Nota de coherencia — El ítem diferido y su evento de cierre

**Documento:** Coherencia-Item-Diferido.md
**Versión:** 1.0
**Fecha:** 2026-08-19
**Versión del conjunto resultante:** SDD **10.0**
**Origen:** `Reportes/14-El-Item-Obligatorio-Contestado-Con-Un-Diferimiento.md` de `IA.SDD.Documentacion`

---

## 1. Alcance

**El método sabía atar una decisión a un evento futuro y no sabía cerrar el lazo cuando ese evento
llegaba.** Un ítem que una §4.x declara obligatorio se podía contestar con la promesa de contestarlo,
y esa promesa **se lee igual que el dato** en toda verificación de presencia.

**Lo que esta intervención NO hace, y conviene declararlo:** no toca el reporte `13`, **resuelto en
9.19 con fundamento escrito**, ni aplica el `12`, que es **una decisión de alcance del Product Owner**
y no un defecto. El prompt de intervención los traía a los tres; la verificación previa redujo el
alcance a uno.

## 2. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Rules/Root-Rules.md` | 6.2 → **7.0** | §12 se parte en §12.1 y §12.2; §12.2 es nueva |
| `Rules/Rules-Devops.md` | 4.6 → **5.0** | §4.3 punto 3 se parte; entra el punto 3.b, prefijo de tag |
| `Orchestrator/Master-Prompt.md` | 8.7 → **8.8** | §10.0 suma la comprobación transversal 6 |
| `Orchestrator/Master-Prompt-Reanudacion.md` | 1.7 → **1.8** | R0 paso 4 y bloque nuevo en R1 |
| `Rules/Catalogo-De-Criterios.md` | 1.5 → **1.6** | Cuatro criterios nuevos, una fila recalificada |
| `Rules/Rules-Calidad-Y-Pruebas.md` · `Rules-Backlog-Tecnico.md` · `Rules-Contexto.md` · `Rules-Prompts-AI.md` · `Rules-Arquitectura-Tecnica.md` · `Rules-Examples.md` | sin bump | **Sólo la cita de sección**, §12 → §12.1, por el barrido |
| `CHANGELOG.md` | — | Entrada **10.0** con su bloque «Impacto sobre destinos existentes» |
| `_legacy/9.19/` | — | Snapshot del conjunto superado, **tomado antes de la primera edición** |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| La referencia pendiente deja de ser toda la §12 | `` `Root-Rules.md` §12 `` sin subsección | `` `Root-Rules.md` §12.1 `` |
| El ítem de versionado deja de empaquetar dos decisiones | `Configuración base y prefijo de tag` | Punto 3 (herramienta) + punto 3.b (prefijo) |

**Resultado de la corrida, sobre todo el árbol vivo:**

| Patrón | Ocurrencias antes | Reemplazadas | **Residuo vivo** |
|---|---|---|---|
| `Root-Rules.md` §12 sin subsección | **14** en 9 archivos | **13** en 8 archivos | **1**, excluida abajo |
| `Configuración base y prefijo de tag` | 1 | 1 | **0** |

**Exclusiones, enumeradas con su motivo:**

| Qué se excluye | Motivo |
|---|---|
| `_legacy/**` | Snapshots congelados. §VI.5 los declara **intocables**: reescribirlos falsificaría el registro del conjunto que archivan |
| `Guides/Coherencia-Reportes-00-11.md` línea 112 | **Es el registro de una intervención pasada**, escrito cuando §12 no tenía subsecciones. Su tabla declara qué produjo el reporte `07` **en su momento**, y corregirle la cita haría decir a un registro histórico algo que no decía |

## 4. Verificación

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 intactas | **Sin violaciones**: ninguna invariante se tocó |
| 2 | Autosuficiencia, cero referencias fuera del repositorio | **Cero** |
| 3 | Referencias internas resuelven | **Cero rotos** fuera de la exclusión de §VI.3. Los 9 avisos de `Root-Rules.md` son **rutas ilustrativas del árbol de un destino** —`00-Contexto/`, `Unidades-Entrega/…`, `Producto/`—, **preexistentes y con el mismo recuento que en el snapshot 9.19** |
| 4 | Sin contradicción con lo que ya estaba | **Sin contradicciones.** §12.1 conserva su texto literal; lo nuevo vive en §12.2 |
| 5 | Control de cambios actualizado en cada archivo modificado | **Una fila por archivo** en los cinco que suben versión. Los seis del barrido **no suben**: cambia una cita, no el contenido normativo |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance declarado fue modificado | **Sin cambios colaterales**, 12 archivos, todos inventariados en §2 |
| 8 | Barrido por concepto, sobre el árbol vivo y sobre el texto propio | **Residuo 1**, excluido con motivo en §3 |
| 9 | Coherencia interna de cada artefacto tocado | **Sin contradicciones internas** |
| 10 | Integridad del registro: cabecera = última fila, en orden, sin repetidas | **Verificado en los cinco.** La tabla de `Root-Rules.md` es **ascendente** y la fila 7.0 se reubicó al final tras haberse insertado al tope |
| 11 | Cobertura de la nota de coherencia | **Esta nota**, con la versión del conjunto declarada en su cabecera |
| 12 | Cobertura del catálogo de criterios | **Cuatro criterios nuevos** registrados, una fila recalificada a §12.1 |

## 5. Observaciones

**El defecto que esta intervención corrige lo cometió esta intervención, en chico.** La fila 7.0 del
control de cambios de `Root-Rules.md` se insertó **al tope** de una tabla ascendente, y la
comprobación 10 la levantó. Se declara en lugar de corregirse en silencio, que es lo que la propia
§VI.3.1 pide.

**Y una asimetría que conviene mirar en la próxima intervención.** §12.2 obliga a que el evento de
cierre se nombre como artefacto y sección, y **§12.1 no lo exige**: su evento es interno y el
orquestador lo observa. Es coherente hoy, pero es **una regla enunciada sobre el caso y no sobre la
propiedad** —lo que §VI.3 1.19 acaba de declarar defecto de forma—. No se cambia acá porque cambiarlo
sin caso medido es exactamente lo que ese bloque desaconseja; se deja escrito para que la próxima
tenga la pregunta hecha.

## 6. Veredicto

**CONFORME.** Las doce comprobaciones pasan, el residuo del barrido es **1 con motivo declarado**, y
el conjunto queda en **SDD 10.0** con su bloque de impacto sobre destinos existentes emitido.
