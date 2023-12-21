#!/bin/bash
#Function to check if a file exists

check_file() {
    local filename=$1

    if [ -e "$filename" ]; then
            echo "File $filename' exists."
            return 0 #success
    else
            echo "File '$filename' does not exists."
            return 1 #Error
    fi
}

check_file $1

echo "Status Code $?"