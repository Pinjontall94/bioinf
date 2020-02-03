#!/bin/bash
# labeler.sh

# appends the source article (with file extension) to the file containing
# the extracted SRP
# usage: <labeler.sh>

shopt -s nullglob

for f in *.sra; do
	echo $f | sed 's/\.txt\.sra/.pdf/g' >> $f
done
