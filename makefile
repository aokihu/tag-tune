# makefile for tagtune
# version: 0.4
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
cur_makefile_path := $(dir $(mkfile_path))

DIR_ROOT := $(patsubst %/,%,$(cur_makefile_path))
DIR_SRC := $(DIR_ROOT)/src
DIR_INCLUDE := $(DIR_ROOT)/include
DIR_OBJ := $(DIR_ROOT)/obj

PREFIX := /usr/local

CC=g++
CFLAGS=-Wall -march=native -flto -Ofast -std=c++11
TAGLIB_DIR=$(DIR_ROOT)/taglib/build
LIBS=-L$(TAGLIB_DIR)/lib -ltag
INCLUDES=-I$(TAGLIB_DIR)/include -I$(DIR_INCLUDE)

SRC := $(wildcard $(DIR_SRC)/*.cpp)
OBJ := $(patsubst $(DIR_SRC)/%.cpp,$(DIR_OBJ)/%.o,$(SRC))
TARGET := tagtune

all: $(DIR_OBJ) $(TARGET)

$(DIR_OBJ):
	@mkdir -p $(DIR_OBJ)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(TARGET) $(OBJ) $(LIBS)

$(DIR_OBJ)/%.o: $(DIR_SRC)/%.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(DIR_OBJ)/*.o $(TARGET)

install:
	@echo "Installing $(TARGET) to $(PREFIX)/bin"
	@mkdir -p $(PREFIX)/bin
	@cp $(TARGET) $(PREFIX)/bin/$(TARGET)
	@chmod 755 $(PREFIX)/bin/$(TARGET)
	@echo "Installation complete."
