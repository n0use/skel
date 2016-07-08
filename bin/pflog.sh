#!/bin/sh

tcpdump -n -e -ttt -i pflog0 | logger -p local4.info &
