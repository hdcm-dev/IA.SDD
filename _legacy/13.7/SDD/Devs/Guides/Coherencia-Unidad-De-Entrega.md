# Nota de coherencia — El nivel de unidad de entrega

**Framework:** SDD
**Documento:** Coherencia-Unidad-De-Entrega.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-15
**Autor:** AG-ROOT (Arquitecto de Soluciones), con verificación medida sobre tres destinos reales
**Versión del conjunto resultante:** SDD 8.0

---

## 1. Alcance

Intervención estructural que convierte la **unidad de entrega** en el nivel intermedio del layout de
salida, cerrando el pendiente que `Vocabulario-Rules.md` §8 declaraba desde la versión 5.0.

Se ejecuta inmediatamente después de la intervención sobre los reportes de evidencia 00 a 11
(versión 7.0), y depende de una de sus correcciones: el nivel declarado **por artefacto** en lugar de
por categoría, que es lo que permite decir qué artefacto corresponde a qué nivel.

## 2. Inventario de archivos

### 2.1 Creados

| Archivo | Rol |
| --- | --- |
| `SDD/Devs/Guides/Coherencia-Unidad-De-Entrega.md` | Esta nota |

### 2.2 Editados

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Vocabulario-Rules.md` | 2.2 → **3.0** | §2 la unidad de entrega es nivel del layout y lleva D8; §4 R3 pasa a tres niveles; §5 suma tres confusiones; §8 cierra el pendiente y declara el que queda |
| `Master-Prompt.md` | 6.0 → **7.0** | §3.4 mapa de rangos por unidad; §3.5 layout y cuatro casos de aplanado; §4 gating por nivel con `redistribuible` y `entrega_diferida`; §6 y §7 bucle por unidad en orden de integración; §8 despacho; §11 vista de producto con la matriz; §12 dos tablas; §15 nueve términos nuevos y el renombre de la variable D8 |
| `PRODUCT-INTAKE-template.md` | 2.2 → **3.0** | §13 partido en tres; §14 dos clases de contrato; §17 por unidad de entrega |
| `PRODUCT-MANIFEST-template.md` | 4.1 → **5.0** | §2 en tres tablas; §3 los dos grafos por separado |
| `Intake-Rules.md` | 3.3 → **4.0** | Campos bloqueantes y validaciones en tres grupos, con siete validaciones nuevas |
| `Migracion-Rules.md` | 2.0 → **3.0** | §4.3.2 migración estructural con detención de clasificación |
| `Root-Rules.md` | 4.0 → **5.0** | Rutas y mapa de documentación al nivel nuevo |
| Las doce reglas de categoría, `Maqueta-Rules.md` y `Deriva-Rules.md` | major cada una | Cabecera, carpeta target, variantes por `tipo_unidad_entrega` y prosa normativa |
| `SDD-User-Guide.md` | 1.10 → **1.11** | §1 los dos ejes y el test de tres preguntas |
| `SDD-Development-Guide.md`, `SDD-Getting-Started-Guide.md`, `Marco-Teorico-SDD.md` | — | Puesta al día |
| `CHANGELOG.md` | — | Entrada `[8.0]` con su impacto |

### 2.3 Sobre el archivado

**No hay `_legacy/7.0/`, y es correcto.** Las versiones 7.0 y 8.0 se publican en la misma
intervención: la 7.0 nunca fue un conjunto vigente que un destino pudiera consumir. `_legacy/`
conserva la **6.0**, que es el último conjunto efectivamente superado. Archivar un estado que nadie
usó agregaría un snapshot que no permite reconstruir ninguna corrida real.

## 3. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D2** | Conforme | Registro, encoding y fechas sin cambios |
| **D3** Nombres | Conforme | No se toca en esta intervención. El ancho y el ámbito quedaron fijados en la 7.0; lo que cambia acá es **a qué se le asigna cada rango**: el reparto pasa de ser por proyecto de código a ser por unidad de entrega, y el ámbito de unicidad sigue siendo el producto, que es lo que hace resolver las citas entre entregas |
| **D4**, **D5** | Conforme | Cada archivo tocado subió versión y registró su fila |
| **D6** Trazabilidad | Conforme y reforzada | La matriz de composición es trazabilidad nueva: cruza los dos ejes y hace explícito qué entrega alcanza un cambio sobre un proyecto compartido |
| **D7** Neutralidad | Conforme | Las mediciones de destinos reales se citan como magnitudes, sin nombrar dominios |
| **D8** Conjunto cerrado | **Conforme, y es el punto** | Los ocho valores **no cambian**. Cambia de qué son atributo: pasan del proyecto de código a la unidad de entrega, porque `SDD-Development-Guide.md` declara que cubren «formas de entrega». El conjunto no se amplía ni se reduce |
| **D9** Evidencia | Conforme | Toda afirmación de esta intervención sobre el estado del framework se verificó contra el archivo, y las mediciones sobre destinos se reprodujeron contando archivos |

## 4. Observaciones

**La sustitución léxica no se hizo a ciegas, y hubo que revisar a mano.** `Vocabulario-Rules.md` §9.5
prohíbe la transformación mecánica de un corpus, con el daño de la 5.0 como prueba. El barrido se hizo
con guarda de contexto: 244 líneas sustituidas automáticamente y **46 preservadas** por mencionar
compilación, build, stack o solución de código. De esas 46, **13 había que corregir igual**, y casi
todas en `Rules-Devops.md`.

**El caso de DevOps merece registro**, porque es donde la sustitución ciega habría producido una regla
falsa. La versión anterior decía que «el orden de construcción y de publicación lo fija el grafo de
dependencias del manifiesto». Con un eje era coherente; con dos es falso, porque **se construye por
proyecto de código y se publica por unidad de entrega**. La matriz única quedó partida en dos.

**Apareció un lugar para una decisión que no tenía dueño.** Un ADR sobre un proyecto de código
compartido —usado por varias entregas— es de nivel producto. En la versión anterior caía en la carpeta
de la primera entrega que lo escribiera, que es la forma que toma el reporte `07` cuando el artefacto
no tiene un dueño declarado.

**La intervención cometió el defecto que corregía, y se detectó al correr un pendiente.** El
inventario de vocabulario propio encontró nueve términos usados en dos o más artefactos sin definición
en ningún glosario del framework, y **cinco los acuñaron las versiones 7.0 y 8.0**: `compuerta
mecánica`, `referencia pendiente`, `apartamiento declarado`, `mapa de rangos` y `conjunto cerrado`. Es
exactamente el patrón del reporte `11`. Los nueve entraron al glosario operativo, y el hecho queda
registrado porque es la evidencia de que el patrón no se cierra con una corrección: se cierra con un
inventario que se corra.

**Los tres pendientes que quedaban se cerraron antes de publicar.** La condición de terminado pasa a
declararse en dos capas con dueños y niveles distintos, con lo que la obligación de la Fase A hacia la
Fase E desaparece en lugar de administrarse; el manifiesto agrupa los proyectos de código por solución
de código y declara un grafo de compilación por solución; y la ampliación de D9 a los recuentos queda
**decidida como descartada**, con su motivo escrito en `Root-Rules.md` §10 para que no vuelva a
plantearse.

`Vocabulario-Rules.md` §8 pasa de «Pendiente declarado» a «Pendientes declarados y su cierre», y se
conserva vacía a propósito: el mecanismo de declarar un pendiente en la propia regla funcionó —el que
estuvo ahí desde la 5.0 quedó visible durante tres versiones en lugar de leerse como un descuido— y
la sección queda como el lugar donde va el próximo.

## 5. Veredicto

**APROBADO.** El conjunto normativo 8.0 es internamente coherente:

- Los tres niveles están declarados en un solo lugar, `Vocabulario-Rules.md` §4 R3, y las diecinueve
  cabeceras de regla los citan.
- El layout, el gating, el bucle de generación, el despacho, el intake, el manifiesto y la validación
  hablan del mismo nivel intermedio.
- Los dos ejes se declaran por separado en los cuatro lugares donde se cruzan —manifiesto, vista de
  producto, pipeline y contratos— y en ninguno se mezclan.
- El conjunto D8 queda intacto en sus ocho valores.
- La migración sabe ejecutar el salto, y **se detiene** en la única decisión que el método no puede
  tomar: cuál de los proyectos de código de un destino existente es una unidad de entrega.
