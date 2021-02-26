#!/usr/bin/bash


songs="songs.txt"

while IFS= read -r line || [ -n "$line" ]; do
    printf '%s\n' "$line"
    you-get "$line" -o mp3-downloads
done < "$songs"


FILES=mp3-downloads/*

for file in $FILES;
do
    ffmpeg -i "${file}" "${file}.mp3"
    rm "${file}"
done

echo "-----DONE DOWNLOADING AND CONVERTING-----"

