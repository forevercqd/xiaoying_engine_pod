#!/bin/bash 
ROOT_DIR=`pwd` 
echo  $ROOT_DIR

echo "arg0"=$0, "arg1"=$1, "arg2"=$2.

POD_DIR=$ROOT_DIR/Pods

INC_DIR_DST=$POD_DIR/XYVivaVideoEngine/XYVivaVideoEngine/Classes/engine_header
LIB_DIR_DST=$POD_DIR/XYVivaVideoEngine/XYVivaVideoEngine/engine_libraries

INC_DIR_SRC=$2/engine_header
LIB_DIR_SRC=$2/engine_libraries

if  [ "--help" ==  $1 ]; then
    echo cqd help
    exit 0
fi

if  [ "update" == $1 ]; then

    # 需要修改XiaoYingApp/Podfile.local

    mkdir -p $POD_DIR 
    cd   $POD_DIR    

    # if the directory exits, just git reset and git clone
    git clone git@192.168.1.33:ioscomponentgroup/XYVivaVideoEngine.git
   
    cd  XYVivaVideoEngine
    git reset --hard HEAD
    git pull origin
fi

if [ -n  "$2" ]; then
    echo copy  $INC_DIR_SRC $INC_DIR_DST
    cp -rf  $INC_DIR_SRC $INC_DIR_DST

    echo copy  $LIB_DIR_SRC $LIB_DIR_DST
    cp -rf  $LIB_DIR_SRC $LIB_DIR_DST
fi

cd    $ROOT_DIR/XiaoYingApp 

echo pod $1
pod $1
