# Nota de coherencia — La devolución al origen, y por qué la verificación no la alcanzaba

**Documento:** Coherencia-Devolucion-Al-Origen.md
**Versión:** 1.0
**Fecha:** 2026-08-20
**Versión del conjunto resultante:** SDD **11.1**
**Origen:** La verificación posterior de la intervención que publicó la 10.0, en
`PROMPTs/Fixs/01-Fix-Reportes-12-14/OUTPUTs/30-Verificacion-Del-Plan-Aplicado.md`

---

## 1. Alcance

**Una intervención que nace de un encargo puede contestar menos de lo que el encargo pedía y
declararlo resuelto igual**, y ninguna de las doce comprobaciones de §VI.3 podía verlo: **todas miran
el árbol que quedó**, y el trabajo que falta **no está en ningún archivo tocado**.

**El caso está medido y es del propio framework.** La intervención que publicó la **10.0** declaró
resuelto un origen de **cinco criterios de aceptación** con **uno sin auditar** —el que pedía barrer la
clase entera y no el caso que la originó—. Las doce comprobaciones pasaron, la nota dio **CONFORME**, y
el registro quedó diciendo «resuelto». Lo levantó una verificación posterior, con la versión ya
publicada.

Entra la **comprobación 13**: la nota **enumera los criterios de aceptación del origen** y les da
veredicto **uno por uno**.

**Lo que esta intervención NO hace, y es una restricción del propio método:** no nombra dónde vive el
origen. La comprobación **2** exige autosuficiencia —cero referencias fuera de este repositorio— y una
comprobación que citara el árbol de afuera la rompería. Por eso la obligación es **traer los criterios
adentro de la nota**, transcritos y con veredicto. Un criterio que nadie transcribió no se puede
contestar, y ésa es exactamente la forma en que el defecto se produce.

## 2. Inventario de archivos tocados

| Archivo | De → a | Qué cambió |
|---|---|---|
| `SDD/Guides/SDD-Development-Guide.md` | 1.20 → **1.21** | §VI.3 suma la comprobación 13 y su fundamento |
| `Devs/Rules/Catalogo-De-Criterios.md` | 1.8 → **1.9** | Un criterio nuevo, y la fila de verificación pasa de **doce** a **trece** comprobaciones |
| `CHANGELOG.md` | — | Entrada **11.1** |
| `_legacy/11.0/` | — | Snapshot del conjunto superado, **tomado del estado sin editar** |

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| La lista de verificación deja de tener doce entradas | `Las doce comprobaciones` | `Las trece comprobaciones` |

**Resultado de la corrida, sobre todo el árbol vivo:**

| Patrón | Ocurrencias antes | Reemplazadas | **Residuo vivo** |
|---|---|---|---|
| `Las doce comprobaciones` / `las doce comprobaciones` | 4 | 1 | **3**, todas de clases estables |

**Exclusiones.** Las **siete clases estables de §VI.3.2 se citan y no se reescriben**. Las tres del
residuo, con su clase:

| Dónde | Clase de §VI.3.2 |
|---|---|
| `Guides/Coherencia-Item-Diferido.md` §6 y `Guides/Coherencia-Items-Empaquetados.md` §6, veredictos ya emitidos | «Notas de coherencia anteriores» |
| `SDD-Development-Guide.md` §VI.3, «las doce comprobaciones **anteriores** pasaron todas» | **Ninguna: es correcto.** Describe el estado en que ocurrió el defecto, cuando eran doce, y decir «trece» ahí sería falso |

## 4. Verificación

**Las trece, y la 13 aplicada a esta misma intervención**, que es la primera prueba de que la
comprobación se puede correr.

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 intactas | **Sin violaciones** |
| 2 | Autosuficiencia, cero referencias fuera del repositorio | **Cero**, y es la restricción que dio forma a la comprobación 13 |
| 3 | Referencias internas resuelven | **Cero rotos** fuera de la exclusión de §VI.3 |
| 4 | Sin contradicción con lo que ya estaba | **Sin contradicciones** |
| 5 | Control de cambios actualizado en cada archivo modificado | **Una fila por archivo** en los dos que suben versión |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance declarado fue modificado | **Sin cambios colaterales** |
| 8 | Barrido por concepto | **Residuo 3**, todas de clases estables citadas |
| 9 | Coherencia interna de cada artefacto tocado | **Sin contradicciones internas** |
| 10 | Integridad del registro | **Verificado en los dos** |
| 11 | Cobertura de la nota de coherencia | **Esta nota** |
| 12 | Cobertura del catálogo de criterios | **Un criterio nuevo** registrado, y el recuento corregido |
| **13** | **Devolución al origen** | **Abajo, criterio por criterio** |

### Comprobación 13 — los criterios del origen, transcritos y contestados

El origen es la verificación posterior de la 10.0, y sus criterios son **los cinco que el encargo
declaraba**. Se transcriben acá porque §VI.3 comprobación 13 lo exige y porque la comprobación 2 impide
citarlos desde afuera:

| # | Criterio del origen | Veredicto |
|---|---|---|
| 1 | Existe una forma marcada de ítem diferido y **se puede contar** | **Cumplido** en 10.0, `Root-Rules.md` §12.2 |
| 2 | Los cuatro campos, y el evento **nombra artefacto y sección** | **Cumplido** en 10.0, §12.2 punto 4 |
| 3 | **Alguna compuerta levanta un ítem cuyo evento ya ocurrió** | **Cumplido** en 10.0, `Master-Prompt.md` §10.0 comprobación 6 y la reanudación |
| 4 | Ningún ítem obligatorio de una §4.x empaqueta dos decisiones. **Se audita sobre las quince reglas** | **Incumplido en 10.0** y **cumplido en 11.0**: cinco ítems partidos. **Es el criterio que este defecto dejó pasar** |
| 5 | *(Interpretativo)* Sobre el destino que originó el encargo, la corrección habría detectado el caso con anticipación | **Cumplido por construcción**, no medido sobre el destino |

**Los cinco contestados, uno de ellos con dos versiones de distancia.** Con la comprobación 13 vigente,
esa distancia se declara al publicar en lugar de descubrirse después.

## 5. Observaciones

**Esta comprobación no cierra el lazo sola, y conviene decirlo.** Obliga a declarar el veredicto de
cada criterio; **no obliga a que el veredicto sea verdadero**. Es la misma limitación que la
comprobación 12 declara de sí misma —*«exige cobertura y no verifica corrección»*— y se acepta por el
mismo motivo: **un criterio transcrito y contestado con un «no» es visible**, y un criterio que nadie
enumeró no lo es.

**Y hay una asimetría deliberada con la comprobación 11.** La 11 se verifica contrastando dos
artefactos del árbol; **la 13 no se puede verificar así**, porque el origen vive afuera. Su garantía es
más débil por construcción, y aun así corta el caso medido: **un criterio sin contestar deja de poder
declararse resuelto en silencio**.

## 6. Veredicto

**CONFORME.** Las trece comprobaciones pasan, el residuo del barrido es **3 de clases estables**, y el
conjunto queda en **SDD 11.1**.
