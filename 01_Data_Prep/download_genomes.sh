#!/bin/bash
# Download 50 T2T Rice Genomes
mkdir -p data/genomes
# Example: Use NCBI Datasets CLI
datasets download genome taxon "Oryza sativa" --reference --include genome,gff3,protein,cds --filename data/genomes/rice_genomes.zip
unzip data/genomes/rice_genomes.zip -d data/genomes/