#!/bin/bash

# needs FILE permission for mysql user

c=0 # commit mode

if [ $# -eq 0 ]; then
	echo "No arguments supplied. Working in echo mode."
	echo
elif [ $# -eq 1 ]; then
	if [ $1 = '-h' ]; then
		echo -e "-h\t\tshows help"
		echo -e "-c\t\tcommits actions to database"
		echo -e "-d\t\tprints data to stdout after committing to database"
		exit
	elif [ $1 = '-c' ]; then
		echo "Working in commit actions mode."
		echo
		c=1
	elif [ $1 = '-d' ]; then
		echo "Working in commit actions & echo data to stdout mode."
		echo
		c=2
	else
		echo "unknown argument \"$1\""
		exit
	fi
else
	echo "too many arguments"
	exit
fi

function doQuery(){
	# echo command if not in echo data mode
	if [ $c -ne 2 ]; then
		echo "$1"
	fi
	
	# commit command if in commit or echo data mode
	if [ $c -eq 1 ] || [ $c -eq 2 ]; then
		mysql lbpages -u lbplanner -e "$1" --init-command="SET SESSION FOREIGN_KEY_CHECKS=0;"
	fi
	
	# if in echo data mode,
	if [ $c -eq 2 ]; then
		# echo data from table if table is specified
		if [ $# -eq 2 ]; then
			mysqldump -t -u lbplanner lbpages $2 --compact
		# echo original command otherwise
		else
			echo "$1"
		fi
	fi
}

langs=('en' 'de')
transDBs=('Translation' 'DocsTitles' 'DocsHeadings' 'DocsTexts')
filepaths=('' 'docs_titles_' 'docs_headings_' 'docs_texts_')

#IGNORE because otherwise you could accidentally change string keys
doQuery "LOAD DATA INFILE \"$(realpath ./keys.txt)\" IGNORE INTO TABLE TranslationKeys FIELDS TERMINATED BY ',';" \
	"TranslationKeys"

for ((i=0;i<"${#langs[@]}";i++));
do :
	#clearing tables in reverse order as to not run into foreign key constraints
	for ((j="${#transDBs[@]}"-1;j>-1;j--));
	do :
		doQuery "DELETE FROM ${transDBs[$j]}_${langs[$i]};"
	done
	#reloading tables
	for ((j=0;j<"${#transDBs[@]}";j++));
	do :
		tablename=${transDBs[$j]}_${langs[$i]};
		doQuery "LOAD DATA INFILE \"$(realpath ./${filepaths[$j]}${langs[$i]}.txt)\" REPLACE INTO TABLE ${tablename} FIELDS TERMINATED BY ',' ESCAPED BY '\\\\';" \
			$tablename
	done
done