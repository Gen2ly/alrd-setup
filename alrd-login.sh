#!/usr/bin/bash
# login setups

if [ ! -f /tmp/mandb.lock ]; then
  echo "Updated man pages database, please wait..."
  mandb --quiet && touch /tmp/mandb.lock
fi

clear 

cat << EoF
"Arch Linux Rescue Disk
  • alrd-setup - a live medium, basic configuration, setup script (recommended).
  • alrd-doc   - documentation of the live medium and general install notes."
EoF

eject
