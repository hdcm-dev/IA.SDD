# Entrega de unidades de trabajo

Cómo se entrega una unidad de trabajo en este repositorio. No es parte del framework: no entra en `_legacy/`
ni cambia su versión.

## Delegación del merge

| | |
| --- | --- |
| **Fecha** | 2026-10-27 |
| **Decidió** | El responsable del producto (PO) |
| **Responsable de ejecutarla** | El agente que conduce cada unidad de trabajo |
| **Conocimiento** | `Conformacion-Pull-Request-Automatico` ([Conocimiento/Knowledge-Conformacion-Pull-Request-Automatico.md](Conocimiento/Knowledge-Conformacion-Pull-Request-Automatico.md)) |
| **Techo de espera de la guarda** | 30 minutos |
| **Intervalo de relectura** | 30 segundos |
| **Control que lee la guarda (G3)** | El workflow `Verificar` ([.github/workflows/verificar.yml](.github/workflows/verificar.yml)) |

El agente abre el pull request de su unidad y publica el informe con el enlace. Lo fusiona cuando se cumplen
G1–G4: cabeza auditada, `mergeable_state` `clean`, al menos una corrida de controles en éxito para ese SHA y
ninguna reserva. Fusiona con un merge commit atado al SHA, nunca `squash`, porque las ramas llevan expedientes.
Después borra la rama remota. Ante una reserva, el merge vuelve al PO.

**Excepción:** si hay un cuestionamiento particular sobre la unidad, se para y se hace manual. La delegación es
revocable por unidad.

### Testimonio literal

> «sobre el merge automático, esto surgió porque despues de un avance surgia preguntas y confirmaciones tontas, -
> nada que con un analisis previo no se resuelva por si solo … de esta manera el desarrollo no se para … Mi
> objetivo es que se enriquesca de tal forma el conocimiento analitico que los subagentes con este conocimiento
> puedan orquestar de forma automatica todo el proceso de desarrollo, busco una interactividad autonoma e
> inteligente»
>
> — PO, 2026-10-27, conversación con el agente; asentado en el registro de decisiones del PO (expediente 0002,
> folio 130).

## Control `Verificar`

`python3 -I .github/scripts/verificar.py` recorre los `.md` versionados fuera de `_legacy/` y falla si:

1. un enlace relativo no resuelve a un archivo o carpeta del árbol;
2. aparece una ruta absoluta de un directorio personal o una dirección IPv4 de red privada.

Los enlaces ilustrativos, que muestran cómo enlaza un proyecto destino, se declaran uno por uno en
`.github/scripts/verificar-excepciones.txt`.
