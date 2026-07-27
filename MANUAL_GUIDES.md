# Manual GUI Guides

Certain tasks in this pipeline require human curation or graphical software.

## 1. Bandage (Pangenome Visualization)
After generating the graph pangenome `.gfa` file in `04_Pangenome`:
1. Open Bandage GUI.
2. File -> Load Graph (`rice_pangenome.gfa`).
3. Click 'Draw Graph'.
4. Locate the NBS-LRR sub-graph using sequence queries and export the topological image.

## 2. RIdeogram (Chromosome Inversions)
The macro-syntenic inversions (e.g., on Chromosome 6) outputted by SyRI need to be visualized in RStudio.
Load the synteny matrices into the `RIdeogram` R package to adjust the karyotype colors and labels manually for publication-ready figures.