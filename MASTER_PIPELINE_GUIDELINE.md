# Master Guideline: Rice Pangenome & SV Pipeline

This document serves as the absolute master guideline for executing the 9-Work Package (WP) Rice Pangenome and Structural Variation (SV) Pipeline. It explains the biological purpose of each step and how to execute the corresponding scripts in this repository.

---

## 1. Data Collection and Quality Control (WP1 & WP2)
**Biological Purpose:** Before any comparative analysis, we must secure high-quality Telomere-to-Telomere (T2T) reference genomes and short-read sequencing data. Poor quality reads lead to false-positive structural variants.

**Execution Guide:**
*   Go to the `01_Data_Prep` folder.
*   Run `bash download_genomes.sh`: This automatically downloads 50 Rice T2T genomes (Japonica, Indica, Aus, Wild) using NCBI Datasets.
*   Run `bash run_qc_pipeline.sh`: This executes Trimmomatic to clean raw short-read FASTQ files, filtering reads below Q30.

---

## 2. Genome Alignment and Synteny (WP3 & WP4)
**Biological Purpose:** To identify how the 50 rice genomes differ structurally from the Nipponbare reference. This step detects massive evolutionary events like the Chromosome 6 inversion in Japonica.

**Execution Guide:**
*   Go to the `02_Alignment_Synteny` folder.
*   Run `bash run_minimap2_syri.sh`: This uses Minimap2 for ultra-fast whole-genome alignment and SyRI to call syntenic blocks and structural rearrangements (Insertions, Deletions, Inversions).
*   Run `bash run_orthofinder.sh`: This clusters the NBS-LRR immune genes into orthogroups to define the Core and Dispensable immune repertoires.

---

## 3. Structural Variation Calling and Population Genetics (WP5 & WP6)
**Biological Purpose:** Integrating the structural variants from all 50 genomes into a single catalog and tracking their evolutionary signatures (e.g., finding out if an SV was positively selected).

**Execution Guide:**
*   Go to the `03_SV_Calling` folder.
*   Run `bash merge_survivor.sh`: Merges the individual SV VCF files into a single non-redundant population SV matrix using SURVIVOR.
*   Run `bash calculate_tajimas_d.sh`: Uses GATK HaplotypeCaller and VCFtools to calculate Tajima’s D across 10-kb sliding windows to detect signatures of selection.

---

## 4. Pangenome Graph Construction (WP7)
**Biological Purpose:** Linear reference genomes fail to capture the massive structural diversity of rice. A graph pangenome represents all genetic variations (paths) simultaneously, crucial for complex NBS-LRR loci.

**Execution Guide:**
*   Go to the `04_Pangenome` folder.
*   Run `bash build_vg_graph.sh`: This uses the Variation Graph (vg) toolkit to build a graph from the merged SV VCF.
*   **Manual Step:** Open the generated `.gfa` file in the Bandage GUI software to visually inspect the highly branched immune gene clusters.

---

## 5. Explainable AI and Pan-GWAS (WP8 & WP9)
**Biological Purpose:** To answer *why* the genomes evolved (via Machine Learning) and *how* they affect agriculture (via GWAS linking SVs to drought/yield).

**Execution Guide:**
*   Go to the `05_AI_and_GWAS` folder.
*   Run `python train_random_forest.py`: Trains a Random Forest regressor to predict the evolutionary rate (dN/dS). It uses SHAP values to prove that Transposable Element (TE) density drives NBS-LRR evolution.
*   Run `Rscript run_farmcpu_gwas.R`: Executes the FarmCPU model to link structural variants to grain yield, automatically accounting for population structure (Kinship/PCA).

---

## ⚠️ System Requirements
Do not run this pipeline on a standard laptop. The whole-genome alignments and graph constructions require a Linux-based HPC cluster with a minimum of 128GB RAM and 32+ CPU threads. Ensure all dependencies are installed via the provided `environment.yml` file before starting.
