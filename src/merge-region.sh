#!/bin/bash

REGION=$1

region_gpkgs=data/${REGION}
merged_gpkg=${region_gpkgs}/${REGION}.gpkg

if [[ -f $merged_gpkg ]]; then
    rm $merged_gpkg
fi

ogrmerge.py -single -overwrite_ds -f GPKG -o ${merged_gpkg} ${region_gpkgs}/*.gpkg