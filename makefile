# PLY polygon file routines

CC=gcc
BUILD=bin
OBJ=obj
PLY_FILE_OBJ=$(OBJ)/plyfile.o
PLY_TEST_OBJ=$(OBJ)/plytest.o
PLY_TEST=$(BUILD)/plytest
PLY_CONVERT_OBJ=$(OBJ)/plyconvert.o
PLY_CONVERT=$(BUILD)/plyconvert
LIB_PLY=$(BUILD)/libply.a


all:	$(BUILD) $(OBJ) $(LIB_PLY) $(PLY_TEST) $(PLY_CONVERT)

$(BUILD): 
	mkdir $(BUILD)
$(OBJ):
	mkdir $(OBJ)


$(LIB_PLY): $(PLY_FILE_OBJ)
	ar -r $(LIB_PLY) $(PLY_FILE_OBJ)

$(PLY_TEST_OBJ): plytest.c ply.h
	$(CC) -c plytest.c -I. -o $(PLY_TEST_OBJ)

$(PLY_FILE_OBJ): plyfile.c ply.h
	$(CC) -c plyfile.c -I. -o $(PLY_FILE_OBJ)

PLY_TEST_OBJS = $(PLY_TEST_OBJ) $(PLY_FILE_OBJ)

$(PLY_TEST): $(PLY_TEST_OBJS)
	$(CC) -o $(PLY_TEST) $(PLY_TEST_OBJS) -lm -O3

$(PLY_CONVERT_OBJ): plyconvert.c ply.h
	$(CC) -c plyconvert.c -I. -o $(PLY_CONVERT_OBJ)

PLY_CONVERT_OBJS = $(PLY_CONVERT_OBJ) $(PLY_FILE_OBJ)
$(PLY_CONVERT): $(PLY_CONVERT_OBJS)
	$(CC) -o $(PLY_CONVERT) $(PLY_CONVERT_OBJS) -lm -O3

.PHONY:clean #伪目标避免执行“make clean”时“clean目标”与目录下的“clean目录或者文件”冲突
clean:
	-rm -r $(BUILD)
	-rm -r $(OBJ)

