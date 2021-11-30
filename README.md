# xcode-command-line-build

Shell script templates for building, archiving and uploading iOS apps with Xcode command line tools.

Building and uploading one or more iOS apps via Xcode can keep you busy clicking and waiting for a long time. 

Here're some shell scripts that can 
- build
- archive
- export to IPA
- upload to App Store Connect / TestFlight
with just one line like

~/bin/publishApps.sh

## Usage

After setting everything up you usually don't need to change these files again. Every file contains comments that tell you what is needed.

I suggest putting all files into your ~/bin/ directory and make the .sh files executable with chmod +x.

- In the ExportOptionsUpload.plist file you associate target names with certificate names. 
- The publishApps.sh file is the main file that calls and uses the other files mentioned below. All scripts can also be used standalone.
- The archive-apps.sh archives your targets. You put your Xcode target names there.
- The xcarchivesToIPAs.sh file exports app archives to IPA files.
- The uploadApps.sh uploads your IPAs to App Store Connect / TestFlight. You put your Apple ID and an app specific password in there.

When every needed information is configured you can do ~/bin/publishApps.sh inside your project and watch your shell working.

## Concurrent option

The scripts use by default a sequential version that works on every target one after another. You can try the concurrent version by removing the comment marks and commenting out the sequential command in these files.
The concurrent version is faster but it will only work correctly if the targets create files with different names. You can just try it out, it does not destroy/change any original files/data of your project.

## Disclaimer

These scripts are provided for anyone to use for anything for free. I selected the MIT license and think this matches my intend. These scripts work well for me. You use them at your own risk.

## Contact

You can reach me via
- https://www.macmark.de
- https://twitter.com/macmark_de
- macmark@macmark.de
