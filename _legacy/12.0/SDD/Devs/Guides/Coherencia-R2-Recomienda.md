# Nota de coherencia — R2 recomienda, y el umbral de continuidad

**Framework:** SDD
**Documento:** Coherencia-R2-Recomienda.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-17
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 9.5
**Origen:** el Product Owner, sobre dos destinos reales con procedencias muy distintas — «es muy importante evaluar qué conviene hacer en función de lo que hay y su impacto»

---

## 1. Alcance

R2 del orquestador de reanudación pasa de **enumerar** salidas a **recomendar una**, con su fundamento
y su alternativa. Y se declara el **umbral de continuidad**, que es el criterio que más cambia la
recomendación y el que el método venía resolviendo por intuición.

## 2. Por qué la neutralidad estaba mal puesta

El prompt declaraba «el humano elige; este prompt no», y lo aplicaba a **dos cosas distintas**:
no decidir, que es correcto, y **no opinar**, que no lo es.

**R0 mide seis dimensiones, el diff normativo artefacto por artefacto y el estado del repositorio.
Presentar todo eso y callarse la conclusión le devuelve al humano el trabajo que el orquestador acaba
de hacer.** La neutralidad correcta es no decidir; recomendar con el fundamento a la vista es lo que
hace que la decisión sea informada en lugar de meramente libre.

**La alternativa razonable es obligatoria**, y no por cortesía: una recomendación sin segunda opción
se lee como un único camino y el humano deja de mirar. Nombrarla obliga a que la primera se sostenga
contra algo.

## 3. El umbral de continuidad, que ya existía y no estaba escrito

**La salida C —seguir en la versión declarada— parecía siempre disponible, y no lo es.** El criterio
que la hace viable o no **ya vivía en el framework** desde la 4.0: el bloque «Impacto sobre destinos
existentes» que `SDD-Development-Guide.md` §VI.4 exige en toda entrada major. **Un major cuyo bloque
no está vacío es, por definición, uno que alcanza artefactos del destino.**

| Major con impacto que atraviesa el salto | Qué le pasa a C |
| --- | --- |
| Ninguno | El desfase es de proceso: C es correcta y barata |
| Uno | Deuda acotada y conocida: C es viable |
| **Dos o más** | **Ninguna regla vigente puede auditar ni extender ese corpus** |

**Por qué dos es cualitativamente distinto de uno.** Un major con impacto deja un destino que las
reglas vigentes leen mal **en un punto**. Dos dejan un destino cuyas **estructuras** —dónde vive cada
categoría, cómo se numeran los identificadores, de qué nivel cuelga cada artefacto— ya no son las que
describe ninguna regla actual. Seguir construyendo ahí **produce documentación nueva con la forma
vieja**, y cada documento agregado **agranda la migración futura en lugar de acercarla**.

**El caso que lo motivó, en palabras del Product Owner:** las procedencias tempranas «no están bien
ajustadas de historial para continuar». Es exacto y ahora está escrito con su mecánica: sus
identificadores no son direcciones válidas —el ámbito de unicidad en el producto no existía— y su
layout no existe. Sobre esas procedencias **C no se recomienda nunca**, y se dice por qué en lugar de
ofrecerla como si fuera equivalente.

**Los dos destinos que dieron el contraste:**

| Destino | Procedencia | Major con impacto en el salto | Recomendación |
| --- | --- | --- | --- |
| Uno, recién migrado | 8.11 | Uno | **B**, por trabajo documental real; C era defendible |
| Otro, generado por primera vez | 6.0 | **Tres** | **B**, y C no se ofrece |

## 4. El encadenamiento después de reparar

La salida A vuelve a R0 y **la pregunta reaparece**. Estaba declarado en la mecánica y no en lo que el
humano ve, con lo cual quien eligió A dos pasos atrás **llegaba a la segunda vuelta sin saber que era
la segunda vuelta**. Ahora la recomendación **se recalcula** —reparar cambió las dimensiones— y R2
nombra la pregunta pendiente: migrar o seguir.

## 5. Barrido declarado (§VI.3.2)

| Concepto | Forma anterior | Forma vigente |
| --- | --- | --- |
| Postura de R2 | `El humano elige; este prompt no.` | `El humano elige; este prompt no decide, pero sí recomienda.` |

**Residuo:** cero ocurrencias vivas de la forma anterior. **Regla 4 sobre el texto propio:** el patrón
se corrió sobre §4, sobre el prompt de entrada y sobre esta nota; las apariciones son las de esta
tabla, que lo declara.

## 6. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.4 → **1.5** | **§4.0** la recomendación y su formato; **§4.0.1** el umbral de continuidad; **§4.0.2** el encadenamiento; R3 suma la recomendación al informe |
| `PROMPTS/PROMPT-Agente-Reanudacion-SDD.md` | 1.2 → **1.3** | Anticipa la recomendación y el umbral |
| `CHANGELOG.md` | — | Entrada `[9.5]` |

## 7. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres |
| **D4**, **D5** | Conforme | Los dos archivos subieron versión y registraron su fila; comprobación 10 en cero |
| **D6** Trazabilidad | **Conforme, y es el punto** | El umbral no inventa un criterio: **lee el bloque de impacto** que §VI.4 ya exigía y que nadie consumía para esto |
| **D7** Neutralidad | Conforme | Los dos destinos se citan por su procedencia, sin nombrarlos |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | El umbral se contrastó contra los dos destinos y contra las entradas major del `CHANGELOG.md` |

## 8. Lo que esta nota deja anotado

**El umbral cuenta major con impacto, y eso supone que todas las entradas major tienen su bloque bien
declarado.** El bloque existe desde la 4.0 y se exige desde entonces, pero **nadie lo verificaba como
insumo de una decisión**: hasta ahora sólo lo leía la migración para resolver renombres. Si una entrada
major lo declaró vacío por descuido, el umbral la cuenta como sin impacto y **recomienda C donde
correspondía B**.

No se resuelve acá porque exige revisar las entradas major ya publicadas, que son registro. Lo que
queda dicho es que **el umbral es tan bueno como el bloque de impacto de cada major**, y que ahora ese
bloque tiene un segundo consumidor que lo vuelve verificable por sus consecuencias.

## 9. Veredicto

**APROBADO.** R2 recomienda con fundamento sin decidir, el umbral de continuidad está escrito con su
mecánica en lugar de resolverse por intuición, y el humano que elige reparar sabe qué pregunta le
espera del otro lado.

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-17 | Emisión inicial. R2 pasa de enumerar a **recomendar**, con alternativa razonable obligatoria. Se declara el **umbral de continuidad** —cuántos major con bloque de impacto no vacío atraviesa el salto—, con **dos o más** como el punto donde ninguna regla vigente puede auditar el corpus y **C deja de ofrecerse**. Registra que el umbral **es tan bueno como el bloque de impacto de cada major**. |
