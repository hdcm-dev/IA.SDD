# Nota de coherencia — El orquestador de migración y el falso negativo de la verificación

**Framework:** SDD
**Documento:** Coherencia-Orquestador-Migracion-8.x.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-15
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.5

---

## 1. Alcance

Dos correcciones: poner `Master-Prompt-Migracion.md` al día con el nivel de unidad de entrega, y
declarar en la guía de desarrollo cómo se verifica una intervención estructural, porque la
verificación de la 8.0 dio este archivo por conforme sin haberlo migrado.

## 2. El defecto, y por qué no se vio

La 8.0 cambió el nivel intermedio del layout. `Master-Prompt-Migracion.md` conduce la migración y su
§8 M4 recorre `SDD/Docs/` documento por documento, de modo que **es uno de los archivos que más
directamente depende del nivel**. Quedó en 1.1, recorriendo «cada proyecto de código».

La verificación de la 8.0 midió la **ausencia de lo viejo**: residuos de `tipo_proyecto_codigo` y de
la ruta `Proyectos/<Nombre-Proyecto-Codigo>/`. Este archivo tenía **cero de las dos**, y por eso pasó.
No porque estuviera migrado: porque **nunca las había usado**. Ordenaba el recorrido nombrando el
nivel en prosa, sin citar la variable ni la ruta.

De ahí la regla nueva: **verificar la presencia de lo nuevo no es lo mismo que verificar la ausencia
de lo viejo**, y la segunda sola tiene un falso negativo que no produce ningún aviso.

## 3. Inventario

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Master-Prompt-Migracion.md` | 1.1 → **2.0** | §2, §7 y §8 M4 pasan al nivel de unidad de entrega; M4 suma el inventario del eje de construcción y la precondición de ejecutar antes la migración estructural |
| `SDD-Development-Guide.md` | 1.9 → **1.10** | Parte IV: cómo se verifica una intervención estructural |
| `CHANGELOG.md` | — | Entrada `[8.5]` |
| `_legacy/8.4/` | — | Conjunto superado |

## 4. La comprobación nueva, corrida

Se aplicó la regla al conjunto completo: buscar los archivos normativos **sin ninguna mención** al
nivel nuevo. Sobre las diecinueve reglas, los dos orquestadores, las dos plantillas de intake, las
tres guías y los dos índices de catálogo: **cero archivos**. `Master-Prompt-Migracion.md` era el
único, y esta intervención lo cierra.

## 5. Verificación de invariantes

| Invariante | Estado |
| --- | --- |
| **D6** Trazabilidad | Conforme. La precondición nueva de M4 —migrar la estructura antes que el contenido— es lo que evita migrar documentos contra un nivel que va a cambiar |
| Resto | Conformes, sin cambios |

## 6. Observaciones

**Dónde apareció, y por qué importa.** Al abrir el orquestador para lanzar la migración real, **antes
de tocar un solo archivo del destino**. Es la cuarta corrección que sale de ejecutar en lugar de leer,
y la primera que sale de **ir a ejecutar**. Si la corrida hubiera arrancado, habría migrado el destino
hacia el modelo que la 8.0 dejó atrás.

**Lo que enseña sobre el orden de una intervención estructural.** Los archivos que **ordenan un
recorrido** son los que más se olvidan, precisamente porque el orden se escribe en prosa y no suele
nombrar la variable que se renombra. Conviene revisarlos primero y no últimos.

## 7. Veredicto

**APROBADO.** La corrección es acotada, no alcanza ninguna invariante y no invalida documentación
emitida. La regla de verificación que la acompaña impide que el mismo falso negativo se repita.
