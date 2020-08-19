#!/bin/bash
#This script will be used to trim poor qulaity fastq files and should be used before running alignments and is part of the quality check step.
#Trimmomatic works with FASTQ files (using phred + 33 or phred + 64 quality scores,
#depending on the Illumina pipeline used). Files compressed using either gzip or bzip2 are
#supported, and are identified by use of ".gz" or ".bz" extensions. 
#####################Variables############################
file=SRR1752832
file1=SRR1752832_1
file2=SRR1752832_2
##########  load the module
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load anaconda/3-2018.12
########## commands go here
java -jar /opt/asn/apps/anaconda_3-2018.12/share/trimmomatic/trimmomatic.jar PE -phred33 -trimlog $file.trimlog $file1.fastq.gz $file2.fastq.gz ${file1}.trim.fastq.gz ${file2}.trim.fast.gz SLIDINGWINDOW:4:20 MINLEN:36
#
exit
