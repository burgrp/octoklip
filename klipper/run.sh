#!/bin/sh

set -e

DEFAULT_KLIPPER_CONFIG=${DEFAULT_KLIPPER_CONFIG:-config/printer-anet-a8-2017.cfg}

if [ ! -f $KLIPPER_CONFIG ]
then
    cp  $DEFAULT_KLIPPER_CONFIG $KLIPPER_CONFIG
fi

./venv/bin/python klippy/klippy.py $KLIPPER_CONFIG -l $KLIPPER_LOG