#register existing upstream service in kong
#NB: curl http://xyz.mycompany.fun:8282/devise-api/public/devise return devises list
#backend-api container has backend.api.host network-alias in conf-docker_mynetwork 
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services \
  --data 'name=devise-service' \
  --data 'url=http://backend.api.host:8282/devise-api'