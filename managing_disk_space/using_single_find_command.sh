#!/bin/bash

# Using Single `find` Command 
find /home/ubuntu/audio/ -type f -mtime +2 -name "file*" -exec ls "{}" > /tmp/output.txt \; -exec rm "{}" \; -name bin  -exec bash `while IFS= read -r file ; do echo "$file" "$(stat -c "%x" "$file")" "$(date --iso-8601=seconds)" >> /home/ubuntu/deleted-files-$(date +%d-%m-%y).log ; done < /tmp/output.txt`  "{}"  \;
