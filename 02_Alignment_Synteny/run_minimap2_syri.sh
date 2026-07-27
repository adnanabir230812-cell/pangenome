#!/bin/bash
# Minimap2 Alignment and SyRI structural variants
minimap2 -cx asm5 --cs data/genomes/nipponbare.fasta data/genomes/japonica_query.fasta > alignment.paf
syri -c alignment.paf -r data/genomes/nipponbare.fasta -q data/genomes/japonica_query.fasta -k -F p --prefix japonica_syri_