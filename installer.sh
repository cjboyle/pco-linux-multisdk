#!/usr/bin/env bash

SRCDIR="$( cd -- "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P )"
PCODIR="/opt/PCO"

if [[ $SRCDIR = $PCODIR ]]; then
    exit 0
fi

rsync -a $SRCDIR/* $PCODIR

make -C $PCODIR clean all install