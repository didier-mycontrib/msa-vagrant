#add rate-limit plugin
#if config.minute=3 , 3 appels par minute maxi
#NB: lorque le plugin key-auth est également activé (ce qui est souvent le cas)
# le nombre de requêtes maxi par minute ou second est interprété 'par utilisateur/consumer"

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/public-session-api-service/plugins/ \
  --data 'name=rate-limiting' \
  --data 'config.minute=3'