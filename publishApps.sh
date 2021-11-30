#!/bin/sh
#
# Build and upload all apps
# Share and enjoy! Written by www.macmark.de @macmark_de https://github.com/MacMark/xcode-command-line-build

LATEST_BUILD_DIR="$(ls -t1 ~/Library/Developer/Xcode/Archives/ | head -1)"
echo "LATEST_BUILD_DIR: $LATEST_BUILD_DIR"
 
rm -rf ~/Library/Developer/Xcode/Archives/$LATEST_BUILD_DIR/*.xcarchive
~/bin/archive-apps.sh
LATEST_BUILD_DIR="$(ls -t1 ~/Library/Developer/Xcode/Archives/ | head -1)"
~/bin/xcarchivesToIPAs.sh ~/Library/Developer/Xcode/Archives/$LATEST_BUILD_DIR 
~/bin/uploadApps.sh .

