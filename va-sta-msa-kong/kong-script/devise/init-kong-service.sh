#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

#register existing upstream service in kong
#NB: curl http://${HOTNAME}:8282/devise-api/public/devise return devises list
#backend-api container has backend-devise.api.host network-alias in mynetwork 
#NB:  since docker v 20.10 on linux, host.docker.internal is an alias for host of docker containers
# http://backend-devise.api.host:8282 means another services on same host
# (but not in another docker container)

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=devise-service' \
  --data 'url=http://backend-devise.api.host:8282/devise-api'
#  --data 'url=http://host.docker.internal:8282/devise-api' not working if in another container


  
#adding a route to access a service  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/devise-service/routes \
  --data 'name=devise-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/devise-api' 
# curl http://xyz.mycompany.fun:8000/devise-api/public/devise
# curl http://d2f2021:8000/devise-api/public/devise
# curl http://localhost:8000/devise-api/public/devise  
  
#register existing upstream frontend (to download) in kong  
#NB: curl http://xyz.mycompany.fun:8989/ng-bs4-app/ return index.html of angular app
#my-frontend1 container has my-frontend1 network-alias in mynetwork
#NB: bon fonctionnement avec base/ref="." plutot que "/" dans dist/ng-bs4-app/index.html
#    et avec chemin WS en "/..." plutot que "./..." du code source des services angular  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=angular-frontend' \
  --data 'url=http://my-frontend1:8989/ng-bs4-app'
  
#adding a route to access frontend behind kong
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/angular-frontend/routes \
  --data 'name=ng-bs4-app-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/ng-bs4-app'
  
# curl http://xyz.mycompany.fun:8000/ng-bs4-app/index.html avec 'paths[]=/ng-bs4-app' fonctionne avec base/href="." 
# curl http://d2f2021:8000/ng-bs4-app/index.html
