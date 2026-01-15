# evoanalysis2026

# challenge problem 3
Included in this folder is a SLURM script, the read count outputs, and this README document

# Files
* fastq_counts.slurm = SLURM job array script created to count the number of reads in each FASTQ file
* *_read_count.txt = Output files for each FASTQ file showing the total number of reads


## work flow
1. script created an array of all FASTQ files
2. each array task selected a single file to work on
3. counted the number of reads in the file and divided by 4
4. output written to a file named after the original. 


