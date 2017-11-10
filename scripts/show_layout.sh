#/bin/bash

echo $(setxkbmap -print | grep xkb_symbols | sed -E 's/.*(us|ru).*/\1/g')
