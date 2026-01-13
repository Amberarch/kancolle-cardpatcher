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
    #$SCRIPTDIR/move-patched.sh

}

copy_banner
export DESTDIR=$ROOTDIR/garbage
export MODDIR=$ROOTDIR/garbage
$SCRIPTDIR/echo.sh


