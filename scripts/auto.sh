#!/bin/bash

export KCCACHEDIR="/home/amber/.config/KCCacheProxy/ProxyData/cache/kcs2/resources/ship"
export KCBANNERDIR=$KCCACHEDIR/banner
export KCCARDDIR=$KCCACHEDIR/card
export ROOTDIR=${PWD%/*}
export SCRIPTDIR=$PWD
export WORKDIR=$ROOTDIR/assetWorkDir
export DESTDIR=$ROOTDIR/garbage
export MODDIR=$ROOTDIR/garbage

function copy_banner(){
    export DESTDIR=$WORKDIR/banner
    cd $KCCBANNERDIR
    $SCRIPTDIR/echo.sh
    #Common assets
    bash $ROOTDIR/fileLists/DD/DDrare
    #TODO: imagemagick
    #$SCRIPTDIR/orig.sh
    #  ffmpeg -i 0001_2910.png -i common-badge.png -filter_complex '[0:v]scale=240x60[bak];[1:v]scale=62x60[badge];[bak][badge] overlay [comb]; [comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=10' out.png
    #$SCRIPTDIR/move-patched.sh

}

copy_banner
export DESTDIR=$ROOTDIR/garbage
export MODDIR=$ROOTDIR/garbage
$SCRIPTDIR/echo.sh


