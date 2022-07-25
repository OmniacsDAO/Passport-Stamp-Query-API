#!/bin/bash
yes " " | yarn add @gitcoinco/passport-sdk-scorer
yes " " | yarn add @spruceid/didkit-wasm-node
yes " " | yarn add axios
yes " " | yarn add express
yes " " | yarn add nodemon
git clone https://github.com/ltyu/tulons-ts.git
cd tulons-ts
yarn install
yarn run build
cd ..
rm -r node_modules/tulons/dist
cp -r tulons-ts/dist node_modules/tulons/
sudo rm -r tulons-ts
rm -r node_modules/@spruceid/didkit-wasm
mv node_modules/@spruceid/didkit-wasm-node node_modules/@spruceid/didkit-wasm
## Make Patch
mkdir patch_modules
cp -r node_modules/@spruceid patch_modules/
cp -r node_modules/tulons patch_modules/
