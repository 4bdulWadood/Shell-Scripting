#!/bin/bash

echo "Disk Space Logs"
df -H | awk '{print $5 " " $1}' | while read output;
do
  #echo "Disk Detail : $output"
  disk_usage=$(echo $output | awk '${print $2}')
  #echo $usage
  if [ $disk_usage -ge 90 ]
  then
      echo "CRITICAL for $file_sys"
  elif [ $disk_usage -ge 60 ]
  then 
      echo "WARNING for $file_sys"
  elif [ $disk_usage -lt 60 ]
  then
      echo "NORMAL for $file_sys"
fi
done

print "\n"

echo "Memory Utilization Logs"
# Get the values from the free command

usedMem=$(free | awk 'NR==2 {print $3}')
totalMem=$(free | awk 'NR==2 {print $2}')

echo "$usedMem/$totalMem"

#Calculate the percentage 
mem_util=$(awk "BEGIN {printf \"%.2f\", ${usedMem}/${totalMem} * 100}")
normal_threshold=90.0

mem_util=95.0

echo "$mem_util"

var=$(awk 'BEGIN{ print "'$mem_util'"<"'$threshold'" }')

# Check the percentage and echo the appropriate message
if ! awk "BEGIN{ exit ($mem_util <= $normal_threshol) }"
then
      echo "memory utilization normal"
elif ! awk "BEGIN{ exit (($mem_util <= $warning_threshold) && ($mem_util >= $normal_threshold)}"
then 
      echo "memory utilization not normal"
fi
