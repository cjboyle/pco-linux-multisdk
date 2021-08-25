#!/bin/bash

if [ -z "$PCODIR" ]; then
    export PCODIR="/opt/PCO"
fi

export LD_PRELOAD="${PCODIR}/pcome4_overrides.so:${LD_PRELOAD}"

# echo "[INFO ] Loading environment for ${DIR}"

# echo "[INFO ] Prepending '${DIR}/bin' to PATH"
export PATH="${PCODIR}/bin:${PATH}:/usr/local/bin"

# echo "[INFO ] Prepending '${DIR}/lib' to LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="${PCODIR}/lib:${LD_LIBRARY_PATH}:/usr/local/lib"
