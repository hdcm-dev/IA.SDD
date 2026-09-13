# Nota de coherencia — La mesa que se pide por nombre, catalogada como conocimiento

**Framework:** SDD
**Documento:** Coherencia-Mesa-De-Expertos-A-Pedido.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-09-13
**Versión del conjunto resultante:** SDD 13.17
**Origen:** pedido del Product Owner, 2026-09-13 — *«sería interesante que incorporases este prompt como
parte de la base de conocimiento […] no lo referencies de ahí, porque si mañana muevo el framework no lo
va a encontrar, entonces cuando te pide hacé una mesa de expertos en… presentales como caso tal o cual
cosa… que busque o algo similar a esto ya sepas que te estoy pidiendo sin tener que darte las
referencias — la constructiva del prompt la podés poner como parte de la base de conocimiento en un
markdown en el `Framework SDD`, luego con la experiencia de cómo lo hemos venido usando sabrás
determinar más especificaciones que sean necesarias»*

---

## 1. Alcance

Alta de un documento en `Conocimiento/`: `Knowledge-Mesa-De-Expertos-A-Pedido.md`, alias
`Mesa-De-Expertos-A-Pedido`, con su fila en `Index-Knowledge.md`. **No se toca ninguna regla, ningún
orquestador ni ninguna plantilla.** Es el eje de extensión de `SDD-Development-Guide.md` §III.11.

## 2. La decisión de fondo: conocimiento, no norma

**El marco de origen ya entró una vez al framework, como norma**, y con una selección deliberada:
`Coherencia-Mesa-De-Evaluacion.md` §6 declara que de sus nueve mecanismos **cinco entraron y cuatro se
rechazaron** porque el método ya los tenía. Volver a traerlo como norma habría reabierto esa decisión
sin una contradicción que la funde, y copiarlo entero a `Conocimiento/` habría creado la segunda fuente
que `Rules-Base-Conocimiento.md` §4.5 nombra como **conocimiento disfrazado de regla**.

**Lo que el pedido necesita no es la mecánica, que ya está: es el uso.** `Mesa-Rules.md` §0.0 convoca
por una condición que supone corpus previo y un orquestador que lee estado, y **las mesas corridas
desde su publicación las pidió una persona**, sobre objetos que esa condición no alcanza: una interfaz en
ejecución, una norma que todavía no existe, una contradicción entre observadores. Cada una reconstruyó
a mano la misma forma. **El documento cataloga esa forma y cita la norma para todo lo demás**; su §8 lo
hace verificable.

**Y resuelve la objeción de ubicación del pedido.** El documento no cita la ruta del marco de origen:
vive en el repositorio que se clona, y entra en el snapshot de `_legacy/` como todo `Conocimiento/`.

## 3. La evidencia de uso, mesa por mesa

Lo que el documento agrega a `Mesa-Rules.md` sale de mesas ya corridas, y **no se midió nada nuevo para
esta nota**. En el documento van anónimas, por la compuerta de ofuscación; acá se declara de dónde sale
cada afirmación.

| Afirmación del documento | Fuente |
| --- | --- |
| Clase «interfaz en ejecución»: usuarios estándar, moderador de objetivos, consultor de documentación, capas de origen de interfaz, cierre por captura posterior, datos sembrados, escalada por identidad visual | Mesa de interfaz de `Lab-Geometria`, 2026-09-02: marco adaptado, cinco actas y cierre. **64 hallazgos, 47 correcciones aplicadas, 1 refutado, 3 deudas declaradas, 0 escaladas** |
| Peritaje que cambia una sola variable; «qué dice el sistema cuando no pudo»; pruebas probadas en rojo antes del arreglo | La misma mesa, acta del peritaje y acta de cierre |
| «Cada dato del despacho lleva su comando»: cuatro datos, tres mal | Mesa sobre la colisión léxica, 2026-09-12, que originó el reporte `28`: su plan y cierre, §3 |
| «Descripción o control»: 71 hallazgos, 55 y 16; la unidad de aplicación es el documento | Mesa sobre la documentación de un tercer destino, 2026-09-07, acta de la mesa §2 |
| Testimonio de quien pide como evidencia E4 | Registro `Mesa-2026-09-12.md` de `Lab-Geometria`, contrato de entrada |
| Rendimiento por especialista 4,9 y 5,8 | `Mesa-Rules.md` §6.7 |
| «Ante un problema, mesa y no detención» | Instrucción del Product Owner del 2026-09-13, en la corrida que migra `Lab-Geometria` a 13.16 |

**Una lección que se consideró y no entró**, porque su fuente no se encontró en el árbol: la de un
Product Owner que reclamó no haber visto resultados funcionando después de muchas entregas en verde.
Lo que de ella está en el documento —la prueba que se vio fallar— se sostiene en otra fuente.

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` | **1.0** | Nuevo. `propio`, `transversal`, sin condición de carga |
| `Conocimiento/Index-Knowledge.md` | 1.2 → **1.3** | La fila del alta. El catálogo pasa de cuatro a **cinco** documentos |
| `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` | **1.0** | Esta nota |
| `CHANGELOG.md` | — | Entrada `[13.17]` |
| `_legacy/13.16/` | — | **El conjunto entero, 131 archivos**, tomado de `main` antes de editar |

## 5. Verificación contra `Rules-Base-Conocimiento.md` §6.1

La lista completa, ítem por ítem, está en la entrada `[13.17]` del `CHANGELOG.md`, con el comando de
cada ítem enumerable.

## 6. Veredicto

**APROBADO.** El conjunto 13.17 es el 13.16 más un documento de catálogo: ninguna regla, orquestador ni
plantilla cambió, el documento cita `Mesa-Rules.md` sin redefinirla, y la propiedad de
`Rules-Base-Conocimiento.md` §0.2 se conserva —con `Conocimiento/` vacía, el framework corre igual—.

---

## 7. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-09-13 | Emisión inicial. Documenta el alta de `Mesa-De-Expertos-A-Pedido`, la decisión de catalogar el uso y no reabrir la norma, y la fuente de cada afirmación del documento. |
