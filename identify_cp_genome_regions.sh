
#!/bin/bash

# Directory containing input files
INPUT_DIR="."

# Perform pairwise BLASTN comparisons for each cpgenome.fna file in the directory
for i in `ls $INPUT_DIR/*.fna`; do
    sh ~/codes/cmd_shell/blastn_m0_v+.sh $i $i 1e-5
done

# Process the BLAST results to extract and sort regions, and generate region files
for i in `ls $INPUT_DIR/*.fna`; do
    less $i.fna_$i.fna.bsn.tab | \
    awk '{if($12>10000 && $12<50000){print}}' | \
    sort -k3n | \
    awk '{
        if($3<110000){
            getline a;
            split(a,x,"\t");
            print $1"\t1\t"($3-1)"\tLSC\n"$1"\t"$3"\t"$4"\tIRb\n"$1"\t"($4+1)"\t"(x[3]-1)"\tSSC\n"$1"\t"x[3]"\t"x[4]"\tIRa";
        }
    }' | more > $i.region
done