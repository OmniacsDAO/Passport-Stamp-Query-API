#!/bin/bash
rm -r node_modules/@spruceid
cp -r patch_modules/@spruceid node_modules/
echo "Patched"
