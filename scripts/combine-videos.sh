#!/bin/bash
INPUT_FOLDER="$1"

if [ ! -d $INPUT_FOLDER ]; then
	echo "Please enter a proper input folder"
	exit 1
fi

ls $INPUT_FOLDER | xargs -I{} echo "file '$(pwd)/$INPUT_FOLDER/{}'" | awk '{print; print "file /home/kqsf6/Videos/interstials/later.mkv"}' | head -n -1 > "$INPUT_FOLDER.manifest"

ffmpeg -f concat -safe 0 -i "$INPUT_FOLDER.manifest" -c copy "$INPUT_FOLDER.mkv"
