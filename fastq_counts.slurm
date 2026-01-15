#!/bin/bash

#SBATCH --job-name=fastq_count_reads		# job name
#SBATCH -A evoanalysis				# specify username
#SBATCH -t 0-00:05:00				# max runtime
#SBATCH --nodes=1				# number of nodes 
#SBATCH --cpus-per-task=1			# number of cores
#SBATCH --mem=1G				# memory
#SBATCH --mail-type=ALL				# when to send emails
#SBATCH --mail-user=jyearou2@uwyo.edu		# email to send to
#SBATCH -e err_count_fastq_%A.err		# error file
#SBATCH -o std_count_fastq_%A.out		# std output file
#SBATCH --array=0-37				# array job indices, will update later

# folder containing FASTQ files 
FASTQ_DIR=../d3challenge_fq

# make an array of all the FASTQ files
FASTQ_FILES=(${FASTQ_DIR}/*.fastq)

# Select the FASTQ file for this array task
FASTQ=${FASTQ_FILES[$SLURM_ARRAY_TASK_ID]}

# pull the file name
BASENAME=$(basename $FASTQ)

# count reads (lines/4)
READS=$(($(wc -l < $FASTQ) / 4))

# write output to a file named after the FASTQ
echo "File: $BASENAME" > ${BASENAME}_read_count.txt
echo "Reads: $READS" >> ${BASENAME}_read_count.txt
