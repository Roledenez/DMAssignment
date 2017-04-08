#!/bin/bash

wget https://goo.gl/BhphrS
mv BhphrS biopics.csv
awk -F ',' '{gsub("-","NO",$5);print $5}' biopics.csv
awk -F ',' '{if (!$11) {print $11, "NO"} else {print $11}}' biopics.csv
awk -F ',' '{print $6,$7}' biopics.csv |sort|uniq > ba1.txt

