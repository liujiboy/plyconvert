根据Stanford ply文件库改写。

# 文件说明

ply.h plyfile.c: ply文件库

plytest.c: ply读写测试

plyconvert.c: ply文件格式转换（二进制和文本互转）

batch_convert2binary.py: 批量转换二进制ply的python代码

# 使用说明
## 编译
make all

## 转二进制ply
./bin/plyconvert [源ply] [目标ply] binary

## 转文本ply
./bin/plyconvert [源ply] [目标ply]

## 批量转二进制
python batch_convert2binary.py(需要修改代码中的路径)
