awk -F ',' '{print $13 "," $5}' biopics.csv > tmp
grep -e "Male,[0-9]" tmp > male
grep -e "Female,[0-9]" tmp > female
awk -F ',' '{sum+=$2} END{print "Male " sum "$"}' male >> result
awk -F ',' '{sum+=$2} END{print "Female " sum "$"}' female >> result
awk 'BEGIN{print "<table>"} {print "<tr><th>Gender</th><th>Total Amount</th></tr><tr>";for(i=1;i<=NF;i++)print "<td>" $i"</td>";print "</tr>"} END{print "</table>"}' result
