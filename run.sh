#!/bin/bash

while read line; do id=`echo $line | cut -d" " -f1` ; seq=`echo $line | cut -d" " -f2` && printf ">${id}\n${seq}\n" > primer-seqs/$id.fasta ; done < input/primer.tsv

for ref in input/*fasta; do

	refname=`basename $ref .fasta`

       for primer in primer-seqs/*fasta ; do

	       primername=`basename $primer .fasta`

	       cat $ref $primer > output/$refname.$primername.fasta
       done

done
