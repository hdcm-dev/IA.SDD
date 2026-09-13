#!/bin/sh
# Método: huella y encabezado del documento de entrada y del tool-prompt, que viven fuera de este repositorio. Base: 2026-09-13, árbol de trabajo (no fijado a commit: IA.SDD.Documentacion tiene cambios sin confirmar). Quién: presidente de mesa.
P=<workspace>/IA/SDD/IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/02-Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS
sha256sum "$P/Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS.md" "$P/INPUTs/Bundle-JS-En-Solucion-Blazor.md"
wc -l "$P/Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS.md" "$P/INPUTs/Bundle-JS-En-Solucion-Blazor.md"
grep -n '^## \|^### ' "$P/INPUTs/Bundle-JS-En-Solucion-Blazor.md"
