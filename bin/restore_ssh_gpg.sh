#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Restore ssh keys
mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh
cp $SCRIPT_DIR/../files/ssh/* $HOME/.ssh/
chmod 600 $HOME/.ssh/id*
chmod 644 $HOME/.ssh/id_*.pub
ssh-add $HOME/.ssh/id_ed25519

# Import private key
gpg --import $SCRIPT_DIR/../files/gpg/private-key.asc