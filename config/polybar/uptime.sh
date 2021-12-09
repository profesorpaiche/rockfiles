#!/bin/bash

# Uptime of the account
time=$(uptime | awk -F',' '{print $1}' | awk '{print $3}')

echo "$time"
