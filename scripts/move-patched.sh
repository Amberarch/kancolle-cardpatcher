#!/usr/bin/bash
for filename in *.png; do
    echo $filename;
    cp $filename /home/amber/kancolle/BannerMod/BannerMod/kcs2/resources/ship/banner/$filename/patched.png;
done
