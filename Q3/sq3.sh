#!/bin/bash
./get_data.sh
./clean.sh

python3 csv2sqlite.py --table-name biopics --input biopics.csv --output biopics.sqlite

sqlite3 biopics.sqlite 'select year_release,avg(box_office)  from biopics group by year_release' > result

awk -F '|' 'BEGIN{print "<html><table><tr><th>Year</th><th>Average Gross ($)</th></tr>"} {print "<tr>";for(i=1;i<=NF;i++)print "<td>" $i"</td>";print "</tr>"} END{print "</table></html>"}' result > sa3.html
rm result
