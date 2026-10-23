# Conocimiento — Base de conocimiento del framework

**Documento:** Conocimiento/README.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-23
**Autor:** AG-00990 (Arquitecto de Soluciones)

---

## 1. Qué es esta carpeta

El catálogo de **oficio**: cómo se construyen y se estructuran las cosas que el método deliberadamente no
gobierna. Una caracterización de una arquitectura, de un template, de una convención de nomenclatura.

El framework aporta el **método** —cómo se especifica, cómo se descompone, cómo se audita, cómo se
planifica—. Esta carpeta aporta el **oficio**, y el intake es donde se encuentran: un producto cita el
alias del conocimiento que quiere aplicar, y el orquestador lo suma a los insumos del despacho que
corresponda.

**Es una carpeta anexa, no parte del conjunto normativo.** Ninguna regla nombra un documento de acá; lo
único que el framework fija es el formato y el contrato del índice, en
[`Rules-Base-Conocimiento.md`](../SDD/Devs/Rules/Rules-Base-Conocimiento.md).

## 2. La propiedad que hay que preservar

**Con esta carpeta vacía el framework corre exactamente igual.** No hay flag que apagar: sin documentos,
el índice no tiene filas, ninguna condición dispara y ningún alias resuelve.

Es lo que hace que agregar conocimiento **no desfigure el método**. Si algún día el framework deja de
funcionar con la carpeta vacía, la capacidad dejó de ser una extensión y pasó a ser parte del método.

## 3. Cómo se extiende

**Forkeando.** Quien quiera su propia base forkea el repositorio y agrega sus documentos acá: se lleva
el método intacto y le suma su oficio. No hay una segunda raíz que declarar ni una ruta que configurar.

Para agregar un documento se ejecuta el tool-prompt de relevamiento, que caracteriza el artefacto contra
`Rules-Base-Conocimiento.md` y deja el documento más su fila en [`Index-Knowledge.md`](Index-Knowledge.md).
A mano también se puede, cumpliendo el mismo formato: lo verifica la lista de su §6.1.

## 4. Condición bloqueante

**`IA.SDD` es un repositorio público.** Ningún documento puede contener nombres de clientes, datos
reales, assets del proyecto de código de origen ni decisiones que sólo tengan sentido en su dominio. La
verificación de ofuscación es previa y bloqueante, con la misma exigencia que
[`Index-Modelos-UX-UI.md`](../SDD/Devs/Modelos-UX-UI/Index-Modelos-UX-UI.md) §4 aplica a los modelos.

Un fork privado puede guardar lo que quiera en su propia carpeta. Este repositorio, no.

## 5. Contenido

| Archivo | Qué es |
| --- | --- |
| [`Index-Knowledge.md`](Index-Knowledge.md) | El índice. Único lugar donde se declara qué existe y cuándo se carga |
| `Knowledge-<Tema>.md` | Un documento por artefacto o convención caracterizada |

`Conocimiento/` **entra en las copias de `_legacy/<version>/`**, por el mismo criterio que `Templates/`:
`SDD-Development-Guide.md` §VI.5 sólo excluye del snapshot lo que no condiciona lo que el orquestador
genera, y un documento cargado sí lo condiciona. Es lo que hace que un destino, al declarar con qué
versión del framework se generó, declare también con qué conocimiento.

## 6. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-23 | Emisión inicial, junto con el alta de la carpeta y de su primer documento. |
