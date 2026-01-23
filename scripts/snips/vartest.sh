#!/bin/bash

export KCCACHEDIR="/home/amber/.config/KCCacheProxy/ProxyData/cache"
export BDMG="banner"
export KCBANNERDIR=$KCCACHEDIR/kcs2/resources/ship/$BDMG
export KCCARDDIR=$KCCACHEDIR/kcs2/resources/ship/card
export ROOTDIR="/home/amber/kancolle"
export SCRIPTDIR="/home/amber/kancolle/scripts"
export MODDIR=$ROOTDIR/garbage/ship

function copy_banner_DD(){
    cd $KCCBANNERDIR


    while read p;
	do cd $KCBANNERDIR;pname=$(find -name $p*)

	   mkdir -p $MODDIR/$BDMG/$pname
	   cp $pname $MODDIR/$BDMG/$pname/original.png

	   ffmpeg -hide_banner -y -i $MODDIR/$BDMG/$pname/original.png -i $ROOTDIR/assets/rare-badge.png -filter_complex \
		'[0:v]scale=240x60[bak];
	   	[1:v]scale=66x71[badge];
		[bak][badge] overlay=x=-3:y=-5 [comb];
		[comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=7'\
	   $MODDIR/$BDMG/$pname/patched.png;

	done < <(cat $ROOTDIR/fileLists/DDrare.csv $ROOTDIR/fileLists/DDvrare.csv)

}

copy_banner_DD
KCBANNERDIR=$KCCACHEDIR/kcs2/resources/ship/banner_dmg BDMG=banner_dmg copy_banner_DD
