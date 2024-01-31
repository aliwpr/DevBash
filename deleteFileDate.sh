#!usrbinenv bash
#USAGE delete older file of certain date from a directory


# the time you wish to delete befor this
olderDate="1988-12-12"

# if we want newer that the date we have to use - after mtime or we can -exec rm -rf {} \;
find "$logDirectory" -type f -name "*.log" -mtime +$(( ($(date +%s) - $(date -d "$olderDate" +%s)) / 86400 )) -exec rm -rf {} \;

