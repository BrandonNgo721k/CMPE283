#!/bin/bash
for (( i=0; i<=162; i++ ))
do
echo "For Exit no $i"
cpuid -l 0x4FFFFFFE -1 -s $i
done
