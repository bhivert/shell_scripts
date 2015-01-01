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

function _usage {
	echo "Usage: ./makegen [-s srcs_dir] [-I incs_dir] [] output_name"
	exit
}

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

MKDIR=\
"";

MAKEFILE="$HEADER\n";
MAKEFILE+="$CONFIG\n";

echo "$MAKEFILE"
