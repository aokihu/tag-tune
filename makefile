mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
cur_makefile_path := $(dir $(mkfile_path))

DIR_ROOT := $(cur_makefile_path)

CC=g++
CFLAGS=-Wall -O2 -std=c++11
TAGLIB_DIR=$(DIR_ROOT)taglib/taglib
LIBS=-L$(TAGLIB_DIR) -ltag
INCLUDES=-I$(TAGLIB_DIR)



All: tagtune

tagtune: main.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -o tagtune main.cpp $(LIBS)

clean:
	rm -f tagtune
