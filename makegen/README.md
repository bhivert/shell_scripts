Usage: ./makegen.sh [[options [args]] ...] NAME

Example: ./makegen.sh [-a] [-+] [[-d <dir>] ...] [[-C <dir> ...] [-I <dir>] NAME

	options:    description:
	  NAME        makefife NAME value:
	  -a          makefife out file are a library (NAME.a).
	  -s          makefife out file are a shared library (NAME.so). Override -a.
	  -+          use of g++ (srcs/*.cpp) instead gcc (srcs/*.c).
	  -D <dir>    add a srcs directory.
	  -C <dir>    add a sub makefile.
	  -I <dir>    add an includes directory.
	  -r <path>   add a depends for recompiling SRCS.

	Bugs resolution:
	  "-+" option have to be set befor the first "-d" option
