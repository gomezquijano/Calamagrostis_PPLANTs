### R Studio analysis pipeline of filtered SNPS from ddRAD of Calamagrostis individuals collected from wild population in the Northwest Territories of Canada

**File description:**

1. `sample.info.one.csv:` --> Sample sheet of sequenced individuals columns include:
num |	ID	| Sample | Species	| origin	| lat	| long	| pop	| region

2. `IDs_for_subset.csv` --> Sample ID of individuals used for the "validation" dataset

3. `GT-seq_uptodatepipeline_downstream.Rmd` : Rmarkdown file containing the complete analysis pipeline of GT-seq genotypes

This pipeline analyzes SNP data from three Calamagrostis species collected in the Northwest Territories, Canada, plus commercial C. canadensis cultivars. Analyses include:

    1. Filtered CVS data import with Genotypes and preprocessing (genind object creation)
    2. Population metadata integration
    3. Sample filtering and subseting of individuals
    4. Principal Component Analysis (PCA)
    5. Linear Fischer Discriminant analyses (LFDA)
    5. Population structure inference (sNMF / LEA)
    6. Genetic diversity statistics
    7. Population differentiation (FST)
    8. Neighbour Joining tree
    9. Mantel test for IBD

All these analyses are done for each data subset "validation", "wild", "canadensis" and "full" 
