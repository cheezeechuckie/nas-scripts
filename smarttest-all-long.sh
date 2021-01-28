#!/bin/sh

for disk in /dev/sd? ; do
        smartctl -t long ${disk}
done
