# Nota de coherencia — Un ítem diferido del framework no tenía dónde vivir

**Documento:** Coherencia-Registro-De-Diferidos.md
**Versión:** 1.0
**Fecha:** 2026-08-22
**Versión del conjunto resultante:** SDD **11.3**
**Origen:** El tramo **T3** del plan de reestructuración. Sus criterios se transcriben en §6

---

## 1. Alcance

**§12.2 declara la forma de un ítem diferido y el framework no tenía dónde anotar los suyos.**

Las obligaciones que una intervención no puede cerrar se venían escribiendo en su **nota de
coherencia** — y **una nota relata una intervención y se cierra con su fecha**. El ítem, en cambio,
**sigue vigente después**. Queda escrito donde nadie lo vuelve a mirar, que es exactamente la forma de
promesa que §12.2 califica **P1**: *«sin marca no se puede contar, y contar es la única defensa contra
un defecto silencioso»*.

**Entra `Root-Rules.md` §12.3**, el registro, con los **dos ítems que la 11.2 ya había declarado**.

**Lo que este tramo NO hace:** no toca **D3**, no declara ningún ámbito nuevo y no renumera nada. El
tramo que sí hacía eso —el segundo ámbito de unicidad— **se retiró tras cuatro rondas de auditoría**,
por un error de segmentación: enumerar una familia la vuelve sujeta al ancho, y el corpus pasaba a
incumplirse a sí mismo. §12.3 sobrevivió a ese retiro **porque no depende de nada de aquello**.

## 2. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Rules/Root-Rules.md` | 7.1 → **7.2** | **§12.3 nueva**, con sus dos ítems |
| `CHANGELOG.md` | — | Entrada **11.3** |
| `_legacy/11.2/` | — | Snapshot del conjunto superado, tomado del **commit publicado** y verificado contra él |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior | Forma vigente |
|---|---|---|
| Dónde vive un ítem diferido del framework | Una sección `## N. Ítems diferidos` **dentro de una nota de coherencia** | `Root-Rules.md` **§12.3** |

**La corrida, no el recuento.** Esta nota **no publica números**: publica el comando. El motivo está
medido en el tramo retirado —tres notas seguidas declararon recuentos que **eran ciertos al medirlos y
falsos al publicarlos**, porque la nota y el `CHANGELOG` **son parte del árbol que la nota mide**—. Es
`Root-Rules.md` §10 **R1**: *«preferir la forma que no cuenta … es la única que elimina el dato en vez
de verificarlo»*.

```bash
grep -rn "^## [0-9]*\.* *Ítems* diferidos*" SDD/Devs/Guides/*.md
```

**Toda ocurrencia viva tiene que caer en una de estas dos cajas, y ninguna otra:**

| Caja | Qué es | Por qué queda |
|---|---|---|
| **Notas de coherencia anteriores** | Una nota emitida que anotó sus diferidos con la práctica de su fecha | Clase estable de §VI.3.2. **Reescribirla falsearía el registro** — y además el ítem que anotó **está ahora en §12.3**, que es lo que la intervención resuelve |
| **La declaración de esta intervención** | Esta nota y la entrada 11.3 | Séptima clase estable |

**Una ocurrencia fuera de esas dos cajas —una nota nueva que anote diferidos en sí misma en lugar de en
§12.3— es hallazgo**, y así se verifica que la corrección tomó.

## 4. Verificación — las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 en todo archivo tocado | **Sin violaciones.** Ninguna invariante se toca: §12.3 no fija forma de nombres, ni ancho, ni layout |
| 2 | Autosuficiencia | Sin referencias fuera del árbol |
| 3 | Referencias internas resuelven | §12.3 cita `Master-Prompt.md` §10, `Master-Prompt-Reanudacion.md` R0 y `SDD-Getting-Started-Guide.md`: **los tres existen** |
| 4 | Sin contradicción con lo que ya estaba | §12.3 **no reemplaza** a §12.2: una declara la forma, la otra es el registro. §12.1 no se toca |
| 5 | Control de cambios en cada archivo modificado | **Una fila**, en el único archivo normativo que cambia |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | Un archivo normativo, más `CHANGELOG`, esta nota y el snapshot |
| 8 | Barrido por concepto | **La corrida está en §3**, con sus dos cajas |
| 9 | Coherencia interna | §12.3 dice de sí misma que **no aplica a un destino**, que es lo que sostiene el bump minor |
| 10 | Integridad del registro | Cabecera **7.2** = última fila **7.2** |
| 11 | Cobertura de la nota | **Esta nota** |
| 12 | Cobertura del catálogo | **Sin criterios nuevos**: §12.3 no agrega una decisión que un agente deba tomar. Es un registro |
| **13** | **Devolución al origen** | **§6** |

## 5. Por qué el cuarto campo se escribió así, y no como en el tramo retirado

§12.2 exige que el evento de cierre **nombre un artefacto y su sección**, *«no un momento»*. La versión
que el tramo retirado había escrito lo declaraba como *«la entrada del `CHANGELOG.md` que publique la
renumeración»* — y **una entrada que todavía no existe no se puede abrir**, que es el defecto exacto que
§12.2 describe. La auditoría lo levantó.

**Acá los dos eventos son artefactos vivos**: `Master-Prompt.md` §10 y la cabecera de
`SDD-Getting-Started-Guide.md`. Se abren, se miran, y dicen o no dicen lo que el ítem espera.

## 6. Comprobación 13 — los criterios del origen

| # | Criterio de T3 | Veredicto |
|---|---|---|
| 1 | Un ítem diferido del framework **sobrevive a la nota que lo declaró** | **Cumplido**: vive en `Root-Rules.md`, que no se cierra con una fecha |
| 2 | Los cuatro campos son los de §12.2, **con el evento abrible** | **Cumplido**: §5 |
| 3 | **Alguien lo mira** | **Cumplido**: la reanudación, en el paso donde ya lee los diferidos de un destino |
| 4 | **Ningún documento generado deja de cumplir** | **Cumplido, y declarado en la propia sección**: §12.3 gobierna al framework y su última línea dice que para un destino no aplica |
| 5 | No arrastra nada del tramo retirado | **Cumplido**: no toca D3, no declara ámbitos y no renumera |

## 7. Observaciones

**El registro nace con dos ítems y eso es el estado sano, no una deuda.** Los dos estaban declarados y
sin lugar desde la 11.2. Lo que cambia no es que existan: es que **ahora se cuentan**.

**Y queda uno afuera, a propósito.** El hueco de §VI.1 que la 11.2 declaró —admite un bump «Ninguno» y
la comprobación 5 exige una fila que empieza por su versión— **no es un ítem diferido**: es un defecto
del método, no una obligación que alguien difirió. Corregirlo es tocar §VI.1, y tiene su propio tramo.

## 8. Veredicto

**CONFORME.** Las trece comprobaciones pasan, el barrido publica su corrida con dos cajas, y el conjunto
queda en **SDD 11.3**.
