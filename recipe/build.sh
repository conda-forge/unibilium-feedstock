#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

make LIBTOOL=${BUILD_PREFIX}/bin/libtool PREFIX=${PREFIX}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make test LIBTOOL=${BUILD_PREFIX}/bin/libtool
fi
make install LIBTOOL=${BUILD_PREFIX}/bin/libtool PREFIX=${PREFIX}
rm -f ${PREFIX}/lib/libunibilium.a
