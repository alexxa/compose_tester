#!/bin/bash

installed_modules='installed_modules.log'
failed_modules='error.log'
failed_modules_amount=$(cat $failed_modules | wc -l)

while IFS='' read -r line || [[ -n "$line" ]]; do
	if $(grep -q "$line" "$installed_modules"); then
	    echo "$line"
        elif $(grep -q "$line" "$failed_modules"); then
	    error_msg=$(grep -e "(item=$line)" $failed_modules | grep -oP 'Error.{80}' )
	    printf "%-30s =>  %-30s\n" "$line" "$error_msg"
	else
            printf  "%-30s =>  %-30s\n" "$line" "Failed with Nothing to do msg"

	fi
done < "$1"

