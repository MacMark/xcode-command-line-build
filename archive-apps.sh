#!/bin/sh
#
# Archive all apps
#
# Builds for every target its xcarchive (like archive command in Xcode)
# Share and enjoy! Written by www.macmark.de @macmark_de https://github.com/MacMark/xcode-command-line-build
# Run it from the directory containing your project


display_usage() { 
	echo "Builds for every target its xcarchive (like archive GUI command in Xcode)" 
	echo "\nUsage:\narchive-apps.sh \n" 
	echo "\nRun it from the directory containing your project"
	} 
	
# check whether user had supplied -h or --help . If yes display usage 
	if [[ ( $1 == "--help") ||  $1 == "-h" ]] 
	then 
		display_usage
		exit 0
	fi
 
# Sequential version

# Replace here the name for workspace and MyApp1 etc with the names of your workspace targets
xcodebuild -workspace macmark.de.xcworkspace -parallelizeTargets -scheme MyApp1 archive
xcodebuild -workspace macmark.de.xcworkspace -parallelizeTargets -scheme MyApp2 archive
xcodebuild -workspace macmark.de.xcworkspace -parallelizeTargets -scheme MyApp3 archive

# Concurrent version
# This is faster than the sequential version but works only if the targets do not generate file with the same name
#xcodebuild -workspace macmark.de.xcworkspace -parallelizeTargets -scheme MyApp1 archive &
#xcodebuild -workspace macmark.de.xcworkspace -parallelizeTargets -scheme MyApp2 archive  &
#xcodebuild -workspace macmark.de.xcworkspace -parallelizeTargets -scheme MyApp3 archive
#wait
echo "All archiving jobs done"
