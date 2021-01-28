#!/bin/sh

for disk in /dev/sd? ; do
        smartctl -t short ${disk}
done
