#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

#register existing upstream service in kong
#NB: curl http://${HOTNAME}:8230/session-api/public/session return session list
#backend-api container has backend-product-repo.api.host network-alias in mynetwork 
#NB:  since docker v 20.10 on linux, host.docker.internal is an alias for host of docker containers
# backend-product-repo.api.host:8230 means another services on same host
# (but not in another docker container)

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=public-session-service' \
  --data 'url=http://backend-product-repo.api.host:8230/session-api/public'

  
#adding a route to access public-session-service  (product)
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/public-session-service/routes \
  --data 'name=public-session-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/session-api/public' 
# curl http://xyz.mycompany.fun:8000/session-api/public/session
# curl http://d2f2021:8000/session-api/public/session
# curl http://localhost:8000/session-api/public/session
  
  # private-session-service
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=private-session-service' \
  --data 'url=http://backend-product-repo.api.host:8230/session-api/private'

  
#adding a route to access private-session-service  (product)
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/private-session-service/routes \
  --data 'name=private-session-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/session-api/private' 
  
#register existing upstream customer-service in kong
  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=public-customer-service' \
  --data 'url=http://backend-customer-repo.api.host:8231/customer-api/public'
  
  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=private-customer-service' \
  --data 'url=http://backend-customer-repo.api.host:8231/customer-api/private'

#adding a route to access public-customer-service  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/public-customer-service/routes \
  --data 'name=public-customer-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/customer-api/public'
  
#adding a route to access private-customer-service  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/private-customer-service/routes \
  --data 'name=private-customer-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/customer-api/private'

#register existing upstream public-reservation-service in kong

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=public-reservation-service' \
  --data 'url=http://backend-resa.api.host:8232/reservation-api/public'

  
#adding a route to access public-reservation-service  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/public-reservation-service/routes \
  --data 'name=public-reservation-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/reservation-api/public'

#register existing upstream private-reservation-service in kong

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=private-reservation-service' \
  --data 'url=http://backend-resa.api.host:8232/reservation-api/private'

  
#adding a route to access private-reservation-service  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/private-reservation-service/routes \
  --data 'name=private-reservation-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/reservation-api/private'    
  
  
  
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
