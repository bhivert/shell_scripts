#!/bin/sh

if [ -e "$1".Class.hpp ] ; then
	echo "Class exist already."
else
	sed 's|name|'$1'|g' NAME.Class.cpp > "$1".Class.cpp
	sed 's|name|'$1'|g' NAME.Class.hpp > "$1".Class.hpp.tmp
	PROTECT=`echo "$1" | tr '[:lower:]' '[:upper:]'`
	sed 's|NAME|'$PROTECT'|g' "$1".Class.hpp.tmp > "$1".Class.hpp
	rm "$1".Class.hpp.tmp
fi
