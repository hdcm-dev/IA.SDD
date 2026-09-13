#!/bin/sh
# Método: grep -nF sobre el conjunto normativo 13.17 de las líneas que el caso cita. Base: IA.SDD a501857. Quién: presidente de mesa.
F=<workspace>/IA/SDD/IA.SDD
c() { printf -- '--- %s :: %s\n' "$1" "$2"; grep -nF -- "$2" "$F/$1" | head -${3:-3}; }
c SDD/Devs/Intake/PRODUCT-INTAKE-template.md '¿Produce un artefacto de compilación propio y declara sus propias dependencias?'
c SDD/Devs/Intake/PRODUCT-INTAKE-template.md 'Los proyectos de código no llevan valor D8'
c SDD/Devs/Intake/PRODUCT-MANIFEST-template.md 'Agrupada por solución de código'
c SDD/Devs/Rules/Vocabulario-Rules.md 'el *workspace* en Cargo o npm'
c SDD/Devs/Intake/PRODUCT-INTAKE-template.md '| **De compilación** |'
c SDD/Devs/Rules/Rules-Examples.md 'Las dos aristas del sample'
c SDD/Devs/Rules/Rules-Examples.md 'Está prohibido partir el sample'
c SDD/Devs/Rules/Rules-Examples.md 'Momento de generación: dos pasadas'
c SDD/Devs/Rules/Rules-Examples.md '`redistribuible` == false y sin portal de developers'
c SDD/Devs/Rules/Maqueta-Rules.md 'La maqueta es siempre HTML, CSS y JavaScript'
c SDD/Devs/Rules/Maqueta-Rules.md 'Si una unidad de entrega futura necesitara compilar para maquetar'
c SDD/Devs/Rules/Rules-Base-Conocimiento.md 'Describe el artefacto, no el método'
c SDD/Devs/Rules/Rules-Base-Conocimiento.md '| `propio` | **600 líneas**'
c SDD/Devs/Rules/Rules-Base-Conocimiento.md 'Once campos, ninguno vacío'
c SDD/Devs/Rules/Rules-Base-Conocimiento.md 'Conocimiento disfrazado de regla'
c SDD/Devs/Rules/Rules-Backlog-Tecnico.md 'Spike implica caja temporal explícita'
c README.md 'los estándares de industria se nombran, no se enlazan'
printf -- '--- ocurrencias de PoC / prueba de concepto en el conjunto normativo (sin _legacy, sin Examples):\n'
grep -rniE '\bPoC\b|prueba de concepto|proof of concept' --include=*.md "$F/SDD" "$F/PROMPTS" "$F/README.md" "$F/Conocimiento" | wc -l
