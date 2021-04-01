#!/usr/bin/env bash
#
# Starts the pco.clhs camera discovery service

SISO_DIR="/opt/SiliconSoftware/Runtime5.7.0"
PCO_DIR="/opt/PCO"

CMD="pco_clhs_${1:-svc}"

if [ -z "${SISODIR5}" ]; then
    source /opt/SiliconSoftware/Runtime5.7.0/setup-siso-env.sh
else
    source "${SISO_DIR}/setup-siso-env.sh"
fi

if [ -f /etc/profile.d/setup-pco-env.sh ]; then
    source /etc/profile.d/setup-pco-env.sh
else
    source "${PCO_DIR}/setup-pco-env.sh"
fi

$CMD