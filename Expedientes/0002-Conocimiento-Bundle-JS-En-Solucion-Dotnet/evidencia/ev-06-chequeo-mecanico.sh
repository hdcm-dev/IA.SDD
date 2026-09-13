#!/bin/sh
# Método: compuerta mecánica previa al panel. Los cinco chequeos de coherencia de Mesa-Evaluadora.md §3 suponen requisitos con ID, tareas y pruebas; el objeto de este caso es un pedido y un análisis, sin esa forma. Se corre lo que sí es chequeable: que todo archivo del framework que el documento de entrada cita exista en la base, y que las secciones que cita existan en esos archivos. Base: IA.SDD a501857. Quién: presidente de mesa.
W=<workspace>
F=$W/IA/SDD/IA.SDD
I=$W/IA/SDD/IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/02-Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS/INPUTs/Bundle-JS-En-Solucion-Blazor.md
printf -- '--- archivos del framework citados por el documento de entrada, y si resuelven\n'
grep -oE '`[A-Za-z0-9/._-]+\.md`' "$I" | tr -d '`' | sort -u | while read p; do
  n=$(find "$F/SDD" "$F/Conocimiento" "$F/README.md" -name "$(basename $p)" -not -path '*/_legacy/*' | wc -l)
  printf '%s  encontrados=%s\n' "$p" "$n"
done
printf -- '\n--- secciones citadas como "Archivo §N": comprobacion de que el archivo tiene un encabezado con ese numero\n'
grep -oE '`[A-Za-z-]+\.md` §[0-9]+(\.[0-9]+)?' "$I" | sort -u | while read f s; do
  f=$(echo $f | tr -d '`'); n=${s#§}
  path=$(find "$F/SDD" "$F/README.md" -name "$f" -not -path '*/_legacy/*' | head -1)
  [ -z "$path" ] && { printf '%s %s  ARCHIVO-NO-ENCONTRADO\n' "$f" "$s"; continue; }
  c=$(grep -cE "^#+ *(§)?$n([ .]|$)|^#+ .*§$n([ .]|$)" "$path")
  printf '%s %s  encabezados=%s\n' "$f" "$s" "$c"
done
