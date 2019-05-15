#!/bin/bash
unzip -o *.xlsx >/dev/null
hex=$(./createmashup.sh | base64 --decode | xxd -e -l4 -s 4 | cut -d' ' -f2)

packagePartsLength=$((16#$hex))

./createmashup.sh | base64 --decode | xxd -l$packagePartsLength -s8 | xxd -r > package.zip

unzip -o package.zip >/dev/null 2>&1

cat Formulas/Section1.m
