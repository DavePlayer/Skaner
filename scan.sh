#!/bin/bash

name=skan
read -p 'rozszerzenie[jpeg,png,ciff,pnm]: ' extension

if [[ "$extension" =~ ^(jpeg|png|ciff|pnm)$ ]]; then
    if [[ -e $name.$extension || -L $name.$extension ]] ; then
        i=1
        while [[ -e $name$i.$extension || -L $name$i.$extension ]] ; do
            let i++
        done
        name=$name$i
    fi
    scanimage -p --format=$extension > $name.$extension
else
    echo "rozszerzenie $extension nie jest wspierane"
fi
