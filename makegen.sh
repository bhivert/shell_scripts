#! /bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makegen.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bhivert <bhivert@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/01 17:43:52 by bhivert           #+#    #+#              #
#    Updated: 2015/01/01 17:43:52 by bhivert          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HEADER=\
"# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bhivert <bhivert@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/01 16:50:57 by bhivert           #+#    #+#              #
#    Updated: 2015/01/01 16:50:57 by bhivert          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #";

CONFIG=\
".PHONY: all, clean, fclean, re, _mkdir
.SUFFIXES: ";

_usage () {
	echo "Usage: ./makegen [-L] [-s srcs_dir] [-I incs_dir] NAME"
}

args=`getopt :Ls:I: $*`
if [ $? -ne 0 ] ; then
	_usage
	exit 1
fi
set -- $args

while [ -n "$*" ]
do
	case $1 in
		-L)
			shift
			;;
		-s)
			shift 2
			;;
		-I)
			shift 2
			;;
		--)
			shift
			break
			;;
	esac
done
if [ -z "$1" ] ; then
	_usage
	exit 2
fi
NAME="NAME\t:\t$1"

MAKEFILE="$HEADER\n";
MAKEFILE="$MAKEFILE$CONFIG\n";
MAKEFILE="$MAKEFILE\n$NAME\n";

echo "$MAKEFILE"
