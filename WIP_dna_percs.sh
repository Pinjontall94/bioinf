#!/bin/env bash
# bash script to run dna_percs.pl

$INPUT=@STDIN

dna_percs.pl $(echo $INPUT | tr [a-z] [A-Z] | cat)
