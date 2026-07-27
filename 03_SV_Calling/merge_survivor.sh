#!/bin/bash
# Merge SVs across 50 accessions
ls *.vcf > sample_files.txt
SURVIVOR merge sample_files.txt 1000 1 1 0 0 0 merged_population_SVs.vcf