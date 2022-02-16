#!/bin/bash

DEVICE=$1
BACKUP=$2

cryptsetup luksOpen $DEVICE $BACKUP
mount /dev/mapper/$BACKUP /$BACKUP
df -H
cd /$BACKUP
ls -l