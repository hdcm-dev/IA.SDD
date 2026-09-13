# Actuación 015 — Verificación del documento contra el dictamen

| Campo | Valor |
|---|---|
| Tipo | `resolucion` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa, con dos corridas de evidencia despachadas (`ev-08`, `ev-10`) |
| Corrige | — |

Objeto: `IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/02-Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS/OUTPUTs/Knowledge-Bundle-JS.md`, versión 1.0. Su huella final es la primera línea de `evidencia/ev-11-formato-del-documento.out`.

---

## 1. Formato (`Rules-Base-Conocimiento.md` §6.1) — `ev-11`

| Criterio | Resultado |
|---|---|
| Once campos de cabecera, ninguno vacío | Cumple: 11 |
| Nombre `Knowledge-<Tema>.md`, sin prefijo numérico | Cumple |
| Secciones §0 a §10 | Cumple |
| Numeración interna contigua | Cumple: sin saltos |
| Techo | Cumple por la excepción: total 737, §5 369, resto 368 ≤ 600; excepción declarada en §0 |
| Fila de índice coincide con la cabecera | Cumple: la fila propuesta en §9 coincide campo por campo; no se cataloga (fuera de alcance, 002 §2) |
| Verificación de ofuscación declarada | Cumple: declarada en §0; barrido de nombres del producto, componentes, códigos de error, métodos, dominio y del segundo precedente, sin coincidencias |
| No define criterios de aceptación de artefactos del framework | Cumple: cero `VER-`, `criterio_aceptacion`, `verificacion:`; §6 formula criterios sobre la costura y remite la forma del sample a §8 (H-N2-03, 013 R-08) |
| Restricción R2: ninguna ruta de solución prescripta | Cumple: `/src`, `/samples`, `/demos`, `/tests` sólo en §0.1 como afuera e ilustrativas |
| No fija foco ni teclado (condición de D-6) | Cumple: única ocurrencia es el ítem interpretativo que lo declara |

## 2. Contenido contra el dictamen (014 §3)

| Sección | Qué fijó el dictamen | Resultado |
|---|---|---|
| Cabecera | Consumidor 05, 08, 09, 10; condición que dispara con F1 y F2, sin render mode | Cumple |
| §0 | Oración método/artefacto; frontera R2; equivalencias; afuera con destino (F3, API de terceros, NuGet, maqueta, spike) | Cumple |
| §1 | Vocabulario E-1; Interactive Server verificado, WebAssembly y Auto no; versión del SDK | Cumple |
| §2 | F2 primero, F1 variante con delta; layouts; anfitriones como piezas | Cumple |
| §3 | Contrato; procedimiento de cambio; costura verificada en ejecución; ciclo de vida; obligaciones del anfitrión; cadena como propiedad y síntoma; fixture producido por la PoC Blazor y consumido por batería y PoC HTML | Cumple |
| §4 | Bifurcaciones con alternativa nombrada, incluida la decisión contraria del producto de origen (E-2) | Cumple |
| §5 | Esqueletos ofuscados; página de PoC Blazor reducida a la captura | Cumple tras correcciones (§3 de este folio) |
| §6 | Criterios sobre la costura; viaje de ida y vuelta obligatorio; matriz y tabla de síntomas | Cumple tras correcciones |
| §7 | Copia a mano (anti-patrón) y salida del generador (válida) en filas separadas | Cumple |
| §8 | Frontera; clase de contrato como hueco; `web-monolith` sin obligación en la 05; accesibilidad del destino | Cumple |
| §9 | Hermano, precedentes ofuscados, fila propuesta, adopción en tres pasos | Cumple |

## 3. Ejecución de los esqueletos — `ev-08`, `ev-09`, `ev-10`

