#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

#register existing upstream service in kong
#NB: curl http://${HOTNAME}:8230/session-api/public-session return session list
#backend-api container has backend-product-repo.api.host network-alias in mynetwork 
#NB:  since docker v 20.10 on linux, host.docker.internal is an alias for host of docker containers
# backend-product-repo.api.host:8230 means another services on same host
# (but not in another docker container)

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=session-service' \
  --data 'url=http://backend-product-repo.api.host:8230/session-api'

  
#adding a route to access session service  (product)
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/session-service/routes \
  --data 'name=session-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/session-api' 
# curl http://xyz.mycompany.fun:8000/session-api/public-session
# curl http://d2f2021:8000/session-api/public-session
# curl http://localhost:8000/session-api/public-session
  
  
#register existing upstream customer-service in kong
  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=customer-service' \
  --data 'url=http://backend-customer-repo.api.host:8231/customer-api'

  
#adding a route to access customer-service  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/customer-service/routes \
  --data 'name=customer-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/customer-api'

#register existing upstream reservation-service in kong

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=reservation-service' \
  --data 'url=http://backend-resa.api.host:8232/reservation-api'

  
#adding a route to access resa-service  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/reservation-service/routes \
  --data 'name=reservation-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/reservation-api'  
  
  
#register existing upstream frontend (to download) in kong  
#NB: curl http://xyz.mycompany.fun:8989/resa-app/ return index.html of angular app
#my-frontend-resa container has my-frontend-resa network-alias in mynetwork
#NB: bon fonctionnement avec base/ref="." plutot que "/" dans dist/ng-bs4-app/index.html
#    et avec chemin WS en "/..." plutot que "./..." du code source des services angular  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=angular-resa-frontend' \
  --data 'url=http://my-frontend-resa:8989/resa-app'
  
#adding a route to access frontend behind kong
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/angular-resa-frontend/routes \
  --data 'name=resa-app-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/resa-app'
  
# curl http://xyz.mycompany.fun:8000/resa-app/index.html avec 'paths[]=/resa-app' fonctionne avec base/href="." 
# curl http://d2f2021:8000/resa-app/index.html
# curl http://localhost:8000/resa-app/index.html
