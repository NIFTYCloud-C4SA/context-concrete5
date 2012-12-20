#!/bin/bash

BIN_CURL="/usr/bin/curl -L"
BIN_GIT="/usr/bin/git"
BIN_MV="/bin/mv"
BIN_RM="/bin/rm -rf"
BIN_TAR="/usr/bin/tar"
BIN_UNZIP="/usr/bin/unzip"
BIN_MKDIR="/bin/mkdir"

URL_REPO="https://github.com/concrete5japan/concrete5.git"
URL_ARCHIVE="https://github.com/concrete5japan/concrete5/archive/5.6.0.2.ja.zip"

PATH_WORKDIR="./workdir"

## make context
${BIN_MKDIR} ${PATH_WORKDIR}

#${BIN_GIT} clone ${URL_REPO} ${PATH_WORKDIR}/tmp_concrete5

${BIN_CURL} -o ${PATH_WORKDIR}/tmp_concrete5.zip ${URL_ARCHIVE}
${BIN_UNZIP} ${PATH_WORKDIR}/tmp_concrete5.zip -d ${PATH_WORKDIR}
${BIN_MV} ${PATH_WORKDIR}/concrete5*/* ./contexts/krm/public_html/
${BIN_RM} ${PATH_WORKDIR}

## create archive
${BIN_TAR} czf ./contexts/krm/web_root.tar.gz ./contexts/krm/public_html
${BIN_RM} ./contexts/krm/public_html
${BIN_TAR} czf ./contexts/krm.tar.gz ./contexts/krm
${BIN_RM} ./contexts/krm/

## end


