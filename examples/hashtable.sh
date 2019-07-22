#!/bin/bash

##
# hashtable.sh
# Copyright (C) 2019  <hivert.benoit@gmail.com>
#
# Created on 2019/07/23 at 23:43:54 by  <hivert.benoit@gmail.com>
# Updated on 2019/07/23 at 00:08:03 by  <hivert.benoit@gmail.com>
##

#set -x

declare -A HTAB

HTAB=(
	[toto]="toto titi tutu"
	[titi]="riri fifi lulu"
)

echo ${HTAB[titi]}
echo ${HTAB[toto]}

echo "============"

if [[ -z ${HTAB[riri]} ]]; then
	echo "OK"
else
	echo "${HTAB[riri]} KO"
fi
