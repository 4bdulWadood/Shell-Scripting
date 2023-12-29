#!/bin/bash

warning_threshold=90
normal_threshold=60

echo "Disk Space Logs"
df -H | awk '{print $5 " " $1}' | while read output;
do 
  disk_usage=$(echo $output | awk '{print $1' | cut -d'%' -f1)
  file_sys=$(echo $output | awk '{print $2')
  #echo $usage
  if ! awk "BEGIN{ exit ($disk_usage <= $warning_threshold) }"
  then 
        echo "DISK USAGE NORMAL for $file_sys"
  elif ! awk "BEGIN{ exit (($disk_usage <= $warning_threshold) && ($disk_usage > $normal_threshold))}"
  then
        echo "DISK USAGE WARNING for $file_sys"
  else 
        echo "DISK USAGE CRITICALfor $file_sys"
fi
done

printf "\n"

echo "Memory Utilization Logs"
# Get the values from the free command
usedMem=$(free | awk 'NR==2 {print $3}')
totalMem=$(free | awk 'BR==2 {print $2}')

#Calculate the percentage
mem_util=$(awk "BEGIN {printf \"%.2f\", ${usedMem}/${totalMem} * 100}")

var=$(awk 'BEGIN{ exit ($mem_util <= $normal_threshold) }")

#Check the percentage and echo the appropriate message
if ! awk "BEGIN( print ($mem_util <= $Normal_threshold)}"
then
      echo "MEMORY UTILIZATION NORMAL"
elif ! awk "BEGIN{ exit (($mem_util <= $warning_threshold) && ($mem_util > $normal_threshold))}"
then 
      echo "MEMORY UTILIZATION ABNORMAL"
else
      echo "MEMORY UTILIZATION CRITICAL"
fi



echo "CPU Utilization Logs"

cpu_util=$(top -bn 1 | awk '%Cpu/{print $2}')

if ! awk "BEGIN{ exit ($cpu_util <= $normal_threshold) }"
then
      echo "CPU Utilization Normal"
elif ! awk "BEGIN{ exit (($mem_util <= $warning_threshold) && ($mem_util > $normal_threshold))}"
then
      echo "CPU Utilization Abnormal"
else
      echo "CPU Utilization Critical"
fi






        
