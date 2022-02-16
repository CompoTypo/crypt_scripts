#!/bin/bash

DEVICE=$1
BACKUP=$2

# Encrypt device
cryptsetup -y -v --type luks2 luksFormat $1

# Initialize volume
cryptsetup luksOpen $1 $2

echo "Backup '$2' created"

# Show mapping path and status
ls -l /dev/mapper/$2 
cryptsetup -v status $2
cryptsetup -v status $2 > $2.status

# Dump headers 
echo "Dumping LUKS headers to '.headers'. Please store safetly"
cryptsetup luksDump $1 > .headers

echo "Allocate block data with 0s. Extra layer of protection against usage patterns"
dd if=/dev/zero of=/dev/mapper/$2 status=progress

# Create the filesystem for backup
echo "Creating fs"
mkfs.ext4 /dev/mapper/$2

# Initial mount
echo "Mounting encrypted device"
mkdir /$2
mount /dev/mapper/$2 /$2
df -H
cd /$2
ls -l