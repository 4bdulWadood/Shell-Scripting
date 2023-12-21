#!/bin/bash

check_exit_status() {
    change_exit_code_status
    if [ $? -eq 0 ]
    then
        echo "No Error Occurred"
    else
        echo "An Error Occurred"
    fi
}

change_exit_code_status() {
    return 3;
}

check_exit_status