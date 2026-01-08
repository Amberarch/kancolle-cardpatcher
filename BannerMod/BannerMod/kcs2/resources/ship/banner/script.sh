#!/usr/bin/bash
for filename in *.png; do
    echo $filename.tmp;
    mv $filename $filename.tmp;
    mkdir $filename;
    mv $filename.tmp $filename/original.png;
done
