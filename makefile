CC=g++
CFLAGS=-Wall -O2 -std=c++11
TAGLIB_DIR=./taglib/taglib
LIBS=-L$(TAGLIB_DIR) -ltag
INCLUDES=-I$(TAGLIB_DIR)/include/taglib

tagtune: main.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -o tagtune main.cpp $(LIBS)

clean:
	rm -f tagtune
