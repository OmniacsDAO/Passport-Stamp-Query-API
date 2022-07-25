#!/bin/bash
rm -r node_modules/tulons
rm -r node_modules/@spruceid
cp -r patch_modules/@spruceid node_modules/
cp -r patch_modules/tulons node_modules/
echo "Patched"
