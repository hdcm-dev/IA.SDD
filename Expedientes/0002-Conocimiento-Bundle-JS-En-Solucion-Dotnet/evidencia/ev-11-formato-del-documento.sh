#!/bin/bash
# Método: chequeos enumerables de Rules-Base-Conocimiento.md §6.1 y de los folios 004 y 013 sobre el documento producido. Base: 2026-09-13, documento en OUTPUTs/ (árbol de trabajo de IA.SDD.Documentacion, no fijado a commit; la huella va en la primera línea de la salida). Quién: presidente de mesa.
D=<workspace>/IA/SDD/IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/02-Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS/OUTPUTs/Knowledge-Bundle-JS.md
sha256sum "$D"
echo "== 1 cabecera (11 esperados):"; sed -n 1,20p $D | grep -cE '^\*\*(Alias|Naturaleza|Tema|Consumidor|Condicion-de-carga|Hereda-de|Sustituye|Compatible-con|Versión|Estado|Fecha):\*\* \S'
echo "== 2 secciones §0-§10:"; grep -oE '^## [0-9]+\.' $D | tr '\n' ' '; echo
echo "== 3 numeración contigua (vacío = ok):"; awk '/^## [0-9]+\./{split($2,a,".");s=a[1];n=0} /^### [0-9]+\.[0-9]+/{split($2,b,".");n++; if(b[1]!=s||b[2]!=n) print "SALTO",$0}' $D
echo "== 4 techo:"; T=$(wc -l < $D); C5=$(awk '/^## 5\./{f=1} /^## 6\./{f=0} f' $D | wc -l); echo "total=$T §5=$C5 resto=$((T-C5)) (resto <= 600 con excepción declarada en §0)"; grep -c 'supera el techo por sí sola' $D
echo "== 5 ofuscación (vacío = ok):"; grep -n -i -E '<f1>|<componente>|<componente>|<prefijo-css>|E-PIN|AlActivarPunto|DiagramaDeCabecera|cabecera de pines|geometria|geometriafactory|visor|teatro|asientos|sillas|googlemaps|BCM|<F1>-srv|<F1>|hdcm|PANELES'  $D
echo "== 6 criterios de sample, anti-patrón (vacío = ok):"; grep -n -E 'VER-|criterio_aceptacion|verificacion:' $D
echo "== 7 rutas de solución (sólo en §0, como ilustrativas):"; grep -n -E '/samples|/demos|/src/|/tests/|\.sln|Unidades-Entrega' $D
echo "== 8 foco/teclado:"; grep -n -i -E 'teclado|foco|tabindex' $D
echo "== 9 fila de índice contra cabecera:"; for c in Alias Naturaleza Tema Consumidor Condicion-de-carga; do v=$(grep -m1 "^\*\*$c:\*\*" $D | sed "s/^\*\*$c:\*\* //"); grep -qF -- "$v" <(grep '^| `Knowledge-Bundle-JS.md`' $D) && echo "ok $c" || echo "DIFF $c"; done
