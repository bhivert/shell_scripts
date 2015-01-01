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

function _usage {
	echo "Usage: ./makegen [-L] [-s srcs_dir] [-I incs_dir] output_name"
	exit -1
}

args=`getopt :Ls:I: $0`
if [ $? -ne 0 ] ; then
	_usage
fi
set -- $args

while [-n "$*"]
do
	case $1 in
		-L)
			shift
			;;
		-s)
			shift
			shift
			;;
		-I)
			shift
			shift
			;;
		--)
			shift
			break
			;;
		-:)
			_usage
			;;
	esac
done
if [ -z "$1" ] ; then
	_usage
fi

MAKEFILE="$HEADER\n";
MAKEFILE+="$CONFIG\n";

echo "$MAKEFILE"
