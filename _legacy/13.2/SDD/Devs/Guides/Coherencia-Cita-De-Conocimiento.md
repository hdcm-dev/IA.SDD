# Nota de coherencia — La cita de conocimiento entra al intake y al despacho

**Framework:** SDD
**Documento:** Coherencia-Cita-De-Conocimiento.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-23
**Autor:** AG-00990 (Arquitecto de Soluciones)

---

## 1. Alcance

Cierra el circuito de la capa de conocimiento: hasta la 13.1 el catálogo se podía **poblar** pero el
orquestador **no lo consumía en una corrida**. Esta intervención conecta las dos puntas.

**Se hacen los dos pasos juntos y es deliberado.** Agregar la subsección de intake sin la mecánica de
despacho dejaría un campo que el usuario llena y que no hace nada, que es peor que no tenerlo: la
plantilla prometería una capacidad inexistente y la guía de usuario tendría que explicar la trampa.

## 2. Inventario de archivos

### 2.1 Creados

| Archivo | Qué es |
| --- | --- |
| `SDD/Devs/Guides/Coherencia-Cita-De-Conocimiento.md` 1.0 | Esta nota |

### 2.2 Editados

| Archivo | Versión | Cambio |
| --- | --- | --- |
| `SDD/Devs/Intake/PRODUCT-INTAKE-template.md` | 3.4 → 3.5 | `§17.P.13` nueva, al final del bloque repetible. Checklist de §19 y tabla de mapeo |
| `SDD/Devs/Rules/Intake-Rules.md` | 4.1 → 4.2 | §5 valida que todo alias resuelva; §7 lo declara bloqueante |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.11 → 8.12 | §6 dos notas operativas nuevas; §8 una línea en el esqueleto |
| `SDD/Devs/Rules/Root-Rules.md` | 8.3 → 8.4 | §9.2 alta de `AG-00980` en el bloque `009xx` |

### 2.3 Publicación

| Artefacto | Estado |
| --- | --- |
| `_legacy/13.1/` | Construido **desde git**, antes de editar, según `SDD-Development-Guide.md` §VI.5. Verificado: lleva la plantilla en 3.4, el master-prompt en 8.11 y **cero apariciones** de `AG-00980` |
| `CHANGELOG.md` | Entrada 13.2 |

## 3. La propiedad que gobierna la intervención

**Todo lo agregado es aditivo y está condicionado.** Se verifica en los cuatro archivos:

| Archivo | Con `Conocimiento/` vacía o sin índice |
| --- | --- |
| Plantilla de intake | `§17.P.13` admite `Ninguno`, que es su valor por defecto |
| `Intake-Rules.md` | No hay alias que resolver; la validación no dispara |
| `Master-Prompt.md` | La nota declara su propia condición; `{{LISTA_DOCUMENTOS_DE_CONOCIMIENTO}}` viaja vacía |
| `Root-Rules.md` | `AG-00980` existe como identificador y no se convoca nunca |

**Ninguna nota operativa existente se tocó**, y en particular las cinco del catálogo de diseño de
`References/Design/` quedaron intactas. Los dos catálogos **no se funden**: uno está siempre y es
normativo, el otro puede no existir y es consultivo. Fundirlos era una propuesta de versiones
anteriores del plan y se retiró con motivo escrito.

## 4. Decisiones de diseño que conviene tener registradas

1. **La validación corre en la fase previa a la Fase A, no en runtime.** Es el criterio de costo con que
   corren todas las de `Intake-Rules.md` §8: un alias inexistente detectado ahí cuesta una corrección
   del intake; detectado en la Fase B, cuesta la Fase A entera.

2. **Citar un conocimiento cuya condición no dispara no es un apartamiento y no lleva ADR.** La
   condición del índice es un disparador por defecto, no una obligación, así que citar de más amplía el
   conjunto sin incumplir nada. `Root-Rules.md` §11 no aplica, y su propia cláusula lo respalda: «un
   apartamiento usado para evadir una condición que ya existe es un anti-patrón». El campo `Motivo` de
   la subsección alcanza como registro de intención, y el log del orquestador deja la traza.

