#!/bin/bash
# Calculate Tajima's D using VCFtools
vcftools --vcf merged_population_SVs.vcf --TajimaD 10000 --out population_tajimas_d_10kb