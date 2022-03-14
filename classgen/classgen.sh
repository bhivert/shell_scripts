#!/bin/sh

if [[ -z $1 ]] ; then
	echo "Usage: $(basename $0) class_name"
elif [[ -e $1_class.h ]] ; then
	echo "$1_class already exist."
else
	path=$(dirname $(realpath $0))
	class=$(basename $1)
	sed 's|name|'$class'|g' "$path"/NAME.cpp > "$1".cpp
	sed 's|name|'$class'|g' "$path"/NAME.hpp > "$1".hpp.tmp
	protect=`echo "$class" | tr '[:lower:]' '[:upper:]'`
	sed 's|NAME|'$protect'|g' "$1".hpp.tmp > "$1".hpp
	rm "$1".hpp.tmp
fi
