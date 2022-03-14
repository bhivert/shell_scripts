##
# assert.sh
# Copyright (C) 2022 Benoit Hivert <hivert.benoit@gmail.com>
#
# Created on 2022/03/14 at 19:28:45 by Benoit Hivert <hivert.benoit@gmail.com>
# Updated on 2022/03/14 at 21:29:47 by Benoit Hivert <hivert.benoit@gmail.com>
##

#!/bin/bash

VERBOSE=0

die() {
	EXIT=$1; shift
	echo "$@" 1>&2; exit $EXIT
}

assert() {
	[ $VERBOSE -eq 0 ] || echo "EXEC: $@"
	set -o pipefail
	eval "$@"; RET=$?
	set +o pipefail
	[ $RET -eq 0 ] || die $RET "KO: $@ exited '$RET'"
	[ $VERBOSE -eq 0 ] || echo "OK: $@ exited '$RET'"
}

set -- $(getopt 'v'  $@)
while [[ -n $@ ]]; do
	case $1 in
		-v) VERBOSE=1; shift ;;
		--) break ;;
	esac
done

declare -ar CMDS=(
	"VAR='Hello World !!'"
	"[[ ! -z \$VAR ]]"
	"echo \$VAR"
	"ls"
	"assert ls"
	"grep toto <<< 'titi' | cat -e"
	"ls doNotExists"
)

for CMD in "${CMDS[@]}"; do
	assert $CMD
done
