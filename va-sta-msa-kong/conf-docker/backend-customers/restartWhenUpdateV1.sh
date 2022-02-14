export FilePathToWatch=lastUpdate.txt
if [ -f $FilePathToWatch ]; then
   echo "File $FilePathToWatch already exists."
else
   echo "File $FilePathToWatch does not already exists. touch/create it"
   touch $FilePathToWatch
fi

inotifywait -q -m -e close_write $FilePathToWatch |
while read -r filename event; do
  echo "launch ./restart-compose.sh";
  sh ./restart-compose.sh
done

