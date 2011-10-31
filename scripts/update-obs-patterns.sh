#!/bin/bash

OSC_CMD="osc -A https://api.pub.meego.com/"
PATTERN_XML_DIR="patterns-xml"
DIR="$( cd "$( dirname "$0" )" && pwd )"

rm -rf ${PATTERN_XML_DIR}
python ${DIR}/create-xml-patterns.py -a arm -o ${PATTERN_XML_DIR}

${OSC_CMD} meta pattern CE:Adaptation:N900 nokia-n900-proprietary-support -F ${PATTERN_XML_DIR}/nokia-n900-proprietary-support.xml
${OSC_CMD} meta pattern CE:Adaptation:N900 nokia-n900-support -F ${PATTERN_XML_DIR}/nokia-n900-support.xml

${OSC_CMD} meta pattern CE:Adaptation:N950-N9 nokia-n950-proprietary-support -F ${PATTERN_XML_DIR}/nokia-n950-proprietary-support.xml
${OSC_CMD} meta pattern CE:Adaptation:N950-N9 nokia-n950-support -F ${PATTERN_XML_DIR}/nokia-n950-support.xml

rm -rf ${PATTERN_XML_DIR}
python ${DIR}/create-xml-patterns.py -a i586 -o ${PATTERN_XML_DIR}

${OSC_CMD} meta pattern CE:Adaptation:x86-generic intel-x86-generic-support -F ${PATTERN_XML_DIR}/intel-x86-generic-support.xml

${OSC_CMD} meta pattern CE:UX:MTF mtf-handset-ux -F ${PATTERN_XML_DIR}/mtf-handset-ux.xml

${OSC_CMD} meta pattern CE:Utils nemo-utils -F ${PATTERN_XML_DIR}/nemo-utils.xml

${OSC_CMD} meta pattern CE:Apps nemo-apps -F ${PATTERN_XML_DIR}/nemo-apps.xml

${OSC_CMD} meta pattern CE:MW:Shared nemo-middleware-shared -F ${PATTERN_XML_DIR}/nemo-middleware-shared.xml



