#!/usr/bin/env sh

# Get the absolute path to the bash script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Remove old versions
for file in CJKSymbols-Regular.otf CJKSymbols-Regular.ttf
do
    if [[ -f $file ]]
    then
        rm $file
        echo "Removed $file"
    fi
done

# Build the CID-keyed OpenType/CFF font (OTF)
makeotf -f cidfont.ps -omitMacNames -ff features -fi cidfontinfo -mf FontMenuNameDB -r -cs 1 -ch UniCJKSymbols-UTF32-H

# Convert the OTF to TTF
otf2ttf CJKSymbols-Regular.otf
sfntedit -d DSIG CJKSymbols-Regular.ttf

# EOF
