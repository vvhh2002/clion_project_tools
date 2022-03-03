#!/bin/bash

ROOT=$(dirname "$0")
PKG=$1
PATCH_PATH=${ROOT}/${PKG}
PKG_INSTALL_PATH=$2
echo "$@"
echo "${PKG} src install at ${PKG_INSTALL_PATH}"
echo "patch from ${PATCH_PATH}"

if [ -d "${ROOT}"/"${PKG}" ]
then
#    for RUN in `ls "${ROOT}"/"${PKG}"/*.sh 2>/dev/null`
    for RUN in "${ROOT}"/"${PKG}"/*.sh
    do
      [[ -e "${RUN}" ]] || break
      sh "${RUN}" "$@"
    done

    cd "${PKG_INSTALL_PATH}" || exit
#    for PATCH in `ls "${PATCH_PATH}"/*.patch 2>/dev/null`
    for PATCH in "${PATCH_PATH}"/*.patch
    do
        [[ -e "${PATCH}" ]] || break
        patch -N -p 1  < "${PATCH}" || true
        echo "patch use ${PATCH}"
    done
fi