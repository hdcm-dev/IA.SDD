| Campo | Valor |
|---|---|
| Tipo | presentacion |
| Fecha | 2026-10-23 |
| Autor | Product Owner (literal asentado por el presidente de mesa) |
| Corrige | — |

# Presentación del caso

## Antecedente en la misma sesión

El Product Owner pidió primero la lista de documentos de los que depende el conocimiento `Mesa-De-Expertos-A-Pedido` en su fork, el de un destino privado. Después preguntó cuál de las dos versiones era más rica: la del destino o la del framework (`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md`).

El presidente respondió con lo que había medido:
1. La versión del destino es la **1.15** (2026-10-21, 790 líneas). La del framework es la **1.2** (2026-09-16, 309 líneas).
2. Las dos comparten el control de cambios 1.0–1.2 al pie de la letra: el fork nació de la 1.2.
3. El fork es un superconjunto. Agrega §3.4 y §5.5–§5.7, apartamientos de un conocimiento (1.3–1.12), enunciado del problema y caso que funciona (1.13), carga progresiva (1.14), ciclo de vida de la evidencia (1.15) y un §8 mucho mayor.
4. Ninguna fila de las tablas del framework falta en el fork.
5. Nada desde la 1.3 se reintegró al framework, que quedó atrasado trece versiones. Las de más valor general son la 1.3 y la 1.13.

## Pedido (literal)

> ok, me gustaria ue incorpores ese conocimiento sobre `/IA/SDD/IA.SDD/Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` - pero podes incluso montar la mesa de <producto-privado> para que haga un trabajo y testeo de ese conocimiento covnocando los especialistas adecuados, - pero la mesa debe saber que /IA/SDD/IA.SDD es un framework que normalmente se descarga en un workspace limpio y desde ahi se ejecutan los prompts para construir otros proyectos, en consecuencia, debe contener las dependencias necesitas, que la mesa debata y discuta su estructura para que sea correcta

La única alteración es el nombre del producto privado: se reemplaza por `<producto-privado>`, porque este repositorio es público. «La mesa de <producto-privado>» designa la convención del fork 1.15, que es la que se usa para convocar esta mesa.
