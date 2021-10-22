#!/bin/sh

if [[ -z $1 ]] ; then
	echo "Usage: "`basename $0`" class_name"
elif [[ -e $1_class.h ]] ; then
	echo "$1_class already exist."
else
	path=`dirname \`realpath $0\``
	class=`basename $1`_class
	sed 's|name|'$class'|g' "$path"/NAME.cpp > "$1_class".cpp
	sed 's|name|'$class'|g' "$path"/NAME.h > "$1_class".h.tmp
	protect=`echo "$class" | tr '[:lower:]' '[:upper:]'`
	sed 's|NAME|'$protect'|g' "$1_class".h.tmp > "$1_class".h
	rm "$1_class".h.tmp
fi
