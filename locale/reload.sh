#!/bin/bash

# needs FILE permission for mysql user

langs=('en' 'de')

#IGNORE because otherwise you could accidentally change string keys & it throws an foreign key constraint error I'd have to explicitly ignore
mysql lbpages -u lbplanner -e "LOAD DATA INFILE \"$(realpath ./keys.txt)\" IGNORE INTO TABLE TranslationKeys FIELDS TERMINATED BY ','"

for ((i=0;i<"${#langs[@]}";i++));
do :
	mysql lbpages -u lbplanner -e "LOAD DATA INFILE \"$(realpath ./${langs[$i]}.txt)\" REPLACE INTO TABLE Translation_${langs[$i]} FIELDS TERMINATED BY ','"
done