| Qué | Evidencia | Resultado |
|---|---|---|
| Defecto de registro de estáticos en el primer build y corrección con `Content` dentro de un target | `ev-08`, sobre copia del precedente F1, SDK 10.0.400 | Reproducido y corregido; el segundo build no duplica el ítem |
| Dos artefactos desde la misma construcción, `main.js` sin duplicar el bundle, acuse íntegro por un doble | `ev-09` | Verificado |
| Solución F2 armada con los esqueletos literales del §5, construida desde limpio | `ev-10` | Construye **tras la corrección D1**; `main.js` registrado en el primer build; `-p:SinCadenaJs=true` construye con artefactos y falla con el mensaje del target sin ellos |
| Criterios de §6.1 corridos: 1, 2, 3, 4, 7, 8, 9, 10, 11 | `ev-10` | 6 pasan tal como estaban escritos; los 9 pasan tras D1, D3 y D4; los criterios 7 y 10 se probaron además **fallando** a propósito |
| `_content/…/main.js` y `mapa.js` servidos por la PoC Blazor | `ev-10`, curl | 200 y 200 |
| Viaje de ida y vuelta en navegador (§6.2) | `ev-10`, Chromium | Celda presente: acuse íntegro y batería verde con la captura real como fixture. **Celda ausente: no alcanzable por la interfaz**, cubierta por la batería (corrección 6.2) |
| PoC HTML servida | `ev-10`, curl y Chromium | 200 en los tres recursos **sirviendo desde la carpeta padre** (corrección D2); el doble registró el acuse |

### 3.1 Defectos encontrados y corregidos en el documento

| Id | Dónde | Defecto | Corrección aplicada |
|---|---|---|---|
| D1 | §5.2 `Contrato.cs` con §5.7 `.csproj` | `IReadOnlyList<>` sin `using` y sin `ImplicitUsings`: `error CS0246` | `<ImplicitUsings>enable</ImplicitUsings>` en §5.7 |
| D2 | §5.8 comentario de `index.html` | Servida desde su propia carpeta, `../contoso-reservas-mapa/dist/main.js` da 404 | Servir desde la carpeta que contiene la PoC y el bundle |
| D3 | §6.1 criterio 1 | La comprobación incluía el `"import"` de `Js.InvokeAsync` | Limitada a las llamadas sobre la referencia al módulo |
| D4 | §6.1 criterio 7 | El `\|` escapado para la tabla daba un grep que devuelve 0 siempre | Un `-e` por término |
| D5 | §5.7 | Avisos CS8632 y CS8669 | `<Nullable>enable</Nullable>` |
| D6 | §2.3 contra §5 | `tsconfig.pruebas.json` listado sin esqueleto | Esqueleto agregado en §5.1 |
| D7 | §6.2 | Pedía activar una celda ausente por la interfaz, inalcanzable | La celda ausente la cubre la batería |
| D8 | §2.2 | Nombre de propiedad del segundo precedente filtrado por ofuscación | Reemplazado por el del esqueleto (`BundleDir`) |

**Una prueba que no se probó fallando no es una prueba**: los criterios 7 y 10 se forzaron a fallar y fallaron (`ev-10`). El criterio 4 del §6.1 y el 12 (retención) no se corrieron como comando aparte; el 12 quedó cubierto por la aserción de escuchas de la batería del §5.6.

## 4. Veredicto de la verificación

**El documento cumple el dictamen.** Queda en `OUTPUTs/`, fuera del framework, como pidió el Product Owner. Los ocho defectos se corrigieron y la corrección se volvió a medir: `ev-11` sobre el formato; la construcción, sobre la copia de `ev-10` con los mismos cambios.

**[presidente]** Límite declarado de esta verificación: la construcción de `ev-10` aplicó D1 en la copia y no volvió a correr entera sobre el texto ya corregido del documento. Las correcciones D2 a D7 son de comentario, de comprobación o de alcance, y no cambian código compilable salvo D5 y D6, que ya estaban en la copia.

## 5. Estado del caso

| | |
|---|---|
| Deuda declarada | D-1 a D-6 (014 §4) |
| Escalada pendiente | `ESC-001`: publicación del expediente con referencias a un producto privado. Default aplicado: el expediente no se confirma ni se publica |
| Observaciones al Product Owner | 014 §6: framework, documento de entrada y producto de origen, entregadas fuera del expediente |

Sigue: respuesta del Product Owner a `ESC-001` · Product Owner
