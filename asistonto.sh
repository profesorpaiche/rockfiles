#!/usr/bin/env bash

# --------------------------------------------------------------------------- #
# This script updates the config files by just copy them.
# The list of files must be in "list.csv".
# The path for "original" is assumed to start in $HOME.
# The part for "repository" files are assumed to be from the repository dir.
#
# Author: Dante T. Castro Garro.
# Date: 2022-04-01
# --------------------------------------------------------------------------- #

case $1 in
    update) # Update files in repository
        # nfiles=$(grep $2 list.csv | wc -l)
        grep $2 list.csv | while read line; do
            original=$(echo $line | awk -F, '{print $2}')
            repository=$(echo $line | awk -F, '{print $3}')
            echo "Copying" $original "to" $repository
            cp $original $repository
        done
        ;;
    *) # Default
        echo "No option selected"
        exit
        ;;
esac
