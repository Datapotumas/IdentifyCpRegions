#!/bin/bash

[ $# -ne 3 ] && echo -e "\nUsage: sh $0 <seq> <ref> <E-value> \n " && exit

seq=$1;
ref=$2;
Evalue=$3;

Blastn="/home/tools/ncbi-blast-2.8.1+/bin/blastn -task blastn";

#blastn
/home/tools/ncbi-blast-2.8.1+/bin/makeblastdb -in $ref -dbtype nucl

$Blastn -query $seq -db $ref -out $seq\_$ref.bsn -evalue 1e-5 -outfmt 0 -word_size 10 -num_descriptions 5 -num_alignments 5 -num_threads 10

perl /home/codes/tgs/blast_parser.pl -Bversion 2.2.31 -tophit 5 -topmatch 5 $seq\_$ref.bsn > $seq\_$ref.bsn.tab

less $seq\_$ref.bsn.tab | awk '{if($0~/^Query_id/){print}else if($2>0 && $12/$2>0.4){print}}' > $seq\_$ref.bsn.tab.filt

rm $ref.n*