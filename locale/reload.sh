#!/bin/bash

# needs FILE permission for mysql user

paths=( "./keys.txt" "./en.txt" "./de.txt" );
tables=( "TranslationKeys" "Translation_en" "Translation_de" );

for ((i=0;i<"${#paths[@]}";i++));
do :
	mysql lbpages -u lbplanner -e "LOAD DATA INFILE \"$(realpath ${paths[$i]})\" REPLACE INTO TABLE ${tables[$i]} FIELDS TERMINATED BY ','"
done