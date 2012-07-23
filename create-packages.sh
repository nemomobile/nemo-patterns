#!/bin/sh

rm -rf packages/
mkdir -p packages/

pushd patterns &> /dev/null

PATTERN_DIRS=`ls -1 -d */`

for PATTERN_DIR in ${PATTERN_DIRS}
do
    if [ -f $PATTERN_DIR/VERSION ]
    then
        # VERSION file is present if there is multiple .yaml files in dir.
        VERSION=`cat $PATTERN_DIR/VERSION`
    else
        # Check version from .yaml if there is only one .yaml file.
        VERSION=`awk '/Version: (\d)*/{print $2;exit}' ${PATTERN_DIR}/*.yaml`
    fi
    cp Makefile ${PATTERN_DIR}/
    PATTERN_NAME=`echo ${PATTERN_DIR} | sed "s!/!!g"`
    TARBALL=../packages/pattern-${PATTERN_NAME}-${VERSION}.tar
    tar --exclude=*~ -cf ${TARBALL} ${PATTERN_DIR}/
    xz ${TARBALL}
    rm ${PATTERN_DIR}/Makefile
done
popd &> /dev/null
