#!/usr/bin/bash
echo $DESTDIR
export ROOTDIR="/home/amber/kancolle"
export VARDIR=$1
echo $1 $VARDIR
export MODDIR=$ROOTDIR/BannerMod/BannerMod/kcs2/resources/ship/$VARDIR


for filename in *.png; do
    echo $filename;
#    mkdir -p /home/amber/kancolle/BannerMod/BannerMod/kcs2/resources/ship/card/$filename;
    mkdir -p $MODDIR/$filename;
    touch $MODDIR/$filename/ignoreMe
#    cp $filename /home/amber/kancolle/BannerMod/BannerMod/kcs2/resources/ship/card/$filename/original.png;
done
