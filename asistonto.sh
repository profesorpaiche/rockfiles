#!/usr/bin/env bash

# --------------------------------------------------------------------------- #
# This script updates the config files by just copy them.
# The list of files must be in "list.csv".
# The path for "original" is assumed to start in $HOME.
# The part for "repository" files are assumed to be from the repository dir.
#
# Syntax:
# ./asistonto.sh <update|install> "config" [dir]
#
# Example HOME -> repo
# ./asistonto.sh update awesome
#
# Example repo -> HOME (not yet)
#
# Author: Dante T. Castro Garro.
# Date: 2022-04-01
# --------------------------------------------------------------------------- #

grep $2 list.txt | while read line; do
    conffile=$(echo $line | awk '{print $2}')

    case $1 in
        update)
            echo "Copying" $HOME"/"$conffile "to" "rockfiles/"$conffile
            cp $HOME"/"$conffile $conffile
            ;;
        instal)
            echo "Copying" $conffile "to" "rockfiles/"$conffile
            cp $conffile $HOME"/"$conffile
            ;;
        *) # Default
            echo "No option selected"
            exit
            ;;
    esac
done
