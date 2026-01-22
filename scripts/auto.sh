#!/bin/bash

export KCCACHEDIR="/home/amber/.config/KCCacheProxy/ProxyData/cache/kcs2/resources/ship"
export KCBANNERDIR=$KCCACHEDIR/banner
export KCCARDDIR=$KCCACHEDIR/card
export ROOTDIR=${PWD%/*}
export SCRIPTDIR=$PWD
export WORKDIR=$ROOTDIR/assetWorkDir
export DESTDIR=$ROOTDIR/garbage
export MODDIR=$ROOTDIR/BannerMod/BannerMod/kcs2/resources/ship

function copy_banner(){
    export DESTDIR=$WORKDIR/banner
    cd $KCCBANNERDIR
    # DD common
    while read p;
	do cd $KCBANNERDIR;pwd;pname=$(find -name $p*)
	   echo $pname
	   mkdir -p $MODDIR/banner/$pname
	   cp $pname $MODDIR/banner/$pname/original.png
	   ffmpeg -hide_banner -y -i $MODDIR/banner/$pname/original.png -i $ROOTDIR/assets/common-badge.png -filter_complex '[0:v]scale=240x60[bak];[1:v]scale=62x60[badge];[bak][badge] overlay=x=-1 [comb]; [comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=8' $MODDIR/banner/$pname/patched.png;
    done <$SCRIPTDIR/generated/DDcommon.csv
    # DD rare
    while read p;
	do cd $KCBANNERDIR;pwd;pname=$(find -name $p*)
	   echo $pname
	   mkdir -p $MODDIR/banner/$pname
	   cp $pname $MODDIR/banner/$pname/original.png
	   ffmpeg -hide_banner -y -i $MODDIR/banner/$pname/original.png -i $ROOTDIR/assets/rare-badge.png -filter_complex '[0:v]scale=240x60[bak];[1:v]scale=66x71[badge];[bak][badge] overlay=x=-3:y=-5 [comb]; [comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=7' $MODDIR/banner/$pname/patched.png;
    done <$SCRIPTDIR/generated/DDrare.csv


    #  ffmpeg -i 0001_2910.png -i common-badge.png -filter_complex '[0:v]scale=240x60[bak];[1:v]scale=62x60[badge];[bak][badge] overlay [comb]; [comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=10' out.png

#      ffmpeg -i 0122_4216.png -i rare-badge.png -filter_complex '[0:v]scale=240x60[bak];[1:v]scale=66x71[badge];[bak][badge] overlay=x=-3:y=-5 [comb]; [comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=7' out.png
}

copy_banner
export DESTDIR=$ROOTDIR/garbage
export MODDIR=$ROOTDIR/garbage


