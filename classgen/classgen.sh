#!/bin/sh

if [ -e "$1".Class.hpp ] ; then
	echo "Class exist already."
else
	path="$HOME/00-devel/00-sh_script/classgen/"
	sed 's|name|'$1'|g' "$path"NAME.Class.cpp > "$1".Class.cpp
	sed 's|name|'$1'|g' "$path"NAME.Class.hpp > "$1".Class.hpp.tmp
	protect=`echo "$1" | tr '[:lower:]' '[:upper:]'`
	sed 's|NAME|'$protect'|g' "$1".Class.hpp.tmp > "$1".Class.hpp
	rm "$1".Class.hpp.tmp
fi
