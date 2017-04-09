#!/bin/bash

./get_data.sh
./clean.sh
awk -F ',' '{print $6,$7}' biopics.csv |sort|uniq > ba1.txt
