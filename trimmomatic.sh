#!/bin/bash
#This script will be used to trim poor qulaity fastq files and should be used before running alignments and is part of the quality check step.
#Trimmomatic works with FASTQ files (using phred + 33 or phred + 64 quality scores,
#depending on the Illumina pipeline used). Files compressed using either gzip or bzip2 are
#supported, and are identified by use of ".gz" or ".bz" extensions. 
#####################Variables############################
file=SRR1752832
#path=~/scripts/
##########  load the module
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load anaconda/3-2018.12
########## commands go here
#java -jar /opt/asn/apps/anaconda_3-2018.12/share/trimmomatic/trimmomatic.jar PE -threads 4  -phred33 -trimlog ${path}/trimlog.txt ${path}/${file}_1.fastq.gz ${path}/${file}_2.fastq.gz ${path}/${file}_1.trim.fastq ${path}/${file}_2.trim.fastq SLIDINGWINDOW:4:20 MINLEN:36
java -jar /opt/asn/apps/anaconda_3-2018.12/share/trimmomatic/trimmomatic.jar -phred33 PE ${file}_1.fastq ${file}_2/fastq ${file}_1_trim.fastq ${file}_2_trim.fastq ILLUMINACLIP:/opt/asn/apps/anaconda_3-2018.12/share/trimmomatic/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
#
exit
