#remove rate-limit plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`


curl http://${HOSTNAME}:8001/services/public-session-api-service/plugins | jq -r '.'
