mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
cur_makefile_path := $(dir $(mkfile_path))

DIR_ROOT := $(patsubst %/,%,$(cur_makefile_path))
DIR_SRC := $(DIR_ROOT)/src
DIR_INCLUDE := $(DIR_ROOT)/include

CC=g++
CFLAGS=-Wall -O2 -std=c++11
TAGLIB_DIR=$(DIR_ROOT)/taglib/build
LIBS=-L$(TAGLIB_DIR)/lib -ltag
INCLUDES=-I$(TAGLIB_DIR)/include -I$(DIR_INCLUDE)

# 定义源文件和目标文件
SRC := $(DIR_SRC)/main.cpp $(DIR_SRC)/Formatter.cpp
OBJ := $(SRC:.cpp=.o)
TARGET := tagtune

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(TARGET) $(OBJ) $(LIBS)

# 通用规则来编译 .cpp 文件
%.o: %.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(DIR_SRC)/*.o $(TARGET)
