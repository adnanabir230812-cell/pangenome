#!/bin/bash
# Construct Variation Graph
vg construct -r data/genomes/nipponbare.fasta -v merged_population_SVs.vcf > rice_pangenome.vg
vg view -g rice_pangenome.vg > rice_pangenome.gfa
# Use Bandage manually to visualize the .gfa file