### Modified GT-seq genotyping script to account for polyploidy:

**File Description:**
`GTseq_Genotyper_v3_MJ.pl` --> This file is a modified script from the original `GTseq_Genotyper_v3.pl` scrip from Nathan Campbell GT-seq pipeline (https://github.com/GTseq/GTseq-Pipeline/tree/master). The modification of this script was done to change the allele ratio thresholds for homozygotes from 10:1 to 100:1 to account for differences in binomial sampling probabilities expected lower frequency of minor alleles in polyploids compared to diploids. Changes are from line 195-215 with original script code mantained as a comment (#). 

### GT-seq Pipeline overview:

We followed the standard GT-seq pipeline written by Nathan Campbell (https://github.com/GTseq/GTseq-Pipeline/tree/master) our only modification was to the Genotyper script as descrived above. 

in short the pipeline consists of: 
*Form GTseq-pipeline GitHub:

1- Split raw fastq sequence file into individual fastq files using dual index sequences.
2- Optional: Test plate fastq sequence files for the presence of forward primers and probes using the GTseq_SeqTest.pl script.
3- Genotype individuals 
4- Compile genotypes from individual .genos files to a single .csv file.
5- Optional: Compile read count data for each sample at each locus.
