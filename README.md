# Rice Pangenome and Structural Variation Pipeline

This repository contains the complete, automated bioinformatics pipeline (Work Packages 1-9) for a comprehensive comparative genomics, structural variation, pangenome, and NBS-LRR integration study in rice.

## Architecture
- `01_Data_Prep`: Scripts for genome downloads, RNA-seq, and Trimmomatic QC.
- `02_Alignment_Synteny`: Scripts for Minimap2, SyRI structural rearrangements, and OrthoFinder clustering.
- `03_SV_Calling`: Scripts for SV integration (SURVIVOR) and population genetics (Tajima's D via VCFtools).
- `04_Pangenome`: Variation graph construction using `vg`.
- `05_AI_and_GWAS`: Explainable AI (Random Forest + SHAP) and FarmCPU Pan-GWAS models.

## Requirements
Executing this pipeline with real T2T genome datasets requires a High-Performance Computing (HPC) cluster. 
To install all required dependencies, use the provided Conda environment file:
```bash
conda env create -f environment.yml
conda activate rice_pangenome
```

See `MANUAL_GUIDES.md` for steps requiring graphical interfaces (e.g., Bandage, RIdeogram).