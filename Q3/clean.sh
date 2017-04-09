awk -F ',' '{gsub("-","NO",$5);print $5}' biopics.csv
awk -F ',' '{if (!$11) {print $11, "NO"} else {print $11}}' biopics.csv

