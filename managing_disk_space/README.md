
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
