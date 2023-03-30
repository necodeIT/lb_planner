#!/bin/bash

cd $(dirname $0) #operating from locale directory

langs=('en' 'de')
transDBs=('Translation' 'DocsTitles' 'DocsHeadings' 'DocsTexts')
filepaths=('' 'docs_titles_' 'docs_headings_' 'docs_texts_')

function loadTable(){
	echo -n "INSERT INTO $2 VALUES "
	notfirst1=false
	while IFS=',' read -a fields || [[ -n $fields ]]; do
		if $notfirst1; then
			echo -ne ',\n\t'
		fi
		echo -n '('
		notfirst2=false
		for field in "${fields[@]}"; do
			if $notfirst2; then
				echo -n ','
			fi
			#check if field is number or not
			if [ "$field" -eq "$field" ] 2>/dev/null ; then
				echo -n "$field"
			else
				#escape ' and \ in string
				_field="$(echo -n "$field" | sed 's/\\/\\\\/g' | sed "s/\x27/\\\\\x27/g")"
				echo -n "'$_field'"
			fi
			notfirst2=true
		done < <(echo -n "$line")
		echo -n ')'
		notfirst1=true
	done < <(cat $1)
	echo ';'
}

#iterating over languages
for ((i=0;i<"${#langs[@]}";i++));
do :
	#clearing tables in reverse order as to not run into foreign key constraints
	for ((j="${#transDBs[@]}"-1;j>-1;j--));
	do :
		echo "DELETE FROM ${transDBs[$j]}_${langs[$i]};"
	done
done

echo "DELETE FROM TranslationKeys;"
loadTable './keys.csv' 'TranslationKeys'

#iterating over languages
for ((i=0;i<"${#langs[@]}";i++));
do :
	#reloading tables
	for ((j=0;j<"${#transDBs[@]}";j++));
	do :
		loadTable "./${filepaths[$j]}${langs[$i]}.csv" "${transDBs[$j]}_${langs[$i]}"
	done
done