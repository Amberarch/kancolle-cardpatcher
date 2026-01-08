#!/usr/bin/bash
for filename in *.png; do
    echo $filename.tmp;
    mkdir -p /home/amber/kancolle/BannerMod/BannerMod/kcs2/resources/ship/card/$filename;
    cp $filename /home/amber/kancolle/BannerMod/BannerMod/kcs2/resources/ship/card/$filename/original.png;
done
