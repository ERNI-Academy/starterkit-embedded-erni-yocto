#!/bin/bash

currentPath="$(dirname $(realpath ${BASH_SOURCE[0]}))"
declare buildDir=""

[ -n "${KAS_BUILD_DIR}" ] && buildDir="${KAS_BUILD_DIR}" || buildDir="build"

if [ ! -d "${buildDir}" ]
then
    echo "Folder ${buildDir} do not exists"
    exit 1
fi

pushd "${buildDir}"/tmp-glibc/deploy/images/raspberrypi3 || return
bmaptool copy core-image-minimal-raspberrypi3.wic.bz2 "${currentPath}"/disk.img
popd || return
