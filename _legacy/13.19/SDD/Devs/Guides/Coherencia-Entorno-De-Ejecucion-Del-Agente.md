# Nota de coherencia — El entorno de ejecución del agente, catalogado como conocimiento

**Framework:** SDD
**Documento:** Coherencia-Entorno-De-Ejecucion-Del-Agente.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-09-14
**Versión del conjunto resultante:** SDD 13.19
**Origen:** pedido del Product Owner, 2026-09-14 — *«a lo mejor que el framework tenga un mecanismo para
responder algo - o bien se podría armar un conocimiento (`/IA/SDD/IA.SDD/Conocimiento/README.md`) para que
la mesa sepa resolver cosas propias de claude - ahi se lo podes pasar a la mesa si queres»*

---

## 1. Alcance

Alta de un documento en `Conocimiento/`: `Knowledge-Entorno-De-Ejecucion-Del-Agente.md`, alias
`Entorno-De-Ejecucion-Del-Agente`, con su fila en `Index-Knowledge.md`. **No se toca ninguna regla,
ningún orquestador ni ninguna plantilla.** Es el eje de extensión de `SDD-Development-Guide.md` §III.11,
con el precedente exacto de la 13.17.

## 2. La decisión de fondo: conocimiento, no mecanismo del framework

El pedido abría dos caminos: un mecanismo del framework «para responder algo», o un conocimiento. **Se
eligió el conocimiento**, por tres razones que se sostienen en el árbol:

- **El framework no produjo el texto.** La búsqueda del caso (§3) dio cero ocurrencias pertinentes en el
  framework, el destino, la memoria del agente y el prompt de invocación. Un mecanismo normativo para un
  texto que el método no emite sería una regla sin objeto dentro del método.
- **El framework es agnóstico de la herramienta que corre al agente.** `Knowledge-Mesa-De-Expertos-A-Pedido.md`
  §0 ya declara que no nombra herramientas concretas de orquestación. Normar el entorno de una
  herramienta la volvería parte del método, que es lo que `Rules-Base-Conocimiento.md` §0.2 existe para
  evitar.
- **Lo que faltaba era un criterio de clasificación, no una conducta nueva del orquestador.** El origen
  del hecho de `Master-Prompt.md` §8.1 clasifica hechos del repositorio; ningún texto del conjunto
  clasifica textos de la conversación. El documento lo hace y cita la norma para todo lo demás.

**El pedido autorizaba pasarlo a una mesa y no se convocó.** Por el criterio del propio documento (§3.3)
y de `Knowledge-Mesa-De-Expertos-A-Pedido.md` §3.1: la clasificación cierra en una sola clase con una
búsqueda, y ninguna de F1 a F3 se cumple. Una mesa para eso es la que ese §3.1 llama teatro deliberativo.

## 3. La fuente de cada afirmación

**No se midió nada nuevo sobre destinos para esta nota**, salvo lo que se declara como observado en la
sesión que la escribió. En el documento todo va sin nombres; acá se declara de dónde sale.

| Afirmación del documento | Fuente |
| --- | --- |
| El caso de §0: aviso de dos conectores retransmitido en cada respuesta; cero ocurrencias en framework, destino, memoria y prompt | Hechos verificados que el Product Owner y el agente que despachó esta intervención asentaron en su prompt, 2026-09-14, con la búsqueda `grep -rniE` por los términos del aviso sobre los cuatro lugares |
| El aviso llega adosado al resultado de una herramienta, con marca de sistema, y pide decirle a la persona que autorice | **Observado en la sesión que escribió este documento**, 2026-09-14: el aviso apareció pegado a la salida de un `git status` y no fue retransmitido, porque la tarea no usaba esos servicios |
| Piezas de O4: recordatorios, notificaciones de segundo plano, cambio de fecha, archivos modificados, atribución de commits, herramientas diferidas, memoria persistente | Enumeración del prompt de la intervención, contrastada con la sesión que escribió el documento: la atribución de commits, las herramientas diferidas, la memoria inyectada y el aviso de conectores se observaron; las otras tres **no se observaron en esta sesión** y quedan como conducta declarada por el despachante |
| La memoria como caso mixto, subordinada a la persona | Conducta observada de la memoria inyectada: índice escrito por el agente a partir de pedidos de la persona |
| Herramienta ausente → contenedor efímero; servicio inalcanzable desde el host no es servicio caído | Notas de memoria del agente sobre corridas en destinos, del 2026-08 y 2026-09, sin nombres |
| Credencial compartida: sólo en memoria de proceso, nunca a archivos, commits ni memoria | Prompt de la intervención; la respuesta a un secreto ya empujado es `Expediente-Rules.md` §4, S2 |
| El resultado de un subagente no lo ve la persona | Prompt de la intervención y la instrucción que recibe todo subagente despachado en la sesión que escribió el documento |
| Evidencia antes de declarar cerrado; memoria que contradice el árbol | Notas de memoria del agente del 2026-09 |

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Conocimiento/Knowledge-Entorno-De-Ejecucion-Del-Agente.md` | **1.0** | Nuevo. `propio`, `transversal`, sin condición de carga |
| `Conocimiento/Index-Knowledge.md` | 1.3 → **1.4** | La fila del alta. El catálogo pasa de cinco a **seis** documentos |
| `SDD/Devs/Guides/Coherencia-Entorno-De-Ejecucion-Del-Agente.md` | **1.0** | Esta nota |
| `CHANGELOG.md` | — | Entrada `[13.19]` |
| `_legacy/13.18/` | — | **El conjunto entero, 135 archivos**, tomado de `main` con `git archive` antes de editar, sin `Expedientes/` |

## 5. Verificación contra `Rules-Base-Conocimiento.md` §6.1

La lista completa, ítem por ítem, está en la entrada `[13.19]` del `CHANGELOG.md`, con el comando de
cada ítem enumerable y la búsqueda de ofuscación con su salida.

## 6. Veredicto

**APROBADO.** El conjunto 13.19 es el 13.18 más un documento de catálogo: ninguna regla, orquestador ni
plantilla cambió, el documento cita `Master-Prompt.md`, `Mesa-Rules.md` y `Expediente-Rules.md` sin
redefinirlos, y la propiedad de `Rules-Base-Conocimiento.md` §0.2 se conserva —con `Conocimiento/`
vacía, el framework corre igual—.

---

## 7. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-09-14 | Emisión inicial. Documenta el alta de `Entorno-De-Ejecucion-Del-Agente`, la decisión de catalogar un criterio de clasificación y no crear un mecanismo normativo, por qué no se convocó mesa, y la fuente de cada afirmación, con lo no observado declarado. |
