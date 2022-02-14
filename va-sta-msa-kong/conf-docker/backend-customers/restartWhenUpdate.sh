#Version 2 (plus simple/plus fiable que v1 et sans dependance inotifywait)
filePathToWatch=lastUpdate.txt
# 15 pous 15s
pollInterval=15
### Set initial time of file
LTIME=`stat -c %Z $filePathToWatch`

while true    
do
   ATIME=`stat -c %Z $filePathToWatch`

   if [ "$ATIME" != "$LTIME" ]
   then    
       echo "launch ./restart-compose.sh"
       sh ./restart-compose.sh
       LTIME=$ATIME
   fi
   sleep $pollInterval
done


