#register existing upstream service in kong
#NB: curl http://xyz.mycompany.fun:90/ng-bs4-app/ return index.html of angular app
#frontend container has frontend network-alias in conf-docker_mynetwork
#NB: bon fonctionnement avec base/ref="." plutot que "/" dans dist/ng-bs4-app/index.html
#    et avec chemin WS en "/..." plutot que "./..." du code source des services angular
 
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services \
  --data 'name=angular-frontend' \
  --data 'url=http://frontend:80/ng-bs4-app'