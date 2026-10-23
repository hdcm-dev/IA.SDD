| Campo | Valor |
|---|---|
| Tipo | constancia |
| Fecha | 2026-10-23 |
| Autor | Redactor designado |
| Corrige | — |

# Redacción de los tramos T0 a T7 y T9 de la resolución 013

Apliqué la resolución del folio 013 sobre el árbol de trabajo de la rama del expediente. **No hice commit**: el
paso 1 de la comprobación se emuló sobre el árbol (abajo). `_legacy/13.21/` no se tocó (T8): está sin seguimiento,
con 140 archivos y cero diferencias contra la base del expediente, y se versiona con el primer commit.

## 1. Archivos y líneas

| Tramo | Archivo | Líneas | Techo de redacción | Qué lleva |
|---|---|---|---|---|
| T0 | `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/README.md` | 14 | — | Carátula de seis campos y la línea de remisión de `Expediente-Rules.md` §3 |
| T0 | `evidencia/ev-01`, `ev-02`, `ev-03` | 57 · 73 · 14 | — | Las tres líneas de A9 (`# Comando:`, `# Base:`, `# Quién:`) antepuestas; dos redacciones (§3) |
| T1 | `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` 2.0 | 550 | 560 (duro 600) | La puerta: §0 con los cinco renglones y el sexto, el mapa de siete filas con «Además»; §1 a §10 según la tabla del padre de 013 |
| T2 | `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` 1.0 | 335 | 480 | La regla de excepción, la ficha `XC-<n>` como folio propio, el cierre, el análisis, sin la guarda |
| T3 | `Conocimiento/Knowledge-Cadena-De-Consecuencias.md` 1.0 | 160 | 200 | La cadena de consecuencias del destino, íntegra y ofuscada; hoja del grafo |
| T4 | `Conocimiento/Index-Knowledge.md` 1.7 | 64 | 70 | Fila del padre desde su cabecera, dos altas a continuación, cabecera a 2.3, §2 (M-2), fila 1.7 |
| T5 | `SDD/Devs/Rules/Rules-Base-Conocimiento.md` 2.3 (M-1) | 545 (+11) | +15 | §2.2 viñeta, §6.1 ítem que no rige hacia atrás, §8 línea del snippet, §10 fila 2.3, versión |
| T6 | `SDD/Devs/Guides/Coherencia-Mesa-De-Expertos-A-Pedido.md` 1.1 | 266 | 220 | §3.1 a §3.7 (versiones, 36 referencias, siete invariantes, dos cotejos, copias, lo que quedó afuera), §6 pendientes, §7 marcado |
| T7 | `CHANGELOG.md` `[13.22] - 2026-10-23` | 50 de la entrada | 70 | Altas, cambios, tabla de §6.1 por documento, salida de la comprobación, por qué es minor, impacto, `_legacy/13.21/` |
| T9 | `evidencia/ev-04-comprobacion-o2-prima.py` | 196 | — | El guion de O2′ como texto, no ejecutable, con sus tres líneas |
| T9 | `evidencia/ev-05-salida-o2-prima.out` | 63 | — | La salida de los pasos 1 a 7 y 9 |
| T9 | `evidencia/ev-06-cotejo-de-las-copias-del-fork.diff` | 63 | — | Las trece copias de reglas del fork contra la regla vigente y `_legacy/13.21/`, y lo que agregaban con su destino |

`Conocimiento/README.md` y el `README.md` raíz no listan el catálogo ni versiones: no se tocaron.

## 2. Comprobaciones, con su comando y su resultado

