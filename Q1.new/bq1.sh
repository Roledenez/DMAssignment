#!/bin/bash

./get_data.sh
./clean.sh
awk 'BEGIN { FS=OFS=SUBSEP=","}{arr[$6]+=$7 }END {for (i in arr) print i,arr[i]}' biopics.csv | sort > ba1.txt
