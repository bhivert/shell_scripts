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
".PHONY: all, clean, fclean, re, _make, _make_clean, _make_fclean
.SUFFIXES:\n";

_usage () {
	echo "Usage: $0 [[options [args]] ...] NAME
$0 -h for more informations"
}

_help () {
	echo "Usage: $0 [[options [args]] ...] NAME"
	echo "Usage: $0 [-a] [-+] [[-d <dir>] ...] [[-C <dir>] ...] [-I <dir>] NAME"
	echo "Help:
	options:\tdescription:
	  NAME\t\t  makefife NAME value.
	  -a\t\t  makefife out file is a library (NAME.a).
	  -s\t\t  makefife out file is a shared library (NAME.so). Override -a.
	  -+\t\t  use of g++ (srcs/*.cpp) instead gcc (srcs/*.c).
	  -D <dir>\t  add a srcs directory.
	  -C <dir>\t  add a sub makefile.
	  -I <dir>\t  add an includes directory.
	  -r <path>\t  add a depends for recompiling SRCS.
	  -L <dir>\t  add a library directory.
	  -l <dir>\t  add a library.

	Bugs resolution:
	  \"-+\" option have to be set befor the first \"-d\" option"
}

ARGS=`getopt as+D:C:I:r:L:l:h $*`
if [ $? -ne 0 ] ; then
	_usage
	exit 1
fi
set -- $ARGS
IS_LIB=0
IS_SHARED_LIB=0
IS_CPP=0
while [ -n "$*" ]
do
	case $1 in
		-a)
			IS_LIB=1
			shift
			;;
		-s)
			IS_SHARED_LIB=1
			shift
			;;
		-C)
			if [ -z "$SUB_MAKE" ]; then
				SUB_MAKE="SUB_MAKE\t=\t"
			else
				SUB_MAKE="$SUB_MAKE\t\t\t"
			fi
			SUB_MAKE="$SUB_MAKE$2 \\\\\n"
			shift 2
			;;
		-+)
			IS_CPP=1
			shift
			;;
		-D)
			SRCS_DIR=$(echo "$2_dir" | tr / _ | tr \'\[:lower:]\' \'\[:upper:]\')
			SRCS_FILES_TMP=$(echo "$2_srcs" | tr / _ | tr \'\[:lower:]\' \'\[:upper:]\')
			if [ -n "$SRCS_FILES" ]; then
				SRCS_FILES="$SRCS_FILES\n"
			fi
			SRCS_FILES="$SRCS_FILES$SRCS_DIR\t=\t$2\n"
			SRCS_FILES="$SRCS_FILES$SRCS_FILES_TMP\t="
			if [ -d $2 ]; then
				if [ $IS_CPP -eq 1 ]; then
					SRCS_LS=$(ls -1 $2/*.cpp \
						| awk 'NR == 1 {print "\t"$0,"\\\\"} NR > 1 {print "\t\t\t"$0,"\\\\"}' \
						| sed -e "s|^\(.*\)\(\/.*\.cpp\)\n$|\t\$($SRCS_DIR)\2 \\\\|")
				else
					SRCS_LS=$(ls -1 $2/*.c \
						| awk 'NR == 1 {print "\t"$0,"\\\\"} NR > 1 {print "\t\t\t"$0,"\\\\"}' \
						| sed -e "s|^\(.*\)\(\/.*\.c\)$|\t\$($SRCS_DIR)\2 \\\\|")
				fi
				echo $SRCS_LS
				SRCS_FILES="$SRCS_FILES$SRCS_LS"
			else
				SRCS_FILES="$SRCS_FILES\t"
			fi
			SRCS_FILES="$SRCS_FILES\n"
			if [ -z "$SRCS" ]; then
				SRCS="SRCS\t\t=\t"
			else
				SRCS="$SRCS\t\t\t"
			fi
			SRCS="$SRCS\$($SRCS_FILES_TMP) \\\\\n"
			shift 2
			;;
		-I)
			if [ -z "$INCS_FLAGS" ]; then
				INCS_FLAGS="INCS_FLAGS\t=\t"
			else
				INCS_FLAGS="$INCS_FLAGS\t\t\t"
			fi
			INCS_FLAGS="$INCS_FLAGS-I$2 \\\\\n"
			shift 2
			;;
		-r)
			if [ -z "$DEPENDS" ]; then
				DEPENDS="DEPENDS\t\t=\t"
			else
				DEPENDS="$DEPENDS\t\t\t"
			fi
			DEPENDS="$DEPENDS$2 \\\\\n"
			shift 2
			;;
		-L)
			if [ -z "$LIBS_DIR" ]; then
				LIBS_DIR="LIBS_DIR\t=\t"
			else
				LIBS_DIR="$LIBS_DIR\t\t\t"
			fi
			LIBS_DIR="$LIBS_DIR-L$2 \\\\\n"
			shift 2
			;;
		-l)
			if [ -z "$LIBS" ]; then
				LIBS="LIBS\t\t=\t"
			else
				LIBS="$LIBS\t\t\t"
			fi
			LIBS="$LIBS-l$2 \\\\\n"
			shift 2
			;;
		-h)
			_help
			exit 0
			;;
		--)
			shift
			break
			;;
		*)
			echo "bug: $1"
			exit 3
			;;
	esac
done
if [ -z "$1" ] ; then
	_usage
	exit 2
fi

NAME="NAME\t\t=\t$1"
if [ $IS_SHARED_LIB -eq 1 ]; then
	NAME="$NAME.so"
else
	if [ $IS_LIB -eq 1 ]; then 
		NAME="$NAME.a"
	fi
fi
NAME="$NAME\n"
if [ -z "$SRCS_FILES" ]; then
	SRCS_FILES="SRCS_DIR\t=\t"
fi
if [ -z "$SRCS" ]; then
	SRCS="SRCS\t\t=\t\n"
fi
if [ -z "$INCS_FLAGS" ]; then
	INCS_FLAGS="INCS_FLAGS\t=\t\n"
fi
if [ -z "$DEPENDS" ]; then
	DEPENDS="DEPENDS\t\t=\t\n"
fi
if [ -z "$SUB_MAKE" ]; then
	SUB_MAKE="SUB_MAKE\t=\t\n"
fi
if [ -z "$LIBS_DIR" ]; then
	LIBS_DIR="LIBS_DIR\t=\t\n"
fi
if [ -z "$LIBS" ]; then
	LIBS="LIBS\t\t=\t\n"
fi
LIBS="$LIBS_DIR\n$LIBS"

COMPIL=\
"DEBUG\t\t=\t0
ifeq (\$(DEBUG), 0)\n"
if [ $IS_CPP -eq 0 ]; then
	COMPIL="$COMPIL\tCC\t=\tgcc\n"
else
	COMPIL="$COMPIL\tCC\t=\tg++\n"
fi
COMPIL="$COMPIL\tCFLAGS\t=\t-Wall -Wextra -Werror \$(INCS_FLAGS) -O3
else\n"
if [ $IS_CPP -eq 0 ]; then
	COMPIL="$COMPIL\tCC\t=\tcc\n"
else
	COMPIL="$COMPIL\tCC\t=\tg++\n"
fi
COMPIL="$COMPIL\tCFLAGS\t=\t-Wall -Wextra \$(INCS_FLAGS) -g3
endif\n"

OBJS="OBJS\t\t=\t"
if [ $IS_CPP -eq 0 ]; then
	OBJS="$OBJS\$(SRCS:.c=.o)\n"
else
	OBJS="$OBJS\$(SRCS:.cpp=.o)\n"
fi

RULES=\
"
all\t\t:\t_make \$(NAME)

\$(NAME)\t\t:\t\$(OBJS)"
if [ $IS_SHARED_LIB -eq 1 ]; then
	RULES="$RULES\n\t\$(CC) \$(CFLAGS) -shared \$^ -o \$@"
else
	if [ $IS_LIB -eq 1 ]; then 
		RULES="$RULES\n\t@ar rc \$@ \$^\n\tranlib \$@"
	else
		RULES="$RULES\n\t\$(CC) \$(CFLAGS) \$(LIBS_DIR) \$(LIBS) \$^ -o \$@"
	fi
fi
if [ $IS_CPP -eq 0 ]; then
	RULES="$RULES
\n%.o\t:\t%.c \$(DEPENDS)"
else
	RULES="$RULES
\n%.o\t:\t%.cpp \$(DEPENDS)"
fi
RULES="$RULES
\t\$(CC) \$(CFLAGS) -c \$< -o \$@

clean\t\t:\t_make_clean
\trm -rf \$(OBJS)

fclean\t\t:\t_make_fclean clean
\trm -rf \$(NAME)

re\t\t\t:\tfclean all

_make\t\t:
ifeq (\$(DEBUG), 2)
\t\$(foreach MAKE, \$(SUB_MAKE),make -C \$(MAKE) DEBUG=\$(DEBUG);)
else
\t\$(foreach MAKE, \$(SUB_MAKE),make -C \$(MAKE);)
endif

_make_clean\t\t:
\t\$(foreach MAKE, \$(SUB_MAKE),make -C \$(MAKE) clean;)

_make_fclean\t\t:
\t\$(foreach MAKE, \$(SUB_MAKE),make -C \$(MAKE) fclean;)"

MAKEFILE="$HEADER";
MAKEFILE="$MAKEFILE\n$CONFIG";
MAKEFILE="$MAKEFILE\n$NAME";
MAKEFILE="$MAKEFILE\n$COMPIL";
MAKEFILE="$MAKEFILE\n$DEPENDS";
MAKEFILE="$MAKEFILE\n$LIBS";
MAKEFILE="$MAKEFILE\n$INCS_FLAGS";
MAKEFILE="$MAKEFILE\n$SUB_MAKE"
MAKEFILE="$MAKEFILE\n$SRCS_FILES"
MAKEFILE="$MAKEFILE\n$SRCS"
MAKEFILE="$MAKEFILE\n$OBJS"
MAKEFILE="$MAKEFILE\n$RULES"

echo "$MAKEFILE" > Makefile
