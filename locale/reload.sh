#!/bin/bash

# needs FILE permission for mysql user

langs=('en' 'de')
transDBs=('Translation' 'DocsTitles' 'DocsHeadings' 'DocsTexts')
filepaths=('' 'docs_titles_' 'docs_headings_' 'docs_texts_')

#IGNORE because otherwise you could accidentally change string keys
query="LOAD DATA INFILE \"$(realpath ./keys.txt)\" IGNORE INTO TABLE TranslationKeys FIELDS TERMINATED BY ',';";
echo "$query"
mysql lbpages -u lbplanner -e "$query"

for ((i=0;i<"${#langs[@]}";i++));
do :
	#clearing tables in reverse order as to not run into foreign key constraints
	for ((j="${#transDBs[@]}"-1;j>-1;j--));
	do :
		query="DELETE FROM ${transDBs[$j]}_${langs[$i]};"
		echo "$query"
		mysql lbpages -u lbplanner -e "$query"
	done
	#reloading tables
	for ((j=0;j<"${#transDBs[@]}";j++));
	do :
		query="LOAD DATA INFILE \"$(realpath ./${filepaths[$j]}${langs[$i]}.txt)\" REPLACE INTO TABLE ${transDBs[$j]}_${langs[$i]} FIELDS TERMINATED BY ',' ESCAPED BY '\\\\';"
		echo "$query"
		mysql lbpages -u lbplanner -e "$query"
	done
done