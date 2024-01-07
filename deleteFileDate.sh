#!usrbinenv bash
#USAGE delete older file of certain date from a directory

logDirectory=pathtologs

# the time you wish to delete befor this
olderDate=1988-12-12

# where to store the logfile or you can igonre it and delete it fast
archiveDirectory=tmpali

archiveFilename=logs_archive_$(date +'%Y%m%d%H%M%S').tar.gz
# if we want newer that the date we have to use - or we can -exec rm -rf {} \;
find "$logDirectory" -type f -name "*.log" -mtime +$(( ($(date +%s) - $(date -d "$olderDate" +%s)) / 86400 )) >  /tmp/logFilesList.txt


# -T read names of files to archive from tmplogFilesList.txt
tar -czvf $archiveDirectory$archiveFilename -T tmplogFilesList.txt

# or you can ignore deleting it 
rm tmplog_files_list.txt
