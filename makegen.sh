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

args=`getopt L+C: $*`
if [ $? -ne 0 ] ; then
	_usage
	exit 1
fi
set -- $args
IS_LIB=0
IS_CPP=0
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
		-+)
			IS_CPP=1
			shift
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

NAME="NAME\t\t\t=\t$1"

COMPIL=\
"DEBUG\t\t\t=\t0
ifeq (\$(DEBUG), 0)\n"
if [ $IS_CPP -eq 0 ]; then
	COMPIL="$COMPIL\tCC\t\t\t=\tgcc\n"
else
	COMPIL="$COMPIL\tCC\t\t\t=\tg++\n"
fi
COMPIL="$COMPIL\tCFLAGS\t\t=\t-Wall -Wextra \$(INCS_FLAGS) -O3
else\n"
if [ $IS_CPP -eq 0 ]; then
	COMPIL="$COMPIL\tCC\t\t\t=\tcc\n"
else
	COMPIL="$COMPIL\tCC\t\t\t=\tg++\n"
fi
COMPIL="$COMPIL\tCFLAGS\t\t=\t-Wall -Wextra -Werror\$(INCS_FLAGS) -g3
endif\n"

MAKEFILE="$HEADER\n";
MAKEFILE="$MAKEFILE$CONFIG\n";
MAKEFILE="$MAKEFILE\n$NAME\n";
MAKEFILE="$MAKEFILE\n$COMPIL\n";
MAKEFILE="$MAKEFILE
all:\n\t@echo \$(CC) \$(CFLAGS)";

echo "$MAKEFILE"
