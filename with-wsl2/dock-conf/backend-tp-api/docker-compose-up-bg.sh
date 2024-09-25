echo "restarting docker compose up in background ..." 
nohup docker compose up --build > logfile.log 2>&1 &