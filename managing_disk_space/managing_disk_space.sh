#!/bin/bash
OUTPUT="/tmp/output.txt"
LOGS="/home/ubuntu/logs.txt"
echo "" > "$LOGS"
find /home/ubuntu/audios/ -type f -mtime +2 -name "audio*" -print0 | xargs -I {} -0 ls "{}"> "${OUTPUT}"
while IFS= read -r file
do
  	echo "${file}" "$(stat -c "%x" "${file}")" "$(date --iso-8601=seconds)" >>"$LOGS"
    rm -f "${file}"
done <"${OUTPUT}"
rm "${OUTPUT}"
echo "" > "$LOGS"


