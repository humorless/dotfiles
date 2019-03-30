#!/bin/sh

# echo now in human format 
date +"%H:%M:%S %m/%d/%Y"

# echo now in timestamp format
date -d "$(date +"%H:%M:%S %m/%d/%Y")" +"%s"

# echo future time
date -d '12:12:08 11/10/2026' +"%s"

date -d @1478749440 
