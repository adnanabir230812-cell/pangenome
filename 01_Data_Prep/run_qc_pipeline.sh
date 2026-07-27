#!/bin/bash
# Trimmomatic QC for short-read sequencing data
mkdir -p data/clean_reads
for fq1 in data/raw_reads/*_1.fastq.gz; do
    fq2="${fq1/_1.fastq.gz/_2.fastq.gz}"
    base=$(basename "$fq1" _1.fastq.gz)
    trimmomatic PE -threads 16 "$fq1" "$fq2" \
        data/clean_reads/${base}_1_paired.fq.gz data/clean_reads/${base}_1_unpaired.fq.gz \
        data/clean_reads/${base}_2_paired.fq.gz data/clean_reads/${base}_2_unpaired.fq.gz \
        ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:36
done