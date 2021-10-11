#deleting a kong service (for re-create it or ...)
#HOTNAME = xyz.mycompany.fun or ...

#1. display list of service routes to find id of routes
#2. delete each routes by id or by name
#3. delete service by id or name

curl http://xyz.mycompany.fun:8001/services/devise-service/routes
#curl -X DELETE  http://xyz.mycompany.fun:8001/services/devise-service/routes/1175e8d5-e293-431c-9fa3-3fea8f0ca7d9
curl -X DELETE  http://xyz.mycompany.fun:8001/services/devise-service/routes/devise-api-route
curl -X DELETE  http://xyz.mycompany.fun:8001/services/devise-service 
