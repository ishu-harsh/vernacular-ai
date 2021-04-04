
### 3. Managing Disk Space
We provide call center automation as one of our products. Essentially it processes user's audio and return a correct audio response. For managing all these audios that are generated in the due process we use [NFS](https://en.wikipedia.org/wiki/Network_File_System). With the call volumes we have, it essential that disk space of NFS should be managed properly.

Write a bash script to clean out all the audios in `/home/ubuntu/audios/` folder that are older than *48hrs*. Also generate a log file with the name `deleted-files-<date>-<month>-<year>.log` which should contain:
- name of audio file
- time of creation of audio file ([ISO Format](https://en.wikipedia.org/wiki/ISO_8601))
- time of deletion of audio file ([ISO Format](https://en.wikipedia.org/wiki/ISO_8601))

For example: A sample log file `deleted-files-12-02-2020.log` will contain:
```shell
audio_0010023.wav 10-02-2020T08:37:16+05:30 12-02-2020T10:18:40+05:30
audio_0010024.wav 10-02-2020T08:38:16+05:30 12-02-2020T10:18:42+05:30
audio_0010025.wav 10-02-2020T08:38:50+05:30 12-02-2020T10:18:45+05:30
...
```
### Solution 



Enter the following command in terminal to Run the Script

```shel
cd managing_disk_space 
sudo bash managing_disk_space.sh   
```
After successfully run ,  
Check the logs in log file in `/home/ubuntu/logs.txt` 
 
### Script Content :

```
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
```


#  Solution Using Single `find` Command

```shell
find /home/ubuntu/audios/ -type f -mtime +2 -name "file*" -exec ls "{}" > /tmp/output.txt \; -exec rm "{}" \; -name bin  -exec bash `while IFS= read -r file ; do echo "$file" "$(stat -c "%x" "$file")" "$(date --iso-8601=seconds)" >> /home/ubuntu/deleted-files-$(date +%d-%m-%y).log ; done < /tmp/output.txt`  "{}"  \;
```


Note  : Run this command with `bash` shell 