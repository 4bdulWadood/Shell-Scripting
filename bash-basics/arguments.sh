#!/bin/bash

lines=$(ls -lh $1 | wc -l)

if [ $# -ne 1 ]
then
      echo "This script requires exactly one directory path passed to it."
      echo "Please Try Again."
      exit 1
fi

echo "You have $(($lines)) objects in the $1 directory."

