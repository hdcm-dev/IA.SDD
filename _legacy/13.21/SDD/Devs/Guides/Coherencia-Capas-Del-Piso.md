# Nota de coherencia — Las dos capas del piso mínimo

**Framework:** SDD
**Documento:** Coherencia-Capas-Del-Piso.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-23
**Autor:** AG-00990 (Arquitecto de Soluciones)

---

## 1. Alcance

Última pieza del Bloque II del plan de base de conocimiento. `Rules-Base-Conocimiento.md` §0.4 declara
desde la 12.2 que un documento puede **sustituir** una decisión de stack del framework, y hasta ahora
**no había nada del otro lado contra qué validar esa declaración**: ninguna regla rotulaba sus ítems.

`Maqueta-Rules.md` §4 es la primera en hacerlo, y es la que bloqueaba el caso concreto que originó todo
esto: el framework construye toda maqueta con una tecnología fija —vanilla, Bootstrap por CDN, sin
build— y una casa que trabaja distinto no tenía dónde declararlo.

## 2. Inventario de archivos

### 2.1 Creados

| Archivo | Qué es |
| --- | --- |
| `SDD/Devs/Guides/Coherencia-Capas-Del-Piso.md` 1.0 | Esta nota |

### 2.2 Editados

| Archivo | Versión | Cambio |
| --- | --- | --- |
| `SDD/Devs/Rules/Maqueta-Rules.md` | 4.4 → 4.5 | §4 declara sus dos capas; §4.1 renombrada y rotulada; §4.7 nueva; §7.2 distingue caso puntual de caso de escala; §1 suma la base a los insumos de AG-00031 |
| `SDD/Devs/Rules/Rules-Base-Conocimiento.md` | 2.0 → 2.1 | §0.3 ajusta el rango citado y nombra que el rótulo ya existe |

### 2.3 Publicación

| Artefacto | Estado |
| --- | --- |
| `_legacy/13.3/` | Construido desde git antes de editar. Verificado: lleva `Maqueta-Rules.md` en 4.4 con seis subsecciones en §4 |
| `CHANGELOG.md` | Entrada 13.4 |

## 3. Verificación de equivalencia, que es la obligación central de esta intervención

**Ninguna regla podía cambiar de contenido.** Una maqueta generada sin base de conocimiento declarada
tiene que quedar sujeta exactamente a las mismas exigencias que antes.

**Método**: se extrajo el conjunto de ítems normativos de §4 antes y después, normalizado, y se
contrastó en las dos direcciones.

| Comprobación | Resultado |
| --- | --- |
| Ítems presentes en la 4.4 y ausentes en la 4.5 | **Ninguno** |
| Ítems presentes en la 4.5 y ausentes en la 4.4 | **Ninguno** |

**Dos ítems cambiaron de subsección**, y son los que el plan había anticipado como el trabajo real:

| Ítem | Estaba en | Pasa a | Motivo |
| --- | --- | --- | --- |
| «Nada de llamadas de red a servicios reales. La maqueta es autónoma y funciona sin backend» | §4.1 Tecnología | **§4.2 Datos de ejemplo** | Define qué **es** una maqueta, no con qué se la construye |
| «Íconos SVG inline con `currentColor`. Prohibido el raster…» | §4.1 Tecnología | **§4.7 Iconografía**, nueva | Es una regla de calidad visual, no una elección de stack |

**Hallazgo de la propia verificación.** La primera redacción de §4.7 puso la regla de iconografía como
prosa en lugar de ítem de lista, y **la comprobación de equivalencia la marcó como perdida**. El
contenido estaba, la forma no: se restituyó como ítem. Es la clase de defecto que una lectura no levanta
y un contraste mecánico sí, y vale registrarlo porque el rótulo `[enumerable]` del método depende de que
las reglas sigan siendo enumerables.

## 4. Qué queda sustituible y qué no

