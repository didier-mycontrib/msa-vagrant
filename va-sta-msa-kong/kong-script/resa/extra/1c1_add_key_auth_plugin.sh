#add key-auth plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

curl -i -X POST \
  --url ${HOSTNAME}:8001/services/public-session-api-service/plugins/ \
  --data 'name=key-auth' \
  --data 'config.key_names=apiKey'
  
  