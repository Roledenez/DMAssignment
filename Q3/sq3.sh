#!/bin/bash
./get_data.sh
./clean.sh

python3 csv2sqlite.py --table-name biopics --input biopics.csv --output biopics.sqlite

sqlite3 biopics.sqlite 'select subject_sex,sum(box_office)  from biopics group by subject_sex' > result
awk -F ',' 'BEGIN{print "<table>"} {print "<tr><th>Gender</th><th>Total Amount</th></tr><tr>";for(i=1;i<=NF;i++)print "<td>" $i"</td>";print "</tr>"} END{print "</table>"}' result
rm result
