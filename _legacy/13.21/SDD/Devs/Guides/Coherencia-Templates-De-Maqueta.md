# Nota de coherencia — La forma constructiva de la maqueta y su realización en Blazor, catalogadas

**Framework:** SDD
**Documento:** Coherencia-Templates-De-Maqueta.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-09-01
**Versión del conjunto resultante:** SDD 13.10
**Origen:** pedido del Product Owner — que la forma constructiva con la que el framework viene produciendo maquetas, y la forma en que esa maqueta se lleva a un proyecto Blazor sin librería de componentes, queden catalogadas como conocimiento citable por alias, en lugar de reconstruirse de memoria en cada corrida

---

## 1. Alcance

Alta de **dos** documentos en `Conocimiento/`, con sus dos filas en `Index-Knowledge.md`:
`Knowledge-Template-HTML-SDD-Default.md` y
`Knowledge-Template-Blazor-Interactive-Server-SDD-Default.md`, el segundo **heredando** del primero.
**No se toca ninguna regla, ni ningún orquestador, ni ninguna plantilla.** Es el eje de extensión de
`SDD-Development-Guide.md` §III.11, el mismo que usó la 13.9.

## 2. Por qué son dos documentos y no uno

Por la propiedad **un documento, un artefacto** de `Rules-Base-Conocimiento.md` §4.4. Lo caracterizado
no es el mismo artefacto: uno es una maqueta estática sin proceso de build, que el humano valida; el
otro es un proyecto .NET que la realiza. Tienen consumidores distintos —`03` y `AG-00031` el primero,
`03` y `05` el segundo—, condiciones de carga disjuntas y ciclos de vida propios.

**La herencia es lo que evita la duplicación.** El documento de Blazor declara `Hereda-de:
Template-HTML-SDD-Default` y **escribe sólo el delta**: no repite tokens, ni anatomías de patrón, ni
vocabulario de estados, ni anti-patrones de diseño, ni criterios de accesibilidad. Es el primer par del
catálogo que ejercita el campo `Hereda-de` de §7.1, que hasta acá estaba en `—` en las dos filas
existentes.

## 3. La decisión que ordena el resto: es catálogo, no norma

Los dos documentos cierran con su §8 declarando la frontera archivo por archivo: qué de lo que dicen es
normativo y dónde vive. Nada de `Maqueta-Rules.md`, de `Design-Rules-Web-Generico.md`, de
`Design-Rules-Acceso-Monousuario.md`, de `Design-Rules-Primer-Arranque.md`, de
`Design-Rules-Identidad-De-Version.md` ni de `Deriva-Rules.md` se copia: se cita. Escribirlo de otro
modo habría sido el anti-patrón **conocimiento disfrazado de regla** de `Rules-Base-Conocimiento.md`
§4.5.

**Y los dos declaran, además, los huecos del piso que llenan sin normar** —el documento HTML: el patrón
agnóstico de diálogo modal y las reglas de paginación y ordenamiento; el de Blazor: la separación
`.razor` / `.razor.cs`, el ciclo de vida, el prerrenderizado con persistencia de estado, la estructura
de carpetas del proyecto de interfaz más allá de los tres archivos que el framework fija, y los render
modes distintos del interactivo de servidor—. En los dos casos con la misma cláusula: **si el framework
lo incorpora, manda el framework**.

## 4. La desviación declarada, que es la pieza a mirar

`Knowledge-Template-Blazor-Interactive-Server-SDD-Default.md` §8.1 **invierte una cláusula de
`Design-Rules-Blazor-Mudblazor.md`**: ese archivo cierra pidiendo que los patrones se realicen con los
componentes de la librería mapeada y **no con HTML propio cuando existe componente equivalente**, y el
documento los realiza con componentes Razor propios.

**No es una sustitución, y el campo `Sustituye` queda en `—` a propósito.**
`Rules-Base-Conocimiento.md` §0.4 sólo habilita sustituir un ítem que el framework haya **rotulado como
decisión de stack**, y `Design-Rules-Blazor-Mudblazor.md` no lleva ese rótulo en ninguna de sus reglas.
El caso es **conflicto**, y ante conflicto manda la regla de la categoría salvo que el documento declare
la desviación con su justificación. Es lo que hace §8.1, y es el mismo límite que la 13.9 dejó anotado
para `Master-Prompt.md` §12.1: **el catálogo vuelve a chocar contra la ausencia del rótulo, ahora desde
otra categoría**. Que el rótulo exista o no sigue siendo decisión del responsable del framework y una
intervención sobre reglas, fuera del alcance de un alta de conocimiento.

**Lo que la desviación cuesta está declarado y no queda implícito:** se pierde la accesibilidad que la
librería resolvía —recorrido por teclado y ARIA de grilla, asistente, diálogo y menú—, y perder el
recorrido por teclado, el foco visible o el contraste **es deriva mayor y bloquea** en el sensado. Por
eso los criterios de aceptación de §6 exigen la verificación explícita de teclado en esos tres
componentes, y por eso `<dialog>` nativo no es negociable.

## 5. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Conocimiento/Knowledge-Template-HTML-SDD-Default.md` | **1.0** | Alta. 877 líneas, sobre el techo de 600 de un documento `propio`, por la excepción de §6.2 declarada en su §0 |
| `Conocimiento/Knowledge-Template-Blazor-Interactive-Server-SDD-Default.md` | **1.0** | Alta. 937 líneas, misma excepción, declarada en su §0 |
| `Conocimiento/Index-Knowledge.md` | 1.1 → **1.2** | Dos filas nuevas en §3, con las diez columnas de §7.1. Fecha al día |
| `CHANGELOG.md` | — | Entrada `[13.10]` |
| `_legacy/13.9/` | — | Snapshot del conjunto superado, **tomado desde el estado sin editar del control de versiones** |

