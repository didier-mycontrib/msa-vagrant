#add key-auth plugin
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services/devise-service/plugins/ \
  --data 'name=key-auth' \
  --data 'config.key_names=apiKey'
  
  