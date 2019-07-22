#!/bin/sh

if [ -e "$1".hpp ] ; then
	echo "Class exist already."
else
	path="$HOME/00-devel/00-sh_script/classgen/"
	sed 's|name|'$1'|g' "$path"NAME.cpp > "$1".cpp
	sed 's|name|'$1'|g' "$path"NAME.hpp > "$1".hpp.tmp
	protect=`echo "$1" | tr '[:lower:]' '[:upper:]'`
	sed 's|NAME|'$protect'|g' "$1".hpp.tmp > "$1".hpp
	rm "$1".hpp.tmp
fi
