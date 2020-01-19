#!/bin/bash

shopt -s nullglob
for f in *.pdf; do
	pdftotext -layout $f
done
