## STACKS denovo complete pileline script for *Calamagrostis*

**File name:** manual_pipeline_script.sh

**File description:** the `manual_pipeline_script.sh` scrip contais a complete pipeline to run all STACKS steps for genotype calling of *Calamagrostis* inidividuals sequenced with ddRAD. Within the scripts there are commands to run:
  1. USTACKS: builds loci *de novo* in each sample
  2. CSTACKS: creates a catalog of all loci across the population. Loci are matched up across samples according to sequence similarity.
  3. SSTACKS: matches each sample against the catalog
  4. TVS2BAM: transposes the data from being organized by sample, to being organized by RAD locus. This allows the downstream pipeline components to look at all data from across the meta-population for each locus.
  5. GSTACKS: If paired-end reads are available, assembles contigs from them and overlapped with the single-end locus. SNPs will be called, and for each locus, the SNPs will be phased into haplotypes.
  6. Populations: generates population-level summary statistics and export data in a variety of formats

TO run these scripts with your own data please modify the directory paths (`reads_dir=` and `out_dir=`). 

For more information about each command and STACKS visit: https://catchenlab.life.illinois.edu/stacks/
