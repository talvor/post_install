#!/usr/bin/env bash
DIR="$(dirname "${BASH_SOURCE[0]}")"
DIR="$(realpath "${DIR}")"

mkdir -p /boot/efi/EFI/refind/themes/nord
cp -r $DIR/{icons,theme.conf,*.png} $_      
sed "s/^include/#include/g" -i /boot/efi/EFI/refind/refind.conf
echo "include themes/nord/theme.conf" | tee -a /boot/efi/EFI/refind/refind.conf
