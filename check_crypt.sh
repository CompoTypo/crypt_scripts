#!/bin/bash

BACKUP=$1

umount /$BACKUP
fsck -vy /dev/mapper/$BACKUP
mount /dev/mapper/$BACKUP /$BACKUP