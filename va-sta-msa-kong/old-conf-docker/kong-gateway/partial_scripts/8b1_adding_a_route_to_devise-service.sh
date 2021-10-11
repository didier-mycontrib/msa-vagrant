#adding a route to access a service
#NB: curl http://httpbin.org/ip return our ip address
#HOTNAME = xyz.mycompany.fun or ...
curl -i -H "Content-Type: application/json" -X POST \
  -d '{ "name" : "devise-api-route", "hosts": ["xyz.mycompany.fun","localhost"] , "paths": ["/devise-api"] }' \
  http://xyz.mycompany.fun:8001/services/devise-service/routes \
  

# curl http://xyz.mycompany.fun:8000/devise-api/public/devise
# curl http://localhost:8000/devise-api/public/devise