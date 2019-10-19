#!/bin/bash
set -Eeu

echo " ----- setup environment ----- "
#fix for locale issues when connecting to ubuntu on fresh install
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"
export LC_CTYPE="UTF-8"
export LC_ALL="en_US.utf8"
echo

echo " ----- make system aware of the new unit file ----- "
sudo systemctl daemon-reload
echo

echo " ----- enable the unit file ----- "
sudo systemctl enable vncserver@1.service
echo

echo " ----- configure vncserver ----- "
vncserver
echo

echo " ----- start the vncserver service ----- "
# vncserver -kill :1
sudo systemctl start vncserver@1
echo
