#!/bin/bash

OSC_CMD="osc -A https://api.pub.meego.com/"
PATTERN_XML_DIR="patterns-xml"
DIR="$( cd "$( dirname "$0" )" && pwd )"

function update_pattern {
  echo "Updating pattern ${2} to project ${1}."
  ${OSC_CMD} meta pattern ${1} ${2} -F ${PATTERN_XML_DIR}/${2}.xml    
}


rm -rf ${PATTERN_XML_DIR}
python ${DIR}/create-xml-patterns.py -a arm -o ${PATTERN_XML_DIR}

update_pattern CE:Adaptation:N900 nokia-n900-proprietary-support
update_pattern CE:Adaptation:N900 nokia-n900-support

update_pattern CE:Adaptation:N950-N9 nokia-n950-proprietary-support
update_pattern CE:Adaptation:N950-N9 nokia-n950-support

rm -rf ${PATTERN_XML_DIR}
python ${DIR}/create-xml-patterns.py -a i586 -o ${PATTERN_XML_DIR}

update_pattern CE:Adaptation:x86-generic intel-x86-generic-support

update_pattern CE:UX:MTF mtf-handset-ux
update_pattern CE:UX:MTF nemo-apps-mtf

update_pattern CE:Utils nemo-utils

update_pattern CE:Apps nemo-apps

update_pattern CE:MW:Shared nemo-middleware-shared



