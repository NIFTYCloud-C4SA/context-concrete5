#!/bin/bash

BIN_CURL="/usr/bin/curl -L"
BIN_GIT="/usr/bin/git"
BIN_MV="/bin/mv"
BIN_RM="/bin/rm -rf"
BIN_TAR="/usr/bin/tar"
BIN_UNZIP="/usr/bin/unzip"
BIN_MKDIR="/bin/mkdir"
BIN_CD="cd"

#URL_REPO="https://github.com/concrete5japan/concrete5.git"
URL_ARCHIVE="https://github.com/downloads/concrete5japan/concrete5/concrete5.5.2.1.ja.zip"

${BIN_CD} ./contexts/krm/docroot/public_html/ 
${BIN_CURL} -o ./concrete5.zip ${URL_ARCHIVE}
${BIN_UNZIP} -q ./concrete5.zip
${BIN_RM} ./concrete5.zip
${BIN_MV} ./concrete5*/* ./
${BIN_RM} ./concrete5.*
${BIN_CD} ../
${BIN_TAR} czpf ../docroot.tar.gz * 
${BIN_CD} ../
${BIN_RM} ./docroot
${BIN_TAR} czpf ./krm.tar.gz ./krm

## end


