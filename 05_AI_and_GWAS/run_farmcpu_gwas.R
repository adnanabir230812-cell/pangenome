library(rMVP)
# Load phenotype and genotype
pheno <- read.table("drought_yield_phenotypes.txt", head=TRUE)
geno <- attach.big.matrix("merged_population_SVs.geno.desc")
map <- read.table("merged_population_SVs.map", head=TRUE)

# Run FarmCPU GWAS
imMVP <- MVP(
    phe=pheno,
    geno=geno,
    map=map,
    method="FarmCPU",
    threshold=0.05,
    file.output=TRUE
)