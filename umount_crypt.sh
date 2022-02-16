#!/bin/bash

BACKUP=$1

umount /$BACKUP
cryptsetup luksClose $BACKUP