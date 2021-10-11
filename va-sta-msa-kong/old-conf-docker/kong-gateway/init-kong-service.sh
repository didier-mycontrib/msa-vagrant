echo "sleeping 59s , waiting for docker-compose up , ...."
sleep 59

#register existing upstream service in kong
#NB: curl http://xyz.mycompany.fun:8282/devise-api/public/devise return devises list
#backend-api container has backend.api.host network-alias in conf-docker_mynetwork 
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services \
  --data 'name=devise-service' \
  --data 'url=http://backend.api.host:8282/devise-api'
  
#adding a route to access a service  
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services/devise-service/routes \
  --data 'name=devise-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/devise-api' 
# curl http://xyz.mycompany.fun:8000/devise-api/public/devise
# curl http://localhost:8000/devise-api/public/devise  
  
#register existing upstream frontend (to download) in kong  
#NB: curl http://xyz.mycompany.fun:90/ng-bs4-app/ return index.html of angular app
#frontend container has frontend network-alias in conf-docker_mynetwork
#NB: bon fonctionnement avec base/ref="." plutot que "/" dans dist/ng-bs4-app/index.html
#    et avec chemin WS en "/..." plutot que "./..." du code source des services angular  
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services \
  --data 'name=angular-frontend' \
  --data 'url=http://frontend:80/ng-bs4-app'
  
#adding a route to access frontend behind kong
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services/angular-frontend/routes \
  --data 'name=ng-bs4-app-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/ng-bs4-app'
# curl http://xyz.mycompany.fun:8000/ng-bs4-app/ avec 'paths[]=/ng-bs4-app' fonctionne avec base/href="." 