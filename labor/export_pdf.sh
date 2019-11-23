#!/bin/bash
C27="\
ghostogether.club/Kong/security 
ghostogether.club/heeju/security
ghostogether.club/hayeong/security
ghostogether.club/jiniljeil/security
ghostogether.club/exponent112/security
ghostogether.club/YeeunJ/security
ghostogether.club/pyojunCode/security
ghostogether.club/ch8925/security
ghostogether.club/jy20170526/security"
HWDIR="HW27"
while read -r line ; do
    subdir=$HWDIR/`echo $line | cut -d "/" -f 2`
    git clone "https://$1:$2@"$line $subdir
done <<< $C27
find . -iname "*.md" -exec md2pdf {} \;
find . -type f -not -iname "*.pdf" -exec rm -f {} \;
