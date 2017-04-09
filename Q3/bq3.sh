./get_data.sh
./clean.sh
awk -F ',' '{print $4 "," $5}' biopics.csv > tmp
grep -e "[0-9],[0-9]" tmp > values
awk 'BEGIN { FS=OFS=SUBSEP=","}{arr[$1]+=$2 }END {for (i in arr) print i,arr[i]}' tmp | sort > result
awk -F ',' 'BEGIN{print "<html><table><tr><th>Year</th><th>Average Gross ($)</th></tr>"} {print "<tr>";for(i=1;i<=NF;i++)print "<td>" $i"</td>";print "</tr>"} END{print "</table></html>"}' result > ba3.html
rm tmp values

