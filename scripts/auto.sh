#!/bin/bash

export KCCACHEDIR="/home/amber/kancolle/tmp/cache"
export BDMG="banner"
export KCBANNERDIR=$KCCACHEDIR/kcs2/resources/ship/banner
export KCCARDDIR=$KCCACHEDIR/kcs2/resources/ship/card
export ROOTDIR=${PWD%/*}
export MODDIR=$ROOTDIR/BannerMod/BannerMod/kcs2/resources/ship

function copy_banner_DD(){
    cd $KCCBANNERDIR
    # DD common
    while read p;
	do cd $KCBANNERDIR;pname=$(find -name $p*)
	   mkdir -p $MODDIR/$BDMG/$pname
	   cp $pname $MODDIR/$BDMG/$pname/original.png

	   ffmpeg -hide_banner -y -i $MODDIR/$BDMG/$pname/original.png -i $ROOTDIR/assets/common-badge.png -filter_complex \
		'[0:v]scale=240x60[bak];
	   	[1:v]scale=62x60[badge];
		[bak][badge] overlay=x=-1 [comb];
		[comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=8'\
	   $MODDIR/$BDMG/$pname/patched.png;
    done <$ROOTDIR/fileLists/DDcommon.csv
    # DD rare
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
    # DD holo
    while read p;
	do cd $KCBANNERDIR;pname=$(find -name $p*)
	   mkdir -p $MODDIR/$BDMG/$pname
	   cp $pname $MODDIR/$BDMG/$pname/original.png

	   ffmpeg -hide_banner -y -i $MODDIR/$BDMG/$pname/original.png -i $ROOTDIR/assets/holo-badge.png -filter_complex \
		'[0:v]scale=240x60[bak];
	   	[1:v]scale=71x70[badge];
		[bak][badge] overlay=x=-5:y=-5 [comb];
	   	[comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=8'\
	   $MODDIR/$BDMG/$pname/patched.png;
    done <$ROOTDIR/fileLists/DDholo.csv
    # DD s holo
    while read p;
	do cd $KCBANNERDIR;pname=$(find -name $p*)
	   mkdir -p $MODDIR/$BDMG/$pname
	   cp $pname $MODDIR/$BDMG/$pname/original.png

	   ffmpeg -hide_banner -y -i $MODDIR/$BDMG/$pname/original.png -i $ROOTDIR/assets/holo-badge.png -filter_complex \
		'[0:v]scale=240x60[bak];
	   	[1:v]scale=82x82[badge];
		[bak][badge] overlay=x=-10:y=-12 [comb];
	   	[comb]drawtext=text=DD:fontsize=30:fontcolor=white:bordercolor=black:borderw=2:y=(h-text_h)/2:x=10'\
	   $MODDIR/$BDMG/$pname/patched.png;
    done <$ROOTDIR/fileLists/DDsholo.csv

}

copy_banner_DD
KCBANNERDIR=$KCCACHEDIR/kcs2/resources/ship/banner_dmg BDMG=banner_dmg copy_banner_DD
