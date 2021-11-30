#!/bin/sh
#
# Upload all apps
#
# Uploads all .ipa files from given directory to App Store / TestFlight
# Share and enjoy! Written by www.macmark.de @macmark_de https://github.com/MacMark/xcode-command-line-build
#
# update the following lines with your Apple ID and an app specific password:

# Provide here an apple id that is registered for your app at developer.apple.com
APPLEID=your@apple.id 
# For creating an app specific password follow https://support.apple.com/HT204397
APPLEPASS=some-strange-words-here

display_usage() { 
	echo "Uploads all .ipa files from given directory to App Store / TestFlight" 
	echo "\nUsage:\nuploadApps.sh [dir/with/IPAs] \n" 
	} 
	
# if apple id is missing
	if [  ${#APPLEID} -le 0  ] 
	then 
		echo "Please configure your Apple ID in APPLEID inside this script" 
		exit 1
	fi 	
	
# if apple id password is missing
	if [  ${#APPLEPASS} -le 0  ] 
	then 
		echo "Please configure an app specific password in APPLEPASS inside this script" 
		exit 1
	fi 	
	
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
	

echo "Uploading ipa files from given directory to AppStore Connect …"
# Sequential version
find $1/*.ipa -d 0 -exec xcrun altool --upload-app -t ios -u $APPLEID -p $APPLEPASS -f '{}' \;

# Concurrent version
# This is faster than the sequential version but works only if the targets do not generate file with the same name
#find $1/*.ipa -d 0 -print0 | xargs -0 -n1 -P8  xcrun altool --upload-app -t ios -u $APPLEID -p $APPLEPASS -f
#wait
echo "All IPAs uploaded to App Store / TestFlight"

