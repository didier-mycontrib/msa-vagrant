#adding a route to access frontend behind kong
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services/angular-frontend/routes \
  --data 'name=ng-bs4-app-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/ng-bs4-app'

# curl http://xyz.mycompany.fun:8000/ avec 'paths[]=/' en fonctionne pas
# curl http://xyz.mycompany.fun:8000/ng-bs4-app/ avec 'paths[]=/ng-bs4-app' fonctionne avec base/href="." ???