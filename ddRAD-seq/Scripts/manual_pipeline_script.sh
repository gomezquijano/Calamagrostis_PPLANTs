#!/bin/bash
#SBATCH --job-name=stacks_denovo
#SBATCH --time 4-12:00:00
#SBATCH -c 8
#SBATCH --mem=120G


#### USTACKS #####

mkdir ~/Programs/STACKS/out/ustacks

# Define directories
reads_dir= ~/Programs/STACKS/out/dedup.demultiplexed # Clean reads
out_dir= ~/Programs/STACKS/out/ustacks # Output directory

# Load necessary modules
module load StdEnv/2023
module load stacks


# Loop through each .fq.gz file in the reads directory
for sample in "$reads_dir"/*.fq.gz; do
    # Get the base filename without the directory and .fq.gz suffix
    base_name=$(basename "$sample" .fq.gz)
    
    # Run ustacks with the specified parameters
    ustacks -f "$sample" -o "$out_dir" -M 5 --name "$base_name"  --model-type bounded --bound-high 0.001 -t 16

done


#####CSTACKS####

mkdir ~/Programs/STACKS/out/cstacks

reads_dir=~/Programs/STACKS/out/ustacks # Clean reads
out_dir= ~/Programs/STACKS/out/cstacks # Output directory

cstacks -n 5 -P "$reads_dir" -M ~/Programs/STACKS/info/popmap  -o "$out_dir" -t 16 



####SSTACKS#####

mkdir ~/Programs/STACKS/out/sstacks 

reads_dir=~/Programs/STACKS/out/cstacks # Clean reads
out_dir= ~/Programs/STACKS/out/sstacks # Output directory

cstacks -P "$reads_dir" -M ~/Programs/STACKS/info/popmap  -o "$out_dir" -t 16 



#####TVS2BAM#######

reads_dir=~/Programs/STACKS/out/sstacks # Clean reads
pesamples = ~/Programs/STACKS/out/dedup.demultiplexed # original dedup reads directory 


tsv2bam -P "$reads_dir" -M ~/Programs/STACKS/info/popmap  --pe-reads-dir "$pesamples" -t 16

####GSTACKS#######

mkdir ~/Programs/STACKS/out/gstacks 

#popmap= ~/Programs/STACKS/info  #popmap file 
reads_dir=~/Programs/STACKS/out/sstacks # Clean reads
out_dir= ~/Programs/STACKS/out/gstacks  # Output directory

gstacks -P "$reads_dir" -M ~/Programs/STACKS/info/popmap -O "$out_dir" -t 16


#####POPULATIONS#######

mkdir ~/Programs/STACKS/out/stacks.denovo/manual.pipeline.populations

#popmap= ~/Programs/STACKS/info #popmap file
reads_dir= ~/Programs/STACKS/out/gstacks # Clean reads
out_dir = ~/Programs/STACKS/out/stacks.denovo/manual.pipeline.populations # Output directory

populations -P  "$reads_dir" -M ~/Programs/STACKS/info/popmap -p 1 -r 0.2 -O "$out_dir" -t 16 \
 --hwe \ #hwe deviations stats
 --fstats --fst_correction p_value \ #fst stats
 --vcf \ #output files
 --fasta-loci \
 --genepop  \
 --structure \
 --plink 

#####ENDofSTACKS####

module load gcc/12.3
module load bcftools

bgzip -c ../out/stacks.denovo/manual.pipeline.populations/populations.snps.vcf > manual.pipeline.calamagrostis_denovo.snps.vcf
tabix -p manual.pipeline.calamagrostis_denovo.snps.vcf
