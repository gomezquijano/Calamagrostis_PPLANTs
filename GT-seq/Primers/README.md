## Data files descriptions:

`FASTA_Primers.fa` --> sequences for 329 GT-seq target loci primers in FASTA file format designed at GTseek LLC. 


`GTseq24_ProbeSeqs.csv`  --> CSV file containing locus names, allele names, in-silico probe sequences, forward primer and allele specific correction values for each locus
This file is required to run the modified `GTseq_Genotyper_v3_MJ.pl` script for the genotyping step of the GT-seq pipeline. 


`GTseq_i5_i7_ID.csv` --> CSV file containing i5 and i7 indexes used for multiplexing. i5 index serves as an individual barcode, while i7 is used per plate creating a unique individual + plate combination. 

Columns are:
Sample	| PlateID	| i7_name	| i7_sequence	| i5_name	| i5_sequence
