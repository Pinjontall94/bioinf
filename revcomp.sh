#!/bin/sh

# revcomp.sh
# A simple shell script to generate reverse complements of raw nucleotide
# sequences.

echo $1 \
| tr ACGTacgt TGCAtgca \
| tr WSMKRY SWKMYR \
| tr BDHV VHDB \
| rev