| Subsección | Capa | Sustituible |
| --- | --- | --- |
| §4.1 Tecnología de construcción | Decisión de stack | **Sí**, declarándolo en `sustituye` |
| §4.2 Datos de ejemplo | Método | No |
| §4.3 Estados y barra de validación | Método | No |
| §4.4 Cobertura mínima por tipo | Método | No |
| §4.5 Accesibilidad | Método | No |
| §4.6 Sello de versión | Método | No |
| §4.7 Iconografía | Método | No |

**Y se declaró explícitamente qué no alcanza la sustitución aunque cambie el stack**: los tokens del
catálogo de diseño siguen rigiendo, y todo §4.2 a §4.7 se cumple con la tecnología que sea. **Sustituir
cambia el cómo, no el qué tiene que ser verdad.** Sin esa cláusula, «sustituyo §4.1» se podía leer como
permiso para bajar la vara.

## 5. La distinción de §7.2, que es la que cierra el caso original

`Maqueta-Rules.md` §7.2 ya admitía apartarse del no-build **por ADR de proyecto de código**. Esa vía es
correcta para lo que imagina —una librería de componentes que sólo se demuestra compilada, una vez— y
**equivocada para una casa que construye siempre así**, porque produce el mismo ADR en cada proyecto,
con la misma justificación, para siempre. Eso no es una excepción: es una convención disfrazada de
excepción, y es el anti-patrón que `Root-Rules.md` §11 nombra.

La regla ahora distingue las dos escalas: **el caso puntual va por ADR; el caso de organización se
declara una sola vez como sustitución**.

## 6. Verificación de invariantes

| Invariante | Verificación | Resultado |
| --- | --- | --- |
| **D1** | Español rioplatense, sin emojis ni marketing | Cumple |
| **D2** | UTF-8 sin BOM, LF. Conteo de `\r` = 0 en los tres archivos | Cumple |
| **D3** | `Coherencia-Capas-Del-Piso.md`, Título-Con-Guiones ASCII | Cumple |
| **D4/D5** | Los dos editados suben versión con su fila. Conjunto superado archivado completo | Cumple |
| **D6** | Esta nota inventaría lo tocado; el `CHANGELOG.md` registra la publicación | Cumple |
| **D7** | Nada de lo agregado nombra un dominio, cliente o producto concreto | Cumple |
| **D8** | La tabla de cobertura de §4.4 no se toca | Cumple |
| **D9** | La equivalencia se declara con el método con que se la midió, no por afirmación | Cumple |

## 7. Observaciones

1. **`Maqueta-Rules.md` es la única regla rotulada.** Las de 02, 05, 08 y 09 cargan la misma mezcla de
   método y decisión de stack, y siguen sin separar. **No bloquea nada**: un documento que intente
   sustituir un ítem de ellas no encuentra rótulo, de modo que el caso vuelve a ser conflicto y manda la
   regla, que es el comportamiento seguro por defecto. Se hace cuando una base real lo necesite, con el
   caso concreto en la mano en vez de a priori.

2. **`AG-00031` ya recibe conocimiento, y era el hueco que quedaba.** Su lista de insumos de §1 era
   cerrada y no incluía la base: el conocimiento sobre cómo construir una página web **no llegaba al
   agente que la construye**. Con esto el Bloque II queda completo salvo el aviso del bibliotecario.

3. **`AG-00980` sigue sin convocarse.** Tiene identificador y contrato; falta la línea en el despacho que
   le dice al subagente que la biblioteca existe y cómo pedir. Está declarado en las dos guías.

## 8. Veredicto

**Coherente.** La sustitución deja de ser una previsión y pasa a tener contra qué validarse. Ninguna
regla cambió de contenido, dos cambiaron de subsección con motivo declarado, y ninguna maqueta que
cumplía deja de cumplir. El conjunto sube **minor**.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-23 | Emisión inicial. Cubre la separación de `Maqueta-Rules.md` §4 en dos capas, la verificación de equivalencia y su hallazgo, la distinción de escalas de §7.2 y el alta de la base en los insumos de AG-00031. |
