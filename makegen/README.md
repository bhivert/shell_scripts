Usage: ./makegen.sh [[options [args]] ...] NAME

Usage: ./makegen.sh [-a] [-+] [[-d <dir>] ...] [[-C <dir>] ...] [-I <dir>] NAME

	options:    description:
	  NAME        makefife NAME value.
	  -a          makefife out file is a library (NAME.a).
	  -s          makefife out file is a shared library (NAME.so). Override -a.
	  -+          use of g++ (srcs/*.cpp) instead gcc (srcs/*.c).
	  -D <dir>    add a srcs directory.
	  -C <dir>    add a sub makefile.
	  -I <dir>    add an includes directory.
	  -r <path>   add a depends for recompiling SRCS.
	  -L <dir>    add a library directory.
	  -l <dir>    add a library.

	Bugs resolution:
	  "-+" option have to be set befor the first "-d" option
