#! /bin/sh

_usage () {
	echo "Usage: [-a] [-b arg] [arg ...]"
}

OSTRING=":ab:"
ARGS=`getopt "$OSTRING" $*`
if [ $? -ne 0 ] ; then
	_usage
	exit 1
fi
set -- $ARGS

while [ -n "$*" ]
do
	case $1 in
		-a)
			echo "opt a found"
			shift
			;;
		-b)
			echo "opt b found arg: $2"
			shift 2
			;;
		--)
			shift
			break
			;;
	esac
done

if [ -n "$*" ] ; then
	echo "args less: $*";
else
	echo "No more args.";
fi
