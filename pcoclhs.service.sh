#!/usr/bin/env bash
#
# Starts the pco.clhs camera discovery service

SISO_DIR="/opt/SiliconSoftware/Runtime5.7.0"
PCO_DIR="/opt/PCO"

CMD="pco_clhs_${1:-mgr}"

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

permit_shm_access() {
    sleep 0.1
	while [[ ! -f /dev/shm/PCO_CLHS_DC_MEM ]]; do sleep 0.1; done
	chown root:video /dev/shm/PCO_CLHS_DC_MEM
	chmod 666 /dev/shm/PCO_CLHS_DC_MEM
}

permit_shm_access &

$CMD
