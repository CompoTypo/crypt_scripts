# CRYPT SCRIPTS

## Description

Simplified way for implementing LUKS2 (Linux Unified Key Setup) with argon2i encryption via cryptsetup

## Dependencies

- cryptsetup

## Steps

There are generally two inputs that need to be consistent across all scripts
- Device (ex. `/dev/sdX`)
- Backup name (ex. `backup`)

### 1. Pick device to encrypt

`fdisk -l`

The backup name is up to you and can be found in `/dev/mapper/`

### 2. Backup device data prior to encryption 

This is very important as all data on the device will be overwritten

### 3. Encrypt

the `encrypt.sh` script has the following usage
- `./encrypt.sh <device> <backup>`

This should walk you through the process of encrypting your device, outputting luks headers to `.headers` (keep safe and secure. It is the only means for recovery)

