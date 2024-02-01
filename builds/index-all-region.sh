#!/bin/bash

make get-regions
all_regions="data/lists/regions.txt"

while read REGION; do
    echo $REGION
    region_list=data/lists/${REGION}.txt

    make list-region region=$REGION

    cat $region_list | xargs -P 10 -t -I % make get-data region=${REGION} workunit=%

    make merge-region region=$REGION

done < $all_regions

