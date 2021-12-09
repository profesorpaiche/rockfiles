#!/bin/bash

# Getting current layout from Qtile
layout=$(qtile cmd-obj -o group -f info | grep "'layout'" | awk -F"'" '{print $4}')

echo "$layout"