## 6. El techo de §6.2, superado por los dos y por mucho

`Rules-Base-Conocimiento.md` §6.2 fija **600 líneas** para un documento `propio` y admite **una sola
excepción**: un §5 de esqueletos que no se puede partir sin volverlo inútil, declarada en §0 con su
motivo. Los dos documentos se acogen a ella y la declaran.

**Se registra porque es la primera medición real del número.** La propia §6.2 dice que los dos techos
«son calibrables» y que «se revisan con los primeros documentos reales en la mano»: éstos son los
primeros documentos `propio` del catálogo, y los dos superan el techo en más del cuarenta por ciento,
con el §5 explicando casi la mitad de cada uno —440 de 877 y 548 de 937—. **No se toca §6.2 en esta
intervención**, que es un alta de conocimiento y no puede modificar la regla que la gobierna. Queda como
evidencia para quien decida la calibración, que es donde §9.4 dice que se mira.

## 7. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** Idioma y registro | Conforme | Español rioplatense técnico, sin emojis ni marketing |
| **D2** Encoding | Conforme | UTF-8 sin BOM, LF, fechas `YYYY-MM-DD` |
| **D3** Nombres | Conforme | Título-Con-Guiones ASCII, sin prefijo numérico. No se acuña ningún identificador nuevo; se citan `AG-00031`, `SUP-`, `CMP-`, `EST-` y `NAV-`, todos ya existentes |
| **D4**, **D5** | Conforme | Un solo archivo por nombre lógico; el índice sube minor y registra su fila, y los dos documentos abren su control de cambios en 1.0 |
| **D6** Trazabilidad | Conforme | El §9 de cada documento declara índice, hermano, consumidor y fuentes del relevamiento; los enlaces por alias `[[…]]` resuelven contra el índice |
| **D7** Neutralidad de dominio | Conforme | Ver §8 |
| **D8** | Alcanzado por condición de carga, no por tipo | El documento HTML gatilla por `requiere_maqueta == true`; el de Blazor por `web-monolith` sobre .NET con interfaz Blazor Interactive Server sin librería. Ninguno de los dos declara comportamiento por tipo D8, que es de las reglas |
| **D9** Evidencia verificable | Conforme | Los criterios de §6 de cada documento se verifican leyendo el árbol producido, y están marcados `[enumerable]` / `[interpretativo]` uno por uno |

## 8. Verificación de ofuscación, previa y bloqueante

Los dos documentos se relevaron de **una maqueta y un proyecto reales de un proyecto de código
concreto**, distinto del repositorio donde se depositan. La verificación es por lo tanto sustantiva y no
formal, y cada documento la declara en su §0.

| Qué se buscó | Resultado |
| --- | --- |
| Nombres de cliente, de solución, de institución o de personas | Ninguno. Las entidades quedaron neutras: `Entidad`, `Registro`, `Elemento`, `Usuario`, con identificadores `REG-0001` y roles `rol-a` / `rol-b` |
| Nombres de archivo de las superficies de origen | Ninguno. Las superficies se nombran por su rol —listado, detalle, alta, ingreso, aprovisionamiento— |
| Espacios de nombres, cadenas de conexión y rutas de servicios internos | Ninguno. El espacio de nombres es `Producto.Web`, genérico |
| Términos del dominio de negocio de origen | Ninguno |

**Falsos positivos léxicos declarados, dos, uno por documento:** **«elemento»**, que aparece como nombre
de entidad neutra y no como término del dominio de origen; y **«Producto»**, que aparece como raíz de
espacio de nombres neutra y como término del framework —la unidad de trabajo es el producto—, y en
ningún caso designa un producto comercial concreto.

## 9. Lo que este alta no habilita, y conviene no dar por hecho

**Un stack de maqueta distinto todavía no sustituye a éste por vía de conocimiento.** El documento HTML
no sustituye nada: el stack que describe es el que `Maqueta-Rules.md` §4.1 ya elige, y lo que aporta es
la caracterización de esa elección. Una organización que construya siempre con proceso de build tiene
que declarar la sustitución del ítem `tecnología de construcción` en su propio documento, y esa
habilitación depende del rótulo de decisión de stack, que hoy tampoco está puesto ahí.

**Y el hueco que el catálogo de diseño tiene reservado sigue reservado.** El índice del catálogo declara
un documento pendiente para frontend sin framework de componentes; mientras no exista, el conocimiento
de Blazor ocupa ese lugar **sin tocar ninguna regla**, y el día que el documento se escriba, manda él.

## 10. Se recoge lo anotado por la 13.9

**`Index-Knowledge.md` declaraba `Compatible con: Rules-Base-Conocimiento.md 2.0` y la regla va por
2.2.** La 13.9 lo dejó anotado y no lo corrigió, con su motivo: el contrato del índice —§7.1 y sus diez
columnas— no cambió en 2.1 ni en 2.2. **Sigue sin cambiar, y por lo tanto sigue sin corregirse.** La
declaración continúa siendo cierta y se vuelve a registrar acá para que la próxima intervención sobre la
regla que sí toque §7 sepa que hay una versión que arrastrar.

## 11. Veredicto

**APROBADO.** El alta agrega dos documentos y sus dos filas, no toca ninguna regla, ningún orquestador
ni ninguna plantilla, y **el framework sigue corriendo exactamente igual con `Conocimiento/` vacía**,
que es la propiedad que `Rules-Base-Conocimiento.md` §0.2 pide preservar en cada cambio posterior.

## 12. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-09-01 | Emisión inicial, con el alta de `Template-HTML-SDD-Default` y de `Template-Blazor-Interactive-Server-SDD-Default`. |
