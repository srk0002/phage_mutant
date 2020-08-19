#!/bin/bash

#This script will be used to download raw read data from the sequence read archive (SRA in NCBI) using SRR numbers availible for each sample.
#This requires use of SRA Toolkit on the ASC.
#
##########Queue Information Based on SampleTest Data###########
#Core=1 Mem=1gb (efficiency a for test_sample1 was 0.49% at 2gb) Wall time=Default (runtime for test_sample1 was 7 minutes)
##########Make Sample List Array##
declare -a sample_list=("SRR2104591" "SRR1752832")

##########Variables###############
#sample_list= assigned earlier by array in above script
#test_sample1=SRR10740748
##################################
#
##########Setup Environment#######
module load sra
#
##########Commands################
for sample in ${sample_list[@]}; do
    fastq-dump --split-files -gzip $sample #Uses fastq-dump to retrieve raw read fastq files and split them based on paired-end data in compressed formats.
#fastq-dump --split-files -gzip $test_sample1
done
