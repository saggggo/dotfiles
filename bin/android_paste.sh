#!/bin/bash

text=$(xsel --clipboard --output | sed -e "s/\ /\\\ /g" | sed -e "s/(/\\\(/g");
adb shell input text "$text"

