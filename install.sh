#!/bin/sh

rootdir=/home/www/wwwroot
filedir=$PWD/..
aliddnsdir=$PWD/CmdDir/packet/aliDDNS_ipv6/aliddns

cd $filedir
filedir=$PWD

cd $aliddnsdir
$aliddnsdir/aliddns-install

if [[ -d $rootdir ]]; then
	[[ "$rootdir" != "$filedir" ]] && mv  $filedir/Software $rootdir/Software
	[[ "$rootdir" != "$filedir" ]] && chown -R www $rootdir/Software
	[[ "$rootdir" != "$filedir" ]] && chgrp -R www $rootdir/Software
	cp $rootdir/Software/CmdDir/cmdcfg /usr/local/bin/cmd
fi

