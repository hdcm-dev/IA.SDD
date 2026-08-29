# Nota de coherencia — Los ítems que empaquetan dos decisiones, y dos citas que el barrido anterior dio por migradas

**Documento:** Coherencia-Items-Empaquetados.md
**Versión:** 1.0
**Fecha:** 2026-08-20
**Versión del conjunto resultante:** SDD **11.0**
**Origen:** `Reportes/14-El-Item-Obligatorio-Contestado-Con-Un-Diferimiento.md` §7 criterio 4, auditado en
`PROMPTs/Fixs/01-Fix-Reportes-12-14/OUTPUTs/40-Auditoria-Empaquetado-Y-Diferimiento-Ilegitimo.md`

---

## 1. Alcance

**La 10.0 corrigió el ítem empaquetado que el incidente medía y no corrió la auditoría que el reporte
pedía sobre la clase.** El criterio 4 de `Reportes/14` §7 dice, literal: *«ningún ítem obligatorio de
una §4.x empaqueta dos decisiones cuando una sola puede estar bloqueada. **Se audita una vez sobre las
quince reglas**»*. Ni la entrada 10.0 del `CHANGELOG` ni `Coherencia-Item-Diferido.md` §2 la
mencionan. Se corrió acá: **cinco ítems**, y los cinco se parten.

**Y una segunda corrección, de otra naturaleza:** el barrido de la 10.0 declaró residuo **1** para el
patrón `` `Root-Rules.md` §12 `` sin subsección, y quedaban **dos citas normativas vivas en
`Master-Prompt.md`** —el archivo que esa misma intervención estaba editando—. Es la migración que la
propia entrada 10.0 manda: *«toda cita a §12 que hable de referencias pasa a §12.1»*.

**Lo que esta intervención NO hace:** no enuncia en §12.2 la propiedad del diferimiento ilegítimo que
el documento `40` §4 construye —*el ítem que fija la forma de un registro que el producto empieza a
producir antes del evento de cierre*—. Queda propuesta y elevada. La partición de los cinco ítems no
depende de ella.

## 2. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Rules/Rules-Devops.md` | 5.0 → **6.0** | Cuatro ítems partidos: §4.3 punto 5/5.b, §4.4 punto 2/2.b, §4.6 punto 1/1.b y punto 5/5.b |
| `Rules/Rules-Backlog-Tecnico.md` | 4.4 → **5.0** | §4.4 punto 5 partido en 5 (prioridad) y 5.b (estimación); el ejemplo de `US-XXXXX` de §7 sigue la estructura nueva |
| `Rules/Rules-Prompts-AI.md` | 4.4 → **4.5** | §4.2 punto 9 remite a `Root-Rules.md` §12.2 en lugar de declarar un tratamiento propio |
| `Orchestrator/Master-Prompt.md` | 8.8 → **8.9** | Dos citas §12 → §12.1, en §6 y en el glosario de §15 |
| `Rules/Catalogo-De-Criterios.md` | 1.7 → **1.8** | Un criterio nuevo: cuándo un ítem de una §4.x se parte y cuándo no |
| `CHANGELOG.md` | — | Entrada **11.0** con su bloque «Impacto sobre destinos existentes» |
| `_legacy/10.1/` | — | Snapshot del conjunto superado, **tomado del estado sin editar** del control de versiones |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| Los canales dejan de arrastrar la convención de sufijos | `semántica de sufijos` dentro del punto 5 | Punto 5 (canales) + punto 5.b (sufijos) |
| La política de aprobación deja de depender de la herramienta de IaC | `` aprobación de `plan` antes de `apply` `` dentro del punto 2 | Punto 2 (herramienta) + punto 2.b (aprobación) |
| El generador del SBOM deja de viajar con el formato | `generador, formato de salida` dentro del punto 1 | Punto 1 (formato y publicación) + punto 1.b (generador) |
| El análisis dinámico deja de arrastrar al estático | `SAST y DAST` como ítem obligatorio | Punto 5 (SAST) + punto 5.b (DAST) |
| La prioridad deja de viajar con la estimación | `Prioridad y estimación` como ítem y como sección del ejemplo | Punto 5 (prioridad) + punto 5.b (estimación) |
| La referencia pendiente se cita por su subsección | `` `Root-Rules.md` §12 `` sin subsección, **hablando de referencias** | `` `Root-Rules.md` §12.1 `` |

**Resultado de la corrida, sobre todo el árbol vivo, incluidos los bloques cercados y el texto propio:**

| Patrón | Ocurrencias antes | Reemplazadas | **Residuo vivo** |
|---|---|---|---|
| `semántica de sufijos` | 1 | 1 | **0** |
| `` aprobación de `plan` antes de `apply` `` | 1 | 1 | **0** |
| `generador, formato de salida` | 1 | 1 | **0** |
| `SAST y DAST` | 3 | 1 | **2**, excluidas abajo |
| `Prioridad y estimación` | 2 | 2 | **0** |
| `` `Root-Rules.md` §12 `` sin subsección | **15** en 11 archivos | **2** en 1 archivo | **16**: las 13 que quedan, todas de clases estables, más las **3** que produce el patrón literal de esta misma nota |

