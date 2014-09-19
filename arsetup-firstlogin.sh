#!/usr/bin/bash
# arsetup first login run

# arsetup run if no lock
lock=/tmp/${0##*/}.lock
[ -f ${lock} ] && exit 1
arsetup && touch ${lock}

# MOTD generate  
if ! [ -s "/etc/motd" ]; then
  echo \
"Arch Linux Rescue 0.87
  • arsetup - live medium basic configuration setup (run at first login).
  • armrr   - pacman mirrorlist generator download (ranked, geo., mirrors).
  • ardoc   - about the live medium and general install notes." >| /etc/motd
  clear && cat /etc/motd
fi
