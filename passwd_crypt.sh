
# Dump headers
cryptsetup luksDump $DEVICE > .headers

# Create new passphrase
cryptsetup luksAddKey $DEVICE

# Delete old passphrase
cryptsetup luksRemoveKey $DEVICE