#!/bin/sh

# Converts degenerate nucleotides to regex patterns

IN=${1:-$(cat /dev/stdin)}

echo $IN | sed '
s/W/(A|T)/
s/S/(C|T)/
s/M/(A|C)/
s/K/(G|T)/
s/R/(A|G)/
s/Y/(C|T)/
s/B/[CGT]/
s/D/[AGT]/
s/H/[ACT]/
s/V/[ACG]/
s/N/./
s/X/./
'
