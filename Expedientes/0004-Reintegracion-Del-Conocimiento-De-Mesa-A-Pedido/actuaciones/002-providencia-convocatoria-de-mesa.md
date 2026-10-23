| Campo | Valor |
|---|---|
| Tipo | providencia |
| Fecha | 2026-10-23 |
| Autor | Presidente de mesa (orquestador de la sesión): convoca, consolida, **no vota** |
| Corrige | — |

# Convocatoria de mesa: enunciado, contrato de entrada, base mecánica y panel

La mesa se arma con la convención **del fork 1.15**, porque así lo pide el literal. Que esa convención funcione a la vista es parte del testeo.

## 1. Enunciado (fork 1.15, «lo que rige siempre» 1)

| Frase del pedido | Función | Sujeto | Origen |
|---|---|---|---|
| «incorpores ese conocimiento sobre `…/Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md`» | qué se hace y dónde | el documento del framework | literal, folio 001 |
| «montar la mesa … para que haga un trabajo y testeo de ese conocimiento» | medio y verificación | la mesa | literal |
| «convocando los especialistas adecuados» | composición del panel | el presidente | literal |
| «un framework que normalmente se descarga en un workspace limpio y desde ahi se ejecutan los prompts» | condición del objeto | el framework | literal |
| «debe contener las dependencias necesarias» | requisito | **ambiguo**, ver abajo | literal |
| «que la mesa debata y discuta su estructura para que sea correcta» | lo que se decide | la mesa | literal |

**«Debe contener las dependencias necesarias» tiene dos lecturas:**

- **(a)** El documento incorporado sólo depende de lo que trae `IA.SDD`. Toda cita resuelve dentro del árbol del framework, y lo que el fork toma de su destino se trae al texto o se quita.
- **(b)** El framework tiene que sumar, además, los archivos de los que dependía el fork (sus reglas base, sus convenciones comunes) como piezas nuevas.

Se toma **(a)**, que es la que menos agrega. Pasar a (b) es una decisión de la mesa y sale marcada.

## 2. Contrato de entrada

**PEDIDO (literal):** folio 001.

**CLASE DE OBJETO:** a decidir por la mesa con §2.2 del conocimiento. El presidente propone **diseño de una norma** sobre un corpus. Las comisiones citan la regla o la fuente con línea, y el refutador ataca el costo y la premisa.

**OBJETO:**
- El documento del framework, la 1.2, en `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md`.
- El fork 1.15. El presidente lo copió fuera del repositorio, en `<insumos>/Knowledge-Mesa-De-Expertos-A-Pedido.fork-1.15.md`, junto con sus dos dependencias del destino (`_reglas_base_conocimiento.md`, `_convenciones_comunes.md`).
- El framework `main` `c9b3e46` (13.21).

**OBJETIVO** (cada cláusula con su origen; lo que no tiene origen es agregado):

| # | Cláusula | Origen |
|---|---|---|
| O1 | El conocimiento del framework incorpora la sustancia del fork 1.3–1.15 que vale fuera del destino | literal «incorpores ese conocimiento» |
| O2 | En un workspace limpio, con sólo `IA.SDD`, toda dependencia del documento resuelve, o su contenido está en el texto | literal «workspace limpio … debe contener las dependencias necesarias», lectura (a) |
| O3 | La estructura del documento, o de los documentos si se parte, está debatida y es correcta contra la norma del framework | literal «que la mesa debata y discuta su estructura» |
| O4 | El resultado se prueba: una reproducción a ciegas en una copia limpia aplica el conocimiento a un caso y lo que falta queda medido | literal «trabajo y testeo» |

**RESTRICCIONES DURAS** (con su origen):

