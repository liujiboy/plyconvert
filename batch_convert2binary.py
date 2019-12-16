import os
dirName="/Users/liuji/Desktop/ASCII/test"
for  dirpath, dirnames, filenames in  os.walk(dirName):
    print(filenames)
    for filename in filenames:
        if filename.endswith(".ply"):
            filename=filename[:-4]
            cmd="./bin/plyconvert %s %s binary"%(os.path.join(dirpath,filename),"scan_ply/"+filename)
            os.system(cmd)
            