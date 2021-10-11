#deleting a kong service (for re-create it or ...)
#HOTNAME = xyz.mycompany.fun or ...

#1. display list of service routes to find id of routes
#2. delete each routes by id or by name
#3. delete service by id or name

#curl http://xyz.mycompany.fun:8001/services/devise-service/routes
curl -X DELETE  http://xyz.mycompany.fun:8001/services/devise-service/routes/devise-api-route
curl -X DELETE  http://xyz.mycompany.fun:8001/services/devise-service

#curl http://xyz.mycompany.fun:8001/services/angular-frontend/routes
curl -X DELETE  http://xyz.mycompany.fun:8001/services/angular-frontend/routes/ng-bs4-app-route
curl -X DELETE  http://xyz.mycompany.fun:8001/services/angular-frontend  
