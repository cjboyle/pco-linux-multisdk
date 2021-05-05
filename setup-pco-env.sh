#!/bin/bash

if [ -z "$PCODIR" ]; then
    export PCODIR="/opt/PCO"
fi

# echo "[INFO ] Loading environment for ${DIR}"

# echo "[INFO ] Prepending '${DIR}/bin' to PATH"
export PATH="${PCODIR}/bin:${PATH}:/usr/local/bin"

# echo "[INFO ] Prepending '${DIR}/lib' to LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="${PCODIR}/lib:${LD_LIBRARY_PATH}:/usr/lib:/usr/lib64:/usr/local/lib:/usr/local/lib64"
