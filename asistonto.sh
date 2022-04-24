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

grep $2 list.csv | while read line; do
    original=$(echo $line | awk -F, '{print $2}')
    repository=$(echo $line | awk -F, '{print $3}')

    case $1 in
        update)
            echo "Copying" $original "to" $repository
            cp $original $repository
            ;;
        instal)
            echo "Copying" $repository "to" $original
            cp $repository $original
            ;;
        *) # Default
            echo "No option selected"
            exit
            ;;
    esac
done
