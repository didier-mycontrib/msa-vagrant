#add rate-limit plugin
#if config.minute=3 , 3 appels par minute maxi
#NB: lorque le plugin key-auth est également activé (ce qui est souvent le cas)
# le nombre de requêtes maxi par minute ou second est interprété 'par utilisateur/consumer"

#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services/devise-service/plugins/ \
  --data 'name=rate-limiting' \
  --data 'config.minute=3'