#!/bin/bash

set -e #debug mode
set -x #error find
set -o 'pipefail' #for pipeline

File="Sc_Av.tsv"

echo "This code extracts the scheme name and asset value and put it into Sc_Av.tsv file"

echo -e "Scheme Name \t Value"
curl https://www.amfiindia.com/spages/NAVAll.txt | awk -F";" 'NF>=6 {print $4 "\t" $5}
'>"$File"

column -t -s $ '\t' "$File"

