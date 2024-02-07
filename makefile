# makefile for tagtune
# version: 0.3
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
cur_makefile_path := $(dir $(mkfile_path))

DIR_ROOT := $(patsubst %/,%,$(cur_makefile_path))
DIR_SRC := $(DIR_ROOT)/src
DIR_INCLUDE := $(DIR_ROOT)/include

PREFIX := /usr/local

CC=g++
CFLAGS=-Wall -march=native -flto -Ofast -std=c++11
TAGLIB_DIR=$(DIR_ROOT)/taglib/build
LIBS=-L$(TAGLIB_DIR)/lib -ltag
INCLUDES=-I$(TAGLIB_DIR)/include -I$(DIR_INCLUDE)

SRC := $(DIR_SRC)/main.cpp $(DIR_SRC)/Formatter.cpp
OBJ := $(SRC:.cpp=.o)
TARGET := tagtune

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(TARGET) $(OBJ) $(LIBS)

%.o: %.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(DIR_SRC)/*.o $(TARGET)

install:
	@echo "Installing $(TARGET) to $(PREFIX)/bin"
	@mkdir -p $(PREFIX)/bin
	@cp $(TARGET) $(PREFIX)/bin/$(TARGET)
	@chmod 755 $(PREFIX)/bin/$(TARGET)
	@echo "Installation complete."
