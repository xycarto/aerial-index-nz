#!/bin/bash

all_regions="data/lists/regions.txt"
merged_all="data/aerial-index-merged-all.gpkg"

# cat $all_regions

while read line; do 
    array+="data/${line}/${line}.gpkg "
done < $all_regions

ogrmerge.py -single -overwrite_ds -f GPKG -o ${merged_all} $array

