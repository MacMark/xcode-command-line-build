#!/bin/sh
#
# Creates IPAs from app archives
#
# Exports all .xcarchive files from given directory into IPAs in current directory
# Share and enjoy! Written by www.macmark.de @macmark_de https://github.com/MacMark/xcode-command-line-build
#
# Uses ExportOptionsUpload.plist for configuration.


display_usage() { 
	echo "Exports all .xcarchive files from given directory into IPAs in current directory" 
	echo "\nUsage:\nxcarchivesToIPAs.sh [dir/with/xcarchives] \n" 
	} 
	
		
# if less than one arguments supplied, display usage 
	if [  $# -le 0 ] 
	then 
		display_usage
		exit 1
	fi 
 
# check whether user had supplied -h or --help . If yes display usage 
	if [[ ( $1 == "--help") ||  $1 == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 

# Sequential version
find $1/*.xcarchive -d 0 -exec xcodebuild -exportArchive -exportOptionsPlist ~/bin/ExportOptionsUpload.plist -exportPath . -archivePath '{}' \;

# Concurrent version
# This is faster than the sequential version but works only if the targets do not generate file with the same name
#find $1/*.xcarchive -d 0 -print0 | xargs -0 -n1 -P8 xcodebuild -exportArchive -exportOptionsPlist ~/bin/ExportOptionsUpload.plist -exportPath . -archivePath
#wait
echo "All archives exported to IPAs"
