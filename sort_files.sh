
# Creates a new directory for the sequence files
mkdir -p all_sequences

# Moves the sequences to the new directory, copying accross the outlet id
for dir in sequences_by_outlet/*/; do

	outlet=$(basename "$dir")

	for file in "$dir"/*; do
		
		filename=$(basename "$file")
		cp "$file" "all_Sequences/${outlet}_${filename}"
	done
done
