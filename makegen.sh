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
".PHONY: all, clean, fclean, re, _mkdir, _make
.SUFFIXES:";

_usage () {
	echo "Usage: $0 [-L] [-C dir [depends]] NAME"
}

args=`getopt LC: $*`
if [ $? -ne 0 ] ; then
	_usage
	exit 1
fi
set -- $args
IS_LIB=0
while [ -n "$*" ]
do
	case $1 in
		-L)
			IS_LIB=1
			shift
			;;
		-C)
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


SRCS="
ifeq (\$(DEBUG), 0)
	CC			=	gcc
	CFLAGS		=	-Wall -Wextra \$(INCS_FLAGS) -O3
else
	CC			=	cc
	CFLAGS		=	-Wall -Wextra -Werror \$(INCS_FLAGS) -g3
endif"



MAKEFILE="$HEADER\n";
MAKEFILE="$MAKEFILE$CONFIG\n";
MAKEFILE="$MAKEFILE\n$NAME\n";

echo "$MAKEFILE"
