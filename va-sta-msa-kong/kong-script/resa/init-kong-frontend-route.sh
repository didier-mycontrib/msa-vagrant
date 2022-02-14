#init services and routes with /public and /private conventions
export HOSTNAME=`hostname`

# APP_NAME as first argument of script (ex: xyz-app)
APP_NAME=$1
# SERVICE_NAME as  ${APP_NAME}-frontend-service
SERVICE_NAME=${APP_NAME}-frontend-service
# SERVICE_URL as second argument of script (ex: http://my-frontends:8989/resa-app)
APP_URL=$2

#register existing upstream frontend (to download) in kong  
#NB: curl http://xyz.mycompany.fun:8989/resa-app/ return index.html of angular app
#my-frontend-resa container has my-frontend-resa network-alias in mynetwork
#NB: bon fonctionnement avec base/ref="." plutot que "/" dans dist/ng-bs4-app/index.html
#    et avec chemin WS en "/..." plutot que "./..." du code source des services angular  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data "name=${SERVICE_NAME}" \
  --data "url=${APP_URL}"
  
#adding a route to access frontend app behind kong
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/${SERVICE_NAME}/routes \
  --data "name=${APP_NAME}-route" \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data "paths[]=/${APP_NAME}"
  
# curl http://xyz.mycompany.fun:8000/resa-app/index.html avec 'paths[]=/resa-app' fonctionne avec base/href="." 
# curl http://d2f2021:8000/resa-app/index.html
# curl http://localhost:8000/resa-app/index.html
