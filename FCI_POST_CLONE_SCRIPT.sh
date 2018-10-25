#!/usr/bin/env bash

export EPOCH=`date +'%s'`
sed -E -i.bak "s/(version: ([0-9]\.?)+)\+([0-9]+)/\1+${EPOCH}/" pubspec.yaml
rm -f pubspec.yaml.bak
