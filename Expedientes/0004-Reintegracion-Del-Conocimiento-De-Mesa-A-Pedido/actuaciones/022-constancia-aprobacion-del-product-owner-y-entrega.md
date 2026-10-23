| Campo | Valor |
|---|---|
| Tipo | constancia |
| Fecha | 2026-10-23 |
| Autor | Presidente de mesa |
| Corrige | — |

# Aprobación de lo marcado y entrega por pedido de fusión

## 1. Lo que se le presentó al Product Owner

Tras el folio 018, el presidente le presentó en la sesión las tres decisiones que la resolución 013 marcó, cada una con su default aplicado:

| # | Decisión | Default |
|---|---|---|
| M-1 | La propiedad general O5 se asienta en `Rules-Base-Conocimiento.md` 2.3: viñeta en §2.2, ítem `[enumerable]` en §6.1 que no se exige a documentos anteriores, línea en el snippet de §8 y fila de §10. Arrastra M-5 (`SDD-Development-Guide.md` 1.32, «quince ítems») y M-6 (una fila en la matriz de `README.md`). Toca la norma, contra el criterio del 2026-08-29 (R1) | aplicado |
| M-3 | El documento se parte en padre, hermano de excepción y dependencia traída, contra la decisión del destino de que la regla viviera en este documento | aplicado |
| M-4 | «Apartamiento» pasa a «excepción a un conocimiento» en el framework, por la colisión con `Root-Rules.md` §11 y `Mesa-Rules.md` | aplicado |

## 2. Respuesta del Product Owner (literal)

> encargate vos de fusionar el PR y arreglar lso repositorios locales

La respuesta llegó con los tres defaults a la vista y ordena la entrega. Se asienta como **aprobación de M-1, M-3 y M-4 tal como quedaron**. Los pendientes P-1 a P-11 de la nota de coherencia siguen con su default: no se aplican.

## 3. Entrega

- Un pedido de fusión a `main`, con merge commit atado al SHA auditado.
- El framework no tiene controles de integración continua: el merge descansa en esta autorización.
- Después del merge, el repositorio local queda en `main` sin ramas sin fusionar y sin el worktree de la mesa.

## Pase

Expediente **cerrado** con la fusión. Sigue: nada en el framework. En el destino, su fork 1.15 puede reconciliarse con la 2.0 del framework cuando su Product Owner lo pida. No es parte de este expediente.
