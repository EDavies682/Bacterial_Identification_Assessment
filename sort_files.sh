#!/bin/bash

# Creates a new directory for the sequence files
mkdir -p Data/all_sequences

# Creates a csv to store info on which sequences were found at which outlets
echo "Sequence, Outlet" > Data/sequence_outlets.csv

# Moves the sequences to the new directory, copying accross the outlet id
for dir in Data/sequences_by_outlet/*/; do

	outlet=$(basename "$dir")

	for file in "$dir"/*; do
		
		filename=$(basename "$file")
		seqname=${filename%.fasta}
		cp "$file" "Data/all_sequences/${outlet}_${filename}"

		echo "$seqname,$outlet" >> Data/sequence_outlets.csv
	done
done

cat Data/all_sequences/*.fasta > Data/combined_sequences.fasta
