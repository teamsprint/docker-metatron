#!/bin/bash

./preptool -f ~/data/s5k_1.csv
./preptool -f ~/data/s5k_1.csv -n "Sales data 5000 rows (1/4)"
./preptool -q "select * from test.t" -c "MySQL" -n "DB test dataset"
./preptool -F multi -o sales_2011_02 -n sales_2011_03
./preptool -w Ruleset1 -s "Ruleset1 (sales_2011_03)" -t result1_2011_03.csv
./preptool -F multi -o sales_2011_03 -n sales_2011_04
./preptool -w Ruleset2 -s "Ruleset2 (sales_2011_04)" -t result2_2011_04.csv

#eof