3. **El consumidor lo declara el índice, no el intake.** Es lo que evita que un alias citado termine
   inyectado en los doce despachos. El campo admite lista y admite **subagentes de fase**, sin lo cual
   el conocimiento sobre cómo construir una página web no llegaría a `AG-00031`, que es quien la
   construye.

4. **`AG-00980` se acuña sin familia nueva.** `AG` ya existe, su ámbito es el conjunto normativo vigente
   y el bloque `009xx` estaba reservado desde la 12.0 a los roles que no son de categoría. El
   identificador se verificó libre antes de acuñarlo. Su contrato vive en `Rules-Base-Conocimiento.md`
   §9 y `Root-Rules.md` lo **cita**, no lo duplica.

## 5. Verificación de invariantes

| Invariante | Verificación | Resultado |
| --- | --- | --- |
| **D1** | Español rioplatense, sin emojis ni lenguaje de marketing | Cumple |
| **D2** | UTF-8 sin BOM, LF, fechas `YYYY-MM-DD`. Conteo de `\r` = 0 en los cinco archivos | Cumple |
| **D3** | `AG-00980` cumple `AG-[0-9]{5}`. `Coherencia-Cita-De-Conocimiento.md` en Título-Con-Guiones ASCII | Cumple |
| **D4/D5** | Los cuatro editados suben versión con su fila de control de cambios. Conjunto superado archivado completo | Cumple |
| **D6** | Esta nota inventaría lo tocado; el `CHANGELOG.md` registra la publicación | Cumple |
| **D7** | Nada de lo agregado nombra un dominio, cliente o producto concreto | Cumple |
| **D8** | No se agrega ni se altera ningún tipo de proyecto de código. `§17.P.13` no depende de D8 | Cumple |
| **D9** | El identificador libre se verificó por búsqueda; la ausencia previa queda registrada en el snapshot | Cumple |

## 6. Verificación de severidad

**La plantilla de intake es la que decide la severidad del conjunto**, por `README.md`: si sube major,
el conjunto sube major. **Sube minor**, y la evidencia es que `§17.P.13` se agregó **al final del bloque
repetible sin renumerar** ninguna subsección existente, de modo que **ningún intake escrito contra la
3.4 deja de cumplir**: la subsección nueva es opcional y admite `Ninguno`.

## 7. Observaciones

1. **La guía de usuario declara una limitación que esta intervención levanta.** `SDD-User-Guide.md`
   F-23.1 dice, en la 1.18, que el catálogo se puede poblar pero que citarlo desde el intake «todavía
   no está cableado». **Desde la 13.2 sí lo está**, y esa frase queda mintiendo. Se corrige en la
   próxima intervención sobre guías, junto con el resto del cierre normativo; se registra acá para que
   no se pierda.

2. **`PRODUCT-MANIFEST-template.md` no se tocó, y es una decisión.** La cita vive en el intake y el
   orquestador la lee de ahí al armar el despacho. Llevarla también al manifiesto crearía una segunda
   fuente del mismo dato, que es lo que `Master-Prompt.md` §6 punto 1 prohíbe por nombre. Si en algún
   momento el manifiesto necesita el dato derivado, se resuelve por derivación declarada en
   `Intake-Rules.md` §4 y no por copia.

3. **El ciclo de pedido a `AG-00980` queda especificado pero sin uso.** Su contrato está entero en
   `Rules-Base-Conocimiento.md` §9, y el rol ya tiene identificador. Lo que todavía no existe es el
   aviso en el despacho que le dice al subagente que la biblioteca existe y cómo pedir. Es trabajo
   menor y se registra como pendiente: **hoy el conocimiento llega por condición y por cita, que es el
   camino determinista y el que cubre el caso común**.

## 8. Veredicto

**Coherente.** El circuito queda cerrado: se cita en el intake, se valida antes de la Fase A, se resuelve
contra el índice y se inyecta en el despacho del consumidor declarado. Ningún documento generado con la
13.1 deja de cumplir y ningún destino tiene trabajo. El conjunto sube **minor**.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-23 | Emisión inicial. Cubre la incorporación de `§17.P.13`, su validación bloqueante, las dos notas operativas del master-prompt, la línea del esqueleto de despacho y el alta de `AG-00980`. |
