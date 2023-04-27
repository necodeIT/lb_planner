#!/bin/bash

echo -n "Enter password: "

read -r passwd

"$(dirname $0)"/reload.sh | mysql "$3" -h "$1" -P "$2" -u "$4" --default-character-set=utf8mb4 --password="$passwd"