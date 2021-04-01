#!/usr/bin/env bash

SRCDIR="$( cd -- "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P )"
PCODIR="/opt/PCO"

if [[ $SRCDIR = $PCODIR ]]; then
    make -C $PCODIR clean all install
else
    rsync -a $SRCDIR/* $PCODIR
    make -C $PCODIR clean all install
fi