**Exclusiones.** Las **siete clases estables de §VI.3.2 se citan y no se reescriben**, que es lo que
la 10.1 incorporó. Las propias de este caso, con su motivo:

| Qué se excluye | Motivo |
|---|---|
| `Rules-Devops.md` línea 32, perfil de la especialidad | Describe qué integra DevSecOps en el pipeline. **No es un ítem obligatorio**: enumerar las dos técnicas ahí sigue siendo cierto y partirlo no significaría nada |
| `Rules-Devops.md` línea 73, tabla §2.2 | Resume el **contenido del documento**, no sus ítems. Los dos análisis siguen siendo obligatorios y la fila los nombra a los dos |

**Las dieciséis ocurrencias vivas de `§12` sin subsección, contadas una por una**, porque es exactamente el
recuento que la intervención anterior declaró mal:

| Dónde | Cuántas | Clase de §VI.3.2 |
|---|---|---|
| Filas de control de cambios de siete reglas de categoría | 7 | «Filas de control de cambios» |
| `Guides/Coherencia-Reportes-00-11.md` línea 112 | 1 | «Notas de coherencia anteriores» |
| `Guides/Coherencia-Item-Diferido.md` §3, patrón literal de aquella intervención | 2 | «Notas de coherencia anteriores» |
| `CHANGELOG.md`, entradas 10.0 y anteriores | 3 | «Filas de control de cambios» |
| **Esta nota**, §3, que escribe el patrón para poder convertirlo | 3 | «La declaración de la propia intervención», la séptima clase, incorporada en 10.1 |

**Y lo que sí se corrigió, porque ninguna clase lo cubría:** `Master-Prompt.md` §6 y el glosario de
§15, **prosa normativa vigente** que remitía a §12 hablando de la referencia pendiente.

## 4. Verificación

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 intactas | **Sin violaciones**: ninguna invariante se tocó |
| 2 | Autosuficiencia, cero referencias fuera del repositorio | **Cero** |
| 3 | Referencias internas resuelven | **Cero rotos** fuera de la exclusión de §VI.3. Ninguna sección citada dejó de existir: los ítems partidos conservan su número y suman uno `.b`, igual que el punto 3.b de la 10.0 |
| 4 | Sin contradicción con lo que ya estaba | **Una contradicción resuelta y ninguna nueva**: `Rules-Prompts-AI.md` §4.2 punto 9 mandaba lo contrario de `Root-Rules.md` §12.2 |
| 5 | Control de cambios actualizado en cada archivo modificado | **Una fila por archivo** en los cinco que suben versión |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance declarado fue modificado | **Sin cambios colaterales**, inventariados en §2 |
| 8 | Barrido por concepto, sobre el árbol vivo y sobre el texto propio | **Residuo 2 del caso**, excluido con motivo, y **9 de clases estables citadas** |
| 9 | Coherencia interna de cada artefacto tocado | **Sin contradicciones internas**. El ejemplo de `US-XXXXX` de `Rules-Backlog-Tecnico.md` §7 se movió con la estructura, que es donde la 10.0 había dejado el suyo sin mover |
| 10 | Integridad del registro: cabecera = última fila, en orden, sin repetidas | **Verificado en los cinco** |
| 11 | Cobertura de la nota de coherencia | **Esta nota**, con la versión del conjunto declarada en su cabecera |
| 12 | Cobertura del catálogo de criterios | **Un criterio nuevo** registrado |

## 5. Observaciones

**El defecto que esta intervención corrige lo cometió la anterior en el mismo archivo, y conviene
mirar por qué.** El barrido de la 10.0 estaba bien planteado y su recuento salió mal: declaró 14
ocurrencias donde el snapshot 9.19 tiene 24, y dio por migradas dos que no lo estaban. **Lo que falló
no fue la exclusión —ésa estaba bien vista— sino el recuento**, y por eso la corrección de la 10.1,
que obliga a citar la lista de exclusiones, **no habría evitado esto**. La comprobación 8 pide
«cero ocurrencias vivas fuera de las exclusiones enumeradas» y **no pide que el recuento se
reconcilie contra el snapshot**, que es lo único que habría delatado la diferencia.

**Se deja anotado como pregunta para la próxima intervención**, no como regla nueva: sin un segundo
caso, agregar una comprobación es exactamente lo que la 9.19 desaconsejó al rechazar el eje de
estratos.

**Y la asimetría que `Coherencia-Item-Diferido.md` §5 dejó abierta sigue abierta.** §12.2 obliga a
nombrar el evento como artefacto y sección; §12.1 no. Esta intervención no la toca, por el mismo
motivo: no hay caso medido.

## 6. Veredicto

**CONFORME.** Las doce comprobaciones pasan, el residuo propio del caso es **2 con motivo declarado**,
y el conjunto queda en **SDD 11.0** con su bloque de impacto sobre destinos existentes emitido.
