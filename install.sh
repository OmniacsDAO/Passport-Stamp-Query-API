#!/bin/bash
yes " " | yarn add @gitcoinco/passport-sdk-scorer
yes " " | yarn add @spruceid/didkit-wasm-node
yes " " | yarn add axios
yes " " | yarn add express
yes " " | yarn add nodemon
rm -r node_modules/@spruceid/didkit-wasm
mv node_modules/@spruceid/didkit-wasm-node node_modules/@spruceid/didkit-wasm
## Make Patch
mkdir patch_modules
cp -r node_modules/@spruceid patch_modules/
