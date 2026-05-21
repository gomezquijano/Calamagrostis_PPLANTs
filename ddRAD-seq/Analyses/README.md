
## Rsutidio analysis pipeline of filtered SNPS from ddRAD of Calamagrostis individuals collected from wild population in the Northwest Territories of Canada


### File description:

  1. `calam_info.csv` : Sample sheet of sequenced individuals columns include:

ID	| sample_no	| species	| lat	| long	| loc_town	| loc_terr	| region	| is_commercial	| pop	| order| 	pop_spec	| Label

  2 . `ddRad_Analysis_allspecies.Rmd` : Rmarkdown file containing the complete analysis pipeline

This pipeline analyzes SNP data from three *Calamagrostis* species collected in the Northwest Territories, Canada, plus commercial *C. canadensis* cultivars. Analyses include:

        1. Filtered SNP data import and preprocessing
        2. Population metadata integration
        3. Sample filtering
        4. Principal Component Analysis (PCA)
        5. Population structure inference (sNMF / LEA)
        6. Genetic diversity statistics
        7. Population differentiation (FST)
        8. Neighbour Joining tree
    