| # | Restricción | Origen |
|---|---|---|
| R1 | El alcance es la base de conocimiento desacoplada. No se cambian reglas, orquestadores ni plantillas. Se tocan sólo el documento (o sus hermanos), su fila en `Index-Knowledge.md`, `CHANGELOG.md`, el snapshot `_legacy/13.21/` (ya hecho) y su nota de coherencia en `SDD/Devs/Guides/` | criterio del Product Owner del 2026-08-29 al dar de alta `Conformacion-Pull-Request-Manual` (13.9): «sumar a la base desacoplada, no modificar el conjunto normativo». Coincide con `Rules-Base-Conocimiento.md` §0.2 |
| R2 | El repositorio es **público**. Nada del destino privado se nombra: ni producto, ni organización, ni proveedor, ni rutas de sus expedientes o bitácoras, ni datos | criterio del Product Owner del 2026-09-13 para repositorios públicos; medición de la API (ev-03) |
| R3 | Se cumple `Rules-Base-Conocimiento.md` (2.2): cabecera de once campos, §0–§10, techo de §6.2 (`propio` 600), lista §6.1 y fila del índice §7 que coincide con la cabecera | regla aceptada del framework (E2) |
| R4 | No se reescribe lo publicado | `Expediente-Rules.md` |

**DECISIONES CERRADAS:**
- Que `Conocimiento/` no es normativo.
- `Mesa-Rules.md` 1.5, `Expediente-Rules.md` 1.1 y `Master-Prompt.md` 8.21 tal como están.
- La forma del expediente.
- La delegación del Product Owner del 2026-09-14: «pasale a la mesa que evalúen las decisiones, que las estudien y propongan alternativas, elijan la mejor propuesta, la mejor fundamentada, y esa propuesta elegida queda aprobada».

**FUERA DE ALCANCE:**
- Cambiar el fork del destino.
- Cambiar la norma del framework. Un límite que aparezca se **anota** en la nota de coherencia como pendiente.

**MEDIOS:** lectura y `git grep` del árbol del framework, lectura del fork y sus dos dependencias (en `<insumos>`) y una copia limpia del framework para la reproducción.

**QUIÉN APLICA:** la mesa, con el presidente como implementador y un redactor designado. El pedido de fusión lo abre el presidente, por la delegación del ciclo de entrega.

**PRESUPUESTO:** 8 hallazgos por comisión; un ciclo de redacción, una prueba a ciegas y una corrección.

**DESPACHO VERIFICADO:** ev-01, ev-02 y ev-03.

## 3. Base mecánica

1. **ev-01.** De las 52 referencias a `.md` del fork, **36 no resuelven** en un workspace limpio con sólo `IA.SDD`. Se reparten así:
   - rutas de expedientes y bitácoras del destino;
   - nombres de reglas citados sin su ruta, que resuelven bajo `SDD/Devs/…` aunque el grep por nombre suelto no los encuentre;
   - las dos dependencias del destino (`_reglas_base_conocimiento.md`, `_convenciones_comunes.md`) y sus rutas `Prompts/…`.
2. **ev-02.** El fork tiene 790 líneas: supera el techo `propio` de 600 del framework, aunque cumplía con el techo de 700 de su destino. El §8 del fork **copia** cláusulas de `Mesa-Rules.md` 1.5 «por si un fork no tiene esa regla». En el framework esa regla viaja en el mismo árbol.
3. **ev-03.** Hay siete términos privados en el fork, con sus líneas. La mayoría está en §9 y §10 (trazabilidad y control de cambios).

## 4. Composición

| Rol | Tipo | Señal |
|---|---|---|
| Normativa de la base de conocimiento | núcleo | conformidad con `Rules-Base-Conocimiento.md`: techo, partición en hermanos, cabecera, índice, versión, nota de coherencia (O3, R3) |
| Portabilidad y workspace limpio | núcleo | qué hace cada dependencia de ev-01 (resuelve, se trae al texto o se quita) y la ofuscación (O2, R2) |
| Metodología del contenido | núcleo | qué de 1.3–1.15 es método general y qué es accidente del destino; qué no puede perderse (O1) |
| Arquitectura de la información | núcleo | un archivo o padre con hermanos; cómo encuentra lo que rige un agente que llega en frío; la carga progresiva (O3) |
| Refutador del objetivo | refutador | ataca la premisa (¿todo entra?, ¿la 1.2 alcanza?) y el costo para quien ya usa la 1.2 |

Le sigue un **jurado** que consolida y elige la estructura mejor fundada; esa decisión queda aprobada por la delegación. Después, un **redactor** escribe en el árbol. Una **auditoría mecánica** y **dos reproducciones a ciegas** sobre una copia limpia prueban el resultado, y una **corrección** cierra.
