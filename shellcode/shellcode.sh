#! /bin/sh
if [ -e "$1" ]
then objdump -d launch_sh |grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
else echo "Le fichier $1 n'existe pas."
fi