| Paso de 013 §7 | Comando | Resultado |
|---|---|---|
| 1 · Copia sin historia | `git -c core.quotepath=off ls-files -z` más `--others --exclude-standard`, por `tar --null -T -` a un workspace vacío; `test "$(ls -A "$W")" = IA.SDD && test ! -e "$W/IA.SDD/.git"` | 7.118 archivos; el workspace contiene sólo `IA.SDD`, sin `.git`. Emulación de `git archive` porque no hay commit |
| 2 · Resolución | `python3 -I evidencia/ev-04-comprobacion-o2-prima.py "$W/IA.SDD" --estricto` sobre los tres documentos, el índice, la nota y la regla | **0 fallas**: 308 rutas, 216 secciones citadas, 58 rangos de líneas, 49 alias, 12 identificadores (A, D, XC) y 18 carpetas de expediente. En modo estricto, 2 rutas resuelven dentro de `Expedientes/`: el folio 019 del expediente 0003, que el padre cita como caso en §3.3 y en su tabla «Dependencias» (D-28) |
| 3 · Nada apunta afuera | `grep -c -E` de los nombres de las dos dependencias del destino, de su carpeta de prompts y de `\bK[0-9]+\b`, y `grep -c -E` de hashes entre acentos graves, sobre los tres documentos y la nota | 0 y 0 en los cuatro |
| 4 · Tabla «Dependencias» | El mismo guion, paso 4 | 29 archivos citados fuera de sí por los tres documentos, 29 con su fila; las equiparadas, con ancla de línea |
| 5 · Ofuscación | `grep -ciE -f <lista del encargo>` sobre lo escrito (los seis archivos, la carátula, las seis evidencias y `CHANGELOG.md` entero); `grep -ciE -f <lista ampliada>` sobre los seis archivos y la entrada `[13.22]`; `grep -c -E 'claude-tmp\|/home/\|-home-\|insumos/crudo'` | **0**, **0** y **0**. Las dos listas viven fuera del repositorio. El barrido de A11 de `Expediente-Rules.md` §6 (rutas y usuario del host) sobre todo el cambio: 0 |
| 6 · Citas entrantes | `git grep -n -o -E 'Mesa-De-Expertos-A-Pedido(\.md)?…§[0-9.]+' -- SDD Conocimiento` | Seis: `Mesa-Rules.md:574` (§3.1), `Root-Rules.md:948-949` (§2.1, pasos 9 y 10), `Knowledge-Entorno-De-Ejecucion-Del-Agente.md:46`, `:145`, `:264` y su nota `:39` (§3.1). Las dos secciones conservan su número y su sentido: §2.1 paso 9 sigue siendo la reintegración, y §3.1 sigue teniendo «Cuándo no hace falta una mesa» y la lectura del pedido como cambio de alcance |
| 7 · Techo y forma | `wc -l`; el guion (prosa de más de 110 columnas fuera de tablas, código y campos de cabecera); `sed -n 3,13p … \| grep -cP`; `grep -c '^## [0-9]*\.'`; cotejo de la fila del índice con la cabecera, campo por campo, por guion | 550 / 335 / 160 contra 560 / 480 / 200; prosa de más de 110 columnas: 0, 0 y 0; 11 campos y 11 secciones en los tres; **nueve de nueve filas del índice iguales a su cabecera** en las diez columnas. En la regla, 6 líneas de más de 110 columnas, todas anteriores a esta edición (la 2.2 tenía las mismas); la que agregué se envolvió |
| §6.1 por documento | Los quince ítems de la 2.3 | Los diez `[enumerable]` cumplen en los tres; los cinco `[interpretativo]`, también, con lo que dice la tabla de `[13.22]` |
| 8 · Reproducciones a ciegas | — | **No corridas**: son T10 |
| 9 · Regresión | El guion, sin `--estricto`, sobre los otros seis documentos | No reprueba. Rutas 119 y secciones 65, sin fallas. Dos alias marcados: `Knowledge-Bundle-JS` en `Knowledge-Conformacion-Pull-Request-Automatico.md:42`, un precedente sin fila en el índice (hallazgo para T10), y `Panel-De-Registros.html` en `Knowledge-Template-HTML-SDD-Default.md:246`, falso positivo del patrón de alias. La tabla «Dependencias» y el ancho de la prosa no se les exigen: no rigen hacia atrás |
| `Expediente-Rules.md` §6 sobre este expediente | A1, A2, A3, A4, A6 y A9 con los comandos de la regla | Vacíos, con esta constancia como último folio. A2 exige el número sin acentos graves; la carátula del 0003 los lleva y daría `NÚMERO` |

## 3. Apartamientos del plan, con su motivo

| # | Qué | Motivo |
|---|---|---|
| 1 | La nota de coherencia tiene 266 líneas contra el techo de redacción de 220 | Las 36 filas de referencias, las siete invariantes y los dos cotejos cláusula por cláusula que pide T6, con las tablas de la 1.0 conservadas. No es un documento de conocimiento: no la alcanza el techo de §6.2. Sale a la presidencia con esta medida |
| 2 | Las líneas de A9 son `# Comando:`, `# Base:` y `# Quién:`, no `# Método:`, `# Comando:` y `# Base:` | `Expediente-Rules.md` §3.4 pide un método (o comando o medio), una base y un quién: dos de las tres que nombra 013 son del mismo campo |
| 3 | La carátula no lleva una tabla de índice de actuaciones | `Expediente-Rules.md` §3 manda, después de la tabla, «esta línea y nada más», y la línea ya da el índice (`ls actuaciones/`) |
| 4 | Dos redacciones en evidencias ya existentes, antes del primer commit: en `ev-02`, la ruta absoluta del scratchpad pasó a `<insumos>/…`; en `ev-01`, el título del expediente 0001 de un destino privado pasó a `<caso-del-destino>` y el nombre de su carta, a `<carta-de-comision>` | La ruta del host la detecta A11; el título nombraba un caso del destino (R2). `ev-01` conserva nombres de archivos y carpetas de bitácoras del destino que ya traía: la lista ampliada los marca (seis líneas). Queda para la auditoría de T10 |
| 5 | Las anclas de las equiparadas van como `ruta:línea` con la versión y la sección entre paréntesis, no sólo como versión y § | 013 §5 pide «la línea del equivalente»; con la versión al lado, un desplazamiento futuro se detecta. Ninguna ancla apunta a `_legacy/` |
| 6 | La cadena lleva su propia tabla «Dependencias» con las reglas que cita | El paso 4 exige fila para cada referencia fuera del documento; no cita a ningún otro conocimiento, así que sigue siendo hoja |
| 7 | `SDD/Guides/SDD-Development-Guide.md:499` dice «los catorce ítems» de `Rules-Base-Conocimiento.md` §6.1, que con la 2.3 son quince. No lo toqué | Es una pieza de `SDD/` fuera del alcance de 013. Es un costo de M-1 que la resolución no listó: sale a la presidencia para que lo sume al marcado o lo corrija con el commit |
| 8 | Los dos barridos de ofuscación se asientan como `grep -f <lista>`, sin el patrón | Escribir el patrón en el repositorio publica los nombres que oculta. La primera versión de la entrada `[13.22]` lo transcribía y el propio barrido lo detectó; se reescribió antes de esta constancia |
| 9 | La subsección de §2.2 del padre va sin número, y ninguna cita usa `§2.2.1` | `Rules-Base-Conocimiento.md` §6.1: una sola subsección no lleva número |

Sigue: T10, la auditoría mecánica sobre el commit y las dos reproducciones a ciegas · Presidente de mesa · Cierra con: el folio de cada reproducción y el commit de la redacción